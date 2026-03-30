include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_engagement_v1.explore.lkml"
include: "/shared/views/countries.view.lkml"

explore: +metric_definitions_desktop_engagement_v1 {
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_desktop_engagement_v1.country} = ${countries.code} ;;
  }
}
