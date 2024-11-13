include: "//looker-hub/monitoring/views/bigquery_usage.view.lkml"

view: +bigquery_usage {

  dimension: job_id {
    sql: job_id ;;
    type: string
  }

  dimension: full_reference_table_name {
    sql: concat(reference_project_id, '.', reference_dataset_id, '.', reference_table_id) ;;
    type: string
  }

  dimension: full_destination_table_name {
    sql: concat(destination_project_id, '.', destination_dataset_id, '.', destination_table_id) ;;
    type: string
  }

  dimension: destination_table_id {
    sql: split(destination_table_id, '$')[SAFE_OFFSET(0)];;
    type: string
  }

  dimension: partition {
    sql: split(destination_table_id, '$')[SAFE_OFFSET(1)];;
    type: string
  }

  measure: avg_total_terabytes_processed{
    type: average_distinct
    sql_distinct_key: ${job_id} ;;
    sql: ${total_terabytes_processed} ;;
    value_format: "#,##0.00"
  }

  measure: sum_total_terabytes_processed{
    type: sum_distinct
    sql_distinct_key: ${job_id} ;;
    sql: ${total_terabytes_processed} ;;
    value_format: "#,##0.00"
  }

  measure: number_of_unique_job_ids{
    description: "count distinct number of job ids"
    type: count_distinct
    sql: ${job_id};;
  }

  measure: sum_total_cost_usd{
    type: sum_distinct
    sql_distinct_key: ${job_id} ;;
    sql: ${cost} ;;
    value_format: "$#.00;($#.00)"
  }
}
