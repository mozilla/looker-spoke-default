include: "//looker-hub/subscription_platform/views/logical_subscriptions.view.lkml"

view: +logical_subscriptions {
  dimension: id {
    primary_key: yes
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

  dimension: services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.services) ;;
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

  dimension: first_touch_attribution__utm_campaign {
    group_item_label: "UTM Campaign"
  }
  dimension: first_touch_attribution__utm_content {
    group_item_label: "UTM Content"
  }
  dimension: first_touch_attribution__utm_medium {
    group_item_label: "UTM Medium"
  }
  dimension: first_touch_attribution__utm_source {
    group_item_label: "UTM Source"
  }
  dimension: first_touch_attribution__utm_term {
    group_item_label: "UTM Term"
  }

  dimension: last_touch_attribution__utm_campaign {
    group_item_label: "UTM Campaign"
  }
  dimension: last_touch_attribution__utm_content {
    group_item_label: "UTM Content"
  }
  dimension: last_touch_attribution__utm_medium {
    group_item_label: "UTM Medium"
  }
  dimension: last_touch_attribution__utm_source {
    group_item_label: "UTM Source"
  }
  dimension: last_touch_attribution__utm_term {
    group_item_label: "UTM Term"
  }

  measure: logical_subscription_count {
    type: count
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
    sql:
      CASE
        WHEN ${is_active}
          AND ${auto_renew}
          AND ${plan_currency} = 'USD'
          THEN
            CASE ${plan_interval_type}
              WHEN 'year'
                THEN ${plan_amount} / ${plan_interval_count}
              WHEN 'month'
                THEN ${plan_amount} / ${plan_interval_count} * 12
              WHEN 'week'
                THEN ${plan_amount} / ${plan_interval_count} * 52
              WHEN 'day'
                THEN ${plan_amount} / ${plan_interval_count} * 365
            END
        ELSE NULL
      END ;;
    value_format_name: usd
  }
}

view: logical_subscriptions__retention_by_month {
  dimension: subscription_month_number {
    type: number
    sql: ${TABLE} ;;
  }

  dimension: is_start_month_cohort_complete {
    type: yesno
    sql: ${subscription_month_number} <= ${logical_subscriptions.months_since_start_month_ended} ;;
  }

  measure: churned_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN NOT ${logical_subscriptions.is_active}
          AND ${subscription_month_number} = ${logical_subscriptions.months_active} + 1
          THEN ${logical_subscriptions.id}
        ELSE NULL
      END ;;
  }

  measure: retained_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN ${logical_subscriptions.is_active}
          OR ${subscription_month_number} <= ${logical_subscriptions.months_active}
          THEN ${logical_subscriptions.id}
        ELSE NULL
      END ;;
  }

  measure: previously_retained_subscription_count {
    type: count_distinct
    sql:
      CASE
        WHEN ${logical_subscriptions.is_active}
          OR ${subscription_month_number} <= ${logical_subscriptions.months_active} + 1
          THEN ${logical_subscriptions.id}
        ELSE NULL
      END ;;
  }
}
