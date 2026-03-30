include: "//looker-hub/multi_product/explores/metric_definitions_mobile_new_profiles.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_new_profiles_last_updated.datagroup.lkml"

explore: +metric_definitions_mobile_new_profiles {
  persist_with: mobile_new_profiles_last_updated

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_mobile_new_profiles.country} = ${countries.code} ;;
  }
}
