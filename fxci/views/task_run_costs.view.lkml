include: "//looker-hub/fxci/views/task_run_costs_base.view.lkml"

view: task_run_costs {
  extends: [task_run_costs_base]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }
}
