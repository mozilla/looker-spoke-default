include: "../views/ios_tab_count_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_tab_count_metrics {
  label: "Tab Count Metric for iOS"
  view_name: ios_tab_count_metrics
  persist_with: metrics_last_updated
}
