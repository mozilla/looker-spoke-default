include: "//looker-hub/monitoring/views/bigquery_usage_costs.view.lkml"

view: +bigquery_usage_costs {
  measure: total_cost_usd{
    type: sum_distinct
    sql_distinct_key: ${job_id} ;;
    sql: ${cost_usd} ;;
    value_format: "#,##0.00"
  }

  measure: count_unique_job_ids{
    description: "Count of unique job ids"
    type: count_distinct
    sql: ${job_id};;
  }
}
