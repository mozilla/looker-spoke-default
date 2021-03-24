view: users {
  dimension: attribution {
    sql: ${TABLE}.attribution ;;
    hidden: yes
  }

  dimension: attribution_category {
    sql: ${TABLE}.attribution_category ;;
    type: string
  }

  dimension: coarse_attribution_category {
    sql: ${TABLE}.coarse_attribution_category ;;
    type: string
  }

  dimension: fxa_uid {
    sql: ${TABLE}.fxa_uid ;;
    type: string
    hidden: yes
  }

  dimension: id {
    sql: ${TABLE}.id ;;
    type: number
    primary_key: yes
    hidden: yes
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

  measure: count {
    type: count
  }

  sql_table_name: `mozdata.mozilla_vpn.users` ;;
}
