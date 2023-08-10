include: "//looker-hub/monitoring/views/dag_run.view.lkml"

view: +dag_run {

  dimension: dag {
    type: string
    sql: ${dag_id} ;;
    link: {
      label: "go to (sub-)DAG"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid"
    }
  }

  measure: failed_last_7_days {
    type: sum
    sql: if(${state} = "failed", 1, 0) ;;
    filters: [execution_date: "138 days ago for 7 days"] # change once we have fresh data
    # filters: [execution_date: "7 days ago for 7 days"]
  }

  measure: execution_time_in_min {
    type: average
    sql: datetime_diff(${end_raw}, ${start_raw}, minute) ;;
    value_format: "0"
  }
  measure: avg_execution_time_min{
    type: average
    sql: datetime_diff(${end_raw}, ${start_raw}, minute) ;;
    value_format: "0"
  }

  measure: avg_execution_time_last_7_days_min {
    type: average
    sql: datetime_diff(${end_raw}, ${start_raw}, minute) ;;
    value_format: "0"
    filters: [execution_date: "138 days ago for 7 days"] # change once we have fresh data
    # filters: [execution_date: "7 days ago for 7 days"]
  }

  measure: sum_failures {
    type: sum
    sql: if(${state} = "failed", 1, 0) ;;
  }

}
