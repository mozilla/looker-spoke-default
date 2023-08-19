include: "../views/daily_active_logical_subscriptions.view.lkml"
include: "../views/logical_subscriptions.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: daily_active_logical_subscriptions {

  join: countries {
    sql_on: ${daily_active_logical_subscriptions.subscription__country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: current_subscriptions {
    from: logical_subscriptions
    sql_on: ${daily_active_logical_subscriptions.subscription__id} = ${current_subscriptions.id} ;;
    type: left_outer
    relationship: many_to_one
  }

}
