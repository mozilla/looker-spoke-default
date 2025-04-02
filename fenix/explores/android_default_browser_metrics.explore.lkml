include: "../views/android_default_browser_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_default_browser_metrics {
  label: "Default Browser Metric for Android"
  view_name: android_default_browser_metrics
  persist_with: metrics_last_updated
}
