view: relay_subscription_events_table {
  sql_table_name: `mozdata.tmp.yeonjoo_relay_subscription_events`;;
###############dimensions should be defined from looker hub view files################

  dimension: count {
    sql: ${TABLE}.count ;;
    type: number
    hidden: yes
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    map_layer_name: countries
  }

  # dimension: country_name {
  #   sql: ${TABLE}.country_name ;;
  #   type: string
  # }

  dimension: event_type {
    sql: ${TABLE}.event_type ;;
    type: string
  }

  dimension: granular_event_type {
    sql: ${TABLE}.granular_event_type ;;
    type: string
  }

  dimension: plan_amount {
    sql: ${TABLE}.plan_amount ;;
    type: number
  }

  dimension: plan_currency {
    sql: ${TABLE}.plan_currency ;;
    type: string
  }

  dimension: plan_id {
    sql: ${TABLE}.plan_id ;;
    type: string
  }

  dimension: plan_interval {
    sql: ${TABLE}.plan_interval ;;
    type: string
  }

  dimension: plan_interval_count {
    sql: ${TABLE}.plan_interval_count ;;
    type: number
  }

  dimension: pricing_plan {
    sql: ${TABLE}.pricing_plan ;;
    type: string
  }

  dimension: product_id {
    sql: ${TABLE}.product_id ;;
    type: string
  }

  dimension: product_name {
    sql: ${TABLE}.product_name ;;
    type: string
  }

  dimension: promotion_codes {
    sql: ${TABLE}.promotion_codes ;;
    hidden: yes
  }

  dimension: provider {
    sql: ${TABLE}.provider ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.status ;;
    type: string
  }

  dimension_group: event {
    sql: ${TABLE}.event_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }
###############dimensions should be defined from looker hub view files################
  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: plan_interval_type {
    description: "Indicates the plan interval type (1 year, 6 month, 1 month, etc)"
    type: string
    sql: sql: CASE WHEN ${product_name} = "Mozilla VPN & Firefox Relay" THEN CONCAT("bundle","_", ${plan_interval})
      ELSE CONCAT(${plan_interval_count},"_",  ${plan_interval}) END;;
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

# view: relay_subscription_events_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
