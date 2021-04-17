view: stripe_subscriptions {
  derived_table: {
    sql:
      SELECT
        subscriptions.* EXCEPT (start_date, trial_end),
        COALESCE(subscriptions.trial_end, subscriptions.start_date) AS start_date,
        MIN(COALESCE(subscriptions.trial_end, subscriptions.start_date)) OVER (
          PARTITION BY
            subscriptions.customer
          ROWS BETWEEN
            UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
        ) AS customer_start_date,
      FROM
        mozdata.stripe.subscriptions
      JOIN
        mozdata.stripe.plans
      ON
        subscriptions.plan = plans.id
      JOIN
        mozdata.stripe.products
      ON
        plans.product = products.id
      WHERE
        products.name = "Mozilla VPN"
        AND subscriptions.status NOT IN ("incomplete", "incomplete_expired")
    ;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id;;
  }

  dimension_group: cancel {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cancel_at;;
  }

  dimension: cancel_at_period_end {
    hidden: yes
    type: yesno
    sql: ${TABLE}.cancel_at_period_end;;
  }

  dimension_group: canceled {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.canceled_at;;
  }

  dimension: cancelled_by_customer {
    type: yesno
    sql: ${cancel_at_period_end} OR "cancelled_for_customer_at" IN (SELECT key FROM UNNEST(${metadata}));;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created;;
  }

  dimension: customer {
    hidden: yes
    type: string
    sql: ${TABLE}.customer;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: COALESCE(${TABLE}.ended_at, CURRENT_TIMESTAMP);;
  }

  dimension_group: modified {
    # this field is renamed to make the meaning more clean in context
    sql: ${TABLE}.event_timestamp;;
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata;;
  }

  dimension: plan {
    hidden: yes
    type: string
    sql: ${TABLE}.plan;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date;;
  }

  dimension_group: customer_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.customer_start_date;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status;;
  }

  measure: count {
    type: count
  }
}
