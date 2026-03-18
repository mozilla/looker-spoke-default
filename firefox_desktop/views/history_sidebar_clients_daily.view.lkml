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

#new measures

  measure: history_visits_all_surfaces_mean {
    type: average
    sql: ${TABLE}.places_previousday_visits_mean ;;
    description: "Average history items visited per day across all surfaces"
  }

  measure: history_library_items {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_link_sum, "history");;
    description: "The number of history items opened from the Library window"
  }

  measure: bookmarks_library_items {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_link_sum, "bookmarks");;
    description: "The number of bookmark items opened from the Library window"
  }

  measure: history_library_opened {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_opened_sum, "history");;
    description: "The number of times the history Library window was opened"
  }

  measure: bookmarks_library_opened {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_opened_sum, "bookmarks");;
    description: "The number of times the bookmarks Library window was opened"
  }

  measure: history_library_search {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_search_sum, "history");;
    description: "The number of history-specific searches made from the Library window"
  }

  measure: bookmarks_library_search {
    type: sum
    sql: mozfun.map.get_key(${TABLE}.scalar_parent_library_search_sum, "bookmarks");;
    description: "The number of bookmarks-specific searches made from the Library window"
  }

  measure: history_cumulative_library_searches {
    sql: ${TABLE}.places_library_cumulative_history_searches_sum ;;
    type: sum
    description: "Cumulative number of history-specific searches performed before selecting a history link in the Library window"
  }

  measure: bookmarks_searchbar_cumulative_searches {
    sql: ${TABLE}.places_bookmarks_searchbar_cumulative_searches_sum ;;
    type: sum
    description: "Cumulative number of bookmark searches performed before selecting a link"
  }

  measure: bookmarks_library_cumulative_searches {
    sql: ${TABLE}.places_library_cumulative_bookmark_searches_sum ;;
    type: sum
    description:"Cumulative number of bookmark-specific searches performed before selecting a bookmark link in the Library window"
  }

  #new client counts

  measure:  clients_with_any_history_items {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_link_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that open history items from the Library window"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmarks_items {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_link_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that open bookmark items from the Library window"
    group_label: "Client counts"
  }
  measure:  clients_with_any_history_library_opened {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_opened_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that open history Library window"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmarks_library_opened {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_opened_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients that open bookmarks Library window"
    group_label: "Client counts"
  }

  measure:  clients_with_any_history_library_searches {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_search_sum, "history") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients with history-specific searches from the Library window"
    group_label: "Client counts"
  }

  measure:  clients_with_any_bookmarks_library_searches {
    type: count_distinct
    sql: IF(mozfun.map.get_key(${TABLE}.scalar_parent_library_search_sum, "bookmarks") > 0, ${client_id}, NULL) ;;
    approximate: yes
    description: "Count of clients with bookmark-specific searches from the Library window"
    group_label: "Client counts"
  }

  #New client share measures

  measure: history_library_items_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_items}/${client_count} ;;
    description: "Percent of clients that open history items from the Library window"
    group_label: "Client shares"
  }

  measure: bookmarks_library_items_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmarks_items}/${client_count} ;;
    description: "Percent of clients that open bookmarks items from the Library window"
    group_label: "Client shares"
  }

  measure: history_library_opened_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_library_opened}/${client_count} ;;
    description: "Percent of clients that open history Library window"
    group_label: "Client shares"
  }

  measure: bookmarks_library_opened_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmarks_library_opened}/${client_count} ;;
    description: "Percent of clients that open bookmarks Library window"
    group_label: "Client shares"
  }

  measure: history_library_search_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_history_library_searches}/${client_count} ;;
    description: "Percent of clients with history-specific searches made from the Library window"
    group_label: "Client shares"
  }

  measure: bookmarks_library_search_client_share {
    type: number
    sql: 100.0 * ${clients_with_any_bookmarks_library_searches}/${client_count} ;;
    description: "Percent of clients with bookmarks-specific searches made from the Library window"
    group_label: "Client shares"
  }

}
