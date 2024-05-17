include: "/firefox_desktop/views/urlbar_events_daily_engagement_by_position.view.lkml"

explore: urlbar_events_daily_engagement_by_position {
  view_name: urlbar_events_daily_engagement_by_position

  always_filter: {
    filters: [urlbar_events_daily_engagement_by_position.submission_date: "after 2023-11-01"
    ]
  }
}
