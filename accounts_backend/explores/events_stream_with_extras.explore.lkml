include: "../views/events_stream_with_extras.view.lkml"

explore: events_stream_with_extras {
  hidden: no

  description: "Events stream with event_extras as dimensions"

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
