view: funnel_stage_protected {
  sql_table_name: `mozdata.mozilla_vpn.protected`;;

  dimension: fxa_uid {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  dimension_group: first_protected {
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
    sql: ${TABLE}.first_protected;;
  }

  measure: count {
    type: count
  }
}
