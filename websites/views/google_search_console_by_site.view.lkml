include: "//looker-hub/websites/views/google_search_console_by_site.view.lkml"

view: +google_search_console_by_site {
  dimension: impressions {
    hidden: yes
  }
  measure: total_impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    description: "The number of times that search results with at least one link to the site were shown to a user."
  }

  dimension: clicks {
    hidden: yes
  }
  measure: total_clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    description: "The number of times a user clicked at least one search result link to the site."
  }

  measure: click_through_rate {
    type: number
    sql: SAFE_DIVIDE(${total_clicks}, ${total_impressions}) ;;
    value_format_name: percent_2
    label: "Click-Through Rate"
    description: "The total click count divided by the total impression count."
  }

  dimension: average_top_position {
    hidden: yes
  }
  measure: total_average_top_position_times_impressions {
    type: sum
    sql: ${TABLE}.average_top_position * ${TABLE}.impressions ;;
    hidden: yes
  }
  measure: average_top_result_position {
    type: number
    sql: SAFE_DIVIDE(${total_average_top_position_times_impressions}, ${total_impressions}) ;;
    value_format_name: decimal_2
    description: "The average top position of the site in the search results, where `1` is the topmost position."
  }

  measure: distinct_query_count {
    type: count_distinct
    sql: ${query} ;;
  }
}
