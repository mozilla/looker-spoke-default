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

  measure: count {
    type: count
  }
}
