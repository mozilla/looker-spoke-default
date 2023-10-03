
view: android_bookmark_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2019-06-04'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
          client_info.client_id,
          DATE(submission_timestamp) as submission_date,
          /*Logins*/
          --autofill
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'copied' THEN 1 ELSE 0 END as copied,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'edited' THEN 1 ELSE 0 END as edited,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'folder_add' THEN 1 ELSE 0 END as folder_add,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open' THEN 1 ELSE 0 END as open,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_all_in_new_tabs' THEN 1 ELSE 0 END as open_all_in_new_tabs,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_all_in_private_tabs' THEN 1 ELSE 0 END as open_all_in_private_tabs,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_new_tab' THEN 1 ELSE 0 END as open_in_new_tab,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_new_tabs' THEN 1 ELSE 0 END as open_in_new_tabs,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_private_tab' THEN 1 ELSE 0 END as open_in_private_tab,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_private_tabs' THEN 1 ELSE 0 END as open_in_private_tabs,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'removed' THEN 1 ELSE 0 END as removed,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'search_icon_tapped' THEN 1 ELSE 0 END as search_icon_tapped,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'search_result_tapped' THEN 1 ELSE 0 END as search_result_tapped,
          CASE WHEN event_category = 'bookmarks_management' AND event_name = 'shared' THEN 1 ELSE 0 END as shared,

          FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2019-06-04'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --copied
      , 100*SUM(copied) as copied
      , 100*COUNT(DISTINCT CASE WHEN copied > 0 THEN client_id END) AS copied_users
      --edited
      , 100*SUM(edited) as edited
      , 100*COUNT(DISTINCT CASE WHEN edited > 0 THEN client_id END) AS edited_users
      --folder_add
      , 100*SUM(folder_add) as folder_add
      , 100*COUNT(DISTINCT CASE WHEN folder_add > 0 THEN client_id END) AS folder_add_users
      --open
      , 100*SUM(open) as open
      , 100*COUNT(DISTINCT CASE WHEN open > 0 THEN client_id END) AS open_users
      --open_all_in_new_tabs
      , 100*SUM(open_all_in_new_tabs) as open_all_in_new_tabs
      , 100*COUNT(DISTINCT CASE WHEN open_all_in_new_tabs > 0 THEN client_id END) AS open_all_in_new_tabs_users
      --open_all_in_private_tabs
      , 100*SUM(open_all_in_private_tabs) as open_all_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN open_all_in_private_tabs > 0 THEN client_id END) AS open_all_in_private_tabs_users
      --open_in_new_tab
      , 100*SUM(open_in_new_tab) as open_in_new_tab
      , 100*COUNT(DISTINCT CASE WHEN open_in_new_tab > 0 THEN client_id END) AS open_in_new_tab_users
      --open_in_new_tabs
      , 100*SUM(open_in_new_tabs) as open_in_new_tabs
      , 100*COUNT(DISTINCT CASE WHEN open_in_new_tabs > 0 THEN client_id END) AS open_in_new_tabs_users
      --open_in_private_tab
      , 100*SUM(open_in_private_tab) as open_in_private_tab
      , 100*COUNT(DISTINCT CASE WHEN open_in_private_tab > 0 THEN client_id END) AS open_in_private_tab_users
      --open_in_private_tabs
      , 100*SUM(open_in_private_tabs) as open_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN open_in_private_tabs > 0 THEN client_id END) AS open_in_private_tabs_users
      --removed
      , 100*SUM(removed) as removed
      , 100*COUNT(DISTINCT CASE WHEN removed > 0 THEN client_id END) AS removed_users
      --search_icon_tapped
      , 100*SUM(search_icon_tapped) as search_icon_tapped
      , 100*COUNT(DISTINCT CASE WHEN search_icon_tapped > 0 THEN client_id END) AS search_icon_tapped_users
      --search_result_tapped
      , 100*SUM(search_result_tapped) as search_result_tapped
      , 100*COUNT(DISTINCT CASE WHEN search_result_tapped > 0 THEN client_id END) AS search_result_tapped_users
      --shared
      , 100*SUM(shared) as shared
      , 100*COUNT(DISTINCT CASE WHEN shared > 0 THEN client_id END) AS shared_users

      FROM product_features
      where submission_date >= '2019-06-04'
      group by 1
      )

      select d.submission_date
      , dau
      , copied
      , copied_users
      , edited
      , edited_users
      , folder_add
      , folder_add_users
      , open
      , open_users
      , open_all_in_new_tabs
      , open_all_in_new_tabs_users
      , open_all_in_private_tabs
      , open_all_in_private_tabs_users
      , open_in_new_tab
      , open_in_new_tab_users
      , open_in_new_tabs
      , open_in_new_tabs_users
      , open_in_private_tab
      , open_in_private_tab_users
      , open_in_private_tabs
      , open_in_private_tabs_users
      , removed
      , removed_users
      , search_icon_tapped
      , search_icon_tapped_users
      , search_result_tapped
      , search_result_tapped_users
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

  measure: copied {
    type: sum
    sql: ${TABLE}.copied ;;
  }

  measure: copied_users {
    type: sum
    sql: ${TABLE}.copied_users ;;
  }

  measure: edited {
    type: sum
    sql: ${TABLE}.edited ;;
  }

  measure: edited_users {
    type: sum
    sql: ${TABLE}.edited_users ;;
  }

  measure: folder_add {
    type: sum
    sql: ${TABLE}.folder_add ;;
  }

  measure: folder_add_users {
    type: sum
    sql: ${TABLE}.folder_add_users ;;
  }

  measure: open {
    type: sum
    sql: ${TABLE}.open ;;
  }

  measure: open_users {
    type: sum
    sql: ${TABLE}.open_users ;;
  }

  measure: open_all_in_new_tabs {
    type: sum
    sql: ${TABLE}.open_all_in_new_tabs ;;
  }

  measure: open_all_in_new_tabs_users {
    type: sum
    sql: ${TABLE}.open_all_in_new_tabs_users ;;
  }

  measure: open_all_in_private_tabs {
    type: sum
    sql: ${TABLE}.open_all_in_private_tabs ;;
  }

  measure: open_all_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.open_all_in_private_tabs_users ;;
  }

  measure: open_in_new_tab {
    type: sum
    sql: ${TABLE}.open_in_new_tab ;;
  }

  measure: open_in_new_tab_users {
    type: sum
    sql: ${TABLE}.open_in_new_tab_users ;;
  }

  measure: open_in_new_tabs {
    type: sum
    sql: ${TABLE}.open_in_new_tabs ;;
  }

  measure: open_in_new_tabs_users {
    type: sum
    sql: ${TABLE}.open_in_new_tabs_users ;;
  }

  measure: open_in_private_tab {
    type: sum
    sql: ${TABLE}.open_in_private_tab ;;
  }

  measure: open_in_private_tab_users {
    type: sum
    sql: ${TABLE}.open_in_private_tab_users ;;
  }

  measure: open_in_private_tabs {
    type: sum
    sql: ${TABLE}.open_in_private_tabs ;;
  }

  measure: open_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.open_in_private_tabs_users ;;
  }

  measure: removed {
    type: sum
    sql: ${TABLE}.removed ;;
  }

  measure: removed_users {
    type: sum
    sql: ${TABLE}.removed_users ;;
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
      copied,
      copied_users,
      edited,
      edited_users,
      folder_add,
      folder_add_users,
      open,
      open_users,
      open_all_in_new_tabs,
      open_all_in_new_tabs_users,
      open_all_in_private_tabs,
      open_all_in_private_tabs_users,
      open_in_new_tab,
      open_in_new_tab_users,
      open_in_new_tabs,
      open_in_new_tabs_users,
      open_in_private_tab,
      open_in_private_tab_users,
      open_in_private_tabs,
      open_in_private_tabs_users,
      removed,
      removed_users,
      search_icon_tapped,
      search_icon_tapped_users,
      search_result_tapped,
      search_result_tapped_users,
      shared,
      shared_users
    ]
  }
}
