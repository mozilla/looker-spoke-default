include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_engagement_v1.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_engagement_last_updated.datagroup.lkml"

explore: +metric_definitions_desktop_engagement_v1 {
  persist_with: desktop_engagement_last_updated

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_desktop_engagement_v1.country} = ${countries.code} ;;
  }
}
