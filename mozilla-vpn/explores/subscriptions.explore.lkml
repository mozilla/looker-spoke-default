include: "../views/*.view"

explore: subscriptions {
  always_join: [
    stripe_subscriptions
  ]

  # apple subscriptions
  from: apple_subscriptions
  view_name: apple_subscriptions
  fields: [
    ALL_FIELDS*,
    -apple_subscriptions*
  ]

  # stripe subscriptions
  join: stripe_subscriptions {
    type: full_outer
    # stripe susbscriptions go in separate rows
    sql_on: FALSE;;
    relationship: one_to_one
  }

  # users
  join: stripe_customers {
    # hide all fields this is only for joining users to stripe subscriptions
    fields: []
    relationship: many_to_one
    foreign_key: stripe_subscriptions.customer
  }
  join: stripe_users {
    from: users
    # hide all fields this is only for joining users to stripe subscriptions
    fields: []
    relationship: many_to_one
    sql_on: ${stripe_users.fxa_uid} = ${stripe_customers.fxa_uid};;
  }
  join: users {
    relationship: many_to_one
    sql_on: COALESCE(${apple_subscriptions.user_id}, ${stripe_users.id}) = ${users.id};;
  }

  # devices
  join: devices {
    relationship: many_to_one
    sql_on: ${devices.user_id} = ${users.id};;
  }

  # common fields
  join: all_subscriptions {
    relationship: one_to_one
    sql: LEFT JOIN UNNEST(
      [
        IF(
          ${stripe_subscriptions.id} IS NOT NULL,
          -- stripe subscription
          STRUCT(
            "FXA" AS provider,
            -- hide trials, which are currently only used for dev work
            ${stripe_subscriptions.start_date} AS start_date,
            ${stripe_subscriptions.end_date} AS end_date,
            -- differentiate start dates
            ${stripe_subscriptions.customer_start_date} AS user_start_date,
            -- differentiate end dates
            IF(
              ${stripe_subscriptions.cancelled_by_customer},
              "Cancelled by Customer",
              "Payment Failed"
            ) AS cancel_reason
          ),
          -- apple subscription conditions
          STRUCT(
            "APPLE" AS provider,
            ${apple_subscriptions.apple_receipt__start_date} AS start_date,
            ${apple_subscriptions.apple_receipt__end_date} AS end_date,
            -- differentiate start dates
            ${apple_subscriptions.user_start_date} AS user_start_date,
            -- differentiate end dates
            "Cancelled by IAP" AS cancel_reason
          )
        )
      ]
    ) AS all_subscriptions;;
    # only show subscriptions that start before they end
    sql_where: ${all_subscriptions.start_raw} < ${all_subscriptions.end_raw};;
  }

  join: all_subscriptions__active {
    view_label: "All Subscriptions: Active"
    sql: LEFT JOIN UNNEST(${all_subscriptions.active}) AS all_subscriptions__active;;
    relationship:  one_to_many
    sql_where: ${all_subscriptions__active.active_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }

  join: all_subscriptions__events {
    # required_joins: [subscription_periods]
    view_label: "All Subscriptions: Events"
    sql: CROSS JOIN UNNEST(${all_subscriptions.events}) AS all_subscriptions__events;;
    relationship:  one_to_many
    sql_where: ${all_subscriptions__events.event_raw} BETWEEN DATE "2020-07-01" AND CURRENT_DATE - 1;;
  }
}

view: all_subscriptions {
  # dimension: id {
  #   hidden: yes
  #   primary_key: yes
  #   sql: COALESCE(
  #     ${stripe_subscriptions.id},
  #     CAST(${apple_subscriptions.id} AS STRING)
  #   );;
  # }
  dimension: provider {
    type: string
    sql: ${TABLE}.provider;;
  }
  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date;;
    convert_tz: no
    datatype: date
  }
  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date;;
    convert_tz: no
    datatype: date
  }
  dimension: cancel_reason {
    type: string
    # sql: CASE
    # WHEN ${stripe_subscriptions.id} IS NULL
    # THEN "Cancelled by IAP"
    # WHEN ${stripe_subscriptions.cancelled_by_customer}
    # THEN "Cancelled by Customer"
    # ELSE "Payment Failed"
    # END;;
    sql: ${TABLE}.cancel_reason;;
  }
  dimension_group: user_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.user_start_date;;
    convert_tz: no
    datatype: date
  }
  dimension: active {
    hidden: yes
    sql: GENERATE_DATE_ARRAY(${start_raw}, ${end_raw} - 1);;
  }
  dimension: events {
    hidden: yes
    sql:
      [
        STRUCT(
          ${start_raw} AS date,
          "New" AS type,
          IF(${start_date} = ${user_start_date}, "New", "Resurrected") AS granular_type,
          1 AS delta
        ),
        STRUCT(
          ${end_raw} AS date,
          "Cancelled" AS type,
          ${cancel_reason} AS granular_type,
          -1 AS delta
        ),
        -- repeat events for displaying net change
        STRUCT(
          ${start_raw} AS date,
          "Net Paid Subscribers" AS type,
          "Net Paid Subscribers" AS granular_type,
          1 AS delta
        ),
        STRUCT(
          ${end_raw} AS date,
          "Net Paid Subscribers" AS type,
          "Net Paid Subscribers" AS granular_type,
          -1 AS delta
        )
      ];;
  }
  measure: count {
    type: count
  }
}

view: all_subscriptions__active {
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

  measure: count {
    type: count
  }
}

view: all_subscriptions__events {
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

  # dimension: raw_delta {
  #   type: string
  #   hidden: yes
  #   sql: ${TABLE}.delta;;
  # }

  measure: delta {
    type: sum
    sql: ${TABLE}.delta;;
  }
}
