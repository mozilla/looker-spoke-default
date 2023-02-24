include: "../views/newtab_interactions.view.lkml"
include: "../../shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/newtab_interactions_v1_last_updated.datagroup"

explore: newtab_interactions {
  persist_with: newtab_interactions_v1_last_updated
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
