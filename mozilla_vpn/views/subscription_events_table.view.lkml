include: "//looker-hub/mozilla_vpn/views/subscription_events_table.view"

view: +subscription_events_table {

  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: plan_interval_type {
    description: "Indicates the plan interval type (1 year, 6 month, 1 month, etc)"
    type: string
    sql: CONCAT(IF(${product_name} LIKE "%Relay%", CONCAT("bundle", "_"), ""), ${plan_interval_count}, "_", ${plan_interval});;
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
