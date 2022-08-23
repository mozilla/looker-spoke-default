include: "//looker-hub/kpi/views/*"
include: "/kpi/views/*"

explore: automated_KPI_confidence_intervals {
  view_name: automated_kpi_confidence_intervals

  always_filter: {
    filters: [automated_kpi_confidence_intervals.target: "-EMPTY",
      automated_kpi_confidence_intervals.forecast_date: "-EMPTY",
      automated_kpi_confidence_intervals.unit: "-EMPTY"]
  }
}
