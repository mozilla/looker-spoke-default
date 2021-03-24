view: add_device_events {
  dimension: fxa_uid {
    sql: ${TABLE}.fxa_uid ;;
    type: string
    primary_key: yes
    hidden: yes
  }

  dimension_group: timestamp {
    sql: ${TABLE}.timestamp ;;
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

  sql_table_name: `mozdata.mozilla_vpn.add_device_events` ;;
}
