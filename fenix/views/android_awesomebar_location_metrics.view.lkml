
view: android_awesomebar_location_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-01-01'
          AND sample_id = 0
          GROUP BY 1),

      product_feature as
      (SELECT date(submission_timestamp) as submission_date
      , metrics.string.preferences_toolbar_position_setting
      ,100*COUNT(DISTINCT client_info.client_id) as clients
      FROM `mozdata.fenix.metrics`
      where date(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0
      GROUP BY 1,2)

      SELECT
      submission_date,
      dau,
      preferences_toolbar_position_setting,
      clients
      FROM product_feature
      JOIN dau_segments
      USING (submission_date) ;;
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

  dimension: preferences_toolbar_position_setting {
    type: string
    sql: ${TABLE}.preferences_toolbar_position_setting;;
  }

  measure: clients {
    type: sum
    sql: ${TABLE}.clients ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      preferences_toolbar_position_setting,
      clients
    ]
  }
}
