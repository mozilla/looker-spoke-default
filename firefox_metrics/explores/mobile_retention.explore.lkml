include: "../views/mobile_retention.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_retention_last_updated.datagroup.lkml"

explore: mobile_retention {
  label: "Retention for Firefox Mobile"
  view_name: mobile_retention

  always_filter: {
    filters: [
      mobile_retention.metric_date: "56 days",
      mobile_retention.is_mobile: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_retention.country} = ${countries.code} ;;
  }

  persist_with: mobile_retention_last_updated
}
