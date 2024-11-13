include: "../views/mobile_new_profiles.view.lkml"
include: "/shared/views/countries.view.lkml"

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
}
