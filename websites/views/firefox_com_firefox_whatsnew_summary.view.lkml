include: "//looker-hub/websites/views/firefox_com_firefox_whatsnew_summary.view.lkml"

view: +firefox_com_firefox_whatsnew_summary {

  measure: cta_clicks {
    description: "Total count of cta_click events"
    type: count
    filters: [event_name: "cta_click"]
  }
  measure: newsletter_subscribe {
    description: "Total count of newsletter_subscribe events"
    type: count
    filters: [event_name: "newsletter_subscribe"]
  }

  measure: page_views {
    description: "Total count of page_views"
    type: count
    filters: [event_name: "page_view"]
  }

  measure: session_start_count {
    description: "Total count of session_start events"
    type: count
    filters: [event_name: "session_start"]
  }
  # measure: engaged_sessions_counts {
  #   description: "Total count of distinct engaged sessions"
  #   type: count_distinct
  #   sql: ${visit_identifier} ;;
  #   filters: [engaged_session: "1"]
  # }

  # measure: engagement_rate {
  #   type: number
  #   sql: SAFE_DIVIDE(${engaged_sessions_counts}, ${session_start_count}) ;;
  #   value_format_name: percent_2
  # }

}
