include: "../views/ios_notification_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_notification_events {
  label: "Notification Event for iOS"
  view_name: ios_notification_events
  persist_with: events_unnested_last_updated
}
