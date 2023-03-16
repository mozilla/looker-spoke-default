connection: "telemetry"
label: "Data Integrity Monitoring (dim)"
include: "//looker-hub/data_integrity_monitoring/views/*"
# include: "explores/*"
# include: "dashboards/*"

explore: run_history {
  join: run_processing_info {
    sql_on: ${run_history.run_id} = ${run_processing_info.run_id} AND ${run_history.dim_check_type} = ${run_processing_info.dim_check_type} ;;
    relationship: one_to_one
  }
}

explore: muted_alerts {}
