include: "../views/android_credential_management_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_credential_management_events {
  label: "Credential Management Event for Android"
  view_name: android_credential_management_events
  persist_with: events_unnested_last_updated
}
