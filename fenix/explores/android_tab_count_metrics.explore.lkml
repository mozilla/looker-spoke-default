include: "../views/android_tab_count_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_tab_count_metrics {
  label: "Tab Count Metric for Android"
  view_name: android_tab_count_metrics
  persist_with: metrics_last_updated
}
