include: "//looker-hub/relay_backend/views/events_stream_table.view.lkml"

view: events_stream_with_extras {
  extends: [events_stream_table]

  dimension: extra_is_reply {
    sql: LAX_BOOL(${TABLE}.event_extra.is_reply) ;;
    type:  yesno
    group_label: "Event extra"
    group_item_label: "Is Reply"
  }

  dimension: extra_premium_status{
    sql: LAX_STRING(${TABLE}.event_extra.premium_status) ;;
    type:  string
    group_label: "Event extra"
    group_item_label: "Premium Status"
  }

  measure: event_count {
    type: count
    description: "The number of times the event(s) occurred."
  }
}
