include: "//looker-hub/monitoring/views/airflow_task_fail.view.lkml"

view: +airflow_task_fail {

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${dag_id}, ${task_id}, ${start_raw}) ;;
  }

  dimension: dag_task {
    type: string
    sql: CONCAT(${dag_id}, ".", ${task_id});;
    link: {
      label: "go to task"
      url: "https://workflow.telemetry.mozilla.org/dags/{{ dag_id }}/grid?task_id={{ task_id }}"
    }
  }

  measure: task_failure_count {
    type: count_distinct
    sql: ${task_id} ;;
  }

  measure: avg_duration {
    type: average
    sql: ${duration} ;;
    label: "Duration in sec"
  }

}
