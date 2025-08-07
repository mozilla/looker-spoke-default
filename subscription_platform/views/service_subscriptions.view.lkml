include: "//looker-hub/subscription_platform/views/service_subscriptions.view.lkml"

view: +service_subscriptions {
  dimension: id {
    primary_key: yes
  }

  dimension: service_id {
    hidden: yes
  }

  dimension: provider_subscription_id {
    group_label: "Provider IDs"
    group_item_label: "Subscription ID"
  }
  dimension: provider_subscription_item_id {
    hidden: yes
  }
  dimension: provider_customer_id {
    group_label: "Provider IDs"
    group_item_label: "Customer ID"
  }

  dimension: mozilla_account_id_sha256 {
    hidden: yes
  }

  dimension: country_code {
    map_layer_name: countries
  }
  dimension: country_name {
    map_layer_name: countries
  }

  dimension: service__id {
    sql: ${TABLE}.service_id ;;
  }

  dimension: other_services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.other_services) ;;
  }

  dimension: provider_product_id {
    group_label: "Provider IDs"
    group_item_label: "Product ID"
  }

  dimension: provider_plan_id {
    group_label: "Provider IDs"
    group_item_label: "Plan ID"
  }
  dimension: plan_interval_type {
    hidden: yes
  }
  dimension: plan_interval_count {
    hidden: yes
  }
  dimension: plan_amount {
    value_format_name: decimal_2
  }

  dimension: effective_date {
    type: date_raw
    sql: COALESCE(DATE(${TABLE}.ended_at), ${table_metadata.last_modified_date} - 1) ;;
    hidden: yes
  }

  dimension_group: active {
    type: duration
    sql_start: ${TABLE}.started_at ;;
    sql_end: COALESCE(${TABLE}.ended_at, TIMESTAMP(CURRENT_DATE())) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension_group: since_subscription_started {
    type: duration
    sql_start: ${TABLE}.started_at ;;
    sql_end: TIMESTAMP(CURRENT_DATE()) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension_group: until_current_period_ends {
    type: duration
    sql_start: LEAST(TIMESTAMP(CURRENT_DATE()), ${TABLE}.current_period_ends_at) ;;
    sql_end: ${TABLE}.current_period_ends_at ;;
    intervals: [day, week, month]
    hidden: yes
  }

  dimension: month_numbers {
    sql: GENERATE_ARRAY(1, ${months_since_subscription_started} + 1) ;;
    hidden: yes
  }

  dimension: months_since_start_month_ended {
    type: duration_month
    sql_start:
      TIMESTAMP_SUB(
        TIMESTAMP_ADD(
          TIMESTAMP(LAST_DAY(DATE(${TABLE}.started_at), MONTH)),
          INTERVAL 1 DAY
        ),
        INTERVAL 1 MICROSECOND
      ) ;;
    sql_end: TIMESTAMP(CURRENT_DATE()) ;;
    hidden: yes
  }

  dimension: current_period_discounted_plan_amount {
    type: number
    sql: GREATEST((${plan_amount} - COALESCE(${current_period_discount_amount}, 0)), 0) ;;
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
        WHEN ${is_active} IS NOT TRUE
          OR ${is_trial} IS TRUE
          THEN 0
        WHEN ${plan_interval_type} IN ('year', 'month')
          THEN (
              ${current_period_discounted_plan_amount}
              / ${plan_interval_months}
              * ${current_period_annual_recurring_revenue_months}
            )
        WHEN ${plan_interval_type} IN ('week', 'day')
          THEN ${current_period_discounted_plan_amount}
      END ;;
    hidden: yes
  }

  dimension: ongoing_discounted_plan_amount {
    type: number
    sql: GREATEST((${plan_amount} - COALESCE(${ongoing_discount_amount}, 0)), 0) ;;
    hidden: yes
  }
  dimension_group: after_current_period_before_ongoing_discount_ends {
    type: duration
    sql_start: ${current_period_ends_at_raw} ;;
    sql_end: TIMESTAMP_SUB(${ongoing_discount_ends_at_raw}, INTERVAL 1 MICROSECOND) ;;
    intervals: [day, week, month]
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_revenue_months {
    type: number
    sql:
      CASE
        WHEN COALESCE(${ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${ongoing_discount_ends_at_raw} IS NULL
          THEN (12 - ${current_period_annual_recurring_revenue_months})
        ELSE
          LEAST(
            (
              (DIV(${months_after_current_period_before_ongoing_discount_ends}, ${plan_interval_months}) + 1)
              * ${plan_interval_months}
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
        WHEN COALESCE(${ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${ongoing_discount_ends_at_raw} IS NULL
          THEN (52 - ${plan_interval_count})
        ELSE
          LEAST(
            (
              (DIV(CAST(${weeks_after_current_period_before_ongoing_discount_ends} AS INTEGER), ${plan_interval_count}) + 1)
              * ${plan_interval_count}
            ),
            (52 - ${plan_interval_count})
          )
      END ;;
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_revenue_days {
    type: number
    sql:
      CASE
        WHEN COALESCE(${ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${ongoing_discount_ends_at_raw} IS NULL
          THEN (365 - ${plan_interval_count})
        ELSE
          LEAST(
            (
              (DIV(${days_after_current_period_before_ongoing_discount_ends}, ${plan_interval_count}) + 1)
              * ${plan_interval_count}
            ),
            (365 - ${plan_interval_count})
          )
      END ;;
    hidden: yes
  }
  dimension: ongoing_discounted_annual_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${is_active} IS NOT TRUE
          OR ${auto_renew} IS NOT TRUE
          OR COALESCE(${ongoing_discount_amount}, 0) = 0
          THEN 0
        WHEN ${plan_interval_type} IN ('year', 'month')
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${plan_interval_months}
              * ${ongoing_discounted_annual_recurring_revenue_months}
            )
        WHEN ${plan_interval_type} = 'week'
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${plan_interval_count}
              * ${ongoing_discounted_annual_recurring_revenue_weeks}
            )
        WHEN ${plan_interval_type} = 'day'
          THEN (
              ${ongoing_discounted_plan_amount}
              / ${plan_interval_count}
              * ${ongoing_discounted_annual_recurring_revenue_days}
            )
      END ;;
    hidden: yes
  }

  dimension: ongoing_undiscounted_annual_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${is_active} IS NOT TRUE
          OR ${auto_renew} IS NOT TRUE
          THEN 0
        WHEN ${plan_interval_type} IN ('year', 'month')
          THEN (
              ${plan_amount}
              / ${plan_interval_months}
              * GREATEST(
                (
                  12
                  - ${current_period_annual_recurring_revenue_months}
                  - ${ongoing_discounted_annual_recurring_revenue_months}
                ),
                0
              )
            )
        WHEN ${plan_interval_type} = 'week'
          THEN (
              ${plan_amount}
              / ${plan_interval_count}
              * GREATEST(
                (
                  52
                  - ${plan_interval_count}
                  - ${ongoing_discounted_annual_recurring_revenue_weeks}
                ),
                0
              )
            )
        WHEN ${plan_interval_type} = 'day'
          THEN (
              ${plan_amount}
              / ${plan_interval_count}
              * GREATEST(
                (
                  365
                  - ${plan_interval_count}
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
    label: "Annual Recurring Revenue (USD)"
    type: number
    sql:
      ${annual_recurring_net_revenue}
      * IF(${plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0)) ;;
    value_format_name: usd
  }

  dimension: monthly_recurring_gross_revenue {
    type: number
    sql:
      CASE
        WHEN ${is_active} IS NOT TRUE
          OR ${is_trial} IS TRUE
          THEN 0
        WHEN ${plan_interval_type} IN ('year', 'month')
          THEN (${current_period_discounted_plan_amount} / ${plan_interval_months})
        WHEN ${plan_interval_type} = 'week'
          THEN (
              ${current_period_discounted_plan_amount}
              + (
                ${ongoing_discounted_plan_amount}
                / ${plan_interval_count}
                * IF(${auto_renew}, GREATEST((4 - ${plan_interval_count}), 0), 0)
              )
            )
        WHEN ${plan_interval_type} = 'day'
          THEN (
              ${current_period_discounted_plan_amount}
              + (
                ${ongoing_discounted_plan_amount}
                / ${plan_interval_count}
                * IF(${auto_renew}, GREATEST((30 - ${plan_interval_count}), 0), 0)
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
    label: "Monthly Recurring Revenue (USD)"
    type: number
    sql:
      ${monthly_recurring_net_revenue}
      * IF(${plan_currency} = 'USD', 1, COALESCE(${exchange_rates_table.price}, 0)) ;;
    value_format_name: usd
  }

  measure: service_subscription_count {
    type: count
  }

  measure: active_service_subscription_count {
    type: count
    filters: [is_active: "yes"]
  }

  measure: logical_subscription_count {
    type: count_distinct
    sql: ${TABLE}.logical_subscription_id ;;
  }

  measure: provider_subscription_count {
    type: count_distinct
    sql: ${TABLE}.provider_subscription_id ;;
  }

  measure: customer_count {
    type: count_distinct
    sql:
      COALESCE(
        ${TABLE}.mozilla_account_id_sha256,
        ${TABLE}.provider_customer_id,
        ${TABLE}.provider_subscription_id
      ) ;;
  }

  measure: total_annual_recurring_revenue_usd {
    label: "Total Annual Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${annual_recurring_revenue_usd} ;;
    value_format_name: usd
  }

  measure: total_monthly_recurring_revenue_usd {
    label: "Total Monthly Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${monthly_recurring_revenue_usd} ;;
    value_format_name: usd
  }
}

view: service_subscriptions__retention_by_month {
  dimension: subscription_month_number {
    type: number
    sql: ${TABLE} ;;
  }

  dimension: is_start_month_cohort_complete {
    type: yesno
    sql: ${subscription_month_number} <= ${service_subscriptions.months_since_start_month_ended} ;;
  }

  measure: churned_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN NOT ${service_subscriptions.is_active}
          AND ${subscription_month_number} = ${service_subscriptions.months_active} + 1
          THEN ${service_subscriptions.id}
        ELSE NULL
      END ;;
  }

  measure: retained_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN ${service_subscriptions.is_active}
          OR ${subscription_month_number} <= ${service_subscriptions.months_active}
          THEN ${service_subscriptions.id}
        ELSE NULL
      END ;;
  }

  measure: previously_retained_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN ${service_subscriptions.is_active}
          OR ${subscription_month_number} <= ${service_subscriptions.months_active} + 1
          THEN ${service_subscriptions.id}
        ELSE NULL
      END ;;
  }
}
