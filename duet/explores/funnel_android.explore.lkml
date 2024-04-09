include: "../views/funnel_android.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: funnel_android {
  label: "Firefox Android Funnel"
  description: "Firefox Android metrics for the Mobile Funnel"
  view_name: funnel_android

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${funnel_android.country} = ${countries.code} ;;
  }

}
