
view: android_privacy_metrics_cat {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-05-05'
          AND sample_id = 0
          GROUP BY 1),

      custom_cookies_selection as
      (SELECT date(submission_timestamp) as submission_date
      ,CASE WHEN metrics.string.preferences_etp_custom_cookies_selection IN ('third_party', 'all', 'social', 'total_protection',
      'unvisited') THEN metrics.string.preferences_etp_custom_cookies_selection ELSE 'null' END AS metric_cat
      , 'preferences_etp_custom_cookies_selection' as metric_name
      ,100*COUNT(DISTINCT client_info.client_id) as clients
      FROM `mozdata.fenix.metrics`
      where date(submission_timestamp) >= '2021-05-05'
      AND sample_id = 0
      GROUP BY 1,2,3
      ),

      enhanced_tracking_protection as
      (SELECT date(submission_timestamp) as submission_date
      ,CASE WHEN metrics.string.preferences_enhanced_tracking_protection IN ('strict', 'custom', 'standard') THEN
      metrics.string.preferences_enhanced_tracking_protection ELSE 'null' END AS metric_cat
      ,'preferences_enhanced_tracking_protection' as metric_name
      ,100*COUNT(DISTINCT client_info.client_id) as clients
      FROM `mozdata.fenix.metrics`
      where date(submission_timestamp) >= '2021-05-05'
      AND sample_id = 0
      GROUP BY 1,2,3
      )

      SELECT * FROM
      (SELECT *
      FROM custom_cookies_selection
      UNION ALL
      SELECT *
      FROM enhanced_tracking_protection) a
      JOIN dau_segments
      USING (submission_date) ;;
  }


  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: metric_cat {
    type: string
    sql: ${TABLE}.metric_cat
  ;;
  }

  dimension: metric_name {
    type: string
    sql: ${TABLE}.metric_name ;;
  }

  measure: clients {
    type: sum
    sql: ${TABLE}.clients ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  set: detail {
    fields: [
      submission_date,
      metric_cat,
      metric_name,
      clients,
      dau
    ]
  }
}
