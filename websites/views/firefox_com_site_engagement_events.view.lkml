include: "//looker-hub/websites/views/site_engagement_events.view.lkml"

view: firefox_com_site_engagement_events {
  extends: [site_engagement_events]

  measure: firefox_downloads {
    type: count
    filters: [event_name: "product_download"]
    description: "Total number of Firefox product_download events"
  }
  measure: session_start_count {
    description: "Total count of session_start events"
    type: count
    filters: [event_name: "session_start"]
  }
  measure: engaged_sessions_counts {
    description: "Total count of distinct engaged sessions"
    type: count_distinct
    sql: ${visit_identifier} ;;
    filters: [engaged_session: "1"]
  }
}
