include: "../views//active_users_aggregates_attribution.view.lkml"
include: "/shared/views/*"

explore: active_users_aggregates_attribution {
  always_filter: {
    filters: [active_users_aggregates_attribution.app_name: "Firefox Desktop, Fenix, Fenix BrowserStack, Firefox iOS, Firefox iOS BrowserStack, Focus Android,
      Focus iOS, Focus iOS BrowserStack",
      active_users_aggregates_attribution.submission_date: "after 4 weeks ago"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates_attribution.country} = ${countries.code} ;;
  }
}
