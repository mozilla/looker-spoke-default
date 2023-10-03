
view: android_notification_metrics {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.metrics`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2022-11-15'
          AND sample_id = 0
          GROUP BY 1),


      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(CASE WHEN metrics.boolean.metrics_notifications_allowed THEN 1 ELSE 0 END)) AS metrics_notifications_allowed,
          COALESCE(SUM(CASE WHEN metrics.boolean.events_marketing_notification_allowed THEN 1 ELSE 0 END)) AS events_marketing_notification_allowed
          FROM `mozdata.fenix.metrics`
      where DATE(submission_timestamp) >= '2022-11-15'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --metrics_notifications_allowed
          100*COUNT(DISTINCT CASE WHEN metrics_notifications_allowed > 0 THEN client_id END) AS metrics_notifications_allowed_users,
          100*COALESCE(SUM(metrics_notifications_allowed), 0) AS metrics_notifications_allowed,
          --events_marketing_notification_allowed
          100*COUNT(DISTINCT CASE WHEN events_marketing_notification_allowed > 0 THEN client_id END) AS events_marketing_notification_allowed_users,
          100*COALESCE(SUM(events_marketing_notification_allowed), 0) AS events_marketing_notification_allowed
      FROM product_features
      where submission_date >= '2022-11-15'
      group by 1)


      select d.submission_date
      , dau
      , metrics_notifications_allowed_users
      , metrics_notifications_allowed
      , events_marketing_notification_allowed_users
      , events_marketing_notification_allowed
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

  measure: metrics_notifications_allowed_users {
    type: sum
    sql: ${TABLE}.metrics_notifications_allowed_users ;;
  }

  measure: metrics_notifications_allowed {
    type: sum
    sql: ${TABLE}.metrics_notifications_allowed ;;
  }

  measure: events_marketing_notification_allowed_users {
    type: sum
    sql: ${TABLE}.events_marketing_notification_allowed_users ;;
  }

  measure: events_marketing_notification_allowed {
    type: sum
    sql: ${TABLE}.events_marketing_notification_allowed ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      metrics_notifications_allowed_users,
      metrics_notifications_allowed,
      events_marketing_notification_allowed_users,
      events_marketing_notification_allowed
    ]
  }
}
