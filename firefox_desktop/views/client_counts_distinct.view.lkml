include: "//looker-hub/firefox_desktop/views/client_counts.view.lkml"

view: client_counts_extended {
  extends: [client_counts]

  measure: client_count_distinct {
    type: number
    description: "The number of clients, determined by whether they sent a baseline ping on the day in question."
    sql: {COUNT(DISTINCT client_id)} ;;
  }
}
