

view: recent_mobile_forecast {
  derived_table: {
    sql:
      SELECT
        *,
        case when app_name = "fennec_fenix" then "Firefox for Android (Fennec + Fenix)"
          when app_name = "firefox_ios" then "Firefox for iOS"
          when app_name = "focus_ios" then "Firefox Focus for iOS"
          when app_name = "focus_android" then "Firefox Focus for Android" end as canonical_app_name,
        AVG(yhat) OVER window_7day AS dau_forecast_7day_ma,
        AVG(yhat_lower) OVER window_7day AS dau_forecast_lower_7day_ma,
        AVG(yhat_upper) OVER window_7day AS dau_forecast_upper_7day_ma,
        DENSE_RANK() OVER (ORDER BY DATE(forecast_run_date) DESC) AS forecast_recency
      FROM `mozdata.analysis.loines_mobile_cdou_forecasts`
      WINDOW window_7day AS (partition by app_name order by date rows between 6 preceding and current row)
      ;;
  }

  dimension: date {
    type: date
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

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
    hidden: yes
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.date, ${TABLE}.app_name) ;;
    hidden: yes
  }

  dimension: canonical_app_name {
    type: string
    sql: ${TABLE}.canonical_app_name ;;
  }

  measure: date_forecast_created {
    type: date
    sql: ANY_VALUE(CAST(${TABLE}.forecast_run_date AS TIMESTAMP)) ;;
  }

  measure: forecast_recency {
    type: number
    label: "Forecast Recency (1 = Most Recent)"
    sql: ANY_VALUE(${TABLE}.forecast_recency) ;;
  }

  measure: recent_dau_forecast {
    type: sum_distinct
    label: "Recent DAU Forecast"
    sql: ${TABLE}.yhat ;;
  }

  measure: cdou_year {
    type: sum_distinct
    label: "Recent CDOU Forecast for Year"
    description: "Starts Counting on Jan 1st"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: cdou {
    type: running_total
    label: "Recent CDOU Forecast"
    description: "Starts Counting on the First Day of Result"
    sql: ${recent_dau_forecast} ;;
  }

  measure: dau_forecast_7day_ma {
    type: sum_distinct
    value_format: "#,##0"
    label:"Recent DAU Forecast (Moving Average)"
    sql: ${TABLE}.dau_forecast_7day_ma ;;
    hidden: no
  }

  measure: dau_forecast_lower_7day_ma {
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_lower_7day_ma ;;
    label:"Recent DAU Forecast Lower Bound (Moving Average)"
    hidden: no
  }

  measure: dau_forecast_upper_7day_ma {
    type: sum_distinct
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_upper_7day_ma ;;
    label:"Recent DAU Forecast Upper Bound (Moving Average)"
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

}
