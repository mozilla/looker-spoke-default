include: "../views/clients_daily_search.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/clients_daily_joined_table_last_updated.datagroup.lkml"

explore: clients_daily_search {
  persist_with: clients_daily_joined_table_last_updated
  sql_always_where: ${clients_daily_search.submission_date} >= '2010-01-01' ;;
  view_name: clients_daily_search
  description: "Daily search aggregates for desktop clients."

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }
}
