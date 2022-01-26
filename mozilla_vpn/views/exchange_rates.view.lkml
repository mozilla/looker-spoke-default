include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

view: +exchange_rates_table {

  derived_table: {
    sql:
      SELECT
        *
      FROM
        mozdata.mozilla_vpn.exchange_rates;;
  }

  dimension: base_currency {
    sql: ${TABLE}.base_currency ;;
    type: string
  }

  dimension: price {
    sql: ${TABLE}.price ;;
    type: number
  }

  dimension: price_type {
    sql: ${TABLE}.price_type ;;
    type: string
  }

  dimension: quote_currency {
    sql: ${TABLE}.quote_currency ;;
    type: string
  }

  dimension_group: date {
    sql: ${TABLE}.date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }
}
