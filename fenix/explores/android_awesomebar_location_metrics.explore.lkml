include: "../views/android_awesomebar_location_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_awesomebar_location_metrics {
  label: "Awesomebar Location Metric for Android"
  view_name: android_awesomebar_location_metrics
  persist_with: metrics_last_updated
}
