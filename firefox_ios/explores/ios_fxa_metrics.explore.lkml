include: "../views/ios_fxa_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_fxa_metrics {
  label: "FxA Metric for iOS"
  view_name: ios_fxa_metrics
  persist_with: metrics_last_updated
}
