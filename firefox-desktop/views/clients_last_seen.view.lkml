include: "//looker-hub/firefox-desktop/*.view.lkml"

view: client_counts {
  extends: [clients_last_seen]

  measure: dau_created_profile {
    type: count
    filters: [days_since_created_profile: "<=0"]
  }

  measure: dau_first_seen {
    type: count
    filters: [days_since_first_seen: "<=0"]
  }

  measure: dau_had_8_active_ticks {
    type: count
    filters: [days_since_had_8_active_ticks: "<=0"]
  }

  measure: dau_interacted {
    type: count
    filters: [days_since_interacted: "<=0"]
  }

  measure: dau_opened_dev_tools {
    type: count
    filters: [days_since_opened_dev_tools: "<=0"]
  }

  measure: dau_second_seen {
    type: count
    filters: [days_since_second_seen: "<=0"]
  }

  measure: dau_seen {
    type: count
    filters: [days_since_seen: "<=0"]
  }

  measure: dau_visited_10_uri {
    type: count
    filters: [days_since_visited_10_uri: "<=0"]
  }

  measure: dau_visited_1_uri {
    type: count
    filters: [days_since_visited_1_uri: "<=0"]
  }

  measure: dau_visited_5_uri {
    type: count
    filters: [days_since_visited_5_uri: "<=0"]
  }


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

# view: clients_last_seen {
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
