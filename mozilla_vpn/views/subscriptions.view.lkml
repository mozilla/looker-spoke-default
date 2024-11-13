include: "//looker-hub/mozilla_vpn/views/subscriptions.view"

view: +subscriptions {
  dimension: customer_id {
    hidden: yes
  }

  dimension: fxa_uid {
    hidden: yes
  }

  dimension: product_id {
    hidden: yes
  }

  dimension: subscription_id {
    hidden: yes
    primary_key: yes
  }

  dimension: original_subscription_id {
    hidden: yes
  }

  dimension: user_id {
    hidden: yes
  }

  dimension: country {
    hidden: yes
  }

  dimension: country_name {
    description: "Add placeholder string for null values.  This is to allow selection of Null values in country name checkbox filters in dashboards"
    sql: COALESCE(${TABLE}.country_name, 'Null') ;;
    type: string
  }

  dimension: cancel_at_period_end {
    description: "Indicates if auto-renewal was cancelled and subscription is to be cancelled at period end"
    type: yesno
    sql: ${TABLE}.cancel_at_period_end;;
  }

  dimension: canceled_for_customer_at {
    hidden: yes
  }

  dimension_group: cancel_at {
    hidden: yes
  }

  dimension_group: canceled_at {
    hidden: yes
  }

  dimension_group: original_subscription_start {
    sql: COALESCE(${TABLE}.original_subscription_start_date, ${TABLE}.subscription_start_date) ;;
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
  dimension: is_ended {
    description: "Indicates if subscription has ended"
    type: yesno
    sql: ${TABLE}.ended_at IS NOT NULL;;
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

  dimension: normalized_source {
    group_label: "Attribution"
  }

  dimension: normalized_medium {
    group_label: "Attribution"
  }

  dimension: normalized_campaign {
    group_label: "Attribution"
  }

  dimension: normalized_content {
    group_label: "Attribution"
  }

  dimension: utm_source {
    group_label: "Attribution"
  }

  dimension: utm_medium {
    group_label: "Attribution"
  }

  dimension: utm_campaign {
    group_label: "Attribution"
  }

  dimension: utm_content {
    group_label: "Attribution"
  }

  dimension: normalized_acquisition_channel {
    group_label: "Attribution"
  }

  dimension: website_channel_group {
    group_label: "Attribution"
  }

  dimension: website_channel_group {
    group_label: "Attribution"
  }

  dimension: attribution_category {
    group_label: "Attribution"
  }

  dimension: coarse_attribution_category {
    group_label: "Attribution"
  }

  dimension: canceled_for_customer {
    type: yesno
    sql: ${canceled_for_customer_at} IS NOT NULL OR ${cancel_at_period_end};;
  }

  dimension: billing_grace_period {
    description: "Interval after billing before a subscription is cancelled due to nonpayment."
    sql: ${TABLE}.billing_grace_period;;
  }

  dimension: months_retained {
    description: "Number of months between subscription start date and end date, minus billing grace period."
    type: number
    sql: ${TABLE}.months_retained;;
  }

  dimension: original_subscription_months_retained {
    description: "Number of months between the first subscription plan start date linked with the given subscription id and end date, minus billing grace period "
    type: number
    sql: ${TABLE}.original_subscription_months_retained;;
  }

  dimension: current_months_since_subscription_start {
    description: "Number of months between subscription start date and the table's last modified date, minus billing grace period."
    type: number
    sql: ${TABLE}.current_months_since_subscription_start;;
  }

  dimension: current_months_since_original_subscription_start {
    description: "Number of months between the first subscription plan start date linked with the given subscription id and the table's last modified date, minus billing grace period."
    type: number
    sql: ${TABLE}.current_months_since_original_subscription_start;;
  }

  dimension: current_months_since_cohort_complete {
    description: "Smallest possible value of current_months_since_subscription_start for this cohort (subscription start month). Used to only count complete cohorts."
    type: number
    sql: mozfun.norm.diff_months(
      start => LAST_DAY(DATE(${subscription_start_raw}), MONTH),
      `end` => DATE(${metadata.last_modified_date}),
      grace_period => INTERVAL 7 DAY,
      inclusive => FALSE
    );;
  }

  dimension: current_months_since_original_subscription_cohort_complete {
    description: "Smallest possible value of current_months_since_original_subscription_start for this cohort (subscription start month). Used to only count complete cohorts."
    type: number
    sql: mozfun.norm.diff_months(
      start => LAST_DAY(DATE(${original_subscription_start_raw}), MONTH),
      `end` => DATE(${metadata.last_modified_date}),
      grace_period => INTERVAL 7 DAY,
      inclusive => FALSE
    );;
  }

  dimension: active_dates {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${subscription_start_date}, ${end_date} - 1);;
  }

  dimension: original_subscription_active_dates {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${original_subscription_start_date}, ${end_date} - 1);;
  }

  dimension: retention {
    hidden: yes
    sql: GENERATE_ARRAY(0, ${current_months_since_subscription_start});;
  }

  dimension: original_subscription_retention {
    hidden: yes
    sql: GENERATE_ARRAY(0, ${current_months_since_original_subscription_start});;
  }

  measure: count {
    type: count
  }

  measure: annual_recurring_revenue {
    description: "Annual Recurring Revenue in USD"
    type: sum_distinct
    sql_distinct_key: ${subscription_id};;
    sql: CASE
    WHEN
      ${plan_interval} = "year"
    THEN
      1 / ${plan_interval_count}
    WHEN
      ${plan_interval} = "month"
    THEN
      12 / ${plan_interval_count}
    END * (${plan_amount} - IFNULL(${promotion_discounts_amount}, 0)) / (1 + IFNULL(${vat_rates.vat}, 0)) * IFNULL(${exchange_rates_table.price}, 1) / 100;;
    value_format: "$#,##0.00"
  }
}

