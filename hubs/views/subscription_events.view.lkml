include: "//looker-hub/hubs/views/subscription_events.view"

view: +subscription_events {

  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: plan_interval_type {
    description: "Indicates the plan interval type (1 year, 6 month, 1 month, etc)"
    type: string
    sql: CONCAT(${plan_interval_count}, "_", ${plan_interval});;
  }

  dimension: coupon_code {
    description: "The coupon code applied to a subscription."
    type: string
    sql: ${TABLE}.promotion_codes[SAFE_ORDINAL(1)] ;;
  }

  dimension: count {
    hidden: yes
  }

  measure: delta {
    type: sum
    sql: IF(${event_type} LIKE "%New%", ${count}, -${count});;
  }
}
