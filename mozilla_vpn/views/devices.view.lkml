view: devices {
  dimension: platform {
    sql: ${TABLE}.platform ;;
    type: string
  }

  dimension: user_id {
    sql: ${TABLE}.user_id ;;
    type: number
    hidden: yes
  }

  dimension: useragent {
    sql: ${TABLE}.useragent ;;
    type: string
  }

  dimension_group: created_at {
    sql: ${TABLE}.created_at ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension_group: updated_at {
    sql: ${TABLE}.updated_at ;;
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  measure: count {
    type: count
  }

  sql_table_name: `mozdata.mozilla_vpn.devices` ;;
}
