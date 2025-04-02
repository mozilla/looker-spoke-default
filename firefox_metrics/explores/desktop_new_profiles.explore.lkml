include: "../views/desktop_new_profiles.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/desktop_new_profiles_last_updated.datagroup.lkml"

explore: desktop_new_profiles {
  label: "New profiles for Firefox Desktop"
  view_name: desktop_new_profiles

  always_filter: {
    filters: [
      desktop_new_profiles.first_seen_date: "56 days",
      desktop_new_profiles.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_new_profiles.country} = ${countries.code} ;;
  }

  persist_with: desktop_new_profiles_last_updated
}
