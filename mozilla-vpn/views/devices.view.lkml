view: devices {
  sql_table_name: `mozdata.mozilla_vpn.devices`;;

  # dimension: id {
  #   type: number
  #   primary_key: yes
  #   hidden: yes
  #   sql: ${TABLE}.id;;
  # }

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

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id;;
  }

  dimension: useragent {
    type: string
    sql: ${TABLE}.useragent;;
  }

  measure: count {
    # can't use "type: count" because id is not exposed (yet)
    type: number
    sql: COUNT(*);;
  }

  # measure: devices {
  #   type: count_distinct
  #   sql_distinct_key: ${id};;
  # }
}
