include: "../views/service_subscriptions.view.lkml"
include: "../views/table_metadata.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "/mozilla_vpn/views/vat_rates.view.lkml"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view.lkml"

explore: service_subscriptions {
  join: countries {
    sql_on: ${service_subscriptions.country_code} = ${countries.code} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: retention_by_month {
    from: service_subscriptions__retention_by_month
    # The `sql` parameter was deprecated in Looker 3.12, so this should use `sql_table_name`,
    # but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql: LEFT JOIN UNNEST(${service_subscriptions.month_numbers}) AS retention_by_month ;;
    type: left_outer
    relationship: one_to_many
  }

  join: subscription_other_services {
    from: service_subscriptions__other_services
    # This should use a dimension reference, but Looker currently has a problem resolving dimension references in `sql_table_name`.
    sql_table_name: UNNEST(service_subscriptions.other_services) ;;
    sql_on: TRUE ;;
    type: left_outer
    relationship: one_to_many
  }

  join: table_metadata {
    sql_on: ${table_metadata.table_name} = 'service_subscriptions_v1' ;;
    type: left_outer
    relationship: many_to_one
  }

  join: vat_rates {
    view_label: "VAT Rates"
    sql_on:
      ${service_subscriptions.country_code} = ${vat_rates.country_code}
      AND (
        ${service_subscriptions.effective_date} BETWEEN ${vat_rates.effective_date} AND ${vat_rates.next_effective_date} - 1
        OR (${service_subscriptions.effective_date} >= ${vat_rates.effective_date} AND ${vat_rates.next_effective_date} IS NULL)
      ) ;;
    type: left_outer
    relationship: many_to_one
    fields: [
      vat
    ]
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    sql_on:
      ${service_subscriptions.plan_currency} = ${exchange_rates_table.base_currency}
      AND ${exchange_rates_table.quote_currency} = 'USD'
      AND ${service_subscriptions.effective_date} = ${exchange_rates_table.date_raw} ;;
    type: left_outer
    relationship: many_to_one
    fields: [
      price
    ]
  }
}
