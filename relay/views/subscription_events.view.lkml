include: "//looker-hub/relay/views/subscription_events.view.lkml"
view: +subscription_events {

  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: plan_type {
    description: "Indicates the plan type (bundle, email month, phone year etc)"
    type: string
    sql:  CONCAT(
            CASE
              WHEN ${product_name} LIKE "%VPN%" THEN "bundle"
              WHEN (${plan_interval} = "month" AND ${plan_amount} > 400)
                OR (${plan_interval} = "year" AND ${plan_amount} > 4000)
                THEN "phone"
              ELSE "email"
            END,
            "_", ${plan_interval_count},
            "_", ${plan_interval});;
  }

  dimension: coupon_code {
    description: "The coupon code applied to a subscription."
    type: string
    sql: ${TABLE}.promotion_codes[SAFE_ORDINAL(1)] ;;
  }

  # dimension: count {
  #   hidden: yes
  # }

  measure: delta {
    type: sum
    sql: IF(${event_type} LIKE "%New%", ${count}, -${count});;
  }

}
