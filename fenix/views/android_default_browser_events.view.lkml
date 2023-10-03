
view: android_default_browser_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-04-15'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,

          CASE WHEN event_category = 'events' AND event_name = 'default_browser_changed' THEN 1 ELSE 0 END as default_browser_changed

          FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-04-15'
      AND sample_id = 0),

      product_features_agg AS
      (SELECT
          submission_date,
          --default_browser_changed
          100*COUNT(DISTINCT CASE WHEN default_browser_changed > 0 THEN client_id END) AS default_browser_changed_users,
          100*COALESCE(SUM(default_browser_changed), 0) AS default_browser_changed
      FROM product_features
      where submission_date >= '2021-04-15'
      group by 1)


      select d.submission_date
      , dau
      , default_browser_changed_users
      , default_browser_changed
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

  measure: default_browser_changed_users {
    type: sum
    sql: ${TABLE}.default_browser_changed_users ;;
  }

  measure: default_browser_changed {
    type: sum
    sql: ${TABLE}.default_browser_changed ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      default_browser_changed_users,
      default_browser_changed
    ]
  }
}
