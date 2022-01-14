view: new_subscriptions {
       sql_table_name: mozdata.tmp.yeonjoo_new_subscriptions  ;;

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

    # measure: Daily_New_Subscriptions {
    #   type: average
    #   sql: ${TABLE}.daily_new_subscriptions ;;
    # }

    measure: channel_group_proportion {
      type: average
      sql:${TABLE}.ch_group_prop;;
      }
}
