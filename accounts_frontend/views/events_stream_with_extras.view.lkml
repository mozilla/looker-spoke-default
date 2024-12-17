include: "//looker-hub/accounts_frontend/views/events_stream_table.view.lkml"

view: events_stream_with_extras {
  extends: [events_stream_table]

  dimension: extra_reason {
    # left for backwards compatibility, duplicated below with `extra__` prefix
    hidden: yes
    type: string
    sql: safe.string(${TABLE}.event_extra.reason) ;;
  }

  dimension: extra__reason {
    sql: safe.string(${TABLE}.event_extra.reason) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "reason"
  }

  dimension: extra__id {
    sql: safe.string(${TABLE}.event_extra.id) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "id"
  }

  dimension: extra__label {
    sql: safe.string(${TABLE}.event_extra.label) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "label"
  }

  dimension: extra__type {
    sql: safe.string(${TABLE}.event_extra.type) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "type"
  }

  dimension: extra__referrer {
    sql: safe.string(${TABLE}.event_extra.referrer) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "referrer"
  }

  dimension: extra__title {
    sql: safe.string(${TABLE}.event_extra.title) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "title"
  }

  dimension: extra__url_normalized {
    sql: REGEXP_REPLACE(LAX_STRING(${TABLE}.event_extra.url), r'https?://[^/]+|\?.*$|#.*$', '') ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "url (normalized)"
  }

  measure: event_count {
    type: count
    description: "The number of times the event(s) occurred."
  }
}
