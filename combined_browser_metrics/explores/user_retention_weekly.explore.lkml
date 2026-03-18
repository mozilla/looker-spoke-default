include: "../views/cohort_weekly_statistics.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/cohort_weekly_statistics_last_updated.datagroup.lkml"

explore: user_retention_weekly {
  view_name: cohort_weekly_statistics

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_weekly_statistics.country} = ${countries.code} ;;
  }

  persist_with: cohort_weekly_statistics_last_updated
}
