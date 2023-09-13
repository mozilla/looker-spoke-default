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

explore: +structured_missing_columns {
  hidden: yes

  join: missing_columns_notes {
    relationship: many_to_one
    sql_on: (${missing_columns_notes.document_namespace} IS NULL OR ${structured_missing_columns.document_namespace} LIKE ${missing_columns_notes.document_namespace})
      AND (${missing_columns_notes.document_type} IS NULL OR ${structured_missing_columns.document_type} LIKE ${missing_columns_notes.document_type})
      AND (${missing_columns_notes.document_version} IS NULL OR ${structured_missing_columns.document_version} LIKE ${missing_columns_notes.document_version})
      AND (${missing_columns_notes.path} IS NULL OR ${structured_missing_columns.path} LIKE ${missing_columns_notes.path})
      AND (${missing_columns_notes.bug} IS NOT NULL OR ${missing_columns_notes.notes} IS NOT NULL);;
  }
}

explore: +schema_error_counts {
  hidden: yes

  join: schema_errors_notes {
    relationship: many_to_one
    sql_on: (${schema_errors_notes.document_namespace} IS NULL OR ${schema_error_counts.document_namespace} LIKE ${schema_errors_notes.document_namespace})
      AND (${schema_errors_notes.document_type} IS NULL OR ${schema_error_counts.document_type} LIKE ${schema_errors_notes.document_type})
      AND (${schema_errors_notes.path} IS NULL OR ${schema_error_counts.path} LIKE ${schema_errors_notes.path})
      AND (${schema_errors_notes.bug} IS NOT NULL OR ${schema_errors_notes.notes} IS NOT NULL);;
  }
}

explore: +telemetry_missing_columns {
  hidden: yes

  join: missing_columns_notes {
    relationship: many_to_one
    sql_on: (${missing_columns_notes.document_namespace} IS NULL OR ${telemetry_missing_columns.document_namespace} LIKE ${missing_columns_notes.document_namespace})
      AND (${missing_columns_notes.document_type} IS NULL OR ${telemetry_missing_columns.document_type} LIKE ${missing_columns_notes.document_type})
      AND (${missing_columns_notes.document_version} IS NULL OR ${telemetry_missing_columns.document_version} LIKE ${missing_columns_notes.document_version})
      AND (${missing_columns_notes.path} IS NULL OR ${telemetry_missing_columns.path} LIKE ${missing_columns_notes.path})
      AND (${missing_columns_notes.bug} IS NOT NULL OR ${missing_columns_notes.notes} IS NOT NULL);;
  }
}

explore: +distinct_docids {
  join: distinct_docids_notes {
    relationship: many_to_one
    sql_on: (${distinct_docids_notes.document_namespace} IS NULL OR ${distinct_docids.namespace} LIKE ${distinct_docids_notes.document_namespace})
      AND (${distinct_docids_notes.document_type} IS NULL OR ${distinct_docids.doc_type} LIKE ${distinct_docids_notes.document_type})
      AND (${distinct_docids_notes.notes} IS NOT NULL OR ${distinct_docids_notes.bug} IS NOT NULL)
      AND (${distinct_docids.submission_date} BETWEEN ${distinct_docids_notes.start_date} AND ${distinct_docids_notes.end_date});;
  }
}

explore: +missing_namespaces_and_document_types {
  hidden: yes
  join: missing_document_namespaces_notes {
    relationship: many_to_one
    sql_on: (${missing_document_namespaces_notes.document_namespace} IS NULL OR ${missing_namespaces_and_document_types.document_namespace} LIKE ${missing_document_namespaces_notes.document_namespace})
      AND (${missing_document_namespaces_notes.document_type} IS NULL OR ${missing_namespaces_and_document_types.document_type} LIKE ${missing_document_namespaces_notes.document_type})
      AND (${missing_document_namespaces_notes.document_version} IS NULL OR ${missing_namespaces_and_document_types.document_version} LIKE ${missing_document_namespaces_notes.document_version})
      AND (${missing_document_namespaces_notes.notes} IS NOT NULL OR ${missing_document_namespaces_notes.bug} IS NOT NULL);;
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
