include: "//looker-hub/hubs/views/active_subscriptions.view"

view: +active_subscriptions {

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
    sql: CONCAT(${plan_interval_count}, "_", ${plan_interval});;
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

  dimension: count {
    hidden: yes
  }

  measure: count_sum {
    description: "Count"
    type: sum
    sql: ${count};;
  }

  dimension: monthly_recurring_revenue_raw {
    sql: CASE
          WHEN
            ${plan_interval} = "year"
          THEN
            1 / (12 * ${plan_interval_count})
          WHEN
            ${plan_interval} = "month"
          THEN
            1 / ${plan_interval_count}
          END * ${count} * (${plan_amount} - IFNULL(${promotion_discounts_amount}, 0)) / (1 + IFNULL(${vat_rates.vat}, 0)) * IFNULL(${exchange_rates_table.price}, 1) / 100;;
    hidden: yes
  }

  measure:  monthly_recurring_revenue {
    description: "MRR in USD"
    type: sum
    sql:  ${monthly_recurring_revenue_raw} ;;
    value_format: "$#,##0"
  }

  measure: annual_recurring_revenue {
    description: "ARR in USD"
    type: sum
    sql:  ${monthly_recurring_revenue_raw} * 12;;
    value_format: "$#,##0"
  }

}
