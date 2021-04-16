include: "../views/*.view"

explore: funnel {
  view_name: login_flows
  sql_always_where: IF(
    ${login_flows.fxa_uid} IS NOT NULL,
    ${login_flows.flow_completed_raw} BETWEEN ${login_flows.flow_started_raw} AND TIMESTAMP_ADD(${login_flows.flow_started_raw}, interval 2 day),
    TRUE
  )
  {% if stripe_customers._in_query %}
  AND IF(
    ${stripe_customers.id} IS NOT NULL,
    ${stripe_subscriptions.customer_start_raw} BETWEEN ${login_flows.flow_started_raw} AND TIMESTAMP_ADD(${login_flows.flow_started_raw}, interval 2 day),
    TRUE
  )
  {% endif %};;

  join: users {
    relationship: many_to_one
    sql_on: ${login_flows.fxa_uid} = ${users.fxa_uid};;
    sql_where: IF(
      ${users.fxa_uid} IS NOT NULL,
      ${users.created_raw} BETWEEN ${login_flows.flow_started_raw} AND TIMESTAMP_ADD(${login_flows.flow_started_raw}, interval 2 day),
      TRUE
    );;
  }
  join: stripe_customers {
    relationship: many_to_one
    # use key from previous funnel stage to ensure joining a strict subset
    sql_on: ${users.fxa_uid} = ${stripe_customers.fxa_uid};;
  }
  join: stripe_subscriptions {
    fields: []  # hide fields, this is only used to filter out non-vpn customers
    relationship: one_to_many
    sql_on: ${stripe_customers.id} = ${stripe_subscriptions.customer};;
  }
  join: add_device_events {
    relationship: many_to_one
    # use key from previous funnel stage to ensure joining a strict subset
    sql_on: ${stripe_customers.fxa_uid} = ${add_device_events.fxa_uid};;
    sql_where: IF(
      ${add_device_events.fxa_uid} IS NOT NULL,
      ${add_device_events.timestamp_raw} BETWEEN ${login_flows.flow_started_raw} AND TIMESTAMP_ADD(${login_flows.flow_started_raw}, interval 2 day),
      TRUE
    );;
  }
  join: protected {
    relationship: many_to_one
    sql_on: ${add_device_events.fxa_uid} = ${protected.fxa_uid};;
    sql_where: IF(
      ${protected.fxa_uid} IS NOT NULL,
      ${protected.first_protected_raw} BETWEEN ${login_flows.flow_started_raw} AND TIMESTAMP_ADD(${login_flows.flow_started_raw}, interval 2 day),
      TRUE
    );;
  }
}
