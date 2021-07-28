view: h2_mobile_forecast {
  derived_table: {
    sql:
      SELECT
        *,
        yhat * 1.0429 AS dau_target,
        yhat_cumulative * 1.0429 AS cdou_target,
        AVG(yhat) OVER window_7day AS dau_forecast_7day_ma,
        AVG(yhat * 1.0429) OVER window_7day AS dau_target_7day_ma,
        AVG(yhat_lower) OVER window_7day AS dau_forecast_lower_7day_ma,
        AVG(yhat_upper) OVER window_7day AS dau_forecast_upper_7day_ma,
        AVG(jan_dau_forecast) OVER window_7day AS jan_forecast_7day_ma,
        AVG(jan_dau_forecast_upper) OVER window_7day AS jan_forecast_upper_7day_ma,
        AVG(jan_dau_forecast_lower) OVER window_7day AS jan_forecast_lower_7day_ma
      FROM `mozdata.analysis.loines_mobile_forecast_2021-06-30`
      WINDOW window_7day AS (partition by app_name order by date rows between 6 preceding and current row)
      ;;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
  }

  measure: yhat {
    type: sum
    label: "DAU Forecast"
    sql: ${TABLE}.yhat ;;
  }

  measure: dau_target {
    type: sum
    label: "DAU Target"
    sql: ${TABLE}.dau_target ;;
  }

  measure: dau_target_7day_ma {
    type: sum
    sql: ${TABLE}.dau_target_7day_ma ;;
    hidden: no
  }

  measure: yhat_cumulative {
    type: sum
    label: "CDOU Forecast"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: cdou_target {
    type: sum
    label: "CDOU Target"
    sql: ${TABLE}.cdou_target ;;
  }

  measure: dau_forecast_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_7day_ma ;;
    hidden: no
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.yhat_cumulative ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: no
  }

  measure: dau_forecast_lower_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_lower_7day_ma ;;
    hidden: no
  }

  measure: dau_forecast_upper_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_upper_7day_ma ;;
    hidden: no
  }

  measure: jan_forecast_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.jan_forecast_7day_ma ;;
    hidden: no
  }

  measure: jan_forecast_lower_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.jan_forecast_lower_7day_ma ;;
    hidden: no
  }

  measure: jan_forecast_upper_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.jan_forecast_upper_7day_ma ;;
    hidden: no
  }

  measure: yhat_lower {
    label: "DAU Forecast Lower Bound"
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_lower ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_upper {
    label: "DAU Forecast Upper Bound"
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_lower_cumulative {
    type: sum
    label: "CDOU Forecast Lower Bound"
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: yhat_upper_cumulative {
    type: sum
    label: "CDOU Forecast Upper Bound"
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

  measure: recent_cdou_target {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: no
  }

}
