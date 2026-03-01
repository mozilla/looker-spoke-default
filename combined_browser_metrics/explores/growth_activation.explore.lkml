include: "../views/growth_activation.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/cohort_daily_statistics_last_updated.datagroup.lkml"

explore: growth_activation {
  view_name: growth_activation


  sql_always_where: ${cohort_date} >= "2025-01-01"
  AND ${activity_date}>= "2025-01-01"
  AND ${period_filtered_measures} in ("this", "last");;

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${growth_activation.country} = ${countries.code} ;;
  }

  persist_with: cohort_daily_statistics_last_updated
}
