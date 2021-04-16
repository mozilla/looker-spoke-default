view: devices {
  sql_table_name: `mozdata.mozilla_vpn.devices`;;

  dimension: id {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.id;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform;;
  }

  dimension_group: modified {
    # this field is renamed to make the meaning more clean in context
    sql: ${TABLE}.updated_at;;
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
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.useragent;;
  }

  measure: count {
    type: count
  }
}
