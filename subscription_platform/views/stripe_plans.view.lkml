include: "//looker-hub/subscription_platform/views/stripe_plans.view.lkml"

view: +stripe_plans {

  dimension: id {
    primary_key: yes
  }

  dimension: aggregate_usage {
    hidden:  yes
  }

  dimension: amount {
    sql: CAST(${TABLE}.amount AS DECIMAL) / 100 ;;
    value_format_name: decimal_2
  }

  dimension: billing_scheme {
    hidden:  yes
  }

  dimension: currency {
    sql: UPPER(${TABLE}.currency) ;;
  }

  dimension: interval_description {
    type: string
    sql:
      CONCAT(
        ${interval_count},
        ' ',
        ${interval},
        IF(${interval_count} > 1, 's', '')
      ) ;;
  }

  dimension: interval_months {
    type: number
    sql:
      CASE
        ${interval}
        WHEN 'month'
          THEN ${interval_count}
        WHEN 'year'
          THEN ${interval_count} * 12
      END ;;
  }

  dimension: summary {
    type: string
    sql:
      CONCAT(
        ${interval_description},
        IF(
          ${amount} IS NOT NULL,
          CONCAT(' ', ${currency}, ' ', FORMAT('%.2f', ${amount})),
          ''
        )
      ) ;;
  }

  dimension: tiers_mode {
    hidden:  yes
  }

  dimension: trial_period_days {
    hidden:  yes
  }

  dimension: usage_type {
    hidden:  yes
  }

}
