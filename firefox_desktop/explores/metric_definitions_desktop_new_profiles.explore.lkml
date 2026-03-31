include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_new_profiles.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/desktop_new_profiles_last_updated.datagroup.lkml"

explore: +metric_definitions_desktop_new_profiles {
  persist_with: desktop_new_profiles_last_updated
}
