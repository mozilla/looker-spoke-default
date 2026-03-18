include: "/firefox_desktop/views/urlbar_events.view.lkml"

explore: urlbar_events {
  view_name: urlbar_events

  always_filter: {
    filters: [urlbar_events.submission_date: "28 days"
    ]
  }
}
