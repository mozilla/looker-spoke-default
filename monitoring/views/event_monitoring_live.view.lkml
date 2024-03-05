include: "//looker-hub/monitoring/views/event_monitoring_live.view.lkml"

view: +event_monitoring_live {
  dimension: full_event_name {
    type: string
    description: "Event Category and Event Name"
    sql: ARRAY_TO_STRING([${event_category}, ${event_name}], ".") ;;
  }
}
