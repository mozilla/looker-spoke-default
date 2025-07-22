connection: "telemetry"

include: "//looker-hub/kpi/explores/*"
include: "//looker-hub/kpi/views/automated_kpi_forecasts.view.lkml"
include: "//looker-hub/kpi/views/unified_metrics.view.lkml"
include: "./dashboards/*.dashboard"
include: "views/automated_kpi_forecasts_confidence_intervals.view.lkml"
include: "views/Automated_KPI_Forecasts.view.lkml"
include: "views/browser_dau.view.lkml"
include: "views/browser_kpis.view.lkml"
include: "views/country_level_yoy_metrics.view.lkml"
include: "views/desktop_dau_actuals.view.lkml"
include: "views/firefox_desktop_usage_2021.view.lkml"
include: "views/firefox_desktop_usage_fields.view.lkml"
include: "views/firefox_desktop_usage_forecast.view.lkml"
include: "views/loines_browser_2022_forecasts.view.lkml"
include: "views/mobile_dau_actuals.view.lkml"
include: "views/mobile_usage_2021.view.lkml"
include: "views/mobile_usage_fields.view.lkml"
include: "views/mobile_usage_forecast.view.lkml"
include: "views/original_desktop_forecast.view.lkml"
include: "views/original_mobile_forecast.view.lkml"
include: "views/recent_desktop_forecast.view.lkml"
include: "views/tmp_browsers_kpi_2023.view.lkml"
include: "views/tmp_kpi_forecasts.view.lkml"
include: "views/unified_metrics.view.lkml"

include: "/shared/views/countries.view.lkml"
include: "explores/*"

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
  join: key_in_cache {
    type: cross
    relationship: many_to_one
  }
  hidden: yes
}

# For suggestions
explore: firefox_desktop_usage_fields {
  hidden: yes
}

explore: mobile_usage_2021 {
  label: "Firefox Mobile Usage"
  group_label: "KPIs"
  hidden: yes
  from: mobile_usage_2021
  join: mobile_prediction {
    view_label: "Mobile Forecast"
    type: left_outer
    sql_on: ${mobile_usage_2021.date} = ${mobile_prediction.date} AND ${mobile_usage_2021.app_name} = ${mobile_prediction.app_name};;
    relationship: one_to_one
  }
  join:  mobile_usage_2020 {
    from: mobile_usage_2021
    fields: []
    view_label: "Firefox Mobile Usage 2020"
    type: left_outer
    sql_on: DATE_SUB(${mobile_usage_2021.date}, INTERVAL 1 YEAR) = ${mobile_usage_2020.date} AND ${mobile_usage_2021.app_name} = ${mobile_usage_2020.app_name} ;;
    relationship: one_to_one
  }
}

# For suggestions
explore: mobile_usage_fields {
  hidden: yes
}

explore: recent_desktop_forecast {
  label: "Desktop Days of Use KRs (Work In Progress)"
  view_label: "Recent Desktop Forecast (Work in Progress)"
  group_label: "KPIs"
  hidden: yes
  from: recent_desktop_forecast
  always_filter: {filters: [recent_desktop_forecast.forecast_recency: "1"]}
  join: original_desktop_forecast {
    view_label: "Desktop KPI Targets (Work in Progress)"
    type: left_outer
    sql_on: ${recent_desktop_forecast.date} = ${original_desktop_forecast.date};;
    relationship: one_to_one
  }
  join: desktop_dau_actuals {
    view_label: "Desktop Days of Use Actuals (Work in Progress)"
    type: left_outer
    sql_on: ${recent_desktop_forecast.date} = ${desktop_dau_actuals.date};;
    relationship: one_to_many
  }
}

explore: browser_kpis {
  label: "2022 Browser KPIs"
  group_label: "Official Browser KPIs"
  description: "For Official Accounting. To drill down into other dimensions (e.g. Country) please use the 'Browsers Daily Active Users' Explore."
  join: loines_browser_2022_forecasts {
    type: left_outer
    sql_on: ${browser_kpis.submission_date} = ${loines_browser_2022_forecasts.date_date} AND ${browser_kpis.platform} = ${loines_browser_2022_forecasts.platform};;
    relationship: one_to_one
  }
}

explore: +unified_metrics {
  group_label: "Core Browser Metrics"
  label: "Unified Browser Metrics"
  sql_always_where: ${submission_date}  >= DATE(2017,1,1);;
  conditionally_filter: {
    filters: [active_today: "yes"]
    unless: [days_seen_bits]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${unified_metrics.country} = ${countries.code} ;;
  }

}

explore: browser_dau {
  label: "Browsers Daily Active Users"
  group_label: "Core Browser Metrics"
  description: "Easiest to use for answering most common questions about (Q)CDOU."
  always_filter: {
    filters: [
      browser_dau.active_today: "yes"
    ]
  }
}

explore: loines_browser_2022_forecasts {
  group_label: "Official Browser KPIs"
  label: "Official Browser KPI Forecasts and Targets"
}
