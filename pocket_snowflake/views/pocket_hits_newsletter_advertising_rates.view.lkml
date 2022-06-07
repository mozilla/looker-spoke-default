view: pocket_hits_monthly_newsletter_advertising_rates {
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."Y2022_MONTHLY_NEWSLETTER_ADVERTISING_RATES"
    ;;

  dimension_group: Period {
    type: time
    timeframes: [
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HAPPENED_MONTH ;;
  }

  measure: revenue_per_send {
    type: average
    sql: ${TABLE}.REVENUE_PER_SEND ;;
    value_format:"$#,###.00;($#,###.00)"
  }
}
