include: "//looker-hub/monitoring/views/bigquery_table_storage.view.lkml"

view: +bigquery_table_storage {

  measure: sum_total_rows{
    type: sum
    sql: ${total_rows} ;;
  }

  measure: sum_total_partitions{
    type: sum
    sql: ${total_partitions} ;;
  }

  measure: sum_total_logical_TB{
    type: sum
    sql: ${total_logical_bytes}/ 1024 / 1024 / 1024 / 1024 ;;
    value_format: "#,##0.00"
  }

  measure: sum_active_logical_bytes{
    type: sum
    sql: ${active_logical_bytes} ;;
  }

  measure: sum_long_term_logical_bytes{
    type: sum
    sql: ${long_term_logical_bytes} ;;
  }

  measure: sum_total_physical_TB{
    type: sum
    sql: ${total_physical_bytes}/ 1024 / 1024 / 1024 / 1024 ;;
    value_format: "#,##0.00"
  }

  measure: sum_active_physical_bytes{
    type: sum
    sql: ${active_physical_bytes} ;;
  }

  measure: sum_long_term_physical_bytes{
    type: sum
    sql: ${long_term_physical_bytes} ;;
  }

  measure: sum_time_travel_physical_bytes{
    type: sum
    sql: ${time_travel_physical_bytes} ;;
  }

  measure: sum_logical_billing_cost_usd{
    type: sum
    sql: ${logical_billing_cost_usd} ;;
  }

  measure: sum_physical_billing_cost_usd{
    type: sum
    sql: ${physical_billing_cost_usd} ;;
  }

  measure: count{
    type: count
  }

}
