include: "//looker-hub/multi_product/explores/metric_definitions_mobile_retention_by_metric_date.explore.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_retention_last_updated.datagroup.lkml"

explore: +metric_definitions_mobile_retention_by_metric_date {
  persist_with: mobile_retention_last_updated

}
