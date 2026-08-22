view: auth_entrypoint_conversion {
  derived_table: {
    sql:
      WITH
      /*
      Read only the flow-start events needed by the requested dashboard dates.
      The existing flow_date, entrypoint, OAuth client, service, and device
      dashboard filters are injected into this SQL by Looker.
      */
      frontend_flow_starts AS (
        SELECT
          es.metrics.string.session_flow_id AS flow_id,
          es.event AS first_view_event,
          es.submission_timestamp AS first_view_ts,
          es.event_timestamp AS event_ts,
          es.metrics.string.relying_party_oauth_client_id AS oauth_client_id,
          es.metrics.string.relying_party_service AS service,
          es.metrics.string.session_entrypoint AS entrypoint,
          es.metrics.string.session_device_type AS device_type
        FROM `mozdata.accounts_frontend.events_stream` AS es
        WHERE es.submission_timestamp >= TIMESTAMP('2025-01-01 00:00:00+00')
          AND es.submission_timestamp < CURRENT_TIMESTAMP()
          AND es.metrics.string.session_flow_id IS NOT NULL
          AND es.event IN (
            'email.first_view',
            'login.view',
            'login.otp_view',
            'reg.otp_view',
            'login.alternative_auth_view',
            'reg.view',
            'cached_login.view'
          )
          /* Push the dashboard date filter into the partitioned source scan. */
          AND {% condition flow_date %} DATE(es.submission_timestamp) {% endcondition %}
      ),

      /* Select the first non-cached authentication screen for each flow. */
      first_view_per_flow AS (
      SELECT
      flow_id,
      first_view_event,
      first_view_ts,
      oauth_client_id,
      service,
      entrypoint,
      device_type
      FROM frontend_flow_starts
      WHERE first_view_event != 'cached_login.view'
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY flow_id
      ORDER BY first_view_ts, event_ts, first_view_event
      ) = 1
      ),

      /*
      Apply dimensional filters after selecting the first screen so filtering
      cannot accidentally turn a later screen into the flow's first screen.
      */
      filtered_first_view_per_flow AS (
      SELECT
      v.*
      FROM first_view_per_flow AS v
      WHERE {% condition first_view_bucket %} v.first_view_event {% endcondition %}
      AND {% condition entrypoint %} v.entrypoint {% endcondition %}
      AND {% condition oauth_client_id %} v.oauth_client_id {% endcondition %}
      AND {% condition service %} v.service {% endcondition %}
      AND {% condition device_type %} v.device_type {% endcondition %}
      ),

      /*
      Centralize the backend completion event set. The original SQL defines two
      separate source scans; BigQuery can now optimize from one shared CTE.

      The broad source range is intentionally retained here so a completion
      occurring after the selected flow date is not dropped.
      */
      backend_completes AS (
      SELECT
      es.metrics.string.session_flow_id AS flow_id,
      es.event AS completion_event,
      es.submission_timestamp AS complete_ts,
      es.extras.string.reason AS authn_reason,
      CASE
      WHEN es.event = 'login.complete' THEN 'login'
      WHEN es.event = 'reg.complete' THEN 'registration'
      ELSE NULL
      END AS authn_type
      FROM `mozdata.accounts_backend.events_stream` AS es
      WHERE es.submission_timestamp >= TIMESTAMP('2025-01-01 00:00:00+00')
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

      /* Keep the first valid completion for each non-cached flow. */
      completed_non_cached_flows AS (
      SELECT
      v.flow_id,
      c.completion_event,
      c.complete_ts
      FROM filtered_first_view_per_flow AS v
      JOIN backend_completes AS c
      ON c.flow_id = v.flow_id
      AND c.complete_ts >= v.first_view_ts
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY v.flow_id
      ORDER BY c.complete_ts, c.completion_event
      ) = 1
      ),

      /* Keep the first password/OTP AuthN completion and its reason. */
      completed_authn_breakout_flows AS (
      SELECT
      v.flow_id,
      c.completion_event,
      c.complete_ts,
      c.authn_type,
      c.authn_reason
      FROM filtered_first_view_per_flow AS v
      JOIN backend_completes AS c
      ON c.flow_id = v.flow_id
      AND c.complete_ts >= v.first_view_ts
      WHERE c.authn_type IS NOT NULL
      QUALIFY ROW_NUMBER() OVER (
      PARTITION BY v.flow_id
      ORDER BY c.complete_ts, c.completion_event
      ) = 1
      ),

      /*
      Each first-view row is already unique by flow_id, so COUNT(*) and
      COUNTIF are sufficient; repeated COUNT(DISTINCT ...) is unnecessary.
      */
      non_cached_results AS (
      SELECT
      'summary' AS row_type,
      'AuthN' AS auth_type,
      COUNTIF(c.flow_id IS NOT NULL) AS completed_flows,
      v.device_type,
      v.entrypoint,
      v.first_view_event AS first_view_bucket,
      DATE(v.first_view_ts) AS flow_date,
      v.oauth_client_id,
      v.service,
      COUNT(*) AS started_flows,
      CAST(NULL AS STRING) AS authn_type,
      CAST(NULL AS STRING) AS authn_reason,
      CAST(0 AS INT64) AS authn_count
      FROM filtered_first_view_per_flow AS v
      LEFT JOIN completed_non_cached_flows AS c
      ON c.flow_id = v.flow_id
      GROUP BY
      v.device_type,
      v.entrypoint,
      v.first_view_event,
      DATE(v.first_view_ts),
      v.oauth_client_id,
      v.service
      ),

      /* Build AuthN login/registration breakouts from one row per flow. */
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
      c.authn_type,
      c.authn_reason,
      COUNT(*) AS authn_count
      FROM filtered_first_view_per_flow AS v
      JOIN completed_authn_breakout_flows AS c
      ON c.flow_id = v.flow_id
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

      /* Apply the same dashboard filters to cached-login flow starts. */
      cached_login_views AS (
      SELECT
      DATE(v.first_view_ts) AS flow_date,
      v.entrypoint,
      v.oauth_client_id,
      v.service,
      v.device_type,
      v.flow_id
      FROM frontend_flow_starts AS v
      WHERE v.first_view_event = 'cached_login.view'
      AND {% condition first_view_bucket %} v.first_view_event {% endcondition %}
      AND {% condition entrypoint %} v.entrypoint {% endcondition %}
      AND {% condition oauth_client_id %} v.oauth_client_id {% endcondition %}
      AND {% condition service %} v.service {% endcondition %}
      AND {% condition device_type %} v.device_type {% endcondition %}
      ),

      /*
      Preserve the original definition by finding cached-login successes over
      the full supported range, including successes after the selected date.
      */
      cached_login_successes AS (
      SELECT DISTINCT
      es.metrics.string.session_flow_id AS flow_id
      FROM `mozdata.accounts_frontend.events_stream` AS es
      WHERE es.submission_timestamp >= TIMESTAMP('2025-01-01 00:00:00+00')
      AND es.submission_timestamp < CURRENT_TIMESTAMP()
      AND es.metrics.string.session_flow_id IS NOT NULL
      AND es.event = 'cached_login.success_view'
      ),

      /* Preserve distinct counting because cached-login views may repeat. */
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
      FROM cached_login_views AS v
      LEFT JOIN cached_login_successes AS s
      ON s.flow_id = v.flow_id
      GROUP BY
      v.device_type,
      v.entrypoint,
      v.flow_date,
      v.oauth_client_id,
      v.service
      )

      /* UNION ALL preserves the three existing result row types. */
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
      ;;
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
