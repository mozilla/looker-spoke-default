include: "../views/daily_active_logical_subscriptions.view.lkml"
include: "../views/logical_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: daily_active_logical_subscriptions {

  join: countries {
    sql_on: ${daily_active_logical_subscriptions.subscription__country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: current_subscription_state {
    from: logical_subscriptions
    sql_on: ${daily_active_logical_subscriptions.subscription__id} = ${current_subscription_state.id} ;;
    type: left_outer
    relationship: many_to_one
    fields: [
      is_trial,
      is_active,
      auto_renew,
      has_refunds,
      has_fraudulent_charges
    ]
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'daily_active_logical_subscriptions_v1' ;;
    type: left_outer
    relationship: many_to_one
  }

}
