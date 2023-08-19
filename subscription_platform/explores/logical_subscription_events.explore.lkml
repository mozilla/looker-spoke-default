include: "../views/logical_subscription_events.view.lkml"
include: "../views/logical_subscriptions.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: logical_subscription_events {

  join: countries {
    sql_on: ${logical_subscription_events.subscription__country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: current_subscriptions {
    from: logical_subscriptions
    sql_on: ${logical_subscription_events.subscription__id} = ${current_subscriptions.id} ;;
    type: left_outer
    relationship: many_to_one
  }

}
