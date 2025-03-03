include: "//looker-hub/combined_browser_metrics/views/cohort_weekly_statistics.view.lkml"

view: +cohort_weekly_statistics {

  measure: total_nbr_active_clients {
    type: number
    sql: SUM(${nbr_active_clients}) ;;
  }

  measure: total_clients_in_cohort {
    type: number
    sql: SUM(${nbr_clients_in_cohort}) ;;
  }

  measure: percent_retained {
    type: number
    sql: SAFE_DIVIDE(total_nbr_active_clients, total_clients_in_cohort) ;;
    value_format: "0.00%"
  }
}
