include: "//looker-hub/combined_browser_metrics/views/cohort_weekly_statistics.view.lkml"

view: +cohort_weekly_statistics {

  measure: total_nbr_active_clients {
    type: number
    SUM(${nbr_active_clients}) ;;
  }

  measure: total_clients_in_cohort {
    type: number
    SUM(${clients_in_cohort}) ;;
  }

  measure: percent_retained {
    type: number
    sql: SAFE_DIVIDE(SUM(${nbr_active_clients}), SUM(${clients_in_cohort})) ;;
    value_format: "0.00%"
  }
}
