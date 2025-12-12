view: missing_namespaces_and_document_types {
  derived_table: {
    sql: WITH error_counts AS (
      SELECT
        DATE(submission_timestamp) AS submission_date,
        document_namespace,
        document_type,
        document_version,
        error_type,
        COUNT(*) AS error_count
      FROM
        mozdata.monitoring.payload_bytes_error_structured
      WHERE
        submission_timestamp >= TIMESTAMP_SUB(current_timestamp, INTERVAL 7 DAY)
        AND exception_class = 'com.mozilla.telemetry.ingestion.core.schema.SchemaNotFoundException'
      GROUP BY
        submission_date,
        document_namespace,
        document_type,
        document_version,
        error_type
    ),
    structured_daily_errors AS (
      SELECT
        submission_date,
        document_namespace,
        document_type,
        document_version,
        error_type,
        COALESCE(error_counts.error_count, 0) AS error_count
      FROM
        error_counts
    )
    SELECT
      document_namespace,
      submission_date,
      document_type,
      document_version,
      SUM(error_count) as total_errors,
      null AS total_pings
    FROM
      structured_daily_errors
    GROUP BY
      document_namespace,
      submission_date,
      document_type,
      document_version
    HAVING
      SUM(error_count) > 20
      AND NOT REGEXP_CONTAINS(document_namespace, '^org-mozilla-firefo.$')
      -- see https://bugzilla.mozilla.org/show_bug.cgi?id=1864571
      AND document_namespace != 'accounts-frontend-dev'
    ORDER BY
      total_errors DESC
    ;;
  }

  # Dimensions
  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date
    ]
    convert_tz: no
    datatype: date
  }

  dimension: document_namespace {
    type: string
    sql: ${TABLE}.document_namespace ;;
  }

  dimension: document_type  {
    type: string
    sql:  ${TABLE}.document_type ;;
  }

  dimension: document_version  {
    type: string
    sql:  ${TABLE}.document_version ;;
  }

  dimension: new_bug_namespace_only {
    label: "New Bug Namespace"
    type: string
    sql: "create Bug" ;;
    link: {
      label: "create new Bug"
      url: "
https://bugzilla.mozilla.org/enter_bug.cgi?
product=Data+Platform+and+Tools
&component=General
&bug_type=defect
&status_whiteboard=%5Bdataquality%5D
&short_desc=missing+namespaces+and+document+types+in+%60{{ document_namespace }}%60%3A%20 {{ list_of_document_types._rendered_value }}
&comment=`{{ document_namespace }}` had {{ total_errors }} pings with missing schemas in the past week. Document types: {{ list_of_document_types._rendered_value }}%0D%0A%0D%0A
See runbook for resolution details: {{ 'https://mozilla-hub.atlassian.net/wiki/spaces/IP/pages/284721153/Missing+Document+Namespace+Bugs' | url_encode }}
"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  dimension: new_bug_namespace_and_type{
    label: "New Bug Namespace and Type"
    type: string
    sql: "create Bug" ;;
    link: {
      label: "create new Bug"
      url: "
https://bugzilla.mozilla.org/enter_bug.cgi?
product=Data+Platform+and+Tools
&component=General
&bug_type=defect
&status_whiteboard=%5Bdataquality%5D
&short_desc=missing+namespace+and+document+types+in+
{{ document_namespace }}.{{ document_type }}
&comment=`{{ document_namespace }}.{{ document_type }}` had {{ total_errors }} pings with missing schemas in the past week.%0D%0A%0D%0A
See runbook for resolution details: {{ 'https://mozilla-hub.atlassian.net/wiki/spaces/IP/pages/284721153/Missing+Document+Namespace+Bugs' | url_encode }}
"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  # Measures
  measure: total_pings {
    type: sum
    sql: ${TABLE}.total_pings ;;
  }
  measure: total_errors {
    type: sum
    sql: ${TABLE}.total_errors ;;
  }
  measure: list_of_document_types {
    type: list
    list_field: document_type
  }
}