view: subscriptions__active {
  dimension_group: active {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE};;
    convert_tz: no
    datatype: date
  }

  dimension: is_end_of_month {
    type: yesno
    sql: ${active_raw} = LAST_DAY(${active_raw}, MONTH) OR ${active_raw} = DATE(${metadata.last_modified_date}) - 1;;
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
    sql: COALESCE({% date_end active_date %}, ${metadata.last_modified_date})-1;;
    # Using date_start and date_end with date filters; it is NULL if active_date is not specified or open-ended.
  }

  dimension: is_max_active_date {
    type: yesno
    sql:  ${active_raw}=${max_active_date};;
  }
}

view: original_subscriptions__active {
  dimension_group: active {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE};;
    convert_tz: no
    datatype: date
  }

  dimension: is_end_of_month {
    type: yesno
    sql: ${active_raw} = LAST_DAY(${active_raw}, MONTH) OR ${active_raw} = DATE(${metadata.last_modified_date}) - 1;;
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
    sql: COALESCE({% date_end active_date %}, ${metadata.last_modified_date})-1;;
    # Using date_start and date_end with date filters; it is NULL if active_date is not specified or open-ended.
  }

  dimension: is_max_active_date {
    type: yesno
    sql:  ${active_raw}=${max_active_date};;
  }
}


view: original_subscriptions__retention {
  dimension: months_since_original_subscription_start {
    description: "Months since original subscription start date"
    type: number
    sql: ${TABLE};;
  }

  # dimension: original_subscription_id {
  #   primary_key: yes
  #   hidden: yes
  #   sql: COALESCE(${subscriptions.original_subscription_id}, ${subscriptions.subscription_id});;
  # }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${subscriptions.subscription_id} || ${months_since_original_subscription_start};;
  }

  dimension:  is_cohort_complete{
    description: "For filtering out incomplete cohorts in current month"
    type: yesno
    sql: ${original_subscriptions__retention.months_since_original_subscription_start} <= ${subscriptions.current_months_since_original_subscription_cohort_complete} ;;
  }

  dimension:  is_current_months_since_original_subscription_start{
    description: "For filtering subscriptions in current month since original subscription start"
    type: yesno
    sql: ${original_subscriptions__retention.months_since_original_subscription_start} = ${subscriptions.current_months_since_original_subscription_start} ;;
  }

  measure: churned {
    description: "Count subscriptions churned on each months_since_original_subscription_start. It is used to calculate churn rate."
    type: sum
    sql:
    CASE WHEN (${subscriptions.ended_reason} IS NULL OR ${subscriptions.ended_reason} != "Plan Change") AND ${original_subscriptions__retention.months_since_original_subscription_start} = ${subscriptions.original_subscription_months_retained} + 1
    THEN 1
    ELSE NULL
    END ;;
  }

  measure: previously_retained {
    description: "Count subscriptions previously retained on each months_since_original_subscription_start. It is used to calculate churn rate."
    type: sum
    sql:
    CASE WHEN (${subscriptions.ended_reason} IS NULL OR ${subscriptions.ended_reason} != "Plan Change") AND
    if(${original_subscriptions__retention.months_since_original_subscription_start} > 0,
  ${original_subscriptions__retention.months_since_original_subscription_start} <= ${subscriptions.original_subscription_months_retained} + 1,
  null
  )
    THEN 1
    ELSE NULL
    END ;;
  }

  measure: retained {
    description: "Count subscriptions retained for each months_since_original_subscription_start. It is a cumulative count and used to calculate retention rate."
    type: count_distinct
    sql:
    CASE WHEN (${subscriptions.ended_reason} IS NULL OR ${subscriptions.ended_reason} != "Plan Change") AND ${original_subscriptions__retention.months_since_original_subscription_start} <= ${subscriptions.original_subscription_months_retained}
    THEN COALESCE(${subscriptions.original_subscription_id},${subscriptions.subscription_id})
    ELSE NULL
    END ;;
  }

  measure: subscription_count {
    type: count_distinct
    sql: COALESCE(${subscriptions.original_subscription_id}, ${subscriptions.subscription_id}) ;;
  }

  measure: count {
    description: "Count subscriptions once for each months_since_original_subscription_start. Used to calculate average churn per month. DO NOT USE FOR RETENTION RATE, because it is cumulative and should not be averaged."
    type: count
  }

}

