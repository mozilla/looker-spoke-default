include: "//looker-hub/firefox_desktop/views/*"
include: "/firefox_desktop/views/*"

explore: urlbar_events_temp_v2 {
  view_name: urlbar_events_temp_v2

  always_filter: {
    filters: [urlbar_events_temp_v2.submission_date: "28 days"
    ]
  }
}
