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
  }
}
