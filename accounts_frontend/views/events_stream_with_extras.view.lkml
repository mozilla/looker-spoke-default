include: "//looker-hub/accounts_frontend/views/events_stream_table.view.lkml"

view: events_stream_with_extras {
  extends: [events_stream_table]

  dimension: extra_reason {
    type: string
    sql: safe.string(${TABLE}.event_extra.reason) ;;
  }
}
