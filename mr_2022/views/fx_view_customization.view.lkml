view: fx_view_customization {
  # sadly this table has to be rebuilt every day because the client's status WRT firefox view changes.
  derived_table: {
    sql: WITH
        clients AS (
            SELECT
                client_id,
                MAX(CASE WHEN c.key LIKE 'firefox-view-button_remove%' THEN submission_timestamp END) AS latest_remove,
                MAX(CASE WHEN c.key LIKE 'firefox-view-button_add%' THEN submission_timestamp END) AS latest_add,
            FROM telemetry.main_1pct
            CROSS JOIN UNNEST(payload.processes.parent.keyed_scalars.browser_ui_customized_widgets) c
            WHERE DATE(submission_timestamp) >= DATE(2022, 9, 20)
            AND ARRAY_LENGTH(payload.processes.parent.keyed_scalars.browser_ui_customized_widgets) != 0
            AND (c.key LIKE 'firefox-view-button_remove%' OR c.key LIKE 'firefox-view-button_add%')
            AND SAFE_CAST(SUBSTR(application.display_version, 1, 3) AS float64) >= 106
            GROUP BY 1
        )

      SELECT
          DATE(submission_timestamp) AS submission_date,
          client_id,
          ANY_VALUE(metadata.geo.country) AS country,
          LOGICAL_OR(COALESCE(environment.services.account_enabled, FALSE)) AS account_enabled,
          LOGICAL_OR(COALESCE(`mozfun`.hist.extract_histogram_sum(payload.histograms.weave_device_count_mobile) > 0, FALSE)) AS has_mobile_device,
          COALESCE(LOGICAL_OR(DATE(latest_remove) = DATE(submission_timestamp)), FALSE) removed_today,
          COALESCE(LOGICAL_OR(DATE(latest_add) = DATE(submission_timestamp)), FALSE) added_today,
          COALESCE(LOGICAL_OR((latest_add IS NULL AND latest_remove IS NOT NULL) OR latest_add < latest_remove), FALSE) AS fx_view_currently_removed,
      FROM telemetry.main_1pct
      LEFT JOIN clients
      USING(client_id)
      WHERE DATE(submission_timestamp) >= DATE(2022, 9, 20)
      AND SAFE_CAST(SUBSTR(application.display_version, 1, 3) AS float64) >= 106
      GROUP BY 1,2
      ORDER BY 1,2;;
  }


  dimension_group: submission {
    sql: DATE(${TABLE}.submission_date) ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    hidden: yes
  }

  dimension: account_enabled {
    type: yesno
    label: "Firefox Account Enabled"
    sql: ${TABLE}.account_enabled ;;
    description: "Whether Client-Side Telemetry Indicates They Have an Fx Account Connected"
  }

  dimension: has_mobile_device {
    type: yesno
    label: "Is Syncing to Mobile Device"
    sql: ${TABLE}.has_mobile_device ;;
    description: "Whether Client-Side Telemetry Indicates They Have a Mobile Sync Device Connected"
  }

  dimension: fx_view_currently_removed {
    type: yesno
    label: "Firefox View is Currently Removed"
    sql: ${TABLE}.fx_view_currently_removed ;;
    description: "Whether the Client Currently Has Fx View Removed (As of their telemetry submission day)"
  }

  dimension: removed_today {
    type: yesno
    label: "Firefox View Removed Today"
    sql: ${TABLE}.removed_today ;;
    description: "Whether the Client Removed Fx View Today"
  }

  dimension: added_today {
    type: yesno
    sql: ${TABLE}.removed_today ;;
    label: "Firefox View Re-Added Today"
    description: "Whether the Client Added Back Fx View Today"
  }

  measure: client_count {
    type: count_distinct
    label: "Client Count"
    description: "Count of Clients - Note this is From a 1% Sample, so you need to multiply by 100."
    sql: ${TABLE}.client_id ;;
  }

}
