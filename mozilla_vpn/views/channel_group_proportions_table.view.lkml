include: "//looker-hub/mozilla_vpn/views/channel_group_proportions_table.view"
view: +channel_group_proportions_table {
  measure: new_subscription_count{
    type: sum
    sql: ${TABLE}.new_subscriptions ;;
  }

  measure: total_channel_group_percent_for_date {
    sql: ${TABLE}.channel_group_percent_of_total_for_date ;;
    type: average
  }

  measure: total_new_subscription_count_for_date {
    sql: ${TABLE}.total_new_subscriptions_for_date ;;
    type: average
  }

  dimension: coupon_code {
    sql: ${TABLE}.promotion_codes[SAFE_ORDINAL(1)] ;;
  }

  dimension: plan_group {
    description: "Indicates the plan interval type (1 year, 6 month, 1 month, etc)"
    type: string
    sql: CONCAT(IF(${product_name} LIKE "%Relay%", CONCAT("bundle", "_"), ""),regexp_extract(${TABLE}.pricing_plan,r'^[0-9]-[a-z]+') );;
  }

  dimension: new_subscriptions{
    hidden: yes
  }

  dimension: channel_group_percent_of_total_for_date {
    hidden: yes
  }

  dimension: total_new_subscriptions_for_date {
    hidden: yes
  }

}
