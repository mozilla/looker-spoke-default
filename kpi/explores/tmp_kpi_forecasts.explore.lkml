include: "/kpi/views/*"

explore: tmp_kpi_forecasts {
  label: "WIP Browser KPI Forecasts"
  description: "WIP Browser KPI Forecasts"
  view_name: tmp_kpi_forecasts
  always_filter: {
    filters: [
        tmp_kpi_forecasts.aggregation_period: "day",
        tmp_kpi_forecasts.data_source: "forecast",
        tmp_kpi_forecasts.measurement: "p10,p50,p90",
        tmp_kpi_forecasts.metric_alias: "\"desktop_dau"\"
    ]
  }
}