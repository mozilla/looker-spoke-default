include: "//looker-hub/monitoring/views/bigquery_table_storage_timeline_daily.view.lkml"

view: +bigquery_table_storage_timeline_daily {

  measure: sum_change_count{
    type: sum
    sql: ${change_count} ;;
  }

  measure: sum_total_rows{
    type: sum
    sql: ${avg_total_rows} ;;
  }

  measure: sum_total_partitions{
    type: sum
    sql: ${avg_total_partitions} ;;
  }

  measure: sum_total_logical_bytes{
    type: sum
    sql: ${avg_total_logical_bytes} ;;
  }

  measure: sum_active_logical_bytes{
    type: sum
    sql: ${avg_active_logical_bytes} ;;
  }

  measure: sum_long_term_logical_bytes{
    type: sum
    sql: ${avg_long_term_logical_bytes} ;;
  }

  measure: sum_total_physical_bytes{
    type: sum
    sql: ${avg_total_physical_bytes} ;;
  }

  measure: sum_active_physical_bytes{
    type: sum
    sql: ${avg_active_physical_bytes} ;;
  }

  measure: sum_long_term_physical_bytes{
    type: sum
    sql: ${avg_long_term_physical_bytes} ;;
  }

  measure: sum_time_travel_physical_bytes{
    type: sum
    sql: ${avg_time_travel_physical_bytes} ;;
  }

  measure: sum_logical_billing_cost_usd{
    type: sum
    sql: ${avg_logical_billing_cost_usd} ;;
  }

  measure: sum_physical_billing_cost_usd{
    type: sum
    sql: ${avg_physical_billing_cost_usd} ;;
  }

  measure: count{
    type: count
  }

}
