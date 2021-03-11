view: loines_desktop_new_profiles_forecast_20210119 {
  derived_table: {
    sql:
      SELECT
        *
        , SUM(forecast_plus5) OVER (PARTITION BY EXTRACT(YEAR FROM date) ORDER BY date) AS cumulative_new_profiles_forecast_plus5
      FROM `mozdata.analysis.loines_desktop_new_profiles_forecast_2021-01-19`
      ORDER BY 1
      ;;
  }
  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  measure: forecast_plus10 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.forecast_plus10 ;;
  }

  measure: forecast_plus5 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.forecast_plus5 ;;
  }

  measure: recent_cumulative_forecast_plus5 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.forecast_plus5  ;;
  }

  measure: cumulative_new_profiles_forecast_plus5 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cumulative_new_profiles_forecast_plus5 ;;
  }

  measure: yhat {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat ;;
  }

  measure: yhat_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: recent_yhat_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: yhat_lower {
    type: sum
    sql: ${TABLE}.yhat_lower ;;
  }

  measure: yhat_lower_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: recent_yhat_lower_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: yhat_upper {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper ;;
  }

  measure: yhat_upper_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

  measure: recent_yhat_upper_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

}
