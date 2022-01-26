include: "//looker-hub/mozilla_vpn/views/subscriptions.view"

view: +subscriptions {
  dimension: customer_id {
    hidden: yes
  }

  dimension: fxa_uid {
    hidden: yes
  }

  dimension: plan_id {
    hidden: yes
  }

  dimension: product_id {
    hidden: yes
  }

  dimension: subscription_id {
    hidden: yes
    primary_key: yes
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
    hidden: yes
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

  dimension: cancel_reason {
    type: string
    sql: CASE
      WHEN ${provider} LIKE "Apple Store%" THEN "Cancelled by IAP"
      WHEN ${canceled_for_customer} THEN "Cancelled by Customer"
      ELSE "Payment Failed"
      END;;
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

  dimension: current_months_since_subscription_start {
    description: "Number of months between subscription start date and the table's last modified date, minus billing grace period."
    type: number
    sql: ${TABLE}.current_months_since_subscription_start;;
  }

  dimension: current_months_since_cohort_complete {
    description: "Smallest possible value of current_months_since_subscription_start for this cohort (subscription start month). Used to only count complete cohorts."
    type: number
    sql: mozfun.norm.diff_months(
      start => LAST_DAY(DATE(${subscriptions.subscription_start_raw}), MONTH),
      `end` => DATE(${metadata.last_modified_date}),
      grace_period => ${subscriptions.billing_grace_period},
      inclusive => FALSE
    );;
  }

  dimension: active_dates {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${subscription_start_date}, ${end_date} - 1);;
  }

  dimension: events {
    hidden: yes
    sql:
      ARRAY_CONCAT(
        [
          STRUCT(
            ${subscription_start_date} AS date,
            "New" AS type,
            IF(${subscription_start_date} = ${customer_start_date}, "New", "Resurrected") AS granular_type,
            1 AS delta
          )
        ],
        IF(
          ${end_date} < DATE(${metadata.last_modified_date}),
          [
            STRUCT(
              ${end_date} AS date,
              "Cancelled" AS type,
              ${cancel_reason} AS granular_type,
              -1 AS delta
            )
          ],
          []
        )
      );;
  }

  dimension: retention {
    hidden: yes
    sql: GENERATE_ARRAY(0, ${current_months_since_subscription_start});;
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
    END * ${plan_amount} * (1 - IFNULL(${vat_rates.vat}, 0)) * IFNULL(${exchange_rates_table.price}, 1) / 100;;
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
  }

  dimension: is_max_active_date {
    type: yesno
    sql:  ${active_raw}=${max_active_date};;
  }
}

view: subscriptions__events {
  dimension_group: event {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date;;
    convert_tz: no
    datatype: date
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type;;
  }

  dimension: granular_type {
    type: string
    sql: ${TABLE}.granular_type;;
  }

  measure: delta {
    description: "Net change in subscription count"
    type: sum
    sql: ${TABLE}.delta;;
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
