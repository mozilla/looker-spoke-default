connection: "telemetry"
label: "Data Integrity Monitoring (dim)"
include: "//looker-hub/data_integrity_monitoring/views/*"
# include: "explores/*"
# include: "dashboards/*"

explore: run_history {}
explore: run_processing_info {}
explore: muted_alerts {}
