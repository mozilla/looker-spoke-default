view: new_subscriptions {
       sql_table_name: mozdata.tmp.yeonjoo_new_subscriptions  ;;
    # sql_table_name: mozdata.tmp.yeonjoo_new_funnel  ;;#temp table created to speed up loading
    # DATE(subscription_start_date) AS partition_date,
    #         country_name,
    #         utm_medium,
    #         utm_source,
    #         utm_campaign,
    #         utm_content,
    #         utm_term,
    #         entrypoint_experiment,
    #         entrypoint_variation,
    #         pricing_plan,
    #         website_channel_group,
    #         provider,
    dimension: country {
      type: string
      sql: ${TABLE}.country_name ;;
    }
    dimension: UTM_medium {
      type: string
      sql:  ${TABLE}.utm_medium ;;
    }
    dimension: UTM_source {
      type: string
      sql:  ${TABLE}.utm_source  ;;
    }
    dimension: UTM_campaign {
      type: string
      sql:  ${TABLE}.utm_campaign  ;;
    }
    dimension: UTM_content {
      type: string
      sql:  ${TABLE}.utm_content  ;;
    }
    dimension: UTM_term {
      type: string
      sql:  ${TABLE}.utm_term  ;;
    }
    dimension: entrypoint_experiment {
      type: string
      sql:  ${TABLE}.entrypoint_experiment  ;;
    }
    dimension: entrypoint_variation {
      type: string
      sql:  ${TABLE}.entrypoint_variation ;;
    }
    dimension: pricing_plan {
      type: string
      sql:  ${TABLE}.pricing_plan  ;;
    }
    dimension: website_channel_group {
      type: string
      sql:  ${TABLE}.website_channel_group  ;;
    }
  dimension: provider {
    type: string
    sql:  ${TABLE}.provider  ;;
  }
  dimension: Channel_group {
    type: string
    sql: ${TABLE}.channel_group ;;
  }
    dimension_group: start{
      description: "date of event"
      type: time
      datatype: date
      convert_tz: no
      timeframes: [raw,date,week, month, quarter, year]
      sql:${TABLE}.partition_date ;;
    }

    measure: New_Subscriptions{
      type: sum
      sql: ${TABLE}.new_subscriptions ;;
    }

    measure: Daily_New_Subscriptions {
      type: average
      sql: ${TABLE}.daily_new_subscriptions ;;
    }

  measure: channel_group_proportion {
    type: average
    sql:${TABLE}.ch_group_prop;;
      # CASE WHEN SUM(new_funnel_from_08252021.total_acquisition_process_start ) >0
      # THEN ROUND(CAST(SUM(new_funnel_from_08252021.total_payment_setup_complete)/SUM(new_funnel_from_08252021.total_acquisition_process_start )*100 AS FLOAT64))
      # ELSE 0 END AS CVR
    }
}

# view: newsubscriptions {
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
