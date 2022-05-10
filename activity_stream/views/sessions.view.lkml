include: "//looker-hub/activity_stream/views/sessions.view.lkml"

view: +sessions {
  measure: session_count {
    type: count
    description: "Count of the number of sessions."
  }
}
