include: "/firefox_desktop/views/suggest_clients_daily.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/suggest_clients_daily_last_updated.datagroup.lkml"

explore: suggest_clients_daily {
  view_name: suggest_clients_daily

  always_filter: {
    filters: [suggest_clients_daily.submission_date: "28 days"
      ]
  }

  persist_with: suggest_clients_daily_last_updated
}
