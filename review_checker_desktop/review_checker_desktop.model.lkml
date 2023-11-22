connection: "telemetry"
label: "Review Checker Desktop"
# Include files from looker-hub or spoke-default below. For example:
# include: "//looker-hub/review_checker_desktop/explores/*"
# include: "//looker-hub/review_checker_desktop/dashboards/*"
include: "//looker-hub/review_checker_desktop/views/*"
include: "views/*"
# include: "explores/*"
# include: "dashboards/*"

explore: clients {

  join: events {
    sql_on: ${clients.client_id} = ${events.client_id} AND ${clients.submission_date} = ${events.submission_date} ;;
    relationship: one_to_one
    type: left_outer
  }

  view_name: clients
  always_filter: {
    filters: [clients.submission_date: "28 days"]
  }
}

explore: events {

  join: events__experiments {
    from: events__experiments
    sql_table_name: UNNEST(events.experiments) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: clients {
    sql_on: ${events.client_id} = ${clients.client_id} AND ${events.submission_date} = ${clients.submission_date} ;;
    relationship: one_to_one
    type: left_outer


  }

  view_name: events
  always_filter: {
    filters: [events.submission_date: "28 days"]
  }
}

explore: microsurvey {

  join: microsurvey__experiments {
    from: microsurvey__experiments
    sql_table_name: UNNEST(microsurvey.experiments) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  view_name: microsurvey
  always_filter: {
    filters: [microsurvey.submission_date: "28 days"]
  }
}
