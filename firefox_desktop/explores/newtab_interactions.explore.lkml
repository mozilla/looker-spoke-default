include: "../views/newtab_interactions.view.lkml"
include: "../../shared/views/countries.view.lkml"

explore: newtab_interactions {
  sql_always_where: ${newtab_interactions.submission_date} >= '2022-07-01' ;;
  label: "New Tab Interactions"
  from: newtab_interactions

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_interactions.country_code} = ${countries.code} ;;
  }
}
