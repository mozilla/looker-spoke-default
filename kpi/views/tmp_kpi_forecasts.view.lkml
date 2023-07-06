view: tmp_kpi_forecasts {
  derived_table: {
    sql:
      WITH most_recent_forecasts AS (
        SELECT aggregation_period,
               metric_alias,
               metric_hub_app_name,
               metric_hub_slug,
               MAX(forecast_predicted_at) AS forecast_predicted_at
          FROM `moz-fx-data-shared-prod.telemetry_derived.kpi_forecasts_v0`
         GROUP BY aggregation_period, metric_alias, metric_hub_app_name, metric_hub_slug
      )
      
      SELECT forecasts.* EXCEPT(forecast_parameters)
        FROM `moz-fx-data-shared-prod.telemetry_derived.kpi_forecasts_v0` AS forecasts
        JOIN most_recent_forecasts
       USING(aggregation_period, metric_alias, metric_hub_app_name, metric_hub_slug, forecast_predicted_at)
       ORDER BY submission_date ASC
      ;;
  }

  dimension_group: submission_date {
    type: time
    datatype: date
    timeframes: [date]
    convert_tz: no
    label: "Submission"
    description: "The date we received pings from clients."
    sql: ${TABLE}.submission_date ;;
  }

  dimension: aggregation_period {
    type: string
    label: "Aggregation Period"
    description: "The period that data was aggregated by, either 'day' or 'month'."
    sql: ${TABLE}.aggregation_period ;;
  }

  dimension: data_source {
    type: string
    label: "Data Source"
    description: "The source of the data, either 'historical' or 'forecast'."
    sql: ${TABLE}.source ;;
  }

  dimension: measurement {
    type: string
    label: "Measurement"
    description: "
    The measure whose value is being reported. This is always 'observed' for
    historical data, but for forecasts represents statistical measures, such as 'mean'
    or 'p50' (i.e. the median).
    "
    sql: ${TABLE}.measure ;;
  }

  dimension: metric_alias {
    type: string
    label: "Metric Alias"
    description: "An alias for the metric that's being forecast."
    sql: ${TABLE}.metric_alias ;;
  }

  dimension: metric_hub_app_name {
    type: string
    label: "Metric Hub App Name"
    description: "The app name for the metric in Metric Hub."
    sql: ${TABLE}.metric_hub_app_name ;;
  }

  dimension: metric_hub_slug {
    type: string
    label: "Metric Hub Slug"
    description: "The slug for the metric in Metric Hub."
    sql: ${TABLE}.metric_hub_slug ;;
  }

  dimension: metric_collected_at {
    type: date_time
    label: "Metric Collected At"
    description: "The time that the metric was queried from its source dataset."
    sql: ${TABLE}.metric_collected_at ;;
  }

  dimension: forecast_trained_at {
    type: date_time
    label: "Forecast Trained At"
    description: "The time that the forecast model was trained."
    sql: ${TABLE}.forecast_trained_at ;;
  }

  dimension: forecast_predicted_at {
    type: date_time
    label: "Forecast Predicted At"
    description: "The time that the forecast was made."
    sql: ${TABLE}.forecast_predicted_at ;;
  }

  measure: value {
    type: average
    label: "Value"
    description: "The value of a particular Measurement."
    sql: ${TABLE}.value ;;
  }
}
