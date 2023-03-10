include: "../views/subscriptions.view"
include: "../views/table_metadata.view"
include: "/mozilla_vpn/views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: subscriptions {

  join: metadata {
    from: table_metadata
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  join: subscriptions__active {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    relationship: one_to_many
  }

  join: original_subscriptions__active {
    view_label: "Original Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.original_subscription_active_dates}) AS original_subscriptions__active;;
    relationship: one_to_many
  }

  # join: subscriptions__events {
  #   view_label: "Subscription Events"
  #   sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
  #   relationship: one_to_many
  # }

  join: subscriptions__retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
    relationship: one_to_many
  }

  join: original_subscriptions__retention {
    view_label: "Original Subscription Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.original_subscription_retention}) AS original_subscriptions__retention;;
    relationship: one_to_many
  }

  join: vat_rates {
    view_label: "VAT Rates"
    fields: [vat]
    sql_on: LOWER(${subscriptions.country}) = LOWER(${vat_rates.country_code})
    AND (
      ${subscriptions__active.active_raw} BETWEEN ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} - 1
      OR (${subscriptions__active.active_raw} < ${vat_rates.effective_raw} AND ${vat_rates.prev_effective_raw} IS NULL)
      OR (${subscriptions__active.active_raw} >= ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} IS NULL)
    );;
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    fields: [price]
    sql_on: UPPER(${subscriptions.plan_currency}) = UPPER(${exchange_rates_table.base_currency})
      AND ${subscriptions__active.active_raw} = ${exchange_rates_table.date_raw};;
    relationship: one_to_one
  }
}
