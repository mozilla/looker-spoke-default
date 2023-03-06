include: "//looker-hub/monitoring/views/telemetry_missing_columns.view.lkml"

view: +telemetry_missing_columns {

  # Dimensions
  dimension: new_bug {
    type: string
    sql: "create Bug" ;;
    link: {
      label: "create new Bug"
      url: "https://bugzilla.mozilla.org/enter_bug.cgi?product=Data+Platform+and+Tools&component=General&bug_status=NEW&bug_type=defect&short_desc=Investigate+telemetry+missing+columns+in+%60{{ document_namespace }}.{{ document_type }}%60+for+{{ path | encode_uri }}"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }
}
