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

  dimension: months_retained {
    type: number
    sql: mozfun.norm.subscription_months_renewed(
      -- month is timezone sensitive, so use localized datetime to calculate monthly retention
      DATETIME(${subscription_start_raw}, ${plan_interval_timezone}),
      DATETIME(${end_raw}, ${plan_interval_timezone}),
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
    sql: GENERATE_ARRAY(0, ${months_retained});;
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
  dimension: retention_month {
    type: number
    sql: ${TABLE};;
  }

  dimension_group: period_start {
    sql: TIMESTAMP(
      DATETIME_ADD(
        DATETIME(${subscriptions.subscription_start_raw}, ${subscriptions.plan_interval_timezone}),
        INTERVAL ${retention_month} MONTH
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
        INTERVAL ${retention_month} + 1 MONTH
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

  dimension: retention_type {
    sql:
    IF(${retention_month} = 0, "first month", "subsequent months");;
  }

  dimension: period_end_7_day_window {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${period_end_date}, ${period_end_date} + 6);;
  }

  measure: retained {
    description: "Subscriptions retained past the end of the 0-based retention_month"
    type: number
    sql: COUNTIF(${retention_month} < ${subscriptions.months_retained});;
  }
}
