include: "../views//cohort_daily_statistics.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/cohort_daily_statistics_last_updated.datagroup.lkml"

explore: user_retention {
  view_name: cohort_daily_statistics

  always_filter: {
    filters: [cohort_daily_statistics.activity_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_daily_statistics.country} = ${countries.code} ;;
  }

  persist_with: cohort_daily_statistics_last_updated
}
