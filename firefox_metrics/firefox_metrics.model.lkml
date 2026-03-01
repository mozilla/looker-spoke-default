connection: "telemetry"
label: "Firefox Metrics for OKRs"

include: "explores/desktop_engagement.explore.lkml"
include: "views/growth_new_profiles.view.lkml"
include: "explores/desktop_retention.explore.lkml"
include: "explores/mobile_engagement.explore.lkml"
include: "explores/mobile_retention.explore.lkml"
include: "explores/mobile_new_profiles.explore.lkml"
include: "explores/desktop_new_profiles.explore.lkml"
include: "explores/glean_desktop_engagement.explore.lkml"
include: "explores/glean_desktop_retention.explore.lkml"
include: "explores/glean_desktop_new_profiles.explore.lkml"

explore: growth_new_profiles {
  sql_always_where: ${first_seen_date} >= "2025-01-01" AND ${period_filtered_measures} in ("this", "last");;
}
