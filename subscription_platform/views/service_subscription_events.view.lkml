include: "//looker-hub/subscription_platform/views/service_subscription_events.view.lkml"

view: +service_subscription_events {
  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension_group: timestamp {
    label: "Event Timestamp"
  }
  dimension: type {
    group_label: "Event"
  }
  dimension: reason {
    group_label: "Event"
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
    sql_end: COALESCE(${TABLE}.subscription.ended_at, ${TABLE}.timestamp) ;;
    intervals: [day, week, month, quarter, year]
  }

  dimension: old_subscription__id {
    hidden: yes
  }
  dimension: old_subscription__provider {
    hidden: yes
  }
  dimension: old_subscription__payment_provider {
    hidden: yes
  }
  dimension: old_subscription__logical_subscription_id {
    hidden: yes
  }
  dimension: old_subscription__provider_subscription_id {
    hidden: yes
  }
  dimension: old_subscription__provider_subscription_item_id {
    hidden: yes
  }
  dimension_group: old_subscription__provider_subscription_created_at {
    hidden: yes
  }
  dimension: old_subscription__provider_customer_id {
    hidden: yes
  }
  dimension: old_subscription__mozilla_account_id_sha256 {
    hidden: yes
  }
  dimension: old_subscription__customer_logical_subscription_number {
    hidden: yes
  }
  dimension: old_subscription__customer_service_subscription_number {
    hidden: yes
  }

  dimension: old_subscription__country_code {
    map_layer_name: countries
  }
  dimension: old_subscription__country_name {
    map_layer_name: countries
  }

  dimension: old_subscription__service__id {
    group_label: "Old Subscription"
    group_item_label: "Service ID"
  }
  dimension: old_subscription__service__name {
    group_label: "Old Subscription"
    group_item_label: "Service Name"
  }
  dimension: old_subscription__service__tier {
    group_label: "Old Subscription"
    group_item_label: "Service Tier"
  }

  dimension: old_subscription__other_services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.old_subscription.other_services) ;;
    group_label: "Old Subscription"
    group_item_label: "Other Services Quantity"
  }

  dimension: old_subscription__provider_product_id {
    group_label: "Old Subscription Provider IDs"
    group_item_label: "Product ID"
  }

  dimension: old_subscription__provider_plan_id {
    group_label: "Old Subscription Provider IDs"
    group_item_label: "Plan ID"
  }
  dimension: old_subscription__plan_interval_type {
    hidden: yes
  }
  dimension: old_subscription__plan_interval_count {
    hidden: yes
  }
  dimension: old_subscription__plan_amount {
    value_format_name: decimal_2
  }

  dimension_group: old_subscription__logical_subscription_started_at {
    hidden: yes
  }
  dimension_group: old_subscription__started_at {
    hidden: yes
  }
  dimension_group: old_subscription__ended_at {
    hidden: yes
  }

  dimension_group: old_subscription__first_touch_attribution__impression_at {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__entrypoint {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__entrypoint_experiment {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__entrypoint_variation {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__utm_campaign {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__utm_content {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__utm_medium {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__utm_source {
    hidden: yes
  }
  dimension: old_subscription__first_touch_attribution__utm_term {
    hidden: yes
  }

  dimension_group: old_subscription__last_touch_attribution__impression_at {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__entrypoint {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__entrypoint_experiment {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__entrypoint_variation {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__utm_campaign {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__utm_content {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__utm_medium {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__utm_source {
    hidden: yes
  }
  dimension: old_subscription__last_touch_attribution__utm_term {
    hidden: yes
  }

  measure: event_count {
    type: count
  }

  measure: service_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.id ;;
  }

  measure: net_service_subscription_count {
    type: sum
    sql:
      CASE ${TABLE}.type
        WHEN 'Subscription Start' THEN 1
        WHEN 'Subscription End' THEN -1
        ELSE 0
      END ;;
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
}
