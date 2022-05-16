connection: "telemetry"
label: "Combined Browser Metrics"
include: "//looker-hub/combined_browser_metrics/views/*"
include: "views/*"

explore: active_users_aggregates {
  always_filter: {
    filters: [active_users_aggregates.submission_date: "2022-01-01"]
  }
}
