connection: "telemetry"
label: "Firefox Focus for iOS"
include: "//looker-hub/focus_ios/explores/*"
# include: "//looker-hub/focus_ios/dashboards/*"
include: "views/*"
# include: "explores/*"
# include: "dashboards/*"

explore: usage {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }
  sql_always_where: submission_date >= "2020-01-01" ;;
}
