view: all_schema_errors_last_14_days {
  derived_table: {
    explore_source: schema_error_counts {
      column: document_namespace {}
      column: document_type {}
      column: path {}
      column: notes { field: schema_errors_notes.notes }
      column: bug { field: schema_errors_notes.bug }
      column: sample_error_messages {}
      column: error_count {}
      filters: {
        field: schema_error_counts.submission_date
        value: "14 days ago for 14 days"
      }
    }
  }

  # Dimensions
  dimension: document_namespace {}
  dimension: document_type {}
  dimension: path {}
  dimension: notes {}
  dimension: sample_error_messages {
    description: "concatenated error messages, limited to 300 characters"
  }
  dimension: bug {
    hidden: yes
  }
  dimension: error_count {
    hidden: yes
  }

  dimension: bug_link {
    label: "Bug"
    type: string
    sql:
      CASE
        WHEN ${bug} IS NOT NULL THEN CONCAT("Bug ", SPLIT(${bug}, "=")[OFFSET(1)])
        ELSE "create Bug"
      END

          ;;
    link: {
      label: "{% if value != \"create Bug\" %} view on BugZilla {% else %} create new Bug {% endif %}"
      url: "
        {% if value != \"create Bug\" %}
          {{ bug }}
        {% else %}
          https://bugzilla.mozilla.org/enter_bug.cgi?product=Data%20Platform%20and%20Tools&component=General&bug_status=NEW&bug_type=defect&short_desc=Investigate+schema+error+in+%60{{ document_namespace }}.{{ document_type }}%60+for+%60{{ path | encode_uri }}%60
        {% endif %}"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }

  }

  # Measures
  measure: sum_error_count {
    label: "Error Count"
    type: sum
    sql: ${error_count};;
  }
}
