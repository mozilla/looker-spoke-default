include: "../views/ios_credit_card_metrics.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/metrics_last_updated.datagroup.lkml"

explore: ios_credit_card_metrics {
  label: "Credit Card Metric for iOS"
  view_name: ios_credit_card_metrics
  persist_with: metrics_last_updated
}
