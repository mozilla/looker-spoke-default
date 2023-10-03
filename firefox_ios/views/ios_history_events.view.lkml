
view: ios_history_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2022-04-18'
                AND sample_id = 0
                GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          CASE WHEN event_category = 'history' AND event_name = 'delete_tap' THEN 1 ELSE 0 END as delete_tap,
          CASE WHEN event_category = 'history' AND event_name = 'opened' THEN 1 ELSE 0 END as opened,
          CASE WHEN event_category = 'history' AND event_name = 'removed' THEN 1 ELSE 0 END as removed,
          CASE WHEN event_category = 'history' AND event_name = 'removed_all' THEN 1 ELSE 0 END as removed_all,
          CASE WHEN event_category = 'history' AND event_name = 'removed_today' THEN 1 ELSE 0 END as removed_today,
          CASE WHEN event_category = 'history' AND event_name = 'removed_today_and_yesterday' THEN 1 ELSE 0 END as removed_today_and_yesterday,
          CASE WHEN event_category = 'history' AND event_name = 'search_tap' THEN 1 ELSE 0 END as search_tap
          FROM `mozdata.firefox_ios.events_unnested`
      where DATE(submission_timestamp) >= '2022-04-18'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date,
      --delete_tap
      100*SUM(delete_tap) as delete_tap,
      100*COUNT(DISTINCT CASE WHEN delete_tap > 0 THEN client_id END) AS delete_tap_users,
      -- Opened
      100*SUM(opened) as opened,
      100*COUNT(DISTINCT CASE WHEN opened > 0 THEN client_id END) AS opened_users,
      -- Removed
      100*SUM(removed) as removed,
      100*COUNT(DISTINCT CASE WHEN removed > 0 THEN client_id END) AS removed_users,
      -- Removed All
      100*SUM(removed_all) as removed_all,
      100*COUNT(DISTINCT CASE WHEN removed_all > 0 THEN client_id END) AS removed_all_users,
      -- Removed Today
      100*SUM(removed_today) as removed_today,
      100*COUNT(DISTINCT CASE WHEN removed_today > 0 THEN client_id END) AS removed_today_users,
      -- Removed Today and Yesterday
      100*SUM(removed_today_and_yesterday) as removed_today_and_yesterday,
      100*COUNT(DISTINCT CASE WHEN removed_today_and_yesterday > 0 THEN client_id END) AS removed_today_and_yesterday_users,
      -- Search Tap
      100*SUM(search_tap) as search_tap,
      100*COUNT(DISTINCT CASE WHEN search_tap > 0 THEN client_id END) AS search_tap_users
      FROM product_features
      where submission_date >= '2022-04-18'
      group by 1
      )

      select d.submission_date,
          dau,
          delete_tap,
          delete_tap_users,
          opened,
          opened_users,
          removed,
          removed_users,
          removed_all,
          removed_all_users,
          removed_today,
          removed_today_users,
          removed_today_and_yesterday,
          removed_today_and_yesterday_users,
          search_tap,
          search_tap_users

      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date
      ORDER BY d.submission_date ;;
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

  measure: delete_tap {
    type: sum
    sql: ${TABLE}.delete_tap ;;
  }

  measure: delete_tap_users {
    type: sum
    sql: ${TABLE}.delete_tap_users ;;
  }

  measure: opened {
    type: sum
    sql: ${TABLE}.opened ;;
  }

  measure: opened_users {
    type: sum
    sql: ${TABLE}.opened_users ;;
  }

  measure: removed {
    type: sum
    sql: ${TABLE}.removed ;;
  }

  measure: removed_users {
    type: sum
    sql: ${TABLE}.removed_users ;;
  }

  measure: removed_all {
    type: sum
    sql: ${TABLE}.removed_all ;;
  }

  measure: removed_all_users {
    type: sum
    sql: ${TABLE}.removed_all_users ;;
  }

  measure: removed_today {
    type: sum
    sql: ${TABLE}.removed_today ;;
  }

  measure: removed_today_users {
    type: sum
    sql: ${TABLE}.removed_today_users ;;
  }

  measure: removed_today_and_yesterday {
    type: sum
    sql: ${TABLE}.removed_today_and_yesterday ;;
  }

  measure: removed_today_and_yesterday_users {
    type: sum
    sql: ${TABLE}.removed_today_and_yesterday_users ;;
  }

  measure: search_tap {
    type: sum
    sql: ${TABLE}.search_tap ;;
  }

  measure: search_tap_users {
    type: sum
    sql: ${TABLE}.search_tap_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      delete_tap,
      delete_tap_users,
      opened,
      opened_users,
      removed,
      removed_users,
      removed_all,
      removed_all_users,
      removed_today,
      removed_today_users,
      removed_today_and_yesterday,
      removed_today_and_yesterday_users,
      search_tap,
      search_tap_users
    ]
  }
}
