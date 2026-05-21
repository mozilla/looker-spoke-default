include: "/firefox_essentials/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: clients_daily_summary {
  label: "Firefox Essentials - Daily Summary"
  from: clients_daily
  join: clients_daily_crashes {
    type: left_outer
    relationship: one_to_one
    sql_on: ${clients_daily_summary.client_id} = ${clients_daily_crashes.client_id} AND ${clients_daily_summary.submission_date} = ${clients_daily_crashes.submission_date};;
  }
  join: clients_daily_telemetry {
    type: left_outer
    relationship: one_to_one
    sql_on: ${clients_daily_summary.client_id} = ${clients_daily_telemetry.client_id} AND ${clients_daily_summary.submission_date} = ${clients_daily_telemetry.submission_date};;
  }
}
