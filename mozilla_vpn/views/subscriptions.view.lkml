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
      WHEN ${provider} LIKE "Apple Store IAP" THEN "Cancelled by IAP"
      WHEN ${canceled_for_customer} THEN "Cancelled by Customer"
      ELSE "Payment Failed"
      END;;
  }

  dimension: billing_grace_period {
    type: number
    sql: 1;;
  }

  dimension: months_active {
    type: number
    # month is timezone sensitive, so use localized datetime to calculate months
    sql: mozfun.norm.subscription_months_renewed(
      DATETIME(${subscription_start_raw}, ${plan_interval_timezone}),
      DATETIME(${end_raw}, ${plan_interval_timezone}),
      ${billing_grace_period}
    );;
  }

  dimension: current_timestamp_limit {
    hidden: yes
    description: "Maximum possible timestamp for which data is available. Assumes ETL is complete up to CURRENT_DATE."
    sql: DATETIME_SUB(TIMESTAMP(CURRENT_DATE), INTERVAL 1 MICROSECOND);;
  }

  dimension: current_age_in_months {
    description: "Number of months since subscription start date for which data is available. Assumes ETL is complete up to CURRENT_DATE."
    type: number
    # month is timezone sensitive, so use localized datetime to calculate months
    sql: mozfun.norm.subscription_months_renewed(
      DATETIME(${subscription_start_raw}, ${plan_interval_timezone}),
      DATETIME(${current_timestamp_limit}, ${plan_interval_timezone}),
      ${billing_grace_period}
    );;
  }

  dimension: active_dates {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${subscription_start_date}, ${end_date} - 1);;
  }

  dimension: events {
    hidden: yes
    sql:
      [
        STRUCT(
          ${subscription_start_date} AS date,
          "New" AS type,
          IF(${subscription_start_date} = ${customer_start_date}, "New", "Resurrected") AS granular_type,
          1 AS delta
        ),
        STRUCT(
          ${end_date} AS date,
          "Cancelled" AS type,
          ${cancel_reason} AS granular_type,
          -1 AS delta
        )
      ];;
  }

  dimension: retention {
    hidden: yes
    sql: GENERATE_ARRAY(0, ${current_age_in_months});;
  }

  measure: count {
    type: count
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
  dimension: age_in_months {
    description: "months since subscription start date"
    type: number
    sql: ${TABLE};;
  }

  dimension_group: period_start {
    sql: TIMESTAMP(
      DATETIME_ADD(
        DATETIME(${subscriptions.subscription_start_raw}, ${subscriptions.plan_interval_timezone}),
        INTERVAL ${age_in_months} MONTH
      ),
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
      DATETIME_ADD(
        DATETIME(${subscriptions.subscription_start_raw}, ${subscriptions.plan_interval_timezone}),
        INTERVAL ${age_in_months} + 1 MONTH
      ),
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
    sql: ${subscriptions.subscription_id} || ${age_in_months};;
  }

  measure: count {
    type: count
  }
}
