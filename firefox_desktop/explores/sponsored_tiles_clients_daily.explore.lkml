include: "/firefox_desktop/views/sponsored_tiles_clients_daily.view.lkml"

explore: sponsored_tiles_clients_daily {
  view_name: sponsored_tiles_clients_daily

  always_filter: {
    filters: [sponsored_tiles_clients_daily.submission_date: "28 days"
      ]
  }
}
