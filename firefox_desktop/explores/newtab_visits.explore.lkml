include: "../views/newtab_visits.view.lkml"
include: "../../shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/newtab_visits_v1_last_updated.datagroup"

explore: newtab_visits {
  persist_with: newtab_visits_v1_last_updated
  sql_always_where: ${newtab_visits.submission_date} >= '2022-07-01' ;;
  label: "New Tab Visits"
  from: newtab_visits

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_visits.country_code} = ${countries.code} ;;
  }

  join: newtab_visits_table__topsite_tile_interactions {
    relationship: one_to_many
    view_label: "Topsite Interactions"
    sql: LEFT JOIN UNNEST(${newtab_visits.topsite_tile_interactions}) AS newtab_visits_table__topsite_tile_interactions ;;
  }
}
