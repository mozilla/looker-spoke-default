include: "../views/firefox_ios_clients.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/firefox_ios_clients_last_updated.datagroup.lkml"

explore: firefox_ios_clients {
  sql_always_where: ${firefox_ios_clients.first_seen_date} >= '2010-01-01' ;;
  view_name: firefox_ios_clients

  always_filter: {
    filters: [
      first_seen_date: "28 days",
    ]
  }

  query: activated_client_count {
    dimensions: [firefox_ios_clients.first_seen_month, firefox_ios_clients.is_activated, firefox_ios_clients.client_count]
    label: "Number of clients activated in the last 6 complete months (release channel)."
    description: "Number of clients activated in the last 6 complete months (release channel)."
    sorts: [firefox_ios_clients.first_seen_month: desc, firefox_ios_clients.is_activated: desc]
    filters: [firefox_ios_clients.first_seen_month: "6 month ago for 6 month", firefox_ios_clients.channel: "release"]
    limit: 100
  }

  persist_with: firefox_ios_clients_last_updated
}
