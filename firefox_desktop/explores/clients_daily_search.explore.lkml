include: "../views/clients_daily_search.view.lkml"

explore: clients_daily_search {
  sql_always_where: ${clients_daily_search.submission_date} >= '2010-01-01' ;;
  view_name: clients_daily_search
  description: "Daily search aggregates for desktop clients."

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}