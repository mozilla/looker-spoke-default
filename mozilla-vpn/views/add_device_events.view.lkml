view: add_device_events {
  sql_table_name: `mozdata.mozilla_vpn.add_device_events`;;

  dimension: fxa_uid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp;;
  }

  measure: count {
    type: count
  }
}
