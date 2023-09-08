include: "//looker-hub/subscription_platform/views/logical_subscription_events.view.lkml"

view: +logical_subscription_events {

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

  dimension: subscription__service_1__id {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].id ;;
    group_label: "Subscription Service 1"
    group_item_label: "ID"
  }
  dimension: subscription__service_1__name {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].name ;;
    group_label: "Subscription Service 1"
    group_item_label: "Name"
  }
  dimension: subscription__service_1__tier {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].tier ;;
    group_label: "Subscription Service 1"
    group_item_label: "Tier"
  }

  dimension: subscription__service_2__id {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].id ;;
    group_label: "Subscription Service 2"
    group_item_label: "ID"
  }
  dimension: subscription__service_2__name {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].name ;;
    group_label: "Subscription Service 2"
    group_item_label: "Name"
  }
  dimension: subscription__service_2__tier {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].tier ;;
    group_label: "Subscription Service 2"
    group_item_label: "Tier"
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

  dimension: old_subscription__id {
    hidden: yes
  }
  dimension: old_subscription__provider {
    hidden: yes
  }
  dimension: old_subscription__payment_provider {
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
  dimension: old_subscription__mozilla_account_id {
    group_item_label: "Mozilla Account ID"
  }
  dimension: old_subscription__mozilla_account_id_sha256 {
    hidden: yes
  }
  dimension: old_subscription__customer_subscription_number {
    hidden: yes
  }

  dimension: old_subscription__country_code {
    map_layer_name: countries
  }
  dimension: old_subscription__country_name {
    map_layer_name: countries
  }

  dimension: old_subscription__services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.old_subscription.services) ;;
    group_label: "Old Subscription"
    group_item_label: "Services Quantity"
  }

  dimension: old_subscription__service_1__id {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].id ;;
    group_label: "Old Subscription Service 1"
    group_item_label: "ID"
  }
  dimension: old_subscription__service_1__name {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].name ;;
    group_label: "Old Subscription Service 1"
    group_item_label: "Name"
  }
  dimension: old_subscription__service_1__tier {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].tier ;;
    group_label: "Old Subscription Service 1"
    group_item_label: "Tier"
  }

  dimension: old_subscription__service_2__id {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].id ;;
    group_label: "Old Subscription Service 2"
    group_item_label: "ID"
  }
  dimension: old_subscription__service_2__name {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].name ;;
    group_label: "Old Subscription Service 2"
    group_item_label: "Name"
  }
  dimension: old_subscription__service_2__tier {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].tier ;;
    group_label: "Old Subscription Service 2"
    group_item_label: "Tier"
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

  measure: logical_subscription_count {
    type: count_distinct
    sql: ${TABLE}.subscription.id ;;
  }

  measure: net_logical_subscription_count {
    type: sum
    sql:
      CASE ${TABLE}.type
        WHEN 'Subscription Start' THEN 1
        WHEN 'Subscription End' THEN -1
        ELSE 0
      END ;;
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
