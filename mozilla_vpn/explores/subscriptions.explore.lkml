include: "../views/subscriptions.view"
include: "../views/devices.view"

explore: subscriptions {

  join: devices {
    relationship: many_to_one
    sql_on: ${devices.user_id} = ${user_id};;
  }

  join: subscriptions__active {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    relationship: one_to_many
    sql_where: ${subscriptions__active.active_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }

  join: subscriptions__events {
    view_label: "Subscription Events"
    sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
    relationship: one_to_many
    sql_where: ${subscriptions__events.event_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }

  join: subscriptions__retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
    relationship: one_to_many
    sql_where: ${subscriptions__retention.period_end_date} < CURRENT_DATE - ${subscriptions.billing_grace_period};;
  }

  join: retention_period_end_7_day_aggregate {
    view_label: "Retention Period End Date: 7-day Aggregate"
    sql: CROSS JOIN UNNEST(${subscriptions__retention.period_end_7_day_window}) AS retention_period_end_7_day_aggregate;;
    relationship: one_to_many
    sql_where: ${retention_period_end_7_day_aggregate.aggregate_raw} BETWEEN "2020-07-01" AND CURRENT_DATE;;
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
