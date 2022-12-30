view: relay_active_subscriptions_table {
  sql_table_name: `mozdata.tmp.yeonjoo_relay_active_subscriptions` ;;

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

  # dimension: promotion_discounts_amount {
  #   sql: ${TABLE}.promotion_discounts_amount ;;
  #   type: number
  # }

  dimension: provider {
    sql: ${TABLE}.provider ;;
    type: string
  }

  dimension: status {
    sql: ${TABLE}.status ;;
    type: string
  }

  dimension_group: active {
    sql: ${TABLE}.active_date ;;
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

  dimension: is_end_of_month {
    type: yesno
    sql: ${active_raw} = LAST_DAY(${active_raw}, MONTH) OR ${active_raw}=${max_active_date};;
  }

  dimension: is_end_of_quarter {
    type: yesno
    sql: ${active_raw} = LAST_DAY(${active_raw}, QUARTER) OR ${active_raw} = DATE(${metadata.last_modified_date}) - 1;;
  }

  dimension: is_end_of_year {
    type: yesno
    sql: ${active_raw} = LAST_DAY(${active_raw}, YEAR) OR ${active_raw} = DATE(${metadata.last_modified_date}) - 1;;
  }

  dimension: max_active_date {
    description: "Get max active date from end date in active date filter.  If null, use last modified date."
    hidden: yes
    type: date
    sql: LEAST(
      IFNULL({% date_end active_date %}, ${metadata.last_modified_date}),
      ${metadata.last_modified_date}
    )-1 ;;
  }

  dimension: is_max_active_date {
    type: yesno
    sql:  ${active_raw}=${max_active_date};;
  }

  dimension: plan_interval_type {
    description: "Indicates the plan interval type (1 year, 6 month, 1 month, etc)"
    type: string
    sql: CASE WHEN ${product_name} = "Mozilla VPN & Firefox Relay" THEN CONCAT("bundle","_", ${plan_interval})
      ELSE CONCAT(${plan_interval_count},"_",  ${plan_interval}) END;;
  }

  dimension: promotion_discounts_amount {
    group_label: "Coupon"
    description: "The discounted amount applied to a subscription."
    type: string
    sql: ${TABLE}.promotion_discounts_amount ;;
  }

  dimension: coupon_code {
    group_label: "Coupon"
    description: "The coupon code applied to a subscription."
    type: string
    sql: ${TABLE}.promotion_codes[SAFE_ORDINAL(1)] ;;
  }

  # dimension: count {
  #   hidden: yes
  # }

  measure: count_sum {
    description: "Count"
    type: sum
    sql: ${count};;
  }

  dimension: normalized_plan_amount {
    description: "Plan amount (inc. USD estimate for Apple based on pricing plan)"
    sql: IFNULL(${plan_amount},
      CASE
        WHEN
          ${pricing_plan} = "1-year-apple"
        THEN
          5988
        WHEN
          ${pricing_plan} = "6-month-apple"
        THEN
          4194
        WHEN
          ${pricing_plan} = "1-month-apple"
        THEN
          999
        ELSE
          NULL
        END);;
  }

  dimension: monthly_recurring_revenue_raw {
    sql: CASE
          WHEN
            ${plan_interval} = "year"
          THEN
            1 / 12 * ${plan_interval_count}
          WHEN
            ${plan_interval} = "month"
          THEN
            1 / ${plan_interval_count}
          END * ${count} * (${normalized_plan_amount} - IFNULL(${promotion_discounts_amount}, 0)) / (1 + IFNULL(${vat_rates.vat}, 0)) * IFNULL(${exchange_rates_table.price}, 1) / 100;;
    hidden: yes
  }

  measure:  monthly_recurring_revenue {
    description: "MRR in USD (includes estimate for Apple subscriptions)"
    type: sum
    sql:  ${monthly_recurring_revenue_raw} ;;
    value_format: "$#,##0"
  }


  measure: annual_recurring_revenue {
    description: "ARR in USD (includes estimate for Apple subscriptions)"
    type: sum
    sql:  ${monthly_recurring_revenue_raw} * 12;;
    value_format: "$#,##0"
  }

}
