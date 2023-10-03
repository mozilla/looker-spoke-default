
view: android_history_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-01-01'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,

      CASE WHEN event_category = 'history' AND event_name = 'opened' THEN 1 ELSE 0 END as opened,
      CASE WHEN event_category = 'history' AND event_name = 'opened_item' THEN 1 ELSE 0 END as opened_item,
      CASE WHEN event_category = 'history' AND event_name = 'opened_items_in_new_tabs' THEN 1 ELSE 0 END as opened_items_in_new_tabs,
      CASE WHEN event_category = 'history' AND event_name = 'opened_items_in_private_tabs' THEN 1 ELSE 0 END as opened_items_in_private_tabs,
      CASE WHEN event_category = 'history' AND event_name = 'recent_searches_tapped' THEN 1 ELSE 0 END as recent_searches_tapped,
      CASE WHEN event_category = 'history' AND event_name = 'remove_prompt_cancelled' THEN 1 ELSE 0 END as remove_prompt_cancelled,
      CASE WHEN event_category = 'history' AND event_name = 'remove_prompt_opened' THEN 1 ELSE 0 END as remove_prompt_opened,
      CASE WHEN event_category = 'history' AND event_name = 'removed' THEN 1 ELSE 0 END as removed,
      CASE WHEN event_category = 'history' AND event_name = 'removed_all' THEN 1 ELSE 0 END as removed_all,
      CASE WHEN event_category = 'history' AND event_name = 'removed_last_hour' THEN 1 ELSE 0 END as removed_last_hour,
      CASE WHEN event_category = 'history' AND event_name = 'removed_today_and_yesterday' THEN 1 ELSE 0 END as removed_today_and_yesterday,
      CASE WHEN event_category = 'history' AND event_name = 'search_icon_tapped' THEN 1 ELSE 0 END as search_icon_tapped,
      CASE WHEN event_category = 'history' AND event_name = 'search_result_tapped' THEN 1 ELSE 0 END as search_result_tapped,
      CASE WHEN event_category = 'history' AND event_name = 'search_term_group_open_tab' THEN 1 ELSE 0 END as search_term_group_open_tab,
      CASE WHEN event_category = 'history' AND event_name = 'search_term_group_remove_all' THEN 1 ELSE 0 END as search_term_group_remove_all,
      CASE WHEN event_category = 'history' AND event_name = 'search_term_group_remove_tab' THEN 1 ELSE 0 END as search_term_group_remove_tab,
      CASE WHEN event_category = 'history' AND event_name = 'search_term_group_tapped' THEN 1 ELSE 0 END as search_term_group_tapped,
      CASE WHEN event_category = 'history' AND event_name = 'shared' THEN 1 ELSE 0 END as shared

      FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --opened
      , 100*SUM(opened) as opened
      , 100*COUNT(DISTINCT CASE WHEN opened > 0 THEN client_id END) AS opened_users
      --opened_item
      , 100*SUM(opened_item) as opened_item
      , 100*COUNT(DISTINCT CASE WHEN opened_item > 0 THEN client_id END) AS opened_item_users
      --opened_items_in_new_tabs
      , 100*SUM(opened_items_in_new_tabs) as opened_items_in_new_tabs
      , 100*COUNT(DISTINCT CASE WHEN opened_items_in_new_tabs > 0 THEN client_id END) AS opened_items_in_new_tabs_users
      --opened_items_in_private_tabs
      , 100*SUM(opened_items_in_private_tabs) as opened_items_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN opened_items_in_private_tabs > 0 THEN client_id END) AS opened_items_in_private_tabs_users
      --recent_searches_tapped
      , 100*SUM(recent_searches_tapped) as recent_searches_tapped
      , 100*COUNT(DISTINCT CASE WHEN recent_searches_tapped > 0 THEN client_id END) AS recent_searches_tapped_users
      --remove_prompt_cancelled
      , 100*SUM(remove_prompt_cancelled) as remove_prompt_cancelled
      , 100*COUNT(DISTINCT CASE WHEN remove_prompt_cancelled > 0 THEN client_id END) AS remove_prompt_cancelled_users
      --remove_prompt_opened
      , 100*SUM(remove_prompt_opened) as remove_prompt_opened
      , 100*COUNT(DISTINCT CASE WHEN remove_prompt_opened > 0 THEN client_id END) AS remove_prompt_opened_users
      --removed
      , 100*SUM(removed) as removed
      , 100*COUNT(DISTINCT CASE WHEN removed > 0 THEN client_id END) AS removed_users
      --removed_all
      , 100*SUM(removed_all) as removed_all
      , 100*COUNT(DISTINCT CASE WHEN removed_all > 0 THEN client_id END) AS removed_all_users
      --removed_last_hour
      , 100*SUM(removed_last_hour) as removed_last_hour
      , 100*COUNT(DISTINCT CASE WHEN removed_last_hour > 0 THEN client_id END) AS removed_last_hour_users
      --removed_today_and_yesterday
      , 100*SUM(removed_today_and_yesterday) as removed_today_and_yesterday
      , 100*COUNT(DISTINCT CASE WHEN removed_today_and_yesterday > 0 THEN client_id END) AS removed_today_and_yesterday_users
      --search_icon_tapped
      , 100*SUM(search_icon_tapped) as search_icon_tapped
      , 100*COUNT(DISTINCT CASE WHEN search_icon_tapped > 0 THEN client_id END) AS search_icon_tapped_users
      --search_result_tapped
      , 100*SUM(search_result_tapped) as search_result_tapped
      , 100*COUNT(DISTINCT CASE WHEN search_result_tapped > 0 THEN client_id END) AS search_result_tapped_users
      --search_term_group_open_tab
      , 100*SUM(search_term_group_open_tab) as search_term_group_open_tab
      , 100*COUNT(DISTINCT CASE WHEN search_term_group_open_tab > 0 THEN client_id END) AS search_term_group_open_tab_users
      --search_term_group_remove_all
      , 100*SUM(search_term_group_remove_all) as search_term_group_remove_all
      , 100*COUNT(DISTINCT CASE WHEN search_term_group_remove_all > 0 THEN client_id END) AS search_term_group_remove_all_users
      --search_term_group_remove_tab
      , 100*SUM(search_term_group_remove_tab) as search_term_group_remove_tab
      , 100*COUNT(DISTINCT CASE WHEN search_term_group_remove_tab > 0 THEN client_id END) AS search_term_group_remove_tab_users
      --search_term_group_tapped
      , 100*SUM(search_term_group_tapped) as search_term_group_tapped
      , 100*COUNT(DISTINCT CASE WHEN search_term_group_tapped > 0 THEN client_id END) AS search_term_group_tapped_users
      --shared
      , 100*SUM(shared) as shared
      , 100*COUNT(DISTINCT CASE WHEN shared > 0 THEN client_id END) AS shared_users

      FROM product_features
      where submission_date >= '2021-01-01'
      group by 1
      )

      select d.submission_date
      , dau
      , opened
      , opened_users
      , opened_item
      , opened_item_users
      , opened_items_in_new_tabs
      , opened_items_in_new_tabs_users
      , opened_items_in_private_tabs
      , opened_items_in_private_tabs_users
      , recent_searches_tapped
      , recent_searches_tapped_users
      , remove_prompt_cancelled
      , remove_prompt_cancelled_users
      , remove_prompt_opened
      , remove_prompt_opened_users
      , removed
      , removed_users
      , removed_all
      , removed_all_users
      , removed_last_hour
      , removed_last_hour_users
      , removed_today_and_yesterday
      , removed_today_and_yesterday_users
      , search_icon_tapped
      , search_icon_tapped_users
      , search_result_tapped
      , search_result_tapped_users
      , search_term_group_open_tab
      , search_term_group_open_tab_users
      , search_term_group_remove_all
      , search_term_group_remove_all_users
      , search_term_group_remove_tab
      , search_term_group_remove_tab_users
      , search_term_group_tapped
      , search_term_group_tapped_users
      , shared
      , shared_users
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

  measure: opened {
    type: sum
    sql: ${TABLE}.opened ;;
  }

  measure: opened_users {
    type: sum
    sql: ${TABLE}.opened_users ;;
  }

  measure: opened_item {
    type: sum
    sql: ${TABLE}.opened_item ;;
  }

  measure: opened_item_users {
    type: sum
    sql: ${TABLE}.opened_item_users ;;
  }

  measure: opened_items_in_new_tabs {
    type: sum
    sql: ${TABLE}.opened_items_in_new_tabs ;;
  }

  measure: opened_items_in_new_tabs_users {
    type: sum
    sql: ${TABLE}.opened_items_in_new_tabs_users ;;
  }

  measure: opened_items_in_private_tabs {
    type: sum
    sql: ${TABLE}.opened_items_in_private_tabs ;;
  }

  measure: opened_items_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.opened_items_in_private_tabs_users ;;
  }

  measure: recent_searches_tapped {
    type: sum
    sql: ${TABLE}.recent_searches_tapped ;;
  }

  measure: recent_searches_tapped_users {
    type: sum
    sql: ${TABLE}.recent_searches_tapped_users ;;
  }

  measure: remove_prompt_cancelled {
    type: sum
    sql: ${TABLE}.remove_prompt_cancelled ;;
  }

  measure: remove_prompt_cancelled_users {
    type: sum
    sql: ${TABLE}.remove_prompt_cancelled_users ;;
  }

  measure: remove_prompt_opened {
    type: sum
    sql: ${TABLE}.remove_prompt_opened ;;
  }

  measure: remove_prompt_opened_users {
    type: sum
    sql: ${TABLE}.remove_prompt_opened_users ;;
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

  measure: removed_last_hour {
    type: sum
    sql: ${TABLE}.removed_last_hour ;;
  }

  measure: removed_last_hour_users {
    type: sum
    sql: ${TABLE}.removed_last_hour_users ;;
  }

  measure: removed_today_and_yesterday {
    type: sum
    sql: ${TABLE}.removed_today_and_yesterday ;;
  }

  measure: removed_today_and_yesterday_users {
    type: sum
    sql: ${TABLE}.removed_today_and_yesterday_users ;;
  }

  measure: search_icon_tapped {
    type: sum
    sql: ${TABLE}.search_icon_tapped ;;
  }

  measure: search_icon_tapped_users {
    type: sum
    sql: ${TABLE}.search_icon_tapped_users ;;
  }

  measure: search_result_tapped {
    type: sum
    sql: ${TABLE}.search_result_tapped ;;
  }

  measure: search_result_tapped_users {
    type: sum
    sql: ${TABLE}.search_result_tapped_users ;;
  }

  measure: search_term_group_open_tab {
    type: sum
    sql: ${TABLE}.search_term_group_open_tab ;;
  }

  measure: search_term_group_open_tab_users {
    type: sum
    sql: ${TABLE}.search_term_group_open_tab_users ;;
  }

  measure: search_term_group_remove_all {
    type: sum
    sql: ${TABLE}.search_term_group_remove_all ;;
  }

  measure: search_term_group_remove_all_users {
    type: sum
    sql: ${TABLE}.search_term_group_remove_all_users ;;
  }

  measure: search_term_group_remove_tab {
    type: sum
    sql: ${TABLE}.search_term_group_remove_tab ;;
  }

  measure: search_term_group_remove_tab_users {
    type: sum
    sql: ${TABLE}.search_term_group_remove_tab_users ;;
  }

  measure: search_term_group_tapped {
    type: sum
    sql: ${TABLE}.search_term_group_tapped ;;
  }

  measure: search_term_group_tapped_users {
    type: sum
    sql: ${TABLE}.search_term_group_tapped_users ;;
  }

  measure: shared {
    type: sum
    sql: ${TABLE}.shared ;;
  }

  measure: shared_users {
    type: sum
    sql: ${TABLE}.shared_users ;;
  }

  set: detail {
    fields: [
      submission_date,
      dau,
      opened,
      opened_users,
      opened_item,
      opened_item_users,
      opened_items_in_new_tabs,
      opened_items_in_new_tabs_users,
      opened_items_in_private_tabs,
      opened_items_in_private_tabs_users,
      recent_searches_tapped,
      recent_searches_tapped_users,
      remove_prompt_cancelled,
      remove_prompt_cancelled_users,
      remove_prompt_opened,
      remove_prompt_opened_users,
      removed,
      removed_users,
      removed_all,
      removed_all_users,
      removed_last_hour,
      removed_last_hour_users,
      removed_today_and_yesterday,
      removed_today_and_yesterday_users,
      search_icon_tapped,
      search_icon_tapped_users,
      search_result_tapped,
      search_result_tapped_users,
      search_term_group_open_tab,
      search_term_group_open_tab_users,
      search_term_group_remove_all,
      search_term_group_remove_all_users,
      search_term_group_remove_tab,
      search_term_group_remove_tab_users,
      search_term_group_tapped,
      search_term_group_tapped_users,
      shared,
      shared_users
    ]
  }
}
