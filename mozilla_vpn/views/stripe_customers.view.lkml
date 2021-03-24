view: stripe_customers {
  dimension: id {
    sql: ${TABLE}.id ;;
    type: string
  }

  dimension: metadata {
    sql: ${TABLE}.metadata ;;
    hidden: yes
  }

  dimension_group: created {
    sql: ${TABLE}.created ;;
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

  sql_table_name: `mozdata.stripe.customers` ;;
}