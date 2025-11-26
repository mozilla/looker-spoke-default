include: "//looker-hub/accounts_frontend/views/events_stream.view.lkml"

view: +events_stream {
  dimension: extras__string__url_relative {
    sql:
      CASE
        WHEN REGEXP_CONTAINS(${extras__string__url}, r'^(file://|/[A-Za-z]:/|content:/)') THEN ''
        ELSE REGEXP_REPLACE(${extras__string__url}, r'^https?://[^/]+|\?.*$|#.*$', '')
      END ;;
    type: string
    group_label: "Extras: String"
    group_item_label: "URL (relative)"
    suggest_persist_for: "24 hours"
  }
}
