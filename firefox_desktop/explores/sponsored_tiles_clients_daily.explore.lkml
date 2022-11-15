# include: "//looker-hub/firefox_desktop/views/*"
include: "/firefox_desktop/views/*"

explore: sponsored_tiles_clients_daily {
  view_name: sponsored_tiles_clients_daily_temp

  always_filter: {
    filters: [sponsored_tiles_clients_daily_temp.submission_date: "28 days"
      ]
  }
}
