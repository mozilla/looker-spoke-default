include: "../views/android_credential_management_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_credential_management_metrics {
  label: "Credential Management Metric for Android"
  view_name: android_credential_management_metrics
  persist_with: metrics_last_updated
}
