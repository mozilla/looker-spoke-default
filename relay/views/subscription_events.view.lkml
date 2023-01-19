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
    sql:  CASE
            WHEN ${product_name} ="Mozilla VPN & Firefox Relay" THEN CONCAT("bundle","_",${plan_interval})
            ELSE
              (CASE
                WHEN (${plan_amount} > 200 AND ${plan_interval} = "month") OR (${plan_amount}  > 1200 AND ${plan_interval} = "year") THEN CONCAT("phone","_",plan_interval)
                ELSE CONCAT("email","_",${plan_interval})
              END)
            END;;
  }

  dimension: forecast_region {
    description: "Indicates region used in financial forecasting.  This is to primarily support finance forecasting work."
    type: string
    sql: CASE
        WHEN ${pricing_plan} LIKE "%-eur-%" THEN "Europe"
        WHEN ${pricing_plan} LIKE "%-chf-%" THEN "Switzerland"
        WHEN ${pricing_plan} = "1-month-usd-4.99" THEN "Wave_1 monthly legacy only"
        ELSE "Wave_1 (excluding monthly legacy) & other"
        END;;
    hidden:  yes
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
