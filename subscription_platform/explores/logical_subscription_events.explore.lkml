include: "../views/logical_subscription_events.view.lkml"
include: "../views/logical_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: logical_subscription_events {

  join: countries {
    sql_on: ${logical_subscription_events.subscription__country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: current_subscription_state {
    from: logical_subscriptions
    sql_on: ${logical_subscription_events.subscription__id} = ${current_subscription_state.id} ;;
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

  join: subscription_services {
    from: logical_subscription_events__subscription__services
    sql_table_name: UNNEST(logical_subscription_events.subscription.services) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: old_subscription_services {
    from: logical_subscription_events__old_subscription__services
    sql_table_name: UNNEST(logical_subscription_events.old_subscription.services) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'logical_subscription_events_v1' ;;
    type: left_outer
    relationship: many_to_one
  }

}
