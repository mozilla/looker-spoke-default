include: "../views/history_sidebar_clients_daily.view.lkml"

explore: history_sidebar_interactions {
  sql_always_where: ${history_sidebar_clients_daily.submission_date} >= '2023-01-01' ;;
  view_name: history_sidebar_clients_daily

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
