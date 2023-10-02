
view: android_privacy_metrics_num {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT submission_date, SUM(DAU) as dau
          FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
          WHERE app_name = 'Fenix'
          --AND channel = 'release'
          AND submission_date >= '2023-06-23'
          GROUP BY 1),


      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,
      COALESCE(SUM(metrics.counter.metrics_private_tabs_open_count), 0) AS metrics_private_tabs_open_count,
      FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2023-06-23'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
      submission_date,
      --metrics_private_tabs_open_count
      100*COUNT(DISTINCT CASE WHEN metrics_private_tabs_open_count > 0 THEN client_id END) AS metrics_private_tabs_open_count_users,
      100*COALESCE(SUM(metrics_private_tabs_open_count), 0) AS metrics_private_tabs_open_count
      FROM product_features
      where submission_date >= '2023-06-23'
      group by 1)


      select d.submission_date
      , dau
      , metrics_private_tabs_open_count_users
      , metrics_private_tabs_open_count
      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date ;;
  }



  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: metrics_private_tabs_open_count_users {
    type: sum
    sql: ${TABLE}.metrics_private_tabs_open_count_users ;;
  }

  measure: metrics_private_tabs_open_count {
    type: sum
    sql: ${TABLE}.metrics_private_tabs_open_count ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      metrics_private_tabs_open_count_users,
      metrics_private_tabs_open_count
    ]
  }
}
