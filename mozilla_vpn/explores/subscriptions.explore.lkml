include: "../views/subscriptions.view"
include: "../views/devices.view"
include: "../views/information_schema_partitions.view"

explore: subscriptions {

  join: metadata {
    from: information_schema_partitions
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "all_subscriptions_v1" AND ${metadata.partition_id} IS NULL;;
    relationship: many_to_one
  }

  join: devices {
    relationship: many_to_one
    sql_on: ${devices.user_id} = ${user_id};;
  }

  join: subscriptions__active {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    relationship: one_to_many
  }

  join: subscriptions__events {
    view_label: "Subscription Events"
    sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
    relationship: one_to_many
  }

  join: subscriptions__retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
    relationship: one_to_many
  }
}
