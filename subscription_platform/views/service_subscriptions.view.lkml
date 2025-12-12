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
  dimension: country_vat_rate {
    label: "Country VAT Rate"
    value_format_name: percent_2
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
  dimension: plan_amount_usd {
    label: "Plan Amount (USD)"
    value_format_name: usd
  }
  dimension: plan_currency_usd_exchange_rate {
    label: "Plan Currency USD Exchange Rate"
    value_format_name: percent_4
  }

  dimension: current_period_discount_amount_usd {
    label: "Current Period Discount Amount (USD)"
    value_format_name: usd
  }
  dimension: ongoing_discount_amount_usd {
    label: "Ongoing Discount Amount (USD)"
    value_format_name: usd
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

  dimension: annual_recurring_revenue_usd {
    label: "Annual Recurring Revenue (USD)"
    value_format_name: usd
  }

  dimension: monthly_recurring_revenue_usd {
    label: "Monthly Recurring Revenue (USD)"
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
    sql_distinct_key: ${logical_subscription_id} ;;
    sql: ${annual_recurring_revenue_usd} ;;
    value_format_name: usd
  }

  measure: total_monthly_recurring_revenue_usd {
    label: "Total Monthly Recurring Revenue (USD)"
    type: sum_distinct
    sql_distinct_key: ${logical_subscription_id} ;;
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
