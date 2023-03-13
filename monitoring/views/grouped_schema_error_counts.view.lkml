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
        '&status_whiteboard=%5Bdata-quality%5D'
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
}
