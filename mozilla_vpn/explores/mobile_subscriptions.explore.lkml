include: "../views/mobile_subscriptions.view"
include: "../views/table_metadata.view"
include: "../views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: mobile_subscriptions {

  join: metadata {
    from: table_metadata
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "all_subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  # join: devices {
  #   relationship: many_to_one
  #   sql_on: ${devices.user_id} = ${user_id};;
  # }

  # join: subscriptions__active {
  #   view_label: "Active Subscriptions"
  #   sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
  #   relationship: one_to_many
  # }

  # join: subscriptions__events {
  #   view_label: "Subscription Events"
  #   sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
  #   relationship: one_to_many
  # }

  # join: subscriptions__retention {
  #   view_label: "Retention"
  #   sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
  #   relationship: one_to_many
  # }

  join: vat_rates {
    view_label: "VAT Rates"
    fields: [vat]
    sql_on: FALSE;;
    type: left_outer
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    fields: [price]
    sql_on: FALSE ;;
    type: left_outer
    relationship: one_to_one
  }

  always_filter: {
    filters: [mobile_subscriptions.provider: "Apple Store, Google Play" ]
  }
}
