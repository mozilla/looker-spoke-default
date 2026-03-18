include: "../views/active_users_aggregates.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: mozmark_dau {
  label: "MozMark DAU"
  view_name: active_users_aggregates

  always_filter: {
    filters: [
      active_users_aggregates.app_name: "Firefox Desktop, Firefox Desktop BrowserStack, Fenix, Fenix BrowserStack, Firefox iOS, Firefox iOS BrowserStack,
    Focus Android,  Focus iOS, Focus iOS BrowserStack"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates.country} = ${countries.code} ;;
  }
}
