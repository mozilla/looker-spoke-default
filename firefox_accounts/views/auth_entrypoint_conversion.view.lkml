
view: auth_entrypoint_conversion {
  derived_table: {
    sql: {% raw %} WITH params AS (
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
      
           Logic:
           1. Find the first qualifying frontend view per flow_id
           2. Apply dashboard-style dimension filters to that first view
           3. Find backend completion events
           4. Count a flow as completed only if completion happened
              at or after the first view timestamp
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
      
        backend_completes AS (
          SELECT
            es.metrics.string.session_flow_id AS flow_id,
            es.event_timestamp AS complete_ts
          FROM `mozdata.accounts_backend.events_stream` AS es
          WHERE es.submission_timestamp >= TIMESTAMP('2026-01-01 00:00:00+00')
            AND es.submission_timestamp < CURRENT_TIMESTAMP()
            AND es.metrics.string.session_flow_id IS NOT NULL
            AND es.event IN (
              'login.complete',
              'third_party_auth.apple_login_complete',
              'third_party_auth.apple_reg_complete',
              'third_party_auth.google_login_complete',
              'third_party_auth.google_reg_complete',
              'reg.complete'
            )
        ),
      
        completed_non_cached_flows AS (
          SELECT DISTINCT
            v.flow_id
          FROM filtered_first_view_per_flow v
          WHERE EXISTS (
            SELECT 1
            FROM backend_completes c
            WHERE c.flow_id = v.flow_id
              AND c.complete_ts >= v.first_view_ts
          )
        ),
      
        non_cached_results AS (
          SELECT
            DATE(v.first_view_ts) AS flow_date,
            v.first_view_event AS first_view_bucket,
            'AuthN' AS auth_type,                           -- AuthN = Authentication
            v.entrypoint,
            v.oauth_client_id,
            v.service,
            v.device_type,
            COUNT(DISTINCT v.flow_id) AS started_flows,
            COUNT(DISTINCT c.flow_id) AS completed_flows
          FROM filtered_first_view_per_flow v
          LEFT JOIN completed_non_cached_flows c
            ON c.flow_id = v.flow_id
          GROUP BY 1, 2, 3, 4, 5, 6, 7
        ),
      
        /* -------------------------------------------------
           Cached login = Authorization
      
           Logic:
           1. cached_login.view = started
           2. cached_login.success_view = completed
           3. Join only by flow_id
           4. No timestamp ordering requirement for completion
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
            v.flow_date,
            'cached_login.view' AS first_view_bucket,
            'AuthZ' AS auth_type,                             --AuthZ = Authorization
            v.entrypoint,
            v.oauth_client_id,
            v.service,
            v.device_type,
            COUNT(DISTINCT v.flow_id) AS started_flows,
            COUNT(DISTINCT s.flow_id) AS completed_flows
          FROM cached_login_views v
          LEFT JOIN cached_login_successes s
            ON s.flow_id = v.flow_id
          GROUP BY 1, 2, 3, 4, 5, 6, 7
        )
      
        /* Final output:
           - Authentication rows from the non-cached branch
           - Authorization rows from the cached-login branch
        */
        SELECT *
        FROM non_cached_results
      
        UNION ALL
      
        SELECT *
        FROM cached_login_results
      
        ORDER BY
          flow_date DESC,
          started_flows DESC {% endraw %} ;;
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
	completed_flows
    ]
  }
}
