include: "../views//glean_cohort_daily_statistics.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/glean_cohort_daily_statistics_last_updated.datagroup.lkml"

explore: glean_user_retention {
  view_name: glean_cohort_daily_statistics

  always_filter: {
    filters: [glean_cohort_daily_statistics.activity_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${glean_cohort_daily_statistics.country} = ${countries.code} ;;
  }

  persist_with: glean_cohort_daily_statistics_last_updated
}
