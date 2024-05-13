include: "../views/desktop_engagement.view.lkml"
include: "/shared/views/*"

explore: desktop_engagement {
  label: "Firefox Desktop Engagement metrics"
  view_name: desktop_engagement

  always_filter: {
    filters: [desktop_engagement.submission_date: "28 days",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_engagement.country} = ${countries.code} ;;
  }
}
