include: "../views/android_bookmark_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_bookmark_metrics {
  label: "Bookmark Metric for Android"
  view_name: android_bookmark_metrics
  persist_with: metrics_last_updated
}
