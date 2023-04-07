include: "//looker-hub/firefox_desktop/views/clients_daily_joined_table.view"

view: history_sidebar_clients_daily {

  extends: [clients_daily_joined_table]

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: major_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).major_version ;;
    description: "The major version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: minor_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.app_version).minor_version ;;
    description: "The minor version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
    suggestions: ["release", "beta", "nightly", "esr", "aurora", "Other"]
    description: "Release channel for the associated installation."
  }

  measure: client_count {
    type:  count_distinct
    sql: ${TABLE}.client_id ;;
  }

  measure: sidebar_history_opened {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_opened_sum, "history");;
    type: sum
    description: "Number of times sidebar history was opened"
  }

  measure: sidebar_bookmarks_opened {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_opened_sum, "bookmarks");;
    type: sum
    description: "Number of times sidebar bookmarks was opened"
  }

  measure: sidebar_history_searched {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_search_sum, "history");;
    type: sum
    description: "Number of times sidebar history was searched"
  }

  measure: sidebar_bookmarks_searched {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_search_sum, "bookmarks");;
    type: sum
    description: "Number of times sidebar bookmarks was searched"
  }

  measure: sidebar_history_link_clicked {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_link_sum, "history");;
    type: sum
    description: "Number of times sidebar history link was clicked"
  }

  measure: sidebar_bookmarks_link_clicked {
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_link_sum, "bookmarks");;
    type: sum
    description: "Number of times sidebar bookmark link was clicked"
  }

  measure: searchbar_cumulative_searches {
    sql: ${TABLE}.places_searchbar_cumulative_searches_sum ;;
    type: sum
    description: "Cumulative searches in the sidebar before action"
  }

  measure: searchbar_cumulative_filters {
    sql: ${TABLE}.places_searchbar_cumulative_filter_count_sum ;;
    type: sum
    description: "Cumulative filters in the sidebar before action"
  }

  measure:  clients_with_any_history_searches {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_search_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that searched the history sidebar"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmark_searches {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_search_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that searched the bookmarks sidebar"
    group_label: "Client counts"
  }

  measure:  clients_with_any_history_opened {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_opened_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that opened the history sidebar"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmark_opened {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_opened_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that opened the bookmarks sidebar"
    group_label: "Client counts"
  }

  measure:  clients_with_any_history_link_clicked{
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_link_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that clicked a link in the history sidebar"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmark_link_clicked {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_sidebar_link_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that clicked a link in the bookmarks sidebar"
    group_label: "Client counts"
  }

  measure: history_opened_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_opened}/${client_count} ;;
    description: "Percent of clients that opened the history sidebar"
    group_label: "Client shares"
  }

  measure: bookmarks_opened_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmark_opened}/${client_count} ;;
    description: "Percent of clients that opened the bookmarks sidebar"
    group_label: "Client shares"
  }

  measure: history_searched_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_searches}/${client_count} ;;
    description: "Percent of clients that searched the history sidebar"
    group_label: "Client shares"
  }

  measure: bookmarks_searched_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmark_searches}/${client_count} ;;
    description: "Percent of clients that searched the bookmarks sidebar"
    group_label: "Client shares"
  }

  measure: history_link_clicked_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_link_clicked}/${client_count} ;;
    description: "Percent of clients that clicked a link in the history sidebar"
    group_label: "Client shares"
  }

  measure: bookmarks_link_clicked_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmark_link_clicked}/${client_count} ;;
    description: "Percent of clients that clicked a link in the bookmarks sidebar"
    group_label: "Client shares"
  }

}
