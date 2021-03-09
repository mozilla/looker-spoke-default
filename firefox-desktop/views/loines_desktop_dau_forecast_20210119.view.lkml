view: loines_desktop_dau_forecast_20210119 {
  sql_table_name: `mozdata.analysis.loines_desktop_dau_forecast_2021-01-19`
    ;;

  measure: continuing_profiles_forecast {
    type: sum_distinct
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.continuing_profiles_forecast ;;
  }

  measure: dau_continuing_profiles_actual {
    type: sum_distinct
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_continuing_profiles_actual ;;
  }

  measure: dau_forecast {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_forecast ;;
  }

  measure: dau_forecast_lower {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_forecast_lower ;;
  }

  measure: dau_forecast_plus5 {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_forecast_plus5 ;;
  }

  measure: cumulative_forecast_plus5 {
    type: running_total
    value_format: "#,##0"
    sql: ${dau_forecast_plus5} ;;
  }

  measure: dau_forecast_upper {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_forecast_upper ;;
  }

  measure: dau_new_profiles_actual {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.dau_new_profiles_actual ;;
  }

  dimension_group: ds {
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
    sql: ${TABLE}.ds ;;
  }

  measure: fraction_new_profiles_forecast {
    type: sum_distinct
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.fraction_new_profiles_forecast ;;
  }

  measure: new_profiles_forecast {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.new_profiles_forecast ;;
  }

  measure: yhat_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: yhat_cumulative_running {
    type: sum_distinct
    value_format: "#,##0"
    sql_distinct_key: ${ds_date} ;;
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: yhat_lower_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: yhat_upper_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

}
