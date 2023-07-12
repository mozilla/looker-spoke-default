include: "../views/funnel_ios.view.lkml"
include: "/shared/views/*"

explore: funnel_ios {
  label: "Firefox iOS Funnel"
  description: "Firefox iOS metrics for the Mobile Funnel"
  view_name: funnel_ios

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${funnel_ios.country} = ${countries.code} ;;
  }

}
