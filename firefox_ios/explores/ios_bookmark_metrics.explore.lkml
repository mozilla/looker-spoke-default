include: "../views/ios_bookmark_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_bookmark_metrics {
  label: "Bookmark Metric for iOS"
  view_name: ios_bookmark_metrics
  persist_with: metrics_last_updated
}
