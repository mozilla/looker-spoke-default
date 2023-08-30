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

  dimension: service_1__id {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].id ;;
    group_label: "Service 1"
    group_item_label: "ID"
  }
  dimension: service_1__name {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].name ;;
    group_label: "Service 1"
    group_item_label: "Name"
  }
  dimension: service_1__tier {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].tier ;;
    group_label: "Service 1"
    group_item_label: "Tier"
  }

  dimension: service_2__id {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].id ;;
    group_label: "Service 2"
    group_item_label: "ID"
  }
  dimension: service_2__name {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].name ;;
    group_label: "Service 2"
    group_item_label: "Name"
  }
  dimension: service_2__tier {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].tier ;;
    group_label: "Service 2"
    group_item_label: "Tier"
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

}
