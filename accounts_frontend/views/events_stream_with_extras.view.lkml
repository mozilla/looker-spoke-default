include: "//looker-hub/accounts_frontend/views/events_stream_table.view.lkml"

view: events_stream_with_extras {
  extends: [events_stream_table]

  dimension: extra_reason {
    # left for backwards compatibility, duplicated below with `extra__` prefix
    hidden: yes
    type: string
    sql: LAX_STRING(${TABLE}.event_extra.reason) ;;
  }

  dimension: extra__reason {
    sql: LAX_STRING(${TABLE}.event_extra.reason) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "reason"
  }

  dimension: extra__third_party_links {
    sql: LAX_STRING(${TABLE}.event_extra.third_party_links) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "third_party_links"
  }

  dimension: extra__id {
    sql: LAX_STRING(${TABLE}.event_extra.id) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "id"
  }

  dimension: extra__label {
    sql: LAX_STRING(${TABLE}.event_extra.label) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "label"
  }

  dimension: extra__type {
    sql: LAX_STRING(${TABLE}.event_extra.type) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "type"
  }

  dimension: extra__referrer {
    sql: LAX_STRING(${TABLE}.event_extra.referrer) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "referrer"
  }

  dimension: extra__title {
    sql: LAX_STRING(${TABLE}.event_extra.title) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "title"
  }

  dimension: extra__url_relative {
    sql: CASE
        WHEN REGEXP_CONTAINS(LAX_STRING(${TABLE}.event_extra.url), r'^(file://|/[A-Za-z]:/|content:/)') THEN ''
        ELSE REGEXP_REPLACE(LAX_STRING(${TABLE}.event_extra.url), r'https?://[^/]+|\?.*$|#.*$', '')
    END ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "url (relative)"
  }

  measure: event_count {
    type: count
    description: "The number of times the event(s) occurred."
  }
}
