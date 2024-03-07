include: "../views/firefox_ios_clients.view.lkml"

explore: firefox_ios_clients {
  sql_always_where: ${firefox_ios_clients.submission_date} >= '2010-01-01' ;;
  view_name: firefox_ios_clients

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  query: activated_client_count {
    dimensions: [firefox_ios_clients.first_seen_month, firefox_ios_clients.is_activated, firefox_ios_clients.client_count]
    label: "Number of clients activated in the last 6 complete months."
    description: "Number of clients activated in the last 6 complete months."
    sorts: [firefox_ios_clients.first_seen_month: desc, firefox_ios_clients.is_activated: desc]
    filters: [firefox_ios_clients.submission_date: "7 month ago for 7 month", firefox_ios_clients.first_seen_month: "6 month ago for 6 month", firefox_ios_clients.channel: "release"]
    limit: 100
  }
}
