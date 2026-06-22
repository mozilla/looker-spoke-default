include: "//looker-hub/fxci/views/task_run_costs_base.view.lkml"

view: task_run_costs {
  extends: [task_run_costs_base]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }

  measure: total_cost {
    type:  sum_distinct
    sql:  ${run_cost} ;;
    sql_distinct_key: ${key} ;;
    value_format: "$#,##0.00"
    label: "Total Run Cost"
    description: "Total task run cost, deduplicated by task run key."
  }
}
