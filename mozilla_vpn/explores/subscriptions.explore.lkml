include: "../views/subscriptions.view"
include: "../views/devices.view"

explore: subscriptions {

  join: devices {
    relationship: many_to_one
    sql_on: ${devices.user_id} = ${user_id};;
  }

  join: active_subscriptions {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS active_subscriptions;;
    relationship: one_to_many
    sql_where: ${active_subscriptions.active_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }

  join: subscription_events {
    view_label: "Subscription Events"
    sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscription_events;;
    relationship: one_to_many
    sql_where: ${subscription_events.event_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }

  join: retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS retention;;
    relationship: one_to_many
    sql_where: ${retention.period_end_date} < CURRENT_DATE - ${subscriptions.billing_grace_period};;
  }

  join: retention_period_end_7_day_aggregate {
    view_label: "Retention Period End Date: 7-day Aggregate"
    sql: CROSS JOIN UNNEST(${retention.period_end_7_day_window}) AS retention_period_end_7_day_aggregate;;
    relationship: one_to_many
    sql_where: ${retention_period_end_7_day_aggregate.aggregate_raw} BETWEEN "2020-07-01" AND CURRENT_DATE;;
  }
}

view: +subscriptions {

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
}

view: active_subscriptions {
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

view: subscription_events {
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
    type: sum
    sql: ${TABLE}.delta;;
  }
}

view: retention {
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
    IF(${retention_month} = 0, 'first month', 'subsequent months');;
  }

  dimension: period_end_7_day_window {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${period_end_date}, ${period_end_date} + 6);;
  }

  measure: retained {
    type: number
    sql: COUNTIF(${retention_month} < ${subscriptions.months_retained});;
  }

  measure: retention_rate {
    value_format: "0.00%"
    type: number
    sql: ${retained}/${subscriptions.count};;
  }
}

view: retention_period_end_7_day_aggregate {
  dimension_group: aggregate {
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
