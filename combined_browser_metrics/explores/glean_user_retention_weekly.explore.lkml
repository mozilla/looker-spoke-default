include: "../views/glean_cohort_weekly_statistics.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/glean_cohort_weekly_statistics_last_updated.datagroup.lkml"

explore: glean_user_retention_weekly {
  view_name: glean_cohort_weekly_statistics

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${glean_cohort_weekly_statistics.country} = ${countries.code} ;;
  }

  persist_with: glean_cohort_weekly_statistics_last_updated
}
