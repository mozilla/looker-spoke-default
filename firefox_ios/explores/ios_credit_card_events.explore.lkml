include: "../views/ios_credit_card_events.view.lkml"
include: "//looker-hub/firefox_ios/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: ios_credit_card_events {
  label: "Credit Card Event for iOS"
  view_name: ios_credit_card_events
  persist_with: events_unnested_last_updated
}
