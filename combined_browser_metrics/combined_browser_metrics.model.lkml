connection: "telemetry"
label: "Combined Browser Metrics"
include: "//looker-hub/combined_browser_metrics/views/*"
include: "views/*"
include: "/shared/views/*"

explore: active_users_aggregates {
  always_filter: {
    filters: [active_users_aggregates.submission_date: "2022-01-01"]
  }
}

explore: user_retention {
  view_name: cohort_daily_statistics

  always_filter: {
    filters: [cohort_daily_statistics.activity_date: "2022-01-01"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_daily_statistics.country} = ${countries.code} ;;
  }


}
