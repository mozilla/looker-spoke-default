view: h2_desktop_forecast {
  derived_table: {
    sql:
      SELECT
        *,
        yhat * 1.05 AS dau_target,
        yhat_cumulative * 1.05 AS cdou_target,
        AVG(yhat) OVER window_7day AS dau_forecast_7day_ma,
        AVG(yhat * 1.05) OVER window_7day AS dau_target_7day_ma,
        AVG(yhat_lower) OVER window_7day AS dau_forecast_lower_7day_ma,
        AVG(yhat_upper) OVER window_7day AS dau_forecast_upper_7day_ma,
        AVG(jan_dau_forecast) OVER window_7day AS jan_forecast_7day_ma,
        AVG(jan_dau_forecast_upper) OVER window_7day AS jan_forecast_upper_7day_ma,
        AVG(jan_dau_forecast_lower) OVER window_7day AS jan_forecast_lower_7day_ma
      FROM `mozdata.analysis.loines_desktop_dau_forecast_2021-06-30`
      WINDOW window_7day AS (order by date rows between 6 preceding and current row)
      ;;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  measure: yhat {
    type: number
    label: "DAU Forecast"
    sql: ANY_VALUE(${TABLE}.yhat) ;;
  }

  measure: dau_target {
    type: number
    label: "DAU Target"
    sql: ANY_VALUE(${TABLE}.dau_target) ;;
  }

  measure: dau_target_7day_ma {
    type: number
    sql: ANY_VALUE(${TABLE}.dau_target_7day_ma) ;;
    hidden: no
  }

  measure: yhat_cumulative {
    type: number
    label: "CDOU Forecast"
    sql: ANY_VALUE(${TABLE}.yhat_cumulative) ;;
  }

  measure: cdou_target {
    type: number
    label: "CDOU Target"
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
  }

  measure: dau_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_7day_ma) ;;
    hidden: no
  }

  measure: dau_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower_7day_ma) ;;
    hidden: no
  }

  measure: dau_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper_7day_ma) ;;
    hidden: no
  }

  measure: jan_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.jan_forecast_7day_ma) ;;
    hidden: no
  }

  measure: jan_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.jan_forecast_lower_7day_ma) ;;
    hidden: no
  }

  measure: jan_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.jan_forecast_upper_7day_ma) ;;
    hidden: no
  }

  measure: yhat_lower {
    label: "DAU Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.yhat_lower) ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_upper {
    label: "DAU Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.yhat_upper) ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_lower_cumulative {
    type: number
    label: "CDOU Forecast Lower Bound"
    sql: ANY_VALUE(${TABLE}.yhat_lower_cumulative) ;;
  }

  measure: yhat_upper_cumulative {
    type: number
    label: "CDOU Forecast Upper Bound"
    sql: ANY_VALUE(${TABLE}.yhat_upper_cumulative) ;;
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
