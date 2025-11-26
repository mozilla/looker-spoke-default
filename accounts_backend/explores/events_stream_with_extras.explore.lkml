include: "../views/events_stream_with_extras.view.lkml"
include: "//looker-hub/accounts_backend/datagroups/events_stream_table_last_updated.datagroup.lkml"

explore: events_stream_with_extras {
  # Hide this now that the default `events_stream` explore has dimensions for event extras (DENG-9548).
  hidden: yes

  description: "Events stream with event_extras as dimensions"

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  persist_with: events_stream_table_last_updated
}
