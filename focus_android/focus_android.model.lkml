connection: "telemetry"
label: "Firefox Focus for Android"
include: "//looker-hub/focus_android/explores/*"
include: "views/*"

explore: usage {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
  sql_always_where: submission_date >= "2020-01-01" ;;
}

explore: focus_launch_new_profile_forecasts {
  sql_always_where: date >= "2020-01-01" ;;
}
