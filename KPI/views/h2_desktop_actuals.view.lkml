view: h2_desktop_actuals {
  derived_table: {
    sql:
      WITH base AS (
        SELECT
          submission_date AS date,
          CASE WHEN EXTRACT(QUARTER FROM submission_date) IN (1,2) THEN 1 ELSE 2 END AS half,
          SUM(dau) AS dau
          FROM `mozdata.telemetry.firefox_desktop_usage_2021`
          -- WHERE submission_date >= "2021-07-01"
          GROUP BY 1,2 ORDER BY 1
      )

      SELECT
        *,
        SUM(dau) OVER (PARTITION BY EXTRACT(YEAR FROM date), half ORDER BY date) AS cdou,
        AVG(dau) OVER window_7day as dau_7day_ma
      FROM base
      WINDOW window_7day AS (order by date rows between 6 preceding and current row);;
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  measure: dau {
    type: number
    label: "DAU Actual"
    sql: ANY_VALUE(${TABLE}.dau) ;;
  }

  measure: dau_7day_ma {
    type: number
    label: "DAU Actual 7 Day MA"
    sql: ANY_VALUE(${TABLE}.dau_7day_ma) ;;
  }

  measure: cdou {
    type: number
    label: "CDOU Actual"
    sql: ANY_VALUE(${TABLE}.cdou) ;;
  }

  measure: delta_from_forecast {
    label: "Cdou: Relative Delta from Forecast"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${h2_desktop_forecast.recent_cdou_forecast} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU."
  }

  measure: delta_from_target {
    label: "Cdou: Relative Delta from Target"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / (${h2_desktop_forecast.recent_cdou_target}) ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_target_count {
    label: "Cdou: Absolute Delta from Target"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${h2_desktop_forecast.cdou_target} ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_forecast_count {
    label: "Cdou: Absolute Delta from Forecast"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${h2_desktop_forecast.yhat_cumulative}  ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  }

  measure: recent_cdou {
    hidden: no
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou ;;
  }

  measure: recent_date {
    hidden: no
    type: date
    sql: MAX(CAST(${TABLE}.date AS TIMESTAMP)) ;;
  }

  # YoY

  measure: year_over_year_dau {
    label: "2020 Dau"
    type: number
    sql: ${h2_desktop_actuals_2020.dau} ;;
    description: "Daily Active Users on this day in 2020."
  }

  measure: year_over_year_dau_7day_ma {
    label: "2020 Dau MA"
    type: number
    sql: ${h2_desktop_actuals_2020.dau_7day_ma} ;;
    hidden: no
  }

  measure: year_over_year_cdou {
    label: "2020 Cdou"
    type: number
    sql: ${h2_desktop_actuals_2020.cdou} ;;
    description: "Cumulative Days of Use on this day in 2020."
  }

  measure: year_over_year_cdou_delta_count {
    label: "Cdou: Absolute Delta from 2020"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${year_over_year_cdou} ;;
    description: "Absolute (given as a whole number) difference between 2020's CDOU and 2021's CDOU."
  }

  measure: year_over_year_cdou_delta_percent {
    label: "Cdou: Relative Delta from 2020"
    type: number
    value_format: "0.000%"
    sql: ${recent_cdou} / ${recent_cdou_2020} - 1;;
    description: "Relative difference between 2020's CDOU and 2021's CDOU."
  }

  measure: recent_cdou_2020 {
    hidden: no
    type: number
    value_format: "0.00,,, \"Billion\""
    sql: ${h2_desktop_actuals_2020.recent_cdou} ;;
  }

}
