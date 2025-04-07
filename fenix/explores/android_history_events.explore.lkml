include: "../views/android_history_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_history_events {
  label: "History Event for Android"
  view_name: android_history_events
  persist_with: events_unnested_last_updated
}
