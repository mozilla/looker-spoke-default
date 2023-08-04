include: "../views/funnel_ios.view.lkml"
include: "/shared/views/*"

explore: funnel_ios {
  label: "Firefox iOS Funnel"
  description: "Firefox iOS metrics for the Mobile Funnel"
  view_name: app_store_funnel_table

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${app_store_funnel_table.country} = ${countries.code} ;;
  }

}
