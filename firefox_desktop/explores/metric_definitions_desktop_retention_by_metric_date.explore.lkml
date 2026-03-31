include: "//looker-hub/firefox_desktop/explores/metric_definitions_desktop_retention_by_metric_date.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/desktop_retention_last_updated.datagroup.lkml"

explore: +metric_definitions_desktop_retention_by_metric_date {
  persist_with: desktop_retention_last_updated

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${metric_definitions_desktop_retention_by_metric_date.country} = ${countries.code} ;;
  }
}
