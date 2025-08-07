include: "../views/ios_history_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_history_events {
  label: "History Event for iOS"
  view_name: ios_history_events
  persist_with: events_unnested_last_updated
}
