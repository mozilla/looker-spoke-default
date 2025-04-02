include: "../views/mobile_engagement.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/firefox_okrs/datagroups/mobile_engagement_last_updated.datagroup.lkml"

explore: mobile_engagement {
  label: "Engagement for Firefox Mobile"
  view_name: mobile_engagement

  always_filter: {
    filters: [
      mobile_engagement.submission_date: "28 days",
      mobile_engagement.is_mobile: "Yes"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_engagement.country} = ${countries.code} ;;
  }

  persist_with: mobile_engagement_last_updated
}
