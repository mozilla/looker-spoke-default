include: "//looker-hub/telemetry_dev_cycle/views/glean_metrics_stats.view.lkml"

view: +glean_metrics_stats {
  # Dimensions
  dimension_group: last {
    hidden: yes
  }

  # Measures
  measure: count_metrics {
    label: "Number of Metrics"
    type: count
  }

  measure: active_metrics {
    label: "Active Metrics"
    type: count
    filters: [expired_date: "NULL"]
    description: "Number of Metrics that have not yet expired."
  }

  measure: new_metrics_last_90_days {
    type: count
    filters: [release_date: "last 90 days"]
  }

  measure: expired_metrics_last_90_days {
    type: count
    filters: [expired_date: "last 90 days"]
  }
}
