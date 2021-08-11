view: original_desktop_forecast {
  derived_table: {
    sql:
    SELECT
      a.ds AS date,
      dau_forecast,
      a.dau_forecast_plus5 AS dau_target,
      a.dau_forecast_lower,
      a.dau_forecast_upper,
      a.yhat_cumulative AS cdou_forecast,
      a.yhat_cumulative * 1.05 AS cdou_target,
      AVG(dau_forecast) OVER window_7day AS dau_forecast_7day_ma,
      AVG(dau_forecast_plus5) OVER window_7day AS dau_target_7day_ma,
      AVG(dau_forecast_lower) OVER window_7day AS dau_forecast_lower_7day_ma,
      AVG(dau_forecast_upper) OVER window_7day AS dau_forecast_upper_7day_ma,

      b.yhat AS new_profiles_forecast,
      b.forecast_plus5 AS new_profiles_target,
      b.yhat_lower AS new_profiles_forecast_lower,
      b.yhat_upper AS new_profiles_forecast_upper,
      b.yhat_cumulative AS cum_new_profiles_forecast,
      b.yhat_cumulative * 1.05 AS cum_new_profiles_target,
      AVG(b.yhat) OVER window_7day AS new_profiles_forecast_7day_ma,
      AVG(b.forecast_plus5) OVER window_7day AS new_profiles_target_7day_ma,
      AVG(b.yhat_lower) OVER window_7day AS new_profiles_forecast_lower_7day_ma,
      AVG(b.yhat_upper) OVER window_7day AS new_profiles_forecast_upper_7day_ma
    FROM
       `mozdata.analysis.loines_desktop_dau_forecast_2021-01-19` a
    INNER JOIN
       `mozdata.analysis.loines_desktop_new_profiles_forecast_2021-01-19` b
    ON DATE(a.ds) = DATE(b.date)
    WINDOW window_7day AS (ORDER BY DATE(a.ds) ROWS BETWEEN 6 PRECEDING AND CURRENT ROW);;
  }

  dimension: date {
    type: date
    primary_key: yes
    sql: CAST(${TABLE}.date AS TIMESTAMP);;
    convert_tz: no
    hidden: no
  }

  measure: cdou_forecast_year {
    label: "CDOU KPI Target for Year"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_forecast) ;;
    description: "Starts Counting on Jan 1st"
  }

  measure: cdou_forecast {
    label: "CDOU KPI Target"
    type: running_total
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast) ;;
    description: "Starts Counting on the First Day of Result"
  }

  measure: cdou_target_year {
    type: number
    label: "CDOU Stretch Goal for Year"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
    description: "Stretch for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cdou_target {
    type: running_total
    label: "CDOU Stretch Goal"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target) ;;
    description: "Stretch Goal for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cum_new_profiles_forecast {
    type: number
    label: "Original Cumulative New Profiles Forecast"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_forecast) ;;
    description: "Forecasted value for Cumulative New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: cum_new_profiles_target {
    type: number
    label: "Cumulative New Profiles Target"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_target) ;;
    description: "Targeted value for Cumulative New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: dau_forecast {
    type: sum
    label: "DAU KPI Target"
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast ;;
    description: "Forecasted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_forecast_7day_ma {
    type: number
    label: "DAU KPI Target (Moving Average)"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_7day_ma) ;;
    hidden: no
  }

  measure: dau_forecast_lower {
    type: number
    label: "DAU KPI Target Lower Bound"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower) ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_lower_7day_ma {
    type: number
    label: "DAU KPI Target Lower Bound (Moving Average)"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower_7day_ma) ;;
    hidden: no
  }

  measure: dau_forecast_upper {
    type: number
    label: "DAU KPI Target Upper Bound"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper) ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_upper_7day_ma {
    type: number
    label: "DAU KPI Target (Moving Average)"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper_7day_ma) ;;
    hidden: no
  }

  measure: dau_target {
    type: sum
    label: "DAU Stretch Goal Pace"
    value_format: "#,##0"
    sql: ${TABLE}.dau_target ;;
    description: "Targeted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_target_7day_ma {
    type: number
    label: "DAU Stretch Goal Pace (Moving Average)"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target_7day_ma) ;;
    hidden: no
  }

  measure: new_profiles_forecast {
    type: number
    label: "Original New Profiles Forecast"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast) ;;
    description: "Forecasted value for New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: new_profiles_forecast_7day_ma {
    type: number
    label: "Original New Profiles Forecast (Moving Average)"
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_lower {
    label: "New Profiles Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower) ;;
    description: "Lower bound (10th percentile) value for Forecasted New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: new_profiles_forecast_lower_7day_ma {
    label: "New Profiles Forecast Lower Bound (Moving Average)"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_upper {
    label: "New Profiles Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper) ;;
    description: "Upper bound (90th percentile) value for Forecasted New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: new_profiles_forecast_upper_7day_ma {
    label: "New Profiles Forecast Upper Bound (Moving Average)"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_target {
    label: "New Profiles Target"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target) ;;
    description: "Targeted value for New Profiles. Only relevant for 2021."
    hidden: yes
  }

  measure: new_profiles_target_7day_ma {
    label: "New Profiles Target (Moving Average)"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target_7day_ma) ;;
    hidden: yes
  }

  measure: recent_cum_new_profiles_forecast {
    type: max
    value_format: "0.000,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_forecast ;;
    filters: [
      date: "1 day ago"
    ]
    hidden: yes
  }

  measure: recent_cum_new_profiles_target {
    type: max
    value_format: "0.00,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_target ;;
    filters: [
      date: "1 day ago"
    ]
    hidden: yes
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
