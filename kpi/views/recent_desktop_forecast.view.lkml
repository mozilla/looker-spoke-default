view: recent_desktop_forecast {
  derived_table: {
    sql:
      SELECT
        *,
        AVG(yhat) OVER window_7day AS dau_forecast_7day_ma,
        AVG(yhat * 1.05) OVER window_7day AS dau_target_7day_ma,
        AVG(yhat_lower) OVER window_7day AS dau_forecast_lower_7day_ma,
        AVG(yhat_upper) OVER window_7day AS dau_forecast_upper_7day_ma,
        DENSE_RANK() OVER (ORDER BY DATE(forecast_run_date) DESC) AS forecast_recency
      FROM `mozdata.analysis.loines_desktop_cdou_forecasts`
      WINDOW window_7day AS (PARTITION BY forecast_run_date ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
      ;;
  }

  dimension: date {
    type: date
    primary_key: yes
    convert_tz: no
    sql: CAST(${TABLE}.date AS TIMESTAMP) ;;
  }

  dimension_group: date_parts {
    type: time
    timeframes: [day_of_year, week_of_year, week, month_name, month_num, quarter, quarter_of_year, year]
    sql: ${TABLE}.date ;;
    datatype: date
    convert_tz: no
  }

  dimension: forecast_recency {
    type: number
    label: "Forecast Recency (1 = Most Recent)"
    sql: ${TABLE}.forecast_recency ;;
  }

  measure: date_forecast_created {
    type: date
    sql: ANY_VALUE(CAST(${TABLE}.forecast_run_date AS TIMESTAMP)) ;;
  }

  measure: recent_dau_forecast {
    type: sum_distinct
    label: "Recent DAU Forecast"
    sql: ${TABLE}.yhat ;;
  }

  measure: cdou_year {
    type: sum_distinct
    label: "Recent CDOU Forecast For Year"
    description: "Starts Counting on Jan 1st"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: cdou {
    type: running_total
    label: "Recent CDOU Forecast"
    description: "Starts Counting on the First Day of Result"
    sql: ANY_VALUE(${TABLE}.yhat) ;;
  }

  measure: dau_forecast_7day_ma {
    label: "Recent DAU Forecast (Moving Average)"
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_7day_ma ;;
    hidden: no
  }

  measure: dau_forecast_lower_7day_ma {
    label: "Recent DAU Forecast Lower Bound (Moving Average)"
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_lower_7day_ma ;;
    hidden: no
  }

  measure: dau_forecast_upper_7day_ma {
    label: "Recent DAU Forecast Upper Bound (Moving Average)"
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_upper_7day_ma ;;
    hidden: no
  }

  measure: yhat_lower {
    label: "Recent DAU Forecast Lower Bound"
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.yhat_lower ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_upper {
    label: "Recent DAU Forecast Upper Bound"
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.yhat_upper ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: yhat_lower_cumulative {
    type: sum_distinct
    label: "Recent CDOU Forecast Lower Bound"
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: yhat_upper_cumulative {
    type: sum_distinct
    label: "Recent CDOU Forecast Upper Bound"
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.yhat_cumulative ;;
    filters: [
      date: "1 day ago"
    ]
    hidden: yes
  }

}
