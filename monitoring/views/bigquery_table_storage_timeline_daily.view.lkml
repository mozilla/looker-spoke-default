include: "//looker-hub/monitoring/views/bigquery_table_storage_timeline_daily.view.lkml"

view: +bigquery_table_storage_timeline_daily {

  measure: sum_change_count{
    type: sum
    sql: ${change_count} ;;
  }

  measure: sum_total_rows{
    type: sum
    sql: ${avg_total_rows} ;;
    value_format: "#,##0,,\" M\""
  }

  measure: sum_total_partitions{
    type: sum
    sql: ${avg_total_partitions} ;;
    value_format: "#,##0,,\" M\""
  }

  measure: sum_total_logical_GB{
    type: sum
    sql: ${avg_total_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_active_logical_GB{
    type: sum
    sql: ${avg_active_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_long_term_logical_GB{
    type: sum
    sql: ${avg_long_term_logical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_total_physical_GB{
    type: sum
    sql: ${avg_total_physical_bytes}/POW(1024, 3);;
    value_format: "#,##0.00"
  }

  measure: sum_active_physical_GB{
    type: sum
    sql: ${avg_active_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_long_term_physical_GB{
    type: sum
    sql: ${avg_long_term_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_time_travel_physical_GB{
    type: sum
    sql: ${avg_time_travel_physical_bytes}/POW(1024, 3) ;;
    value_format: "#,##0.00"
  }

  measure: sum_logical_billing_cost_usd{
    type: sum
    sql: (${avg_active_logical_bytes}/POW(1024, 3) * 0.02) + ((${avg_long_term_logical_bytes}/ POW(1024, 3)) * 0.01);;
    value_format:"$#,##0.00"
  }

  measure: sum_physical_billing_cost_usd{
    type: sum
    sql: (${avg_active_physical_bytes}/POW(1024, 3) * 0.04) + ((${avg_long_term_physical_bytes}/ POW(1024, 3)) * 0.02);;
    value_format:"$#,##0.00"
  }

  measure: count{
    type: count
  }

}
