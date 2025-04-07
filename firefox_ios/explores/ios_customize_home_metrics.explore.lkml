include: "../views/ios_customize_home_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_customize_home_metrics {
  label: "Customize Home Metric for iOS"
  view_name: ios_customize_home_metrics
  persist_with: metrics_last_updated
}
