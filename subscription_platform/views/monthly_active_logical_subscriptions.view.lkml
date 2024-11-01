include: "//looker-hub/subscription_platform/views/monthly_active_logical_subscriptions.view.lkml"

view: +monthly_active_logical_subscriptions {

  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month_start_date ;;
    datatype: date
    timeframes: [month, quarter, year]
  }

  dimension: logical_subscriptions_history_id {
    hidden: yes
  }

  dimension: subscription__id {
    group_item_label: "ID"
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

  dimension: subscription__mozilla_account_id {
    group_item_label: "Mozilla Account ID"
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
  dimension: subscription__plan_vat_rate {
    group_label: "Subscription"
    group_item_label: "Plan VAT Rate"
    type: number
    # Stripe Tax doesn't charge inclusive taxes on plans where the currency is USD or CAD.
    # We started using Stripe Tax on 2022-12-01 (FXA-5457).
    sql:
      CASE
        WHEN ${effective_date} >= '2022-12-01'
          AND ${subscription__provider} = 'Stripe'
          AND ${subscription__plan_currency} IN ('USD', 'CAD')
          THEN 0
        ELSE COALESCE(${vat_rates.vat}, 0)
      END ;;
  }

  dimension: effective_date {
    type: date_raw
    sql:
      COALESCE(
        DATE(${TABLE}.subscription.ended_at),
        LEAST(${TABLE}.month_end_date, ${table_metadata.last_modified_date} - 1)
      ) ;;
    hidden: yes
  }

  dimension_group: subscription_active {
    type: duration
    sql_start: ${TABLE}.subscription.started_at ;;
    sql_end:
      COALESCE(
        ${TABLE}.subscription.ended_at,
        TIMESTAMP(LEAST((${TABLE}.month_end_date + 1), CURRENT_DATE()))
      ) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension_group: until_current_period_ends {
    type: duration
    sql_start:
      LEAST(
        TIMESTAMP_SUB(TIMESTAMP(${TABLE}.month_end_date + 1), INTERVAL 1 MICROSECOND),
        TIMESTAMP(CURRENT_DATE()),
        ${TABLE}.subscription.current_period_ends_at
      ) ;;
    sql_end: ${TABLE}.subscription.current_period_ends_at ;;
    intervals: [day, week, month]
    hidden: yes
  }

  dimension: subscription__first_touch_attribution__utm_campaign {
    group_item_label: "UTM Campaign"
  }
  dimension: subscription__first_touch_attribution__utm_content {
    group_item_label: "UTM Content"
  }
  dimension: subscription__first_touch_attribution__utm_medium {
    group_item_label: "UTM Medium"
  }
  dimension: subscription__first_touch_attribution__utm_source {
    group_item_label: "UTM Source"
  }
  dimension: subscription__first_touch_attribution__utm_term {
    group_item_label: "UTM Term"
  }

  dimension: subscription__last_touch_attribution__utm_campaign {
    group_item_label: "UTM Campaign"
  }
  dimension: subscription__last_touch_attribution__utm_content {
    group_item_label: "UTM Content"
  }
  dimension: subscription__last_touch_attribution__utm_medium {
    group_item_label: "UTM Medium"
  }
  dimension: subscription__last_touch_attribution__utm_source {
    group_item_label: "UTM Source"
  }
  dimension: subscription__last_touch_attribution__utm_term {
    group_item_label: "UTM Term"
  }

  dimension: annual_recurring_revenue_usd {
    group_label: "Subscription"
    label: "Annual Recurring Revenue (USD)"
    type: number
    sql:
      IF(
        ${subscription__is_active} IS NOT TRUE,
        0,
        (
          CASE ${subscription__plan_interval_type}
            WHEN 'year'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, 1, (LEAST((${months_until_current_period_ends} + 1), 12) / 12))
                )
            WHEN 'month'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, 12, LEAST((${months_until_current_period_ends} + 1), 12))
                )
            WHEN 'week'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, 52, LEAST((${weeks_until_current_period_ends} + 1), 52))
                )
            WHEN 'day'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, 365, LEAST((${days_until_current_period_ends} + 1), 365))
                )
          END
          / (1 + ${subscription__plan_vat_rate})
          * IF(${subscription__plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0))
        )
      ) ;;
    value_format_name: usd
  }

  dimension: monthly_recurring_revenue_usd {
    group_label: "Subscription"
    label: "Monthly Recurring Revenue (USD)"
    type: number
    sql:
      IF(
        ${subscription__is_active} IS NOT TRUE,
        0,
        (
          CASE ${subscription__plan_interval_type}
            WHEN 'year'
              THEN ${subscription__plan_amount} / ${subscription__plan_interval_count} / 12
            WHEN 'month'
              THEN ${subscription__plan_amount} / ${subscription__plan_interval_count}
            WHEN 'week'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, (52 / 12), LEAST((${weeks_until_current_period_ends} + 1), (52 / 12)))
                )
            WHEN 'day'
              THEN (
                  ${subscription__plan_amount}
                  / ${subscription__plan_interval_count}
                  * IF(${subscription__auto_renew}, (365 / 12), LEAST((${days_until_current_period_ends} + 1), (365 / 12)))
                )
          END
          / (1 + ${subscription__plan_vat_rate})
          * IF(${subscription__plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0))
        )
      ) ;;
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
    sql: ${annual_recurring_revenue_usd} ;;
    value_format_name: usd
  }

  measure: total_monthly_recurring_revenue_usd {
    label: "Total Monthly Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${subscription__id} ;;
    sql: ${monthly_recurring_revenue_usd} ;;
    value_format_name: usd
  }
}
