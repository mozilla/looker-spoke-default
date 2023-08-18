include: "//looker-hub/subscription_platform/views/monthly_active_logical_subscriptions.view.lkml"

view: +monthly_active_logical_subscriptions {

  dimension: id {
    primary_key: yes
    hidden: yes
  }

  dimension_group: month {
    type: time
    sql: ${TABLE}.month_start_date
    datatype: date
    timeframes: [month, quarter, year]
  }
  dimension_group: month_start {
    datatype: date
  }
  dimension_group: month_end {
    datatype: date
  }

  dimension: logical_subscriptions_history_id {
    hidden: yes
  }

  dimension: subscription__provider_subscription_item_id {
    hidden: yes
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

  dimension: subscription__service_1__id {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].id ;;
  }
  dimension: subscription__service_1__name {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].name ;;
  }
  dimension: subscription__service_1__tier {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(1)].tier ;;
  }

  dimension: subscription__service_2__id {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].id ;;
  }
  dimension: subscription__service_2__name {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].name ;;
  }
  dimension: subscription__service_2__tier {
    type: string
    sql: ${TABLE}.subscription.services[SAFE_ORDINAL(2)].tier ;;
  }

  dimension: subscription__plan_interval_type {
    hidden: yes
  }
  dimension: subscription__plan_interval_count {
    hidden: yes
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

}
