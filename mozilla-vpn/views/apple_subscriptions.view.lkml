view: apple_subscriptions {
  derived_table: {
    sql:
      SELECT
        * REPLACE(
          STRUCT(
            apple_receipt.environment,
            start_date,
            end_date,
            active_period_offset,
            `interval`
          ) AS apple_receipt
        ),
        MIN(start_date) OVER (PARTITION BY user_id) AS user_start_date,
      FROM
        `mozdata.mozilla_vpn.subscriptions`
      CROSS JOIN
        UNNEST(apple_receipt.active_periods)
        WITH OFFSET AS active_period_offset
      WHERE
        apple_receipt.environment = "Production";;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: apple_receipt__environment {
    hidden: yes
    type: string
    sql: ${TABLE}.apple_receipt.environment;;
    group_label: "Apple Receipt"
    group_item_label: "Environment"
  }

  dimension_group: apple_receipt__end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.apple_receipt.end_date;;
    group_label: "Apple Receipt"
    group_item_label: "End Date"
  }

  dimension_group: apple_receipt__start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.apple_receipt.start_date;;
    group_label: "Apple Receipt"
    group_item_label: "Start Date"
  }

  dimension: apple_receipt__interval {
    type: string
    sql: ${TABLE}.apple_receipt.interval;;
    group_label: "Apple Receipt"
    group_item_label: "Interval"
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.user_start_date;;
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
    sql: ${TABLE}.created_at;;
  }

  dimension_group: ended {
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
    sql: ${TABLE}.ended_at;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type;;
  }

  dimension_group: modified {
    # this field is renamed to make the meaning more clean in context
    sql: ${TABLE}.updated_at;;
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

  dimension: user_id {
    hidden: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id;;
  }

  measure: count {
    type: count
  }
}
