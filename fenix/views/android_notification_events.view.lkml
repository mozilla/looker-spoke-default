
view: android_notification_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2022-11-28'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,

          CASE WHEN event_category = 'events' AND event_name = 're_engagement_notif_shown' THEN 1 ELSE 0 END as re_engagement_notif_shown,
          CASE WHEN event_category = 'events' AND event_name = 're_engagement_notif_tapped' THEN 1 ELSE 0 END as re_engagement_notif_tapped


          FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2022-11-28'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --re_engagement_notif_shown
      , 100*SUM(re_engagement_notif_shown) as re_engagement_notif_shown
      , 100*COUNT(DISTINCT CASE WHEN re_engagement_notif_shown > 0 THEN client_id END) AS re_engagement_notif_shown_users
      --re_engagement_notif_tapped
      , 100*SUM(re_engagement_notif_tapped) as re_engagement_notif_tapped
      , 100*COUNT(DISTINCT CASE WHEN re_engagement_notif_tapped > 0 THEN client_id END) AS re_engagement_notif_tapped_users

      FROM product_features
      where submission_date >= '2022-11-28'
      group by 1
      )

      select d.submission_date
      , dau
      , re_engagement_notif_shown
      , re_engagement_notif_shown_users
      , re_engagement_notif_tapped
      , re_engagement_notif_tapped_users

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

  measure: re_engagement_notif_shown {
    type: sum
    sql: ${TABLE}.re_engagement_notif_shown ;;
  }

  measure: re_engagement_notif_shown_users {
    type: sum
    sql: ${TABLE}.re_engagement_notif_shown_users ;;
  }

  measure: re_engagement_notif_tapped {
    type: sum
    sql: ${TABLE}.re_engagement_notif_tapped ;;
  }

  measure: re_engagement_notif_tapped_users {
    type: sum
    sql: ${TABLE}.re_engagement_notif_tapped_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      re_engagement_notif_shown,
      re_engagement_notif_shown_users,
      re_engagement_notif_tapped,
      re_engagement_notif_tapped_users
    ]
  }
}
