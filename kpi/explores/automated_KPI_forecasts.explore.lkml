include: "//looker-hub/kpi/views/*"
include: "/kpi/views/*"

explore: automated_KPI_forecasts {
  view_name: automated_kpi_forecasts

  always_filter: {
    filters: [automated_kpi_forecasts.target: "-EMPTY",
      automated_kpi_forecasts.forecast_date: "-EMPTY",
      automated_kpi_forecasts.metric: "-EMPTY"]
  }
}
