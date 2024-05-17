include: "../views/mobile_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: mobile_engagement {
  label: "Engagement for Firefox Mobile"
  view_name: mobile_engagement

  always_filter: {
    filters: [mobile_engagement.submission_date: "28 days",]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_engagement.country} = ${countries.code} ;;
  }
}
