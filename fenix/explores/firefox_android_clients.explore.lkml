include: "../views/firefox_android_clients.view.lkml"

explore: firefox_android_clients {
  sql_always_where: ${firefox_android_clients.submission_date} >= '2010-01-01' ;;
  view_name: firefox_android_clients

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
