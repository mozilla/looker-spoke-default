include: "/kpi/views/tmp_kpi_forecasts.view.lkml"

explore: tmp_kpi_forecasts {
  label: "WIP Browser KPI Forecasts"
  description: "WIP Browser KPI Forecasts"
  view_name: tmp_kpi_forecasts
  always_filter: {
    filters: [
        tmp_kpi_forecasts.aggregation_period: "day",
        tmp_kpi_forecasts.measurement: "observed, p50",
        tmp_kpi_forecasts.metric_alias: "desktop_dau"
    ]
  }
}