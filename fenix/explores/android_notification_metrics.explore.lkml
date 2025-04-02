include: "../views/android_notification_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"


explore: fenix_android_notification_metrics {
  label: "Notification Metric for Android"
  view_name: android_notification_metrics
  persist_with: metrics_last_updated
}
