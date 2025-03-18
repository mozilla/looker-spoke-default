include: "../views/firefox_desktop_baseline_active_users_aggregates.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: firefox_desktop_baseline_active_users_aggregates {
  view_name: firefox_desktop_baseline_active_users_aggregates
  
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${firefox_desktop_baseline_active_users_aggregates.country} = ${countries.code} ;;
  }
}
