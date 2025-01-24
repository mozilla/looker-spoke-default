include: "//looker-hub/monitoring/views/bigquery_shared_prod_table_storage.view.lkml"

view: +bigquery_shared_prod_table_storage {

  measure: sum_total_rows{
    type: sum
    sql: ${total_rows} ;;
    value_format: "#,##0,,\" M\""
  }

  measure: sum_total_partitions{
    type: sum
    sql: ${total_partitions} ;;
  }

  measure: sum_total_logical_GB{
    type: sum
    sql: ${total_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_active_logical_GB{
    type: sum
    sql: ${active_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_long_term_logical_GB{
    type: sum
    sql: ${long_term_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_total_physical_GB{
    type: sum
    sql: ${total_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_active_physical_GB{
    type: sum
    sql: ${active_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_long_term_physical_GB{
    type: sum
    sql: ${long_term_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_time_travel_physical_GB{
    type: sum
    sql: ${time_travel_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_logical_billing_cost_usd{
    type: sum
    sql: (${active_logical_bytes}/POW(1024, 3) * 0.02) + ((${long_term_logical_bytes}/POW(1024, 3)) * 0.01);;
    value_format:"$#,##0.00"
  }

  measure: sum_physical_billing_cost_usd{
    type: sum
    sql: (${active_physical_bytes}/POW(1024, 3) * 0.04) + ((${long_term_physical_bytes}/POW(1024, 3)) * 0.02);;
    value_format:"$#,##0.00"
  }

  measure: count{
    type: count
  }

}
