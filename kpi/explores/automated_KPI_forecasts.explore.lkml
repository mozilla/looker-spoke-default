include: "/kpi/views/Automated_KPI_Forecasts.view.lkml"

explore: automated_KPI_forecasts {
  label: "Automated KPI Forecasts: Daily Data"
  description: "This contains daily forecast output only. Aggregations to other time intervals are supported via the Automated KPI Confidence Intervals Explore."
  view_name: automated_kpi_forecasts

  always_filter: {
    filters: [automated_kpi_forecasts.target: "-EMPTY",
      automated_kpi_forecasts.forecast_date: "-EMPTY",
      automated_kpi_forecasts.metric: "-EMPTY"]
  }
}
