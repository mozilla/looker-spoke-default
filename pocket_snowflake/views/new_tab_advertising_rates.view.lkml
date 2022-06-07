view: new_tab_advertising_rates{
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."Y2022_MONTHLY_NEW_TAB_ADVERTISING_RATES"
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

  measure: CPM_Rest_Of_World {
    type: average
    sql: ${TABLE}.ROW_CPM ;;
    value_format:"$#.00;($#.00)"
  }

  measure: CPM_US {
    type: average
    sql: ${TABLE}.US_CPM ;;
    value_format:"$#.00;($#.00)"
  }
}
