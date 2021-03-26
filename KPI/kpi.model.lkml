connection: "telemetry"

include: "./dashboards/*.dashboard"
include: "./views/*.view.lkml"                # include all views in the views/ folder in this project

explore: firefox_desktop_usage_2021 {
  label: "Firefox Desktop Usage"
  group_label: "KPIs"
  from: firefox_desktop_usage_2021
  join: prediction {
    view_label: "Forecast"
    type: left_outer
    sql_on: ${firefox_desktop_usage_2021.date} = ${prediction.date} ;;
    relationship: one_to_one
  }
  join: firefox_desktop_usage_2020 {
    from: firefox_desktop_usage_2021
    fields: []
    view_label: "Firefox Desktop Usage 2020"
    type: left_outer
    sql_on: DATE_SUB(${firefox_desktop_usage_2021.date}, INTERVAL 1 YEAR) = ${firefox_desktop_usage_2020.date} ;;
    relationship: one_to_one
  }
  always_filter: {
    filters: [
      show_2020: "Yes",
    ]
  }
  hidden: no
}

# For suggestions
explore: firefox_desktop_usage_fields {
  hidden: yes
}
