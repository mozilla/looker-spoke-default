include: "//looker-hub/monitoring/views/schema_error_counts.view.lkml"

view: +schema_error_counts {

  # Dimensions
  dimension: document_namespace{
    type: string
    sql: replace(${TABLE}.document_namespace, "-", "_") ;;
  }

  dimension:  document_type{
    type: string
    sql: concat(replace(${TABLE}.document_type, "-", "_"), "_v", coalesce(${TABLE}.document_version, if(${TABLE}.document_namespace="telemetry", "4", "1"))) ;;
    }

  # Measures
  measure: error_counts_sum {
    type: sum
    sql: (${error_count}) ;;
  }

  measure: error_count_last_week {
    type: sum
    sql: ${error_count} ;;
    filters: [submission_date: "7 days ago for 7 days"]
  }

  measure: error_count_prev_week {
    type: sum
    sql: ${error_count} ;;
    filters: [submission_date: "14 days ago for 7 days"]
  }

  measure: percent_change {
    type: number
    sql: (${error_count_last_week} - ${error_count_prev_week}) / nullif(${error_count_last_week}, 0)  ;;
    value_format_name: percent_2
  }

}
