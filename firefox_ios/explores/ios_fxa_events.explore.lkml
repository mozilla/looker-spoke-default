include: "../views/ios_fxa_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_fxa_events {
  label: "FxA Event for iOS"
  view_name: ios_fxa_events
  persist_with: events_unnested_last_updated
}
