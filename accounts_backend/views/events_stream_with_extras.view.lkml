include: "//looker-hub/accounts_backend/views/events_stream_table.view.lkml"

view: events_stream_with_extras {
  extends: [events_stream_table]

  dimension: extra__linking {
    sql: LAX_STRING(${TABLE}.event_extra.linking) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "linking"
  }

  dimension: extra__reason {
    sql: LAX_STRING(${TABLE}.event_extra.reason) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "reason"
  }

  dimension: extra__type {
    sql: LAX_STRING(${TABLE}.event_extra.type) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "type"
  }

  dimension: extra__scopes {
    sql: LAX_STRING(${TABLE}.event_extra.scopes) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "scopes"
  }

  measure: event_count {
    type: count
    description: "The number of times the event(s) occurred."
  }
}
