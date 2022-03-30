connection: "telemetry"
label: "Pocket"
include: "//looker-hub/pocket/views/twice_weekly_active_user_counts_history_v1.view.lkml"

explore: twice_weekly_active_user_counts_history_v1 {
  description: "Twice weekly active user counts history v1"
  always_filter: {
    filters: [twice_weekly_active_user_counts_history_v1.submission_date: "1 day ago"]
  }
}
