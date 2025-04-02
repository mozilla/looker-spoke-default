include: "../views/android_privacy_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_privacy_metric {
  label: "Privacy Event for Android"
  view_name: android_privacy_events
  persist_with: events_unnested_last_updated
}
