view: h2_mobile_actuals {
  derived_table: {
    sql:
      with
        base as (
          select
              submission_date as date,
              app_name,
              canonical_app_name,
              CASE WHEN EXTRACT(QUARTER FROM submission_date) IN (1,2) THEN 1 ELSE 2 END AS half,
              sum(dau) as dau
          from
              ${mobile_usage_fields.SQL_TABLE_NAME} AS mobile_usage_fields
          group by 1,2,3,4
          )

      SELECT
        *,
        SUM(dau) OVER (PARTITION BY EXTRACT(YEAR FROM date), half, app_name ORDER BY date) AS cdou,
        AVG(dau) OVER window_7day as dau_7day_ma
      FROM base
      WINDOW window_7day AS (PARTITION BY app_name order by date rows between 6 preceding and current row)
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

  measure: dau {
    type: sum
    label: "DAU Actual"
    sql: ${TABLE}.dau ;;
  }

  measure: dau_7day_ma {
    type: sum
    label: "DAU Actual 7 Day MA"
    sql: ${TABLE}.dau_7day_ma ;;
  }

  measure: cdou {
    type: sum
    label: "CDOU Actual"
    sql: ${TABLE}.cdou ;;
  }

  measure: delta_from_forecast {
    label: "Cdou: Relative Delta from Forecast"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${h2_mobile_forecast.recent_cdou_forecast} ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and forecasted CDOU."
  }

  measure: delta_from_target {
    label: "Cdou: Relative Delta from Target"
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / (${h2_mobile_forecast.recent_cdou_target}) ) - 1 ;;
    description: "Relative (given as a fraction) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_target_count {
    label: "Cdou: Absolute Delta from Target"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${h2_mobile_forecast.cdou_target} ;;
    description: "Absolute (given as a whole number) difference between actual CDOU and targeted CDOU."
  }

  measure: delta_from_forecast_count {
    label: "Cdou: Absolute Delta from Forecast"
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${h2_mobile_forecast.yhat_cumulative}  ;;
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
    sql: ${h2_mobile_actuals_2020.dau} ;;
    description: "Daily Active Users on this day in 2020."
  }

  measure: year_over_year_dau_7day_ma {
    label: "2020 Dau MA"
    type: number
    sql: ${h2_mobile_actuals_2020.dau_7day_ma} ;;
    hidden: no
  }

  measure: year_over_year_cdou {
    label: "2020 Cdou"
    type: number
    sql: ${h2_mobile_actuals_2020.cdou} ;;
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
    sql: ${h2_mobile_actuals_2020.recent_cdou} ;;
  }


}
