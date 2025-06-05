view: dt_ctr {
  derived_table: {
    sql: WITH
####################
#Clients with first session ping
####################
first_session AS (
    SELECT
        normalized_country_code AS country,
        DATE_TRUNC(DATE(submission_timestamp), MONTH) as submission_month,
        metrics.string.first_session_distribution_id,
        COUNT(DISTINCT client_info.client_id) AS partner_app_open_count,
    FROM
        `mozdata.fenix.first_session`  AS first_session
    WHERE
        metrics.string.first_session_distribution_id IS NOT NULL
        AND metrics.string.first_session_distribution_id NOT IN ('Mozilla', 'MozillaOnline')
        AND DATE(submission_timestamp) >= "2025-01-01"
    GROUP BY
    1, 2, 3
),
####################
#DT Device activations
####################
dt_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        country_code as country,
        preloaded as dt_preloaded,
        --opened,
        --SUM(preloaded) AS partner_activated_count,
        --SUM(opened) AS partner_opened_count
    FROM
        `mozdata.device_manufacturer_partnerships.preload_and_open_dt`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    --GROUP BY 1
),
####################
#vivo Device activations
####################
vivo_activations AS (
    SELECT
        DATE(CONCAT(date, "-01")) as submission_month,
        country_code AS country,
        activated AS vivo_activated
    FROM
        `mozdata.device_manufacturer_partnerships.shipment_and_activation_vivo`
    WHERE
        DATE(CONCAT(date, "-01")) >= "2025-01-01"
    --GROUP BY
    --    1
),
res AS (
SELECT
first_session.country,
first_session.submission_month,
first_session.first_session_distribution_id as distribution_id,
first_session.partner_app_open_count,
dt_activations.dt_preloaded,
vivo_activations.vivo_activated
FROM first_session
LEFT JOIN dt_activations
USING(country, submission_month)
LEFT JOIN vivo_activations
USING(country, submission_month)
)
SELECT
country,
submission_month,
distribution_id,
partner_app_open_count,
IF(distribution_id LIKE 'vivo%', NULL, dt_preloaded) as dt_preloaded,
IF(distribution_id LIKE 'dt%', NULL, vivo_activated) as vivo_activated
FROM res
      ;;
  }

  dimension: country {
    description: "two letter country code"
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: submission_month {
    description: "submission month in 'YYYY-MM' format"
    type: date_month
    sql: ${TABLE}.submission_month ;;
  }

  dimension: distribution_id {
    description: "the partner distribution id in form dt-001"
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: partner_app_open_count {
    description: "the distinct number of clients that opened app"
    type: number
    sql: ${TABLE}.partner_app_open_count ;;
  }

  dimension: dt_preloaded {
    description: "the number of clients with the app preloaded for dt/telephonica"
    type: number
    sql: ${TABLE}.dt_preloaded ;;
  }

  dimension: dt_ctr {
    description: "partner_app_count/preloaded for dt/telephonica"
    type: number
    sql: ${TABLE}.partner_app_open_count/${TABLE}.dt_preloaded;;
  }

  dimension: vivo_activated {
    description: "the number of clients that activated the app for vivo"
    type: number
    sql: ${TABLE}.vivo_activated ;;
  }

  dimension: vivo_ctr {
    description: "partner_app_count/activated for vivo"
    type: number
    sql: ${TABLE}.partner_app_open_count/${TABLE}.vivo_activated ;;
  }

  measure: total_preloaded {
    description: "total preloaded clients over time for dt/telephonica"
    type: sum
    sql: ${TABLE}.dt_preloaded ;;
  }

  measure: total_partner_app_count {
    description: "total number of clients that opened app over time"
    type: sum
    sql: ${TABLE}.partner_app_open_count ;;
  }

  measure: total_dt_ctr {
    description: "total dt/telephonica ctr (partner_app_open_count/dt_preloaded) over time"
    type: number
    sql: ${total_partner_app_count}/${total_preloaded} ;;
  }

  measure: total_vivo_activated {
    description: "total number of clients that activated app over time for vivo"
    type: sum
    sql: ${TABLE}.vivo_activated ;;
  }

  measure: total_vivo_ctr {
    description: "total vivo ctr (partner_app_open_count/vivo_activated) over time"
    type: number
    sql: ${total_partner_app_count}/${total_vivo_activated} ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: dt_ctr {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
