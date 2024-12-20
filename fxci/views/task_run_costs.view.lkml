include: "//looker-hub/fxci/views/task_run_costs.view.lkml"

view: task_run_costs_ex {
  extends: [task_run_costs]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }
}
