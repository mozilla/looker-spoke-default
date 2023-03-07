include: "//looker-hub/monitoring/views/structured_missing_columns.view.lkml"

view: +structured_missing_columns {

  # Dimensions
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
        '&short_desc=structured+missing+columns+in+%60'
      }}{{
        document_namespace }}.{{ document_type }}_v{{ document_version
      }}{{
        '%60+for+'
      }}{{
        path | encode_uri
      }}"
      icon_url: "https://bugzilla.mozilla.org/favicon.ico"
    }
  }
}
