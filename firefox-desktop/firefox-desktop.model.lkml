connection: "telemetry"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project
include: "dashboards/*.dashboard"


explore: firefox_desktop_usage_2021 {
  label: "Firefox Desktop Usage"
  group_label: "Firefox Desktop"
  from: firefox_desktop_usage_2021
  hidden: yes
}

explore: mobile_usage_2021 {
  label: "Firefox Mobile Usage"
  group_label: "Firefox Mobile"
  from: mobile_usage_2021
  hidden: yes
}

explore: desktop_kpis {
  group_label: "KPIs"
  sql_always_where: ${date} >= '2021-01-01' ;;
  label: "Desktop KPIs"
  join: loines_desktop_dau_forecast_20210119  {
    view_label: "DAU Forecast"
    type: left_outer
    relationship: one_to_one
    sql_on: ${loines_desktop_dau_forecast_20210119.date} = ${desktop_kpis.date} ;;
  }
  join:  loines_desktop_new_profiles_forecast_20210119 {
    view_label: "New Profiles Forecast"
    type: left_outer
    relationship: one_to_one
    sql_on: ${loines_desktop_new_profiles_forecast_20210119.date} = ${desktop_kpis.date} ;;
  }
  hidden: yes
}

explore: mobile_kpis {
  group_label: "KPIs"
  sql_always_where: ${date} >= '2021-01-01' ;;
  label: "Mobile KPIs"
  join: mobile_forecasts {
    view_label: "Mobile Forecasts"
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_forecasts.date} = ${mobile_kpis.date} AND ${mobile_forecasts.app_name} = ${mobile_kpis.app_name} ;;
  }
  hidden: yes
}
