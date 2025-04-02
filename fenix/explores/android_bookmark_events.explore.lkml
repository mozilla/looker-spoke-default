include: "../views/android_bookmark_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_bookmark_events {
  label: "Bookmark Event for Android"
  view_name: android_bookmark_events
  persist_with: events_unnested_last_updated
}
