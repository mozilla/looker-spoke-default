include: "//looker-hub/combined_browser_metrics/views/fenix_and_firefox_use_counters.view.lkml"

view: +fenix_and_firefox_use_counters {

  measure: usage_rate {
    description: "Usage rate; denominator depends on if metric is a doc, page, worker shared, worker service, or worker dedicated type of metric"
    label: "Usage Rate"
    type: average
    sql:  ${TABLE}.rate ;;
  }
}
