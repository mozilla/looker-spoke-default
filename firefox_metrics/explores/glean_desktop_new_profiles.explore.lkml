include: "../views/glean_desktop_new_profiles.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/glean_desktop_new_profiles_last_updated.datagroup.lkml"

explore: glean_desktop_new_profiles {
  label: "New profiles for Firefox Desktop"
  view_name: glean_desktop_new_profiles

  always_filter: {
    filters: [
      glean_desktop_new_profiles.first_seen_date: "56 days",
      glean_desktop_new_profiles.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${glean_desktop_new_profiles.country} = ${countries.code} ;;
  }

  persist_with: glean_desktop_new_profiles_last_updated
}
