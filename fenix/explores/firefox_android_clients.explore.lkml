include: "../views/firefox_android_clients.view.lkml"
include: "//looker-hub/fenix/datagroups/firefox_android_clients_last_updated.datagroup.lkml"

explore: firefox_android_clients {
  sql_always_where: ${firefox_android_clients.first_seen_date} >= '2010-01-01' ;;
  view_name: firefox_android_clients

  always_filter: {
    filters: [
      first_seen_date: "28 days",
    ]
  }

  query: activated_client_count {
    dimensions: [firefox_android_clients.first_seen_month, firefox_android_clients.activated, firefox_android_clients.client_count]
    label: "Number of clients activated in the last 6 complete months (release channel)."
    description: "Number of clients activated in the last 6 complete months (release channel)."
    sorts: [firefox_android_clients.first_seen_month: desc, firefox_android_clients.activated: desc]
    filters: [firefox_android_clients.first_seen_month: "6 month ago for 6 month", firefox_android_clients.channel: "release"]
    limit: 100
  }

  persist_with: firefox_android_clients_last_updated
}
