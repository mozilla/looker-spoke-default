connection: "telemetry"
label: "Monitoring (Data Pipeline)"
include: "//looker-hub/monitoring/explores/*"
include: "//looker-hub/monitoring/views/*"
include: "views/*"
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

  join: missing_columns_notes {
    relationship: many_to_one
    sql_on: (${missing_columns_notes.document_namespace} IS NULL OR ${structured_missing_columns.document_namespace} = ${missing_columns_notes.document_namespace})
      AND (${missing_columns_notes.document_type} IS NULL OR ${structured_missing_columns.document_type} = ${missing_columns_notes.document_type})
      AND (${missing_columns_notes.document_version} IS NULL OR ${structured_missing_columns.document_version} = ${missing_columns_notes.document_version})
      AND (${missing_columns_notes.path} IS NULL OR ${structured_missing_columns.path} = ${missing_columns_notes.path})
      AND (${missing_columns_notes.start_date} IS NULL OR ${missing_columns_notes.start_date} <= ${structured_missing_columns.submission_date})
      AND (${missing_columns_notes.end_date} IS NULL OR ${missing_columns_notes.end_date} >= ${structured_missing_columns.submission_date});;
  }
}

explore: +schema_error_counts {
  hidden: yes

  join: schema_errors_notes {
    relationship: many_to_one
    sql_on: (${schema_errors_notes.document_namespace} IS NULL OR ${schema_error_counts.document_namespace} = ${schema_errors_notes.document_namespace})
      AND (${schema_errors_notes.document_type} IS NULL OR ${schema_error_counts.document_type} = ${schema_errors_notes.document_type})
      AND (${schema_errors_notes.path} IS NULL OR ${schema_error_counts.path} = ${schema_errors_notes.path})
      AND (${schema_errors_notes.start_date} IS NULL OR ${schema_errors_notes.start_date} <= ${schema_error_counts.submission_date})
      AND (${schema_errors_notes.end_date} IS NULL OR ${schema_errors_notes.end_date} >= ${schema_error_counts.submission_date});;
  }
}

explore: +telemetry_missing_columns {
  hidden: yes

  join: missing_columns_notes {
    relationship: many_to_one
    sql_on: (${missing_columns_notes.document_namespace} IS NULL OR ${telemetry_missing_columns.document_namespace} = ${missing_columns_notes.document_namespace})
      AND (${missing_columns_notes.document_type} IS NULL OR ${telemetry_missing_columns.document_type} = ${missing_columns_notes.document_type})
      AND (${missing_columns_notes.document_version} IS NULL OR ${telemetry_missing_columns.document_version} = ${missing_columns_notes.document_version})
      AND (${missing_columns_notes.path} IS NULL OR ${telemetry_missing_columns.path} = ${missing_columns_notes.path})
      AND (${missing_columns_notes.start_date} IS NULL OR ${missing_columns_notes.start_date} <= ${telemetry_missing_columns.submission_date})
      AND (${missing_columns_notes.end_date} IS NULL OR ${missing_columns_notes.end_date} >= ${telemetry_missing_columns.submission_date});;
  }
}

explore: +distinct_docids {
  join: distinct_docids_notes {
    relationship: many_to_one
    sql_on: (${distinct_docids_notes.document_namespace} IS NULL OR ${distinct_docids.namespace} = ${distinct_docids_notes.document_namespace})
      AND (${distinct_docids_notes.document_type} IS NULL OR ${distinct_docids.doc_type} = ${distinct_docids_notes.document_type})
      AND (${distinct_docids_notes.start_date} IS NULL OR ${distinct_docids_notes.start_date} <= ${distinct_docids.submission_date})
      AND (${distinct_docids_notes.end_date} IS NULL OR ${distinct_docids_notes.end_date} >= ${distinct_docids.submission_date});;
  }
}

explore: +missing_namespaces_and_document_types {
  hidden: yes
  join: missing_document_namespaces_notes {
    relationship: many_to_one
    sql_on: (${missing_document_namespaces_notes.document_namespace} IS NULL OR ${missing_namespaces_and_document_types.document_namespace} = ${missing_document_namespaces_notes.document_namespace})
      AND (${missing_document_namespaces_notes.document_type} IS NULL OR ${missing_namespaces_and_document_types.document_type} = ${missing_document_namespaces_notes.document_type})
      AND (${missing_document_namespaces_notes.document_version} IS NULL OR ${missing_namespaces_and_document_types.document_version} = ${missing_document_namespaces_notes.document_version});;
  }
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

explore: missing_columns_notes {
  hidden: yes
  sql_always_where: ${bug} IS NOT NULL OR ${notes} IS NOT NULL ;;
}

explore: distinct_docids_notes {
  hidden: yes
  sql_always_where: ${bug} IS NOT NULL OR ${notes} IS NOT NULL ;;
}

explore: schema_errors_notes {
  hidden: yes
  sql_always_where: ${bug} IS NOT NULL OR ${notes} IS NOT NULL ;;
}

explore: missing_document_namespaces_notes {
  hidden: yes
  sql_always_where: ${bug} IS NOT NULL OR ${notes} IS NOT NULL ;;
}
