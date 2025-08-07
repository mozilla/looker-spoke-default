include: "../views/events_stream_with_extras.view.lkml"


explore: events_stream_with_extras {
  hidden: no

  description: "Events stream with event_extras as dimensions"

  always_filter: {
    filters: [
      submission_date: "This year to second",
    ]
  }

  persist_with: events_stream_table_last_updated
}
