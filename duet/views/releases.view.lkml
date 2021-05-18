view: releases {
  sql_table_name: `mozdata.telemetry.releases`
    ;;

  dimension: build_number {
    type: number
    sql: ${TABLE}.build_number ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_security_driven {
    type: yesno
    sql: ${TABLE}.is_security_driven ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
}
