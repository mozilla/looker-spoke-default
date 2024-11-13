
view: ios_notification_metrics {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.metrics`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2023-06-22'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_sync_notifs THEN 1 ELSE 0 END), 0) AS preferences_sync_notifs,
          COALESCE(SUM(CASE WHEN metrics.boolean.preferences_tips_and_features_notifs THEN 1 ELSE 0 END), 0) AS preferences_tips_and_features_notifs

          FROM `mozdata.firefox_ios.metrics`
      where DATE(submission_timestamp) >= '2023-06-22'
      AND sample_id = 0
      group by 1,2),

      product_features_agg AS
      (SELECT
          submission_date,
          --preferences_sync_notifs
          100*COUNT(DISTINCT CASE WHEN preferences_sync_notifs > 0 THEN client_id END) AS preferences_sync_notifs_users,
          100*COALESCE(SUM(preferences_sync_notifs), 0) AS preferences_sync_notifs,
          -- preferences_tips_and_features_notifs
          100*COUNT(DISTINCT CASE WHEN preferences_tips_and_features_notifs > 0 THEN client_id END) AS preferences_tips_and_features_notifs_users,
          100*COALESCE(SUM(preferences_tips_and_features_notifs), 0) AS preferences_tips_and_features_notifs

          FROM product_features
      where submission_date >= '2023-06-22'
      group by 1)


      select submission_date,
      dau,
      preferences_sync_notifs_users,
      preferences_sync_notifs,
      preferences_tips_and_features_notifs_users,
      preferences_tips_and_features_notifs

      from dau_segments
      JOIN product_features_agg
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

  measure: preferences_sync_notifs_users {
    type: sum
    sql: ${TABLE}.preferences_sync_notifs_users ;;
  }

  measure: preferences_sync_notifs {
    type: sum
    sql: ${TABLE}.preferences_sync_notifs ;;
  }

  measure: preferences_tips_and_features_notifs_users {
    type: sum
    sql: ${TABLE}.preferences_tips_and_features_notifs_users ;;
  }

  measure: preferences_tips_and_features_notifs {
    type: sum
    sql: ${TABLE}.preferences_tips_and_features_notifs ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      preferences_sync_notifs_users,
      preferences_sync_notifs,
      preferences_tips_and_features_notifs_users,
      preferences_tips_and_features_notifs
    ]
  }
}
