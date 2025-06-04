connection: "telemetry"
label: "Monitoring (Data Pipeline)"

include: "//looker-hub/monitoring/explores/*"

# TODO: remove unnecessary view imports
include: "//looker-hub/monitoring/views/airflow_dag.view.lkml"
include: "//looker-hub/monitoring/views/airflow_dag_note.view.lkml"
include: "//looker-hub/monitoring/views/airflow_dag_owner_attributes.view.lkml"
include: "//looker-hub/monitoring/views/airflow_dag_run.view.lkml"
include: "//looker-hub/monitoring/views/airflow_dag_tag.view.lkml"
include: "//looker-hub/monitoring/views/airflow_dag_warning.view.lkml"
include: "//looker-hub/monitoring/views/airflow_import_error.view.lkml"
include: "//looker-hub/monitoring/views/airflow_job.view.lkml"
include: "//looker-hub/monitoring/views/airflow_slot_pool.view.lkml"
include: "//looker-hub/monitoring/views/airflow_task_fail.view.lkml"
include: "//looker-hub/monitoring/views/airflow_task_instance.view.lkml"
include: "//looker-hub/monitoring/views/airflow_task_instance_note.view.lkml"
include: "//looker-hub/monitoring/views/airflow_task_reschedule.view.lkml"
include: "//looker-hub/monitoring/views/airflow_trigger.view.lkml"
include: "//looker-hub/monitoring/views/airflow_user.view.lkml"
include: "//looker-hub/monitoring/views/bigquery_table_storage.view.lkml"
include: "//looker-hub/monitoring/views/bigquery_table_storage_timeline_daily.view.lkml"
include: "//looker-hub/monitoring/views/bigquery_tables_inventory.view.lkml"
include: "//looker-hub/monitoring/views/bigquery_usage.view.lkml"
include: "//looker-hub/monitoring/views/column_size.view.lkml"
include: "//looker-hub/monitoring/views/event_error_monitoring_aggregates.view.lkml"
include: "//looker-hub/monitoring/views/event_monitoring_live.view.lkml"
include: "//looker-hub/monitoring/views/missing_columns_notes.view.lkml"
include: "//looker-hub/monitoring/views/missing_document_namespaces_notes.view.lkml"
include: "//looker-hub/monitoring/views/mlops_job_cost_per_job.view.lkml"
include: "//looker-hub/monitoring/views/mlops_job_cost_per_job_run.view.lkml"
include: "//looker-hub/monitoring/views/payload_bytes_error_all.view.lkml"
include: "//looker-hub/monitoring/views/schema_error_counts.view.lkml"
include: "//looker-hub/monitoring/views/schema_errors_notes.view.lkml"
include: "//looker-hub/monitoring/views/stable_and_derived_table_sizes.view.lkml"
include: "//looker-hub/monitoring/views/stable_table_column_counts.view.lkml"
include: "//looker-hub/monitoring/views/structured_missing_columns.view.lkml"
include: "//looker-hub/monitoring/views/telemetry_missing_columns.view.lkml"
include: "views/airflow_dag.view.lkml"
include: "views/airflow_dag_run.view.lkml"
include: "views/airflow_dag_tag.view.lkml"
include: "views/airflow_task_fail.view.lkml"
include: "views/bigquery_table_storage.view.lkml"
include: "views/bigquery_table_storage_timeline_daily.view.lkml"
include: "views/bigquery_tables_inventory.view.lkml"
include: "views/bigquery_usage.view.lkml"
include: "views/database_sizes_mb.view.lkml"
include: "views/event_flow_monitoring_aggregates.view.lkml"
include: "views/event_monitoring_live.view.lkml"
include: "views/grouped_schema_error_counts.view.lkml"
include: "views/missing_columns_notes.view.lkml"
include: "views/missing_document_namespaces_notes.view.lkml"
include: "views/missing_namespaces_and_document_types.view.lkml"
include: "views/mlops_flow_cost.view.lkml"
include: "views/mlops_flow_run_cost.view.lkml"
include: "views/schema_error_notes.view.lkml"
include: "views/stable_table_column_counts.view.lkml"
include: "views/structured_missing_columns.view.lkml"
include: "views/telemetry_missing_columns.view.lkml"
include: "views/looker_dashboard_load_times.view.lkml"
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

explore: +column_size {
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

explore: +stable_table_column_counts {
  hidden: yes
}

explore: missing_columns_notes {
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

explore: event_monitoring_live {
  hidden: yes
}

explore: event_error_monitoring_aggregates {
  hidden: yes
}
