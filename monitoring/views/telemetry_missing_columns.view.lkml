include: "//looker-hub/monitoring/views/telemetry_missing_columns.view.lkml"

view: +telemetry_missing_columns {

  # Dimensions
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
&short_desc=telemetry+missing+columns+in+%60
{{ document_namespace }}.{{ document_type }}_v{{ document_version }}
%60+for+{{path | encode_uri}}
&comment=Missing column {{ path | url_encode }} in `{{ document_namespace }}.{{ document_type }}_v{{ document_version }}`.
%0D%0A%0D%0A
Found in {{ path_count_last_week }} pings in the past week which is a change of {{ percent_change._rendered_value }} from the previous week. This is affecting {{ percent_affected_pings._rendered_value }} of valid pings.
%0D%0A%0D%0A
See runbook for resolution: {{ 'https://mozilla-hub.atlassian.net/wiki/spaces/DATA/pages/590446607/Missing+Column+Error' | url_encode }}
%0D%0A%0D%0A
[Link to Looker explore](https://mozilla.cloud.looker.com/x/Fkx1kRudQQ5neF9B9YGTlw)
"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }

  dimension: path_count {
    hidden: yes
  }

  # Measures
  measure: sum_path_count {
    label: "Path Count"
    type: sum
    sql: ${path_count} ;;
  }

  measure: path_count_last_week {
    label: "Path Count (last 7 days)"
    type: sum
    sql: ${path_count} ;;
    filters: [submission_date: "7 days ago for 7 days"]
  }

  measure: path_count_prev_week {
    label: "Path Count (2 weeks ago)"
    type: sum
    sql: ${path_count} ;;
    filters: [submission_date: "14 days ago for 7 days"]
  }

  measure: percent_change {
    label: "Diff % to two weeks ago"
    type: number
    sql: (${path_count_last_week} - ${path_count_prev_week}) / nullif(${path_count_prev_week}, 0)  ;;
    value_format_name: percent_2
  }

  measure: total_ping_count {
    label: "Total Ping Count (last 7 days)"
    type: sum
    sql: ${stable_and_derived_table_sizes.row_count} ;;
    filters: [submission_date: "7 days ago for 7 days"]
  }

  measure: percent_affected_pings {
    label: "% affected pings"
    type: number
    sql: ${path_count_last_week} / GREATEST(${total_ping_count}, 1) ;;
    value_format_name: percent_2
  }
}
