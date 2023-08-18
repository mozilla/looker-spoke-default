include: "//looker-hub/subscription_platform/views/logical_subscriptions.view.lkml"

view: +logical_subscriptions {

  dimension: id {
    primary_key: yes
  }

  dimension: provider_subscription_item_id {
    hidden: yes
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

  dimension: service_1__id {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].id ;;
  }
  dimension: service_1__name {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].name ;;
  }
  dimension: service_1__tier {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(1)].tier ;;
  }

  dimension: service_2__id {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].id ;;
  }
  dimension: service_2__name {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].name ;;
  }
  dimension: service_2__tier {
    type: string
    sql: ${TABLE}.services[SAFE_ORDINAL(2)].tier ;;
  }

  dimension: plan_interval_type {
    hidden: yes
  }
  dimension: plan_interval_count {
    hidden: yes
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
