include: "//looker-hub/combined_browser_metrics/views/glean_cohort_daily_churn.view.lkml"

view: +glean_cohort_daily_churn {
  dimension: num_clients_in_cohort {
    hidden: yes
  }

  dimension: num_clients_returned_on_day_1 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_2 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_3 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_4 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_5 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_6 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_7 {
    hidden: yes
  }

  dimension: num_clients_returned_any_day_between_day_1_and_day_28 {
    hidden: yes
  }

  measure: sum_num_clients_in_cohort {
    type: sum
    sql: ${num_clients_in_cohort} ;;
    label: "Number of Clients in Cohort"
  }

  measure: sum_num_clients_returned_on_day_1 {
    type: sum
    sql: ${num_clients_returned_on_day_1} ;;
    label: "Number of Clients Returned on Day 1"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_2 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_2} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 2"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_3 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_3} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 3"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_4 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_4} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 4"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_5 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_5} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 5"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_6 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_6} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 6"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_7 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_7} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 7"
  }

  measure: sum_num_clients_returned_any_day_between_day_1_and_day_28 {
    type: sum
    sql: ${num_clients_returned_any_day_between_day_1_and_day_28} ;;
    label: "Number of Clients Returned Any Day Between Day 1 and Day 28"
  }
}
