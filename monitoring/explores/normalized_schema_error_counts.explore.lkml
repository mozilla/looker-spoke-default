include: "../views/grouped_schema_error_counts.view.lkml"
include: "../views/overall_ping_counts.view.lkml"

explore: normalized_schema_error_counts{
view_name: overall_ping_counts

hidden: no

join: grouped_schema_error_counts {
  from: grouped_schema_error_counts
  relationship: one_to_one

  sql_on:
    ${grouped_schema_error_counts.document_type_v} = ${overall_ping_counts.doc_type}
  AND ${grouped_schema_error_counts.document_namespace} = ${overall_ping_counts.namespace}
  AND ${grouped_schema_error_counts.submission_date} = ${overall_ping_counts.submission_date}
  ;;
}

}
