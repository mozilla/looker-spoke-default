view: users {
  sql_table_name: `mozdata.mozilla_vpn.users`;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id;;
  }

  dimension: attribution {
    hidden: yes
    # type: map
    sql: ${TABLE}.attribution;;
  }

  dimension: attribution_category {
    type: string
    sql: ${TABLE}.attribution_category;;
  }

  dimension: coarse_attribution_category {
    type: string
    sql: ${TABLE}.coarse_attribution_category;;
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

  dimension: fxa_uid {
    hidden: yes
    type: string
    sql: ${TABLE}.fxa_uid;;
  }

  measure: count {
    type: count
  }

  # measure: users {
  #   type: count_distinct
  #   sql_distinct_key: ${id};;
  # }
}
