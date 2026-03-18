include: "../views/ios_awesomebar_location_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_awesomebar_location_events {
  label: "Awesomebar Location Event for iOS"
  view_name: ios_awesomebar_location_events
  persist_with: events_unnested_last_updated
}
