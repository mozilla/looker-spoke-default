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
      url: "{{
        'https://bugzilla.mozilla.org/enter_bug.cgi?'
      }}{{
        'product=Data+Platform+and+Tools'
      }}{{
        '&component=General'
      }}{{
        '&bug_type=defect'
      }}{{
        '&status_whiteboard=%5Bdataquality%5D'
      }}{{
        '&short_desc=schema+error+in+%60'
      }}{{
        document_namespace }}.{{ document_type
      }}{{
        '%60+for+'
      }}{{
        path | encode_uri
      }}"
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

}
