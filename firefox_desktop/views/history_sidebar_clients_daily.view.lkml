view: history_sidebar_clients_daily {

  sql_table_name: `moz-fx-data-shared-prod`.telemetry_derived.clients_daily_joined_v1 ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: submission_date {
    type: date
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP);;
    description: "Submission date of the crash"
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

}
