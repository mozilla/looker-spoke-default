include: "//looker-hub/subscription_platform/views/stripe_subscriptions.view.lkml"

view: +stripe_subscriptions {
  dimension: id {
    primary_key: yes
  }

  dimension: customer__address__country {
    map_layer_name: countries
  }

  dimension: customer__metadata__userid_sha256 {
    hidden: yes
  }

  dimension: customer__shipping__address__country {
    map_layer_name: countries
  }

  dimension: default_tax_rates_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.default_tax_rates) ;;
  }

  dimension: items_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.items) ;;
  }

  dimension_group: active {
    type: duration
    sql_start: ${TABLE}.start_date ;;
    sql_end: COALESCE(${TABLE}.ended_at, TIMESTAMP(CURRENT_DATE())) ;;
    intervals: [day, week, month, quarter, year]
  }

  measure: count {
    type: count
  }

  measure: customer_count {
    type: count_distinct
    sql:
      COALESCE(
        ${TABLE}.customer.metadata.userid_sha256,
        ${TABLE}.customer.id,
        ${TABLE}.id
      ) ;;
  }
}

view: +stripe_subscriptions__items {
  dimension: id {
    primary_key: yes
  }

  measure: count {
    type: count
  }
}
