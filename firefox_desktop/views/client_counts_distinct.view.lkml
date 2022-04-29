include: "//looker-hub/firefox_desktop/views/*.view.lkml"
include: "//looker-hub/firefox_desktop/explores/*.explore.lkml"

view: +client_counts {
  measure: client_count_distinct {
    type: number
    description: "The number of clients, determined by whether they sent a baseline ping on the day in question."
    sql: {COUNT(DISTINCT client_id)} ;;
  }
}
