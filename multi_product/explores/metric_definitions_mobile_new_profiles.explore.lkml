include: "//looker-hub/multi_product/explores/metric_definitions_mobile_new_profiles.explore.lkml"
include: "/shared/views/countries.view.lkml"

explore: +metric_definitions_mobile_new_profiles {
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_mobile_new_profiles.country} = ${countries.code} ;;
  }
}
