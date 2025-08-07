include: "/firefox_desktop/views/sponsored_tiles_clients_daily.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/sponsored_tiles_clients_daily_last_updated.datagroup.lkml"

explore: sponsored_tiles_clients_daily {
  view_name: sponsored_tiles_clients_daily

  always_filter: {
    filters: [sponsored_tiles_clients_daily.submission_date: "28 days"
      ]
  }

  persist_with: sponsored_tiles_clients_daily_last_updated
}
