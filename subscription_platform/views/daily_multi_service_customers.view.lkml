view: daily_multi_service_customers {
  label: "Daily Multi-Service Customers"

  derived_table: {
    sql:
      SELECT
        date,
        subscription.mozilla_account_id,
        ARRAY_AGG(DISTINCT service.id IGNORE NULLS ORDER BY service.id) AS service_ids,
        ARRAY_AGG(DISTINCT service.name IGNORE NULLS ORDER BY service.name) AS service_names,
        ARRAY_AGG(DISTINCT subscription.product_name IGNORE NULLS ORDER BY subscription.product_name) AS product_names,
        ARRAY_AGG(DISTINCT subscription.plan_interval IGNORE NULLS ORDER BY subscription.plan_interval) AS plan_intervals,
        MAX_BY(subscription.country_code, subscription.customer_subscription_number) AS country_code,
        MAX_BY(subscription.country_name, subscription.customer_subscription_number) AS country_name,
      FROM
        `mozdata.subscription_platform.daily_active_logical_subscriptions`
      CROSS JOIN
        UNNEST(subscription.services) AS service
      WHERE
        was_active_at_day_end
      GROUP BY
        date,
        subscription.mozilla_account_id
      HAVING
        ARRAY_LENGTH(service_ids) > 1 ;;
  }

  measure: customer_count {
    type: count_distinct
    sql: ${TABLE}.mozilla_account_id ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
    datatype: date
    convert_tz: no
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: mozilla_account_id {
    type: string
    sql: ${TABLE}.mozilla_account_id ;;
  }

  dimension: services_quantity {
    type: number
    sql: ARRAY_LENGTH(${TABLE}.service_ids) ;;
  }

  dimension: service_ids {
    label: "Service IDs"
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.service_ids, ' + ') ;;
  }

  dimension: service_names {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.service_names, ' + ') ;;
  }

  dimension: product_names {
    type: string
    sql: ARRAY_TO_STRING(${TABLE}.product_names, ' + ') ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }
}

view: daily_multi_service_customers__service_ids {
  dimension: service_id {
    type: string
    sql: ${TABLE} ;;
  }
}

view: daily_multi_service_customers__service_names {
  dimension: service_name {
    type: string
    sql: ${TABLE} ;;
  }
}

view: daily_multi_service_customers__product_names {
  dimension: product_name {
    type: string
    sql: ${TABLE} ;;
  }
}

view: daily_multi_service_customers__plan_intervals {
  dimension: plan_interval {
    type: string
    sql: ${TABLE} ;;
  }
}
