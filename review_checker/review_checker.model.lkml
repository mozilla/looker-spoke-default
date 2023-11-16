connection: "telemetry"
label: "Review Checker"
# Include files from looker-hub or spoke-default below. For example:
  include: "//looker-hub/review_checker/explores/*"
# include: "//looker-hub/review_checker/dashboards/*"
  include: "//looker-hub/review_checker/views/*"
 include: "views/*"
 #include: "explores/*"
# include: "dashboards/*"

explore: +android_events {

  join: android_clients {
    sql_on: ${android_events.client_id} = ${android_clients.client_id} AND ${android_events.submission_date} = ${android_clients.submission_date} ;;
    relationship: one_to_many
    type: left_outer
  }


}
