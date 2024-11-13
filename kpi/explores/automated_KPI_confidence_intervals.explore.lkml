include: "../views/automated_kpi_forecasts_confidence_intervals.view.lkml"

explore: automated_KPI_confidence_intervals {
  label: "Automated KPI Confidence Intervals: Aggregated Data"
  view_name: automated_kpi_forecasts_confidence_intervals
  description: "This calculates confidence intervals for the time interval noted in unit. Aggregations to other time intervals are not supported. If desired, the KPI forecasting job should be updated to output confidence intervals at additional temporal specifications."

  always_filter: {
    filters: [automated_kpi_forecasts_confidence_intervals.target: "-EMPTY",
      automated_kpi_forecasts_confidence_intervals.forecast_date: "-EMPTY",
      automated_kpi_forecasts_confidence_intervals.unit: "-EMPTY"]
  }
}
