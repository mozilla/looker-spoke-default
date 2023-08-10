include: "../views/app_store_funnel_ios.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: app_store_funnel_ios {
  label: "Firefox iOS - App Store Funnel"
  description: "Firefox iOS metrics for the Mobile Funnel"
  view_name: app_store_funnel_ios

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${app_store_funnel_ios.country} = ${countries.code} ;;
  }

}
