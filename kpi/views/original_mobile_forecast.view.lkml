view: original_mobile_forecast {
derived_table: {
  sql:
    -- note: I'm not even computing the KPI "target" of 3.87B for now since we are going to smash that for sure.
    SELECT
      date,
      app_name,
       case when app_name = "fennec_fenix" then "Firefox for Android (Fennec + Fenix)"
          when app_name = "firefox_ios" then "Firefox for iOS"
          when app_name = "focus_ios" then "Firefox Focus for iOS"
          when app_name = "focus_android" then "Firefox Focus for Android" end as canonical_app_name,
      target_lift,
      yhat AS dau_forecast,
      yhat * (1 + target_lift) AS dau_kpi_target,
      yhat * 1.01445221 AS dau_kr_target, -- 1.01445221 is the equivalent lift over forecast that gets to +5% YoY
      yhat_p10 AS dau_forecast_lower,
      yhat_p90 AS dau_forecast_upper,
      yhat_cumulative AS cdou_forecast,
      target_pace AS cdou_kpi_target,
      yhat_cumulative * 1.05 AS cdou_kr_target,
      AVG(yhat) OVER window_7day AS dau_forecast_7day_ma,
      AVG(yhat * (1 + target_lift)) OVER window_7day AS dau_kpi_target_7day_ma,
      AVG(yhat * 1.01445221) OVER window_7day AS dau_kr_target_7day_ma,
      AVG(yhat_p10) OVER window_7day AS dau_forecast_lower_7day_ma,
      AVG(yhat_p90) OVER window_7day AS dau_forecast_upper_7day_ma
    FROM
       `moz-fx-data-shared-prod.static.mobile_forecasts_official_2021` a
    WINDOW window_7day AS (PARTITION BY app_name ORDER BY DATE(date) ROWS BETWEEN 6 PRECEDING AND CURRENT ROW);;
}

dimension: date {
  type: date
  sql: CAST(${TABLE}.date AS TIMESTAMP);;
  convert_tz: no
  hidden: no
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

measure: target_lift {
  label: "KPI Target Lift"
  type: number
  sql: ANY_VALUE(${TABLE}.target_lift) ;;
  description: "KPI Stretch Goal Lift Level as a Proportion Above Forecast"
  hidden: yes
}

measure: cdou_forecast_year {
  label: "CDOU KPI Baseline Forecast for Year"
  type: sum_distinct
  value_format: "#,##0"
  sql: ${TABLE}.cdou_forecast ;;
  description: "Forecasted value from January. Starts Counting on Jan 1st"
}

measure: cdou_forecast {
  label: "CDOU KPI Baseline Forecast"
  type: running_total
  value_format: "#,##0"
  sql: ${dau_forecast} ;;
  description: "Forecasted value from January. Starts Counting on the First Day of Result"
}

measure: cdou_kpi_target {
  type: running_total
  label: "CDOU KPI Stretch Goal for Year"
  value_format: "#,##0"
  sql: ${dau_kpi_target} ;;
  description: "Stretch Goal for Cumulative Days of Use. Starts Counting on First Day of Result."
}

measure: cdou_kpi_target_year {
  type: sum_distinct
  label: "CDOU KPI Stretch Goal for Year"
  value_format: "#,##0"
  sql: ${TABLE}.cdou_kpi_target ;;
  description: "Stretch Goal for Cumulative Days of Use. Starts Counting on Jan 1 2021."
}

measure: dau_forecast {
  type: sum_distinct
  label: "DAU KPI Baseline Forecast (+2.9% YoY)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast ;;
  description: "Forecasted value from January for Daily Active Users."
}

measure: dau_kpi_target {
  type: sum_distinct
  label: "DAU KPI Stretch Goal Pace (+4.29% YoY)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_kpi_target ;;
  description: "Stretch Goal Pace for KPI Set in January"
}

measure: dau_forecast_7day_ma {
  type: sum_distinct
  label: "DAU KPI Baseline Forecast (Moving Average)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast_7day_ma ;;
  hidden: no
  description: "Forecasted value from January for Daily Active Users."
}

measure: dau_forecast_lower {
  type: sum_distinct
  label: "DAU KPI Baseline Forecast Lower Bound"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast_lower ;;
  description: "Lower bound (10th percentile) of January Baseline Forecast"
}

measure: dau_forecast_lower_7day_ma {
  type: sum_distinct
  label: "DAU KPI Baseline Forecast Lower Bound (Moving Average)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast_lower_7day_ma ;;
  hidden: no
  description: "Lower bound (10th percentile) of January Baseline Forecast"
}

measure: dau_forecast_upper {
  type: sum_distinct
  label: "DAU KPI Target Upper Bound"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast_upper ;;
  description: "Upper bound (10th percentile) of January Baseline Forecast"
}

measure: dau_forecast_upper_7day_ma {
  type: sum_distinct
  label: "DAU KPI Baseline Forecast Upper Bound (Moving Average)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_forecast_upper_7day_ma ;;
  description: "Upper bound (10th percentile) of January Baseline Forecast"
  hidden: no
}

measure: dau_kpi_target_7day_ma {
  type: sum_distinct
  label: "DAU KPI Stretch Goal Pace (Moving Average)"
  value_format: "#,##0"
  sql: ${TABLE}.dau_kpi_target_7day_ma ;;
  hidden: no
  description: "Stretch Goal Pace for KPI Set in January"
}

measure: recent_cdou_forecast {
  type: max
  value_format: "0.00,,, \"Billion\""
  sql: ${TABLE}.cdou_forecast ;;
  filters: [
    date: "1 day ago"
  ]
  hidden: yes
}

measure: recent_cdou_target {
  type: max
  value_format: "0.00,,, \"Billion\""
  sql: ${TABLE}.cdou_target ;;
  filters: [
    date: "1 day ago"
  ]
  hidden: yes
}
}
