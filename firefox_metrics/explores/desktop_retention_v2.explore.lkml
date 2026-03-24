include: "../views/desktop_retention_v2.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: desktop_retention_v2 {
  label: "Desktop Retention by Metric Date"
  description: "New profile and overall retention rates. Set submission_date_extension=1 year for YoY, 28 days for rolling average."

  always_filter: {
    filters: [
     desktop_retention_v2.metric_date_range: "90 days",
     desktop_retention_v2.is_desktop: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_retention_v2.country} = ${countries.code} ;;
  }
}
