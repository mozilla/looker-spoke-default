include: "../views/desktop_retention.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: desktop_retention {
  label: "Retention for Firefox Desktop"
  view_name: desktop_retention

  always_filter: {
    filters: [desktop_retention.metric_date: "56 days",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_retention.country} = ${countries.code} ;;
  }
}
