include: "//looker-hub/firefox_desktop/views/client_counts.view.lkml"

view: client_counts_extended {
  extends: [client_counts]

  measure: client_count_distinct {
    type: count_distinct
    description: "Force client count to always be distinct."
    sql: ${TABLE}.client_id ;;
  }
}
