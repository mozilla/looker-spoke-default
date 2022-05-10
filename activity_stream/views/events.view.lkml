include: "//looker-hub/activity_stream/views/events.view.lkml"

view: +events {
  measure: event_count {
    type: count
    description: "Count of the number of events."
  }
}
