include: "../views/mobile_new_profiles.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_new_profiles_last_updated.datagroup.lkml"

explore: mobile_new_profiles {
  label: "New profiles for Firefox Mobile"
  view_name: mobile_new_profiles

  always_filter: {
    filters: [
      mobile_new_profiles.first_seen_date: "56 days",
      mobile_new_profiles.is_mobile: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_new_profiles.country} = ${countries.code} ;;
  }

  persist_with: mobile_new_profiles_last_updated
}
