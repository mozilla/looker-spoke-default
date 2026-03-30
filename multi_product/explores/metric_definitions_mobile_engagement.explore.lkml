include: "//looker-hub/multi_product/explores/metric_definitions_mobile_engagement.explore.lkml"
include: "/shared/views/countries.view.lkml"

explore: +metric_definitions_mobile_engagement {
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_mobile_engagement.country} = ${countries.code} ;;
  }
}
