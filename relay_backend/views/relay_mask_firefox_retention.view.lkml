view: relay_mask_firefox_retention {

  sql_table_name: `mozdata.relay.relay_mask_firefox_retention` ;;

  dimension_group: submission {
    type: time
    sql: ${TABLE}.submission_date ;;
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

  dimension_group: metric_date {
    type: time
    sql: ${TABLE}.metric_date ;;
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

  dimension: mask_count_tier {
    type: string
    sql: ${TABLE}.mask_count_tier ;;
    order_by_field: mask_count_tier_sort
  }

  dimension: mask_count_tier_sort {
    hidden: yes
    type: number
    sql:
      CASE ${TABLE}.mask_count_tier
        WHEN 'No Relay account' THEN 0
        WHEN '0 masks' THEN 1
        WHEN '1-5 masks' THEN 2
        WHEN '6-10 masks' THEN 3
        WHEN '11-25 masks' THEN 4
        WHEN '26-50 masks' THEN 5
        WHEN '51+ masks' THEN 6
      END ;;
  }

  dimension: has_relay_account {
    type: yesno
    sql: ${TABLE}.has_relay_account ;;
  }

  dimension: relay_premium_status {
    type: string
    sql: ${TABLE}.relay_premium_status ;;
  }

  dimension: total_masks {
    type: number
    sql: ${TABLE}.total_masks ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: active_metric_date {
    type: yesno
    sql: ${TABLE}.active_metric_date ;;
  }

  dimension: retained_week_4 {
    type: yesno
    sql: ${TABLE}.retained_week_4 ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  measure: total_clients {
    type: count_distinct
    sql: ${client_id} ;;
    filters: [active_metric_date: "yes"]
    description: "Count of distinct active clients"
  }

  measure: retained_clients {
    type: count_distinct
    sql: ${client_id} ;;
    filters: [retained_week_4: "yes"]
    description: "Count of distinct clients retained at week 4"
  }

  measure: retention_rate {
    type: number
    sql: SAFE_DIVIDE(${retained_clients}, ${total_clients}) ;;
    value_format_name: percent_2
    description: "Week 4 retention rate (retained_clients / total_clients)"
  }
}
