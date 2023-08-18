include: "//looker-hub/subscription_platform/views/logical_subscription_events.view.lkml"

view: +logical_subscription_events {

  dimension: id {
    primary_key: yes
    hidden: yes
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

  dimension: old_subscription__service_1__id {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].id ;;
  }
  dimension: old_subscription__service_1__name {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].name ;;
  }
  dimension: old_subscription__service_1__tier {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(1)].tier ;;
  }

  dimension: old_subscription__service_2__id {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].id ;;
  }
  dimension: old_subscription__service_2__name {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].name ;;
  }
  dimension: old_subscription__service_2__tier {
    type: string
    sql: ${TABLE}.old_subscription.services[SAFE_ORDINAL(2)].tier ;;
  }

  dimension: old_subscription__plan_interval_type {
    hidden: yes
  }
  dimension: old_subscription__plan_interval_count {
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
