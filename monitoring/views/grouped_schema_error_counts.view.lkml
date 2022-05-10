include: "//looker-hub/monitoring/views/schema_error_counts.view.lkml"

view: +schema_error_counts {

  dimension: document_namespace{
    type: string
    sql: replace(${TABLE}.document_namespace, "-", "_") ;;

  }

  dimension:  document_type{
    type: string
    sql: concat(replace(${TABLE}.document_type, "-", "_"), "_v", coalesce(${TABLE}.document_version, if(${TABLE}.document_namespace="telemetry", "4", "1"))) ;;
    }

  measure: error_counts_sum {
    type: sum
    sql: (${error_count}) ;;
  }
}
