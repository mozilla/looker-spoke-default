view: auth_entrypoint_conversion {
  derived_table: {
    sql: {% raw %}
      WITH params AS (
        SELECT
          -- Leave these arrays empty for "no filter".
          -- Populate them in Looker / SQL Runner to restrict the results.
          CAST([] AS ARRAY<STRING>) AS entrypoint_filter,
          CAST([] AS ARRAY<STRING>) AS oauth_client_id_filter,
          CAST([] AS ARRAY<STRING>) AS service_filter,
          CAST([] AS ARRAY<STRING>) AS device_type_filter
      ),

      /* -------------------------------------------------
      Non-cached flows = Authentication

      Frontend first-view data is used for:
      - flow_date
      - first_view_bucket
      - entrypoint
      - oauth_client_id
      - service
      - device_type
      -------------------------------------------------- */
      first_view_per_flow AS (
      SELECT
      es.metrics.string.session_flow_id AS flow_id,
      es.event AS first_view_event,
      es.event_timestamp AS first_view_ts,
      es.metrics.string.relying_party_oauth_client_id AS oauth_client_id,
      es.metrics.string.relying_party_service AS service,
      es.metrics.string.session_entrypoint AS entrypoint,
      es.metrics.string.session_device_type AS device_type
      FROM `mozdata.accounts_frontend.events_stream` AS es
      WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event IN (
      'email.first_view',
      'login.view',
      'login.otp_view',
      'reg.otp_view',
      'reg.view'
      )
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY es.metrics.string.session_flow_id
      ORDER BY es.event_timestamp, es.event
      ) = 1
      ),

      filtered_first_view_per_flow AS (
      SELECT
      v.*
      FROM first_view_per_flow v
      CROSS JOIN params p
      WHERE (ARRAY_LENGTH(p.entrypoint_filter) = 0 OR v.entrypoint IN UNNEST(p.entrypoint_filter))
      AND (ARRAY_LENGTH(p.oauth_client_id_filter) = 0 OR v.oauth_client_id IN UNNEST(p.oauth_client_id_filter))
      AND (ARRAY_LENGTH(p.service_filter) = 0 OR v.service IN UNNEST(p.service_filter))
      AND (ARRAY_LENGTH(p.device_type_filter) = 0 OR v.device_type IN UNNEST(p.device_type_filter))
      ),

      /* -------------------------------------------------
      Backend completion events for existing summary totals

      This preserves existing completed_flows logic, including
      third-party auth completion events.
      -------------------------------------------------- */
      backend_completes AS (
      SELECT
      es.metrics.string.session_flow_id AS flow_id,
      es.event AS completion_event,
      es.event_timestamp AS complete_ts
      FROM `mozdata.accounts_backend.events_stream` AS es
      WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event IN (
      'login.complete',
      'third_party_auth.apple_login_complete',
      'third_party_auth.google_login_complete',
      'reg.complete',
      'third_party_auth.apple_reg_complete',
      'third_party_auth.google_reg_complete'
      )
      ),

      completed_non_cached_flows AS (
      SELECT
      v.flow_id,
      c.completion_event,
      c.complete_ts
      FROM filtered_first_view_per_flow v
      JOIN backend_completes c
      ON c.flow_id = v.flow_id
      AND c.complete_ts >= v.first_view_ts
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY v.flow_id
      ORDER BY c.complete_ts, c.completion_event
      ) = 1
      ),

      /* -------------------------------------------------
      Backend AuthN breakout events

      This is intentionally limited to:
      - login.complete
      - reg.complete

      AuthN reason comes only from these backend events.
      -------------------------------------------------- */
      authn_backend_completes AS (
      SELECT
      es.metrics.string.session_flow_id AS flow_id,
      es.event AS completion_event,
      es.event_timestamp AS complete_ts,
      es.extras.string.reason AS authn_reason,
      CASE
      WHEN es.event = 'login.complete' THEN 'login'
      WHEN es.event = 'reg.complete' THEN 'registration'
      END AS authn_type
      FROM `mozdata.accounts_backend.events_stream` AS es
      WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event IN (
      'login.complete',
      'reg.complete'
      )
      ),

      completed_authn_breakout_flows AS (
      SELECT
      v.flow_id,
      c.completion_event,
      c.complete_ts,
      c.authn_type,
      c.authn_reason
      FROM filtered_first_view_per_flow v
      JOIN authn_backend_completes c
      ON c.flow_id = v.flow_id
      AND c.complete_ts >= v.first_view_ts
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY v.flow_id
      ORDER BY c.complete_ts, c.completion_event
      ) = 1
      ),

      /* -------------------------------------------------
      Existing non-cached summary rows

      These preserve your existing started_flows and completed_flows logic.
      AuthN breakout columns are NULL / 0 on these rows.
      -------------------------------------------------- */
      non_cached_results AS (
      SELECT
      'summary' AS row_type,
      'AuthN' AS auth_type,
      COUNT(DISTINCT c.flow_id) AS completed_flows,
      v.device_type,
      v.entrypoint,
      v.first_view_event AS first_view_bucket,
      DATE(v.first_view_ts) AS flow_date,
      v.oauth_client_id,
      v.service,
      COUNT(DISTINCT v.flow_id) AS started_flows,

      CAST(NULL AS STRING) AS authn_type,
      CAST(NULL AS STRING) AS authn_reason,
      CAST(0 AS INT64) AS authn_count
      FROM filtered_first_view_per_flow v
      LEFT JOIN completed_non_cached_flows c
      ON c.flow_id = v.flow_id
      GROUP BY
      v.device_type,
      v.entrypoint,
      v.first_view_event,
      DATE(v.first_view_ts),
      v.oauth_client_id,
      v.service
      ),

      /* -------------------------------------------------
      AuthN breakout rows

      These rows provide:
      - AuthN Types: login, registration
      - AuthN Reasons from backend login.complete / reg.complete
      - AuthN Count

      started_flows and completed_flows are set to 0 so existing
      dashboard totals are not inflated.
      -------------------------------------------------- */
      authn_breakout_results AS (
      SELECT
      'authn_breakout' AS row_type,
      'AuthN' AS auth_type,
      CAST(0 AS INT64) AS completed_flows,
      v.device_type,
      v.entrypoint,
      v.first_view_event AS first_view_bucket,
      DATE(v.first_view_ts) AS flow_date,
      v.oauth_client_id,
      v.service,
      CAST(0 AS INT64) AS started_flows,

      c.authn_type AS authn_type,
      c.authn_reason AS authn_reason,
      COUNT(DISTINCT v.flow_id) AS authn_count
      FROM filtered_first_view_per_flow v
      JOIN completed_authn_breakout_flows c
      ON c.flow_id = v.flow_id
      WHERE c.authn_type IS NOT NULL
      GROUP BY
      v.device_type,
      v.entrypoint,
      v.first_view_event,
      DATE(v.first_view_ts),
      v.oauth_client_id,
      v.service,
      c.authn_type,
      c.authn_reason
      ),

      /* -------------------------------------------------
      Cached login = Authorization

      Existing AuthZ summary logic.
      AuthN breakout columns are NULL / 0 on these rows.
      -------------------------------------------------- */
      cached_login_views AS (
      SELECT
      DATE(es.submission_timestamp) AS flow_date,
      es.metrics.string.session_entrypoint AS entrypoint,
      es.metrics.string.relying_party_oauth_client_id AS oauth_client_id,
      es.metrics.string.relying_party_service AS service,
      es.metrics.string.session_device_type AS device_type,
      es.metrics.string.session_flow_id AS flow_id
      FROM `mozdata.accounts_frontend.events_stream` AS es
      CROSS JOIN params p
      WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event = 'cached_login.view'
      AND (ARRAY_LENGTH(p.entrypoint_filter) = 0 OR es.metrics.string.session_entrypoint IN UNNEST(p.entrypoint_filter))
      AND (ARRAY_LENGTH(p.oauth_client_id_filter) = 0 OR es.metrics.string.relying_party_oauth_client_id IN UNNEST(p.oauth_client_id_filter))
      AND (ARRAY_LENGTH(p.service_filter) = 0 OR es.metrics.string.relying_party_service IN UNNEST(p.service_filter))
      AND (ARRAY_LENGTH(p.device_type_filter) = 0 OR es.metrics.string.session_device_type IN UNNEST(p.device_type_filter))
      ),

      cached_login_successes AS (
      SELECT DISTINCT
      es.metrics.string.session_flow_id AS flow_id
      FROM `mozdata.accounts_frontend.events_stream` AS es
      CROSS JOIN params p
      WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event = 'cached_login.success_view'
      AND (ARRAY_LENGTH(p.entrypoint_filter) = 0 OR es.metrics.string.session_entrypoint IN UNNEST(p.entrypoint_filter))
      AND (ARRAY_LENGTH(p.oauth_client_id_filter) = 0 OR es.metrics.string.relying_party_oauth_client_id IN UNNEST(p.oauth_client_id_filter))
      AND (ARRAY_LENGTH(p.service_filter) = 0 OR es.metrics.string.relying_party_service IN UNNEST(p.service_filter))
      AND (ARRAY_LENGTH(p.device_type_filter) = 0 OR es.metrics.string.session_device_type IN UNNEST(p.device_type_filter))
      ),

      cached_login_results AS (
      SELECT
      'summary' AS row_type,
      'AuthZ' AS auth_type,
      COUNT(DISTINCT s.flow_id) AS completed_flows,
      v.device_type,
      v.entrypoint,
      'cached_login.view' AS first_view_bucket,
      v.flow_date,
      v.oauth_client_id,
      v.service,
      COUNT(DISTINCT v.flow_id) AS started_flows,

      CAST(NULL AS STRING) AS authn_type,
      CAST(NULL AS STRING) AS authn_reason,
      CAST(0 AS INT64) AS authn_count
      FROM cached_login_views v
      LEFT JOIN cached_login_successes s
      ON s.flow_id = v.flow_id
      GROUP BY
      v.device_type,
      v.entrypoint,
      v.flow_date,
      v.oauth_client_id,
      v.service
      )

      /* Final output columns */
      SELECT
      auth_type,
      completed_flows,
      device_type,
      entrypoint,
      first_view_bucket,
      flow_date,
      oauth_client_id,
      service,
      started_flows,
      authn_type,
      authn_reason,
      authn_count
      FROM non_cached_results

      UNION ALL

      SELECT
      auth_type,
      completed_flows,
      device_type,
      entrypoint,
      first_view_bucket,
      flow_date,
      oauth_client_id,
      service,
      started_flows,
      authn_type,
      authn_reason,
      authn_count
      FROM cached_login_results

      UNION ALL

      SELECT
      auth_type,
      completed_flows,
      device_type,
      entrypoint,
      first_view_bucket,
      flow_date,
      oauth_client_id,
      service,
      started_flows,
      authn_type,
      authn_reason,
      authn_count
      FROM authn_breakout_results

      ORDER BY
      flow_date DESC,
      started_flows DESC,
      authn_count DESC
      {% endraw %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: flow_date {
    type: date
    datatype: date
    sql: ${TABLE}.flow_date ;;
  }

  dimension: first_view_bucket {
    type: string
    sql: ${TABLE}.first_view_bucket ;;
  }

  dimension: auth_type {
    type: string
    sql: ${TABLE}.auth_type ;;
  }

  dimension: entrypoint {
    type: string
    sql: ${TABLE}.entrypoint ;;
  }

  dimension: oauth_client_id {
    type: string
    sql: ${TABLE}.oauth_client_id ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}.service ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: started_flows {
    type: number
    sql: ${TABLE}.started_flows ;;
  }

  dimension: completed_flows {
    type: number
    sql: ${TABLE}.completed_flows ;;
  }

  dimension: authn_type {
    label: "AuthN Type"
    type: string
    sql: ${TABLE}.authn_type ;;
  }

  dimension: authn_reason {
    label: "AuthN Reason"
    type: string
    sql: ${TABLE}.authn_reason ;;
  }

  dimension: authn_count {
    label: "AuthN Count"
    type: number
    sql: ${TABLE}.authn_count ;;
  }

  set: detail {
    fields: [
      flow_date,
      first_view_bucket,
      auth_type,
      entrypoint,
      oauth_client_id,
      service,
      device_type,
      started_flows,
      completed_flows,
      authn_type,
      authn_reason,
      authn_count
    ]
  }
}
