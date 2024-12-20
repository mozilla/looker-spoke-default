include: "//looker-hub/fxci/views/task_runs.view.lkml"

view: task_runs_ex {
  extends: [task_runs]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }
}
