include: "//looker-hub/telemetry_dev_cycle/views/experiments_stats.view.lkml"

view: +experiments_stats {
  # Measures
  measure: count_metrics {
    label: "Number of Experiments"
    type: count
  }
}
