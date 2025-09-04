include: "//looker-hub/subscription_platform/views/daily_active_logical_subscriptions.view.lkml"

view: +daily_active_logical_subscriptions {
  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension: logical_subscriptions_history_id {
    hidden: yes
  }

  dimension: subscription__provider_subscription_id {
    group_label: "Subscription Provider IDs"
    group_item_label: "Subscription ID"
  }
  dimension: subscription__provider_subscription_item_id {
    hidden: yes
  }
  dimension: subscription__provider_customer_id {
    group_label: "Subscription Provider IDs"
    group_item_label: "Customer ID"
  }

  dimension: subscription__mozilla_account_id_sha256 {
    hidden: yes
  }

  dimension: subscription__country_code {
    map_layer_name: countries
  }
  dimension: subscription__country_name {
    map_layer_name: countries
  }
  dimension: subscription__country_vat_rate {
    group_item_label: "Country VAT Rate"
    value_format_name: percent_2
  }

  dimension: subscription__services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.subscription.services) ;;
    group_label: "Subscription"
    group_item_label: "Services Quantity"
  }

  dimension: subscription__provider_product_id {
    group_label: "Subscription Provider IDs"
    group_item_label: "Product ID"
  }

  dimension: subscription__provider_plan_id {
    group_label: "Subscription Provider IDs"
    group_item_label: "Plan ID"
  }
  dimension: subscription__plan_interval_type {
    hidden: yes
  }
  dimension: subscription__plan_interval_count {
    hidden: yes
  }
  dimension: subscription__plan_amount {
    value_format_name: decimal_2
  }
  dimension: subscription__plan_amount_usd {
    group_item_label: "Plan Amount (USD)"
    value_format_name: usd
  }
  dimension: subscription__plan_currency_usd_exchange_rate {
    group_item_label: "Plan Currency USD Exchange Rate"
    value_format_name: percent_4
  }

  dimension: subscription__current_period_discount_amount_usd {
    group_item_label: "Current Period Discount Amount (USD)"
    value_format_name: usd
  }
  dimension: subscription__ongoing_discount_amount_usd {
    group_item_label: "Ongoing Discount Amount (USD)"
    value_format_name: usd
  }

  dimension_group: subscription_active {
    type: duration
    sql_start: ${TABLE}.subscription.started_at ;;
    sql_end: COALESCE(${TABLE}.subscription.ended_at, TIMESTAMP(${TABLE}.date + 1)) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension: subscription__annual_recurring_revenue_usd {
    group_item_label: "Annual Recurring Revenue (USD)"
    value_format_name: usd
  }

  dimension: subscription__monthly_recurring_revenue_usd {
    group_item_label: "Monthly Recurring Revenue (USD)"
    value_format_name: usd
  }

  measure: logical_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.id ;;
  }

  measure: provider_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.provider_subscription_id ;;
  }

  measure: customer_count {
    type: count_distinct
    sql:
      COALESCE(
        ${TABLE}.subscription.mozilla_account_id_sha256,
        ${TABLE}.subscription.provider_customer_id,
        ${TABLE}.subscription.provider_subscription_id
      ) ;;
  }

  measure: total_annual_recurring_revenue_usd {
    label: "Total Annual Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${subscription__id} ;;
    sql: ${subscription__annual_recurring_revenue_usd} ;;
    value_format_name: usd
  }

  measure: total_monthly_recurring_revenue_usd {
    label: "Total Monthly Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${subscription__id} ;;
    sql: ${subscription__monthly_recurring_revenue_usd} ;;
    value_format_name: usd
  }
}
