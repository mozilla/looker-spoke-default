include: "../views/newtab_clients_daily.view.lkml"
include: "../../shared/views/countries.view.lkml"

explore: newtab_clients_daily {
  sql_always_where: ${newtab_clients_daily.submission_date} >= '2022-07-01' ;;
  label: "New Tab Clients Daily"
  from: newtab_clients_daily

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_clients_daily.country_code} = ${countries.code} ;;
  }

}
