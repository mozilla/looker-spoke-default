view: new_tab_advertising_rates{
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."Y2022_MONTHLY_NEW_TAB_ADVERTISING_RATES"
    ;;

  dimension_group: month {
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
    sql: ${TABLE}.HAPPENED_MONTH ;;
  }

  measure: cpm_rest_of_world {
    type: number
    sql: ${TABLE}.ROW_CPM ;;
  }

  measure: cpm_us {
    type: number
    sql: ${TABLE}.US_CPM ;;
  }
}
