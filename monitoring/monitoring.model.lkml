connection: "telemetry"
label: "Monitoring (Data Pipeline)"
include: "//looker-hub/monitoring/explores/*"
include: "//looker-hub/monitoring/views/*"
# include: "views/*"
include: "explores/*"
include: "dashboards/*"

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

# hiding explores to declutter available explores suggestions
explore: +average_ping_sizes {
  hidden: yes
}

explore: +column_size {
  hidden: yes
}

explore: +payload_bytes_decoded_all {
  hidden: yes
}

explore: +payload_bytes_error_all {
  hidden: yes
}

explore: +payload_bytes_error_all {
  hidden: yes
}

explore: +stable_table_column_counts {
  hidden: yes
}

explore: +structured_distinct_docids {
  hidden: yes
}

explore: +structured_missing_columns {
  hidden: yes
}

explore: +telemetry_missing_columns {
  hidden: yes
}

explore: +telemetry_distinct_docids {
  hidden: yes
}

explore: +stable_table_column_counts {
  hidden: yes
}

explore: +stable_table_sizes {
  hidden: yes
}
