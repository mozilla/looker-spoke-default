include: "//looker-hub/telemetry_dev_cycle/views/telemetry_probes_stats.view.lkml"

view: +telemetry_probes_stats {

  measure: count {
    type: count
    label: "Number of Probes"
  }

  measure: active_probes {
    type: count
    filters: [expired_date: "NULL"]
  }

  measure: new_probes_last_90_days {
    type: count
    filters: [release_date: "last 90 days"]
  }

  measure: expired_metrics_last_90_days {
    type: count
    filters: [expired_date: "last 90 days"]
  }
}
