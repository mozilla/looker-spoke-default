include: "../views/android_fxa_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_fxa_events {
  label: "Fxa Event for Android"
  view_name: android_fxa_events
  persist_with: events_unnested_last_updated
}
