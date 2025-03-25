include: "//looker-hub/subscription_platform/views/daily_active_service_subscriptions.view.lkml"

view: +daily_active_service_subscriptions {
  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension: service_subscriptions_history_id {
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

  dimension: subscription__service__id {
    sql: ${TABLE}.service_id ;;
    group_label: "Subscription"
    group_item_label: "Service ID"
  }
  dimension: subscription__service__name {
    group_label: "Subscription"
    group_item_label: "Service Name"
  }
  dimension: subscription__service__tier {
    group_label: "Subscription"
    group_item_label: "Service Tier"
  }

  dimension: subscription__other_services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.subscription.other_services) ;;
    group_label: "Subscription"
    group_item_label: "Other Services Quantity"
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

  dimension_group: subscription_active {
    type: duration
    sql_start: ${TABLE}.subscription.started_at ;;
    sql_end: COALESCE(${TABLE}.subscription.ended_at, TIMESTAMP(${TABLE}.date + 1)) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension_group: until_current_period_ends {
    type: duration
    sql_start:
      LEAST(
        TIMESTAMP_SUB(TIMESTAMP(${TABLE}.date + 1), INTERVAL 1 MICROSECOND),
        ${TABLE}.subscription.current_period_ends_at
      ) ;;
    sql_end: ${TABLE}.subscription.current_period_ends_at ;;
    intervals: [day, week, month]
    hidden: yes
  }

  dimension: current_period_discounted_plan_amount {
    type: number
    sql: GREATEST((${subscription__plan_amount} - COALESCE(${subscription__current_period_discount_amount}, 0)), 0) ;;
    hidden: yes
  }
  dimension: current_period_annual_recurring_revenue_months {
    type: number
    sql: LEAST((${months_until_current_period_ends} + 1), 12) ;;
    hidden: yes
  }
  dimension: current_period_annual_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${subscription__is_active} IS NOT TRUE
          OR ${subscription__is_trial} IS TRUE
          THEN 0
        WHEN ${subscription__plan_interval_type} IN ('year', 'month')
          THEN (
              ${current_period_discounted_plan_amount}
              / ${subscription__plan_interval_months}
              * ${current_period_annual_recurring_revenue_months}
            )
        WHEN ${subscription__plan_interval_type} IN ('week', 'day')
          THEN ${current_period_discounted_plan_amount}
      END ;;
    hidden: yes
  }

  dimension: ongoing_discounted_plan_amount {
    type: number
    sql: GREATEST((${subscription__plan_amount} - COALESCE(${subscription__ongoing_discount_amount}, 0)), 0) ;;
    hidden: yes
  }
  dimension_group: after_current_period_before_ongoing_discount_ends {
    type: duration
    sql_start: ${subscription__current_period_ends_at_raw} ;;
    sql_end: TIMESTAMP_SUB(${subscription__ongoing_discount_ends_at_raw}, INTERVAL 1 MICROSECOND) ;;
    intervals: [day, week, month]
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_revenue_months {
    type: number
    sql:
      CASE
        WHEN COALESCE(${subscription__ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${subscription__ongoing_discount_ends_at_raw} IS NULL
          THEN (12 - ${current_period_annual_recurring_revenue_months})
        ELSE
          LEAST(
            (
              (DIV(${months_after_current_period_before_ongoing_discount_ends}, ${subscription__plan_interval_months}) + 1)
              * ${subscription__plan_interval_months}
            ),
            (12 - ${current_period_annual_recurring_revenue_months})
          )
      END ;;
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_revenue_weeks {
    type: number
    sql:
      CASE
        WHEN COALESCE(${subscription__ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${subscription__ongoing_discount_ends_at_raw} IS NULL
          THEN (52 - ${subscription__plan_interval_count})
        ELSE
          LEAST(
            (
              (DIV(CAST(${weeks_after_current_period_before_ongoing_discount_ends} AS INTEGER), ${subscription__plan_interval_count}) + 1)
              * ${subscription__plan_interval_count}
            ),
            (52 - ${subscription__plan_interval_count})
          )
      END ;;
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_revenue_days {
    type: number
    sql:
      CASE
        WHEN COALESCE(${subscription__ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${subscription__ongoing_discount_ends_at_raw} IS NULL
          THEN (365 - ${subscription__plan_interval_count})
        ELSE
          LEAST(
            (
              (DIV(${days_after_current_period_before_ongoing_discount_ends}, ${subscription__plan_interval_count}) + 1)
              * ${subscription__plan_interval_count}
            ),
            (365 - ${subscription__plan_interval_count})
          )
      END ;;
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${subscription__is_active} IS NOT TRUE
          OR ${subscription__auto_renew} IS NOT TRUE
          OR COALESCE(${subscription__ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${subscription__plan_interval_type} IN ('year', 'month')
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${subscription__plan_interval_months}
              * ${ongoing_discounted_annual_recurring_revenue_months}
            )
        WHEN ${subscription__plan_interval_type} = 'week'
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${subscription__plan_interval_count}
              * ${ongoing_discounted_annual_recurring_revenue_weeks}
            )
        WHEN ${subscription__plan_interval_type} = 'day'
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${subscription__plan_interval_count}
              * ${ongoing_discounted_annual_recurring_revenue_days}
            )
      END ;;
    hidden: yes
  }

  dimension: ongoing_undiscounted_annual_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${subscription__is_active} IS NOT TRUE
          OR ${subscription__auto_renew} IS NOT TRUE
          THEN 0
        WHEN ${subscription__plan_interval_type} IN ('year', 'month')
          THEN (
              ${subscription__plan_amount}
              / ${subscription__plan_interval_months}
              * GREATEST(
                (
                  12
                  - ${current_period_annual_recurring_revenue_months}
                  - ${ongoing_discounted_annual_recurring_revenue_months}
                ),
                0
              )
            )
        WHEN ${subscription__plan_interval_type} = 'week'
          THEN (
              ${subscription__plan_amount}
              / ${subscription__plan_interval_count}
              * GREATEST(
                (
                  52
                  - ${subscription__plan_interval_count}
                  - ${ongoing_discounted_annual_recurring_revenue_weeks}
                ),
                0
              )
            )
        WHEN ${subscription__plan_interval_type} = 'day'
          THEN (
              ${subscription__plan_amount}
              / ${subscription__plan_interval_count}
              * GREATEST(
                (
                  365
                  - ${subscription__plan_interval_count}
                  - ${ongoing_discounted_annual_recurring_revenue_days}
                ),
                0
              )
            )
      END ;;
    hidden: yes
  }

  dimension: annual_recurring_gross_revenue {
    type: number
    sql:
      ${current_period_annual_recurring_gross_revenue}
      + ${ongoing_discounted_annual_recurring_gross_revenue}
      + ${ongoing_undiscounted_annual_recurring_gross_revenue} ;;
    hidden: yes
  }
  dimension: annual_recurring_net_revenue {
    type: number
    sql:
      ${annual_recurring_gross_revenue}
      / (1 + COALESCE(${vat_rates.vat}, 0)) ;;
    hidden: yes
  }
  dimension: annual_recurring_revenue_usd {
    group_label: "Subscription"
    label: "Annual Recurring Revenue (USD)"
    type: number
    sql:
      ${annual_recurring_net_revenue}
      * IF(${subscription__plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0)) ;;
    value_format_name: usd
  }

  dimension: monthly_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${subscription__is_active} IS NOT TRUE
          OR ${subscription__is_trial} IS TRUE
          THEN 0
        WHEN ${subscription__plan_interval_type} IN ('year', 'month')
          THEN (${current_period_discounted_plan_amount} / ${subscription__plan_interval_months})
        WHEN ${subscription__plan_interval_type} = 'week'
          THEN (
              ${current_period_discounted_plan_amount}
              + (
                ${ongoing_discounted_plan_amount}
                / ${subscription__plan_interval_count}
                * IF(${subscription__auto_renew}, GREATEST((4 - ${subscription__plan_interval_count}), 0), 0)
              )
            )
        WHEN ${subscription__plan_interval_type} = 'day'
          THEN (
              ${current_period_discounted_plan_amount}
              + (
                ${ongoing_discounted_plan_amount}
                / ${subscription__plan_interval_count}
                * IF(${subscription__auto_renew}, GREATEST((30 - ${subscription__plan_interval_count}), 0), 0)
              )
            )
      END ;;
    hidden: yes
  }
  dimension: monthly_recurring_net_revenue {
    type: number
    sql:
      ${monthly_recurring_gross_revenue}
      / (1 + COALESCE(${vat_rates.vat}, 0)) ;;
    hidden: yes
  }
  dimension: monthly_recurring_revenue_usd {
    group_label: "Subscription"
    label: "Monthly Recurring Revenue (USD)"
    type: number
    sql:
      ${monthly_recurring_net_revenue}
      * IF(${subscription__plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0)) ;;
    value_format_name: usd
  }

  measure: service_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.id ;;
  }

  measure: logical_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.logical_subscription_id ;;
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
