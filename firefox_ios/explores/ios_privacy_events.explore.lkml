include: "../views/ios_privacy_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_privacy_events {
  label: "Privacy Event for iOS"
  view_name: ios_privacy_events
  persist_with: events_unnested_last_updated
}
