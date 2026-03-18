include: "//looker-hub/subscription_platform/explores/active_subscriptions.explore.lkml"
include: "/shared/views/countries.view.lkml"

explore: +active_subscriptions {
  join: countries {
    sql_on: ${active_subscriptions.country} = LOWER(${countries.code}) ;;
    relationship: many_to_one
  }
}
