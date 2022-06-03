include: "//looker-hub/marketing/views/acoustic_email_events.view.lkml"

explore: acoustic_email_events {
  description:
  "
  This table contains Acoustic email events (by default shows last 6 months).
  "

  always_filter: {
    filters: [
      submission_date: "6 months",
    ]
  }
}
