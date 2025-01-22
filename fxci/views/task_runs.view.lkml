include: "//looker-hub/fxci/views/task_runs_base.view.lkml"

view: task_runs {
  extends: [task_runs_base]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }
}
