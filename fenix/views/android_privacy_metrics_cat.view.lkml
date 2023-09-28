
view: android_privacy_metrics_cat {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT submission_date, SUM(DAU) as dau
          FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
          WHERE app_name = 'Fenix'
          --AND channel = 'release'
          AND submission_date >= '2021-05-05'
          GROUP BY 1),

      custom_cookies_selection as
      (SELECT date(submission_timestamp) as submission_date
      ,metrics.string.preferences_etp_custom_cookies_selection
      , 'preferences_etp_custom_cookies_selection' as metric_name
      ,COUNT(DISTINCT client_info.client_id) as clients
      FROM `mozdata.fenix.metrics`
      where date(submission_timestamp) = '2023-09-01'
      AND sample_id = 0
      GROUP BY 1,2,3
      ),

      enhanced_tracking_protection as
      (SELECT date(submission_timestamp) as submission_date
      ,metrics.string.preferences_enhanced_tracking_protection
      ,'preferences_enhanced_tracking_protection' as metric_name
      ,COUNT(DISTINCT client_info.client_id) as clients
      FROM `mozdata.fenix.metrics`
      where date(submission_timestamp) = '2023-09-01'
      AND sample_id = 0
      GROUP BY 1,2,3
      )

      SELECT *
      FROM custom_cookies_selection
      UNION ALL
      SELECT *
      FROM enhanced_tracking_protection ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: preferences_etp_custom_cookies_selection {
    type: string
    sql: ${TABLE}.preferences_etp_custom_cookies_selection ;;
  }

  measure: metric_name {
    type: string
    sql: ${TABLE}.metric_name ;;
  }

  measure: clients {
    type: number
    sql: ${TABLE}.clients ;;
  }

  set: detail {
    fields: [
      submission_date,
      preferences_etp_custom_cookies_selection,
      metric_name,
      clients
    ]
  }
}
