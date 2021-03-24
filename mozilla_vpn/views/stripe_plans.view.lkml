view: stripe_plans {
  dimension: active {
    sql: ${TABLE}.active ;;
    type: yesno
  }

  dimension: aggregate_usage {
    sql: ${TABLE}.aggregate_usage ;;
    type: string
  }

  dimension: amount {
    sql: ${TABLE}.amount ;;
    type: number
  }

  dimension: amount_decimal {
    sql: ${TABLE}.amount_decimal ;;
    type: string
  }

  dimension: billing_scheme {
    sql: ${TABLE}.billing_scheme ;;
    type: string
  }

  dimension: currency {
    sql: ${TABLE}.currency ;;
    type: string
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: string
    primary_key: yes
    hidden: yes
  }

  dimension: interval {
    sql: ${TABLE}.interval ;;
    type: string
  }

  dimension: interval_count {
    sql: ${TABLE}.interval_count ;;
    type: number
  }

  dimension: livemode {
    sql: ${TABLE}.livemode ;;
    type: yesno
  }

  dimension: metadata {
    sql: ${TABLE}.metadata ;;
    hidden: yes
  }

  dimension: nickname {
    sql: ${TABLE}.nickname ;;
    type: string
  }

  dimension: object {
    sql: ${TABLE}.object ;;
    type: string
  }

  dimension: product {
    sql: ${TABLE}.product ;;
    type: string
  }

  dimension: tiers {
    sql: ${TABLE}.tiers ;;
    hidden: yes
  }

  dimension: tiers_mode {
    sql: ${TABLE}.tiers_mode ;;
    type: string
  }

  dimension: transform_usage__divide_by {
    sql: ${TABLE}.transform_usage.divide_by ;;
    type: number
    group_label: "Transform Usage"
    group_item_label: "Divide By"
  }

  dimension: transform_usage__round {
    sql: ${TABLE}.transform_usage.round ;;
    type: string
    group_label: "Transform Usage"
    group_item_label: "Round"
  }

  dimension: trial_period_days {
    sql: ${TABLE}.trial_period_days ;;
    type: number
  }

  dimension: usage_type {
    sql: ${TABLE}.usage_type ;;
    type: string
  }

  dimension_group: created {
    sql: ${TABLE}.created ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension_group: event {
    sql: ${TABLE}.event_timestamp ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  measure: count {
    type: count
  }

  sql_table_name: `mozdata.stripe.plans` ;;
}
