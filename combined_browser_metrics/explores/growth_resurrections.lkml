include: "../views/growth_resurrections.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/cohort_daily_statistics_last_updated.datagroup.lkml"

explore: growth_resurrections {
  view_name: growth_resurrections


  sql_always_where: ${submission_date} >= "2025-01-01"
      AND ${period_filtered_measures} in ("this", "last");;

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${growth_resurrections.country} = ${countries.code} ;;
  }

  persist_with: cohort_daily_statistics_last_updated
}
