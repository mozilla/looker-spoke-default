include: "//looker-hub/firefox_desktop/views/*"
include: "/firefox_desktop/views/*"

explore: serp_impression {
  view_name: serp_impression

  always_filter: {
    filters: [serp_impression.submission_date:"28 days"
    ]
  }
}
