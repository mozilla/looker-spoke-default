view: task_run_costs {
  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }

  dimension: run_cost {
    sql: ${TABLE}.run_cost ;;
    type: number
  }

  dimension: run_id {
    sql: ${TABLE}.run_id ;;
    type: number
  }

  dimension: task_id {
    sql: ${TABLE}.task_id ;;
    type: string
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  measure: total_cost {
    sql: ${run_cost} ;;
    type: sum
    value_format_name: usd
  }

  sql_table_name: `moz-fx-data-shared-prod.fxci.task_run_costs` ;;
}
