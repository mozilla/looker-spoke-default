connection: "telemetry"
label: "Monitoring (Data Pipeline)"
include: "//looker-hub/monitoring/explores/*"
include: "//looker-hub/monitoring/views/*"
# include: "views/*"
include: "explores/*"
# include: "dashboards/*"

# todo: hide explores once dashboard has been implemented
view: +payload_bytes_error_all {
  dimension: calculated_exception_class {
    type: string
    sql: REGEXP_REPLACE(${exception_class}, r'.*[.$](.*)', r'\1');;
  }
  measure: count_total_exceptions{
    sql: COUNT(*) ;;
    type: number
  }
}
