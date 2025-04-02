include: "../views/android_notification_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_notification_events {
  label: "Notification Event for Android"
  view_name: android_notification_events
  persist_with: events_unnested_last_updated
}
