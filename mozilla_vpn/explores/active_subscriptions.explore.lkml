include: "../views/active_subscriptions_table.view"
include: "../views/table_metadata.view"
include: "../views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: active_subscriptions {
  # from: active_subscriptions
  from: active_subscriptions_table


  join: metadata {
    from: table_metadata
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "active_subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  join: vat_rates {
    view_label: "VAT Rates"
    fields: [vat]
    sql_on: LOWER(${active_subscriptions.country}) = LOWER(${vat_rates.country_code})
          AND (
            ${active_subscriptions.active_raw} BETWEEN ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} - 1
            OR (${active_subscriptions.active_raw} < ${vat_rates.effective_raw} AND ${vat_rates.prev_effective_raw} IS NULL)
            OR (${active_subscriptions.active_raw} >= ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} IS NULL)
          );;
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    fields: []
    sql_on: UPPER(${active_subscriptions.plan_currency}) = UPPER(${exchange_rates_table.base_currency})
      AND ${active_subscriptions.active_raw} = ${exchange_rates_table.date_raw};;
    relationship: one_to_one
  }
}
