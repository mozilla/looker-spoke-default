include: "../views/mobile_retention.view.lkml"
include: "/shared/views/*"

explore: mobile_retention {
  label: "Retention for Firefox Mobile"
  view_name: mobile_retention

  always_filter: {
    filters: [
      mobile_retention.metric_date: "56 days",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_retention.country} = ${countries.code} ;;
  }
}
