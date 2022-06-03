include: "//looker-hub/marketing/views/acoustic_contact_change_events.view.lkml"

explore: acoustic_contact_change_events {
  description:
  "
  This explore contains Acoustic Contact modification events (by default shows last 6 months).
  "

  always_filter: {
    filters: [
      last_modified_date: "6 months",
    ]
  }
}
