view: stripe_plans {
  sql_table_name: `mozdata.stripe.plans`;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active;;
  }

  dimension: aggregate_usage {
    hidden: yes
    type: string
    sql: ${TABLE}.aggregate_usage;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount;;
  }

  dimension: amount_decimal {
    type: string
    sql: ${TABLE}.amount_decimal;;
  }

  dimension: billing_scheme {
    type: string
    sql: ${TABLE}.billing_scheme;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency;;
  }

  dimension_group: modified {
    # this field is renamed to make the meaning more clean in context
    sql: ${TABLE}.event_timestamp;;
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: interval {
    type: string
    sql: ${TABLE}.`interval`;;
  }

  dimension: interval_count {
    type: number
    sql: ${TABLE}.interval_count;;
  }

  dimension: livemode {
    hidden: yes
    type: yesno
    sql: ${TABLE}.livemode;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata;;
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname;;
  }

  dimension: object {
    hidden: yes
    type: string
    sql: ${TABLE}.object;;
  }

  dimension: product {
    hidden: yes
    type: string
    sql: ${TABLE}.product;;
  }

  dimension: tiers {
    hidden: yes
    sql: ${TABLE}.tiers;;
  }

  dimension: tiers_mode {
    type: string
    sql: ${TABLE}.tiers_mode;;
  }

  dimension: transform_usage__divide_by {
    type: number
    sql: ${TABLE}.transform_usage.divide_by;;
    group_label: "Transform Usage"
    group_item_label: "Divide By"
  }

  dimension: transform_usage__round {
    type: string
    sql: ${TABLE}.transform_usage.round;;
    group_label: "Transform Usage"
    group_item_label: "Round"
  }

  dimension: trial_period_days {
    type: number
    sql: ${TABLE}.trial_period_days;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}.usage_type;;
  }
}

# view: stripe_plans__tiers {
#   dimension: flat_amount {
#     type: number
#     sql: ${TABLE}.flat_amount;;
#   }

#   dimension: flat_amount_decimal {
#     type: string
#     sql: ${TABLE}.flat_amount_decimal;;
#   }

#   dimension: unit_amount {
#     type: number
#     sql: ${TABLE}.unit_amount;;
#   }

#   dimension: unit_amount_decimal {
#     type: string
#     sql: ${TABLE}.unit_amount_decimal;;
#   }

#   dimension: up_to {
#     type: number
#     sql: ${TABLE}.up_to;;
#   }
# }
