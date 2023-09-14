include: "../views/monthly_active_logical_subscriptions.view.lkml"
include: "../views/logical_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"

explore: monthly_active_logical_subscriptions {

  join: countries {
    sql_on: ${monthly_active_logical_subscriptions.subscription__country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: current_subscription_state {
    from: logical_subscriptions
    sql_on: ${monthly_active_logical_subscriptions.subscription__id} = ${current_subscription_state.id} ;;
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

  join: next_month_still_active_subscriptions {
    from: monthly_active_logical_subscriptions
    sql_on:
      ${monthly_active_logical_subscriptions.subscription__id} = ${next_month_still_active_subscriptions.subscription__id}
      AND DATE_ADD(${monthly_active_logical_subscriptions.month_start_date}, INTERVAL 1 MONTH) = ${next_month_still_active_subscriptions.month_start_date} ;;
    type: left_outer
    relationship: one_to_one
    fields: [
      logical_subscription_count,
      provider_subscription_count,
      customer_count
    ]
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'monthly_active_logical_subscriptions_v1' ;;
    type: left_outer
    relationship: many_to_one
  }

}
