view: funnel_stage_paid_for_subscription {
  derived_table: {
    sql:
    SELECT
      mozfun.map.get_key(customers.metadata, "fxa_uid") AS fxa_uid,
      MIN(subscriptions.start_date) AS first_paid_for_subscription,
    FROM
      mozdata.stripe.subscriptions
    JOIN
      mozdata.stripe.products
    ON
      subscriptions.product = products.id
    JOIN
      mozdata.stripe.customers
    ON
      subscriptions.customer = customers.id
    WHERE
      products.name = "Mozilla VPN"
    GROUP BY
      fxa_uid;;
  }

  dimension: fxa_uid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: first_paid_for_subscription {
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
    sql: ${TABLE}.first_paid_for_subscription;;
  }

  measure: count {
    type: count
  }
}
