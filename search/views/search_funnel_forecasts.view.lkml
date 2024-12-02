view: search_funnel_forecasts {
  derived_table: {
    sql:
    -- Need to filter out forecast start dates with multiple forecasts; keeps the most recent
    WITH cte AS (
      SELECT
        country,
        channel,
        device,
        partner,
        metric_alias,
        forecast_start_date,
        MAX(forecast_trained_at) AS forecast_trained_at,
      FROM
        `mozdata.analysis.search_funnel_forecasts`
      GROUP BY 1, 2, 3, 4, 5, 6
    )
    SELECT
      srf.*
    FROM
      `mozdata.analysis.search_funnel_forecasts` srf
    WHERE
      forecast_trained_at IN (SELECT forecast_trained_at FROM cte);;
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: device {
    sql: ${TABLE}.device ;;
    type: string
  }

  dimension: partner {
    sql: ${TABLE}.partner ;;
    type: string
  }

  dimension: forecast_start_date {
    sql:  ${TABLE}.forecast_start_date ;;
    type: string
    description: "First date of forecasted series as a string."
  }

  dimension: forecast_end_date {
    sql:  ${TABLE}.forecast_start_date ;;
    type: string
    description: "Last date of forecasted series as a string."
  }

  dimension:  aggregation_period {
    sql:  ${TABLE}.aggregation_period ;;
    type: string
    description: "Aggregation period of the value, either 'month' or 'day'."
  }

  dimension:  source {
    sql:  ${TABLE}.source ;;
    type: string
    description: "Whether the value on this submission date is a forecasted or historical value."
  }

  dimension: metric_name {
    sql: REPLACE(${TABLE}.metric_alias, "search_forecasting_", "") ;;
    type:  string
    description: "Name of forecasted metric."
  }

  dimension: metric_hub_app_name {
    sql: ${TABLE}.metric_hub_app_name ;;
    type:  string
    description: "Name of the app in the `metric-hub` repo where this metric's definition can be found."
  }

  measure: value {
    sql: ${TABLE}.value ;;
    type: sum
    description: "Value of the forecasted or actuals for the given metric."
  }

  measure: value_low {
    sql:  ${TABLE}.value_low ;;
    type:  sum
    description: "On forecasted dates, the lower bound of the 90% credible interval."
  }

  measure: value_mid {
    sql:  ${TABLE}.value_mid ;;
    type:  sum
    description: "On forecasted dates, the midpoint of the 90% credible interval."
  }

  measure: value_high {
    sql:  ${TABLE}.value_high ;;
    type:  sum
    description: "On forecasted dates, the upper bound of the 90% credible interval."
  }

}
