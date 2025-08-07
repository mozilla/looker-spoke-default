include: "../views/ios_notification_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_notification_metrics {
  label: "notification Metric for iOS"
  view_name: ios_notification_metrics
  persist_with: metrics_last_updated
}
