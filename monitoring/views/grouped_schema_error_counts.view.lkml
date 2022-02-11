include: "//looker-hub/monitoring/views/schema_error_counts.view.lkml"

view: grouped_schema_error_counts {
    extends: [schema_error_counts]

  dimension:  document_type_v{
    type: string
    sql: concat(${document_type}, "_v", coalesce(${document_version}, if(${document_namespace}="telemetry", "4", "1"))) ;;
    }

  measure: error_counts_sum {
    type: number
    sql: sum(${error_count}) ;;
  }
}
