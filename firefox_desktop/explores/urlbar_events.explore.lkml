include: "//looker-hub/firefox_desktop/explores/*"
# include: "/firefox_desktop/views/*"

explore: +urlbar_events_daily {
  view_name: urlbar_events_daily_table

  always_filter: {
    filters: [submission_date: "28 days"
    ]
  }
}
