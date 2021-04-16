# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
view: stripe_customers {
  sql_table_name: `mozdata.stripe.customers`;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
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
    sql: ${TABLE}.created;;
  }

  dimension: metadata {
    hidden: yes
    sql: ${TABLE}.metadata;;
  }

  dimension: fxa_uid {
    hidden: yes
    type: string
    sql:  mozfun.map.get_key(${TABLE}.metadata, "fxa_uid");;
  }

  measure: count {
    type: count
  }
}
