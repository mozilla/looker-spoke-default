include: "../views/android_customize_home_metrics.view.lkml"
include: "//looker-hub/fenix/datagroups/metrics_last_updated.datagroup.lkml"

explore: fenix_android_customize_home_metrics {
  label: "Customize Home Metric for Android"
  view_name: android_customize_home_metrics
  persist_with: metrics_last_updated
}
