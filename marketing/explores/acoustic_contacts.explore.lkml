include: "//looker-hub/marketing/views/acoustic_contacts.view.lkml"

explore: acoustic_contacts {
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
