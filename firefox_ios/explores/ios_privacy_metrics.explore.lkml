include: "../views/ios_privacy_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_privacy_metrics {
  label: "Privacy Metric for iOS"
  view_name: ios_privacy_metrics
  persist_with: metrics_last_updated
}
