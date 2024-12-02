include: "/firefox_desktop/views/urlbar_sessions_daily.view.lkml"

explore: urlbar_sessions_daily {
  view_name: urlbar_sessions_daily

  always_filter: {
    filters: [urlbar_sessions_daily.submission_date: "after 2023-11-01"
    ]
  }
}
