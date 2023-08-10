include: "//looker-hub/monitoring/views/task_fail.view.lkml"

view: +task_fail {
  measure: task_failure_count {
    type: count_distinct
    sql: ${task_id} ;;
  }
 }
