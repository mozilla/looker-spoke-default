include: "//looker-hub/monitoring/views/bigquery_table_storage.view.lkml"

view: +bigquery_table_storage {

  measure: sum_total_rows{
    type: sum
    sql: {total_rows} ;;
  }

  # measure: sum_total_partitions{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_logical_billing_cost_usd{
  #   type: sum
  # }

  # measure: sum_physical_billing_cost_usd{
  #   type: sum
  # }

  measure: count{
    type: count
  }

}
