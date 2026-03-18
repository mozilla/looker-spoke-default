include: "../views/stripe_subscriptions.view.lkml"

explore: stripe_subscriptions {
  view_label: "Subscriptions"

  join: default_tax_rates {
    from: stripe_subscriptions__default_tax_rates
    # This should use a dimension reference, but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql_table_name: UNNEST(stripe_subscriptions.default_tax_rates) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: subscription_items {
    from: stripe_subscriptions__items
    # This should use a dimension reference, but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql_table_name: UNNEST(stripe_subscriptions.items) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }
}
