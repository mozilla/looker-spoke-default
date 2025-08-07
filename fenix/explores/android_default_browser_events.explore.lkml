include: "../views/android_default_browser_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_default_browser_events {
  label: "Default Browser Event for Android"
  view_name: android_default_browser_events
  persist_with: events_unnested_last_updated
}
