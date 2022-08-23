include: "../views/mobile_subscriptions.view"
include: "../views/table_metadata.view"
include: "../views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: mobile_subscriptions {

  join: metadata {
    from: table_metadata
    view_label: "Nonfunctional Set1 -- DO NOT USE"
    sql_on: ${metadata.table_name} = "all_subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  join: vat_rates {
    view_label: "Nonfunctional Set2 -- DO NOT USE"
    fields: [vat]
    sql_on: FALSE;;
    type: left_outer
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Nonfunctional Set3 -- DO NOT USE"
    fields: [price]
    sql_on: FALSE ;;
    type: left_outer
    relationship: one_to_one
  }

  always_filter: {
    filters: [mobile_subscriptions.provider: "Apple Store, Google Play" ]
  }
}
