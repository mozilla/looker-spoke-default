connection: "telemetry"

include: "//looker-hub/kpi/explores/*"
include: "//looker-hub/kpi/views/automated_kpi_forecasts.view.lkml"
include: "//looker-hub/kpi/views/unified_metrics.view.lkml"
include: "views/automated_kpi_forecasts_confidence_intervals.view.lkml"
include: "views/Automated_KPI_Forecasts.view.lkml"
include: "views/browser_dau.view.lkml"
include: "views/browser_kpis.view.lkml"
include: "views/country_level_yoy_metrics.view.lkml"
include: "views/mobile_usage_forecast.view.lkml"
include: "views/unified_metrics.view.lkml"

include: "/shared/views/countries.view.lkml"
include: "explores/*"


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
