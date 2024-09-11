include: "../views/desktop_new_profiles_aggregates.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: desktop_new_profiles {
  label: "New profiles for Firefox Desktop"
  view_name: desktop_new_profiles_aggregates

  always_filter: {
    filters: [
      desktop_new_profiles_aggregates.first_seen_date: "56 days",
      desktop_new_profiles_aggregates.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_new_profiles_aggregates.country} = ${countries.code} ;;
  }
}
