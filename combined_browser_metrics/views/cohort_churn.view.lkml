include: "//looker-hub/combined_browser_metrics/views/cohort_churn.view.lkml"

view: +cohort_churn {

  measure: num_clients_in_cohort {
    type: number
    sql: SUM(${num_clients_in_cohort}) ;;
    label: "Number of Clients in Cohort"
  }

  measure: num_clients_returned_on_day_1 {
    type: number
    sql: SUM(${num_clients_returned_on_day_1}) ;;
    label: "Number of Clients Returned on Day 1"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_2 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_2}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 2"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_3 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_3}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 3"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_4 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_4}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 4"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_5 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_5}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 5"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_6 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_6}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 6"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_7 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_7}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 7"
  }

  measure: num_clients_returned_any_day_between_day_1_and_day_28 {
    type: number
    sql: SUM(${num_clients_returned_any_day_between_day_1_and_day_28}) ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 28"
  }

}
