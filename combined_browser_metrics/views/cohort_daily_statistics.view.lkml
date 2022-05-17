include: "//looker-hub/combined_browser_metrics/views/cohort_daily_statistics.view.lkml"

view: +cohort_daily_statistics {

  dimension: days_retained {
    type: number
    sql: DATE_DIFF(${cohort_date}, ${activity_date}, DAY) ;;
  }

  measure: retention {
    sql: SAFE_DIVIDE(SUM(${num_clients_active_on_day}), SUM(${num_clients_in_cohort})) ;;
    value_format: "0.00%"
  }

  measure: clients_active_on_day {
    type: number
    sql: SUM(${num_clients_active_on_day}) ;;
  }

  measure: clients_in_cohort {
    type: number
    sql: SUM(${num_clients_in_cohort}) ;;
  }

  dimension: num_clients_in_cohort {
    hidden: yes
  }

  dimension: num_clients_active_on_day {
    hidden: yes
  }

}