view: subscriptions__retention {
  dimension: months_since_subscription_start {
    description: "Months since subscription start date"
    type: number
    sql: ${TABLE};;
  }

  dimension_group: period_start {
    sql: TIMESTAMP(
      DATETIME(
        ${subscriptions.subscription_start_raw},
        ${subscriptions.plan_interval_timezone}
      ) + INTERVAL ${months_since_subscription_start} MONTH,
      ${subscriptions.plan_interval_timezone}
    );;
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

  dimension_group: period_end {
    sql: TIMESTAMP(
      DATETIME(
        ${subscriptions.subscription_start_raw},
        ${subscriptions.plan_interval_timezone}
      ) + INTERVAL ${months_since_subscription_start} + 1 MONTH,
      ${subscriptions.plan_interval_timezone}
    );;
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

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${subscriptions.subscription_id} || ${months_since_subscription_start};;
  }

  dimension:  is_cohort_complete{
    description: "For filtering out incomplete cohorts in current month"
    type: yesno
    sql: ${subscriptions__retention.months_since_subscription_start} <= ${subscriptions.current_months_since_cohort_complete} ;;
  }

  dimension:  is_current_months_since_subscription_start{
    description: "For filtering subscriptions in current month since subscription start"
    type: yesno
    sql: ${subscriptions__retention.months_since_subscription_start} = ${subscriptions.current_months_since_subscription_start} ;;
  }

  measure: churned {
    description: "Count subscriptions churned on each months_since_subscription_start. It is used to calculate churn rate."
    type: sum
    sql:
    CASE WHEN ${subscriptions__retention.months_since_subscription_start} = ${subscriptions.months_retained} + 1
    THEN 1
    ELSE NULL
    END ;;
  }

  measure: upgrade_out {
    description: "Count subscriptions loss due to upgrades on each months_since_subscription_start."
    type: sum
    sql:
    CASE WHEN ${subscriptions.ended_reason} = "Plan Change" AND ${subscriptions__retention.months_since_subscription_start} = ${subscriptions.months_retained} + 1
    THEN 1
    ELSE NULL
    END ;;
  }

  measure: previously_retained {
    description: "Count subscriptions previously retained on each months_since_subscription_start. It is used to calculate churn rate."
    type: sum
    sql:
    CASE WHEN if(
  ${subscriptions__retention.months_since_subscription_start} > 0,
  ${subscriptions__retention.months_since_subscription_start} <= ${subscriptions.months_retained} + 1,
  null
  )
    THEN 1
    ELSE NULL
    END ;;
  }

  measure: retained {
    description: "Count subscriptions retained for each months_since_subscription_start. It is a cumulative count and used to calculate retention rate."
    type: count_distinct
    sql:
    CASE WHEN ${subscriptions__retention.months_since_subscription_start} <= ${subscriptions.months_retained}
    THEN ${subscriptions.subscription_id}
    ELSE NULL
    END ;;
  }

  measure: count {
    description: "Count subscriptions once for each months_since_subscription_start. Used to calculate average churn per month. DO NOT USE FOR RETENTION RATE, because it is cumulative and should not be averaged."
    type: count
  }

}
