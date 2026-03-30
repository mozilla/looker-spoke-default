include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_new_profiles.explore.lkml"
include: "/shared/views/countries.view.lkml"

explore: +metric_definitions_desktop_new_profiles {
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_desktop_new_profiles.country} = ${countries.code} ;;
  }
}
