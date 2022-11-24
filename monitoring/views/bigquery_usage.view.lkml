include: "//looker-hub/monitoring/views/bigquery_usage.view.lkml"

view: +bigquery_usage {

  dimension: job_id {
    primary_key: yes
    sql: job_id ;;
    type: string
  }

  dimension: full_reference_table_name {
        sql: concat(reference_project_id, reference_dataset_id, reference_table_id) ;;
        type: string
  }

  dimension: full_destination_table_name {
    sql: concat(destination_project_id, destination_dataset_id, destination_table_id) ;;
    type: string
  }

  measure: sum_total_job_cost_usd{
    type: sum_distinct
    sql_distinct_key: ${job_id};;
    sql: ${cost_usd} ;;
    value_format:"$#,##0.00"
  }

  measure: sum_total_terabytes_processed{
    type: sum_distinct
    sql_distinct_key: ${job_id} ;;
    sql: ${total_terabytes_processed} ;;
  }

  measure: number_of_unique_job_ids{
    description: "count distinct number of job ids"
    type: count_distinct
    sql: ${job_id};;
  }
}
