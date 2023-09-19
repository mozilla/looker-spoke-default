include: "//looker-hub/subscription_platform/views/stripe_plans.view.lkml"

view: +stripe_plans {

  dimension: id {
    primary_key: yes
  }

  dimension: aggregate_usage {
    hidden:  yes
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
