include: "//looker-hub/monitoring/views/schema_error_counts.view.lkml"

view: +schema_error_counts {

  # Dimensions
  dimension: document_namespace{
    type: string
    sql: replace(${TABLE}.document_namespace, "-", "_") ;;
  }

  dimension:  document_type{
    type: string
    sql: concat(replace(${TABLE}.document_type, "-", "_"), "_v", coalesce(${TABLE}.document_version, if(${TABLE}.document_namespace="telemetry", "4", "1"))) ;;
  }

  dimension: new_bug {
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
&short_desc=schema+error+in+%60
{{document_namespace }}.{{ document_type }}
%60+for+{{ path | url_encode }}
&comment=Schema error for {{ path | url_encode }} in `{{ document_namespace }}.{{ document_type }}`.
%0D%0A%0D%0A
Encountered {{ error_count_last_week }} errors in the past week which is a change of {{ percent_change._rendered_value }} from the previous week. The error count is {{ percent_affected_pings._rendered_value }} of {{ stable_and_derived_table_sizes.row_count_last_week }} valid pings.
%0D%0A%0D%0A
See runbook for resolution: {{ 'https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/1134854153/Schema+Errors' | url_encode }}
%0D%0A%0D%0A
[Link to Looker explore](https://mozilla.cloud.looker.com/x/Voz5agVb8xEpOiB6gvUQ61). Change `document_namespace` to `{{ document_namespace }}` and `document_type` to `{{ document_type }}`.
"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  # Measures
  measure: error_counts_sum {
    type: sum
    sql: (${error_count}) ;;
  }

  measure: error_count_last_week {
    label: "Error Count (last 7 days)"
    type: sum
    sql: ${error_count} ;;
    filters: [submission_date: "7 days ago for 7 days"]
  }

  measure: error_count_prev_week {
    label: "Error Count (2 weeks ago)"
    type: sum
    sql: ${error_count} ;;
    filters: [submission_date: "14 days ago for 7 days"]
  }

  measure: percent_change {
    label: "Diff % to two weeks ago"
    type: number
    sql: (${error_count_last_week} - ${error_count_prev_week}) / nullif(${error_count_prev_week}, 0)  ;;
    value_format_name: percent_2
  }

  measure: percent_affected_pings {
    label: "% affected pings"
    type: number
    sql: ${error_count_last_week} / GREATEST(${stable_and_derived_table_sizes.row_count_last_week}, 1) ;;
    value_format_name: percent_2
  }
}
