include: "../views/android_customize_home_events.view.lkml"
include: "//looker-hub/fenix/datagroups/events_unnested_last_updated.datagroup.lkml"

explore: fenix_android_customize_home_events {
  label: "Customize Home Event for Android"
  view_name: android_customize_home_events
  persist_with: events_unnested_last_updated
}
