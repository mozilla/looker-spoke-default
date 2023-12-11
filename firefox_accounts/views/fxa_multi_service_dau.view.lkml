view: fxa_multi_service_dau {

  derived_table: {

    sql:
    SELECT
      DATE(timestamp) as submission_date,
      user_id,
      ARRAY_AGG(DISTINCT service IGNORE NULLS ORDER BY service) as services,
      MAX_BY(country_code, timestamp) as country_code
    FROM
      `mozdata.firefox_accounts.fxa_all_events`
    WHERE service IN ('sync', 'mdn-plus', 'guardian-vpn', 'fx-monitor', 'fx-private-relay', 'pocket-web', 'amo-web', 'thunderbird-addons', 'mozilla-iam', 'moz-social', 'mozilla-support', 'pontoon', 'mozilla-hubs-dev')
    AND event_type like 'fxa_activity%'
    GROUP BY
      1, 2
    HAVING ARRAY_LENGTH(services) > 1;;
  }

  measure: user_count {
    type:  count_distinct
    sql:  ${TABLE}.user_id ;;
  }

  dimension_group: date {
    type:  time
    sql:  ${TABLE}.submission_date;;
    datatype: date
    convert_tz: no
    timeframes:[
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: user_id {
    type:  string
    sql:  ${TABLE}.user_id ;;
  }

  dimension: services_quantity {
    type: number
    sql:  ARRAY_LENGTH(${TABLE}.services) ;;
  }

  dimension: service_list {
    type: string
    sql:  ARRAY_TO_STRING(${TABLE}.services, ' + ') ;;
  }

  dimension: country_code {
    type:  string
    sql:  ${TABLE}.country_code ;;
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

# view: multi_service_accounts {
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
