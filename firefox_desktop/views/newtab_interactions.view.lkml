include: "//looker-hub/firefox_desktop/views/newtab_interactions_table.view.lkml"

view: newtab_interactions {
  extends: [newtab_interactions_table]

  dimension: is_search_issued {
    hidden: yes
  }

  dimension: is_tagged_search_ad_click {
    hidden: yes
  }

  dimension: is_tagged_search_ad_impression {
    hidden: yes
  }

  dimension: is_follow_on_search_ad_click {
    hidden: yes
  }

  dimension: is_follow_on_search_ad_impression {
    hidden: yes
  }

  dimension: newtab_visit_id {
    hidden: yes
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: is_topsite_impression {
    hidden: yes
  }

  dimension: is_sponsored_topsite_impression {
    hidden: yes
  }

  dimension: is_topsite_click {
    hidden: yes
  }

  dimension: is_sponsored_topsite_click {
    hidden: yes
  }

  dimension: is_sponsored_topsite_interaction {
    hidden: yes
  }


  ### Search

  measure: searches {
    type: sum
    sql: IF(${is_search_issued}, 1, 0) ;;
  }

  measure: tagged_search_ad_impressions {
    type: sum
    sql: IF(${is_tagged_search_ad_impression}, 1, 0) ;;
  }

  measure: tagged_search_ad_clicks {
    type: sum
    sql: IF(${is_tagged_search_ad_click}, 1, 0) ;;
  }

  measure: follow_on_search_ad_impressions {
    type: sum
    sql: IF(${is_follow_on_search_ad_impression}, 1, 0) ;;
  }

  measure: follow_on_search_ad_clicks {
    type: sum
    sql: IF(${is_follow_on_search_ad_click}, 1, 0) ;;
  }

  measure: visits_with_search {
    type: count_distinct
    sql: IF(${is_search_issued}, newtab_visit_id, NULL) ;;
    approximate: yes
  }

  measure: visits_with_tagged_search_ad_impression {
    type: count_distinct
    sql: IF(${is_tagged_search_ad_impression}, newtab_visit_id, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_search_ad_click {
    type: count_distinct
    sql: IF(${is_tagged_search_ad_click}, newtab_visit_id, NULL) ;;
    approximate: yes
  }

  measure: visits_with_follow_on_search_ad_impression {
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression}, newtab_visit_id, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_follow_on_search_ad_click {
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click}, newtab_visit_id, NULL) ;;
    approximate: yes
  }

  measure: clients_with_search {
    type: count_distinct
    sql: IF(${is_search_issued}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_tagged_search_ad_impression {
    type: count_distinct
    sql: IF(${is_tagged_search_ad_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_search_ad_click {
    type: count_distinct
    sql: IF(${is_tagged_search_ad_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_follow_on_search_ad_impression {
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_follow_on_search_ad_click {
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click}, ${client_id}, NULL) ;;
    approximate: yes
  }


  ### Topsites

  measure: topsite_clicks {
    type: sum
    sql: IF(${is_topsite_click}, 1, 0) ;;
  }

  measure: sponsored_topsite_clicks {
    type: sum
    sql: IF(${is_sponsored_topsite_click}, 1, 0) ;;
  }

  measure: topsite_impressions {
    type: sum
    sql: IF(${is_topsite_impression}, 1, 0) ;;
  }

  measure: sponsored_topsite_impressions {
    type: sum
    sql: IF(${is_sponsored_topsite_impression}, 1, 0) ;;
  }

  measure: visits_with_topsite_click {
    type: count_distinct
    sql: IF(${is_topsite_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_click {
    type: count_distinct
    sql: IF(${is_sponsored_topsite_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_topsite_impression {
    type: count_distinct
    sql: IF(${is_topsite_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_impression{
    type: count_distinct
    sql: IF(${is_sponsored_topsite_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_click {
    type: count_distinct
    sql: IF(${is_topsite_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_click {
    type: count_distinct
    sql: IF(${is_sponsored_topsite_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_impression {
    type: count_distinct
    sql: IF(${is_topsite_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_impression{
    type: count_distinct
    sql: IF(${is_sponsored_topsite_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }



  # measure: searches {
  #   type: sum
  #   sql: ${IF(${is_search_issued, 1, 0)} ;;
  # }

  # measure: searches {
  #   type: sum
  #   sql: ${IF(${is_search_issued, 1, 0)} ;;
  # }

  # measure: searches {
  #   type: sum
  #   sql: ${IF(${is_search_issued, 1, 0)} ;;
  # }
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

# view: newtab_interactions {
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
