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
         GROUP BY 1, 2, 3, 4
      )
      
      SELECT forecasts.* EXCEPT(forecast_parameters)
        FROM `moz-fx-data-shared-prod.telemetry_derived.kpi_forecasts_v0` AS forecasts
        JOIN most_recent_forecasts
       USING(aggregation_period, metric_alias, metric_hub_app_name, metric_hub_slug, forecast_predicted_at)
      ;;
  }

  dimension: submission_date {
    type: date
    label: "Submission Date"
    description: "The date we received pings from clients."
    sql: DATE(${TABLE}.submission_date) ;;
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
    historical data, but generally represents statistical measures, such as 'mean'
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
    sql: ${TABLE}.measure ;;
  }

  dimension: metric_start_date {
    type: string
    label: "Metric Hub Slug"
    description: "The slug for the metric in Metric Hub."
    sql: ${TABLE}.measure ;;
  }

  dimension: metric_start_date {
    type: date
    label: "Metric Start Date"
    description: "The first metric date that was available for model training."
    sql: DATE(${TABLE}.metric_start_date) ;;
  }

  dimension: metric_end_date {
    type: date
    label: "Metric End Date"
    description: "The final metric date that was available for model training."
    sql: DATE(${TABLE}.metric_end_date) ;;
  }

  dimension: metric_collected_at {
    type: date_time
    label: "Metric Collected At"
    description: "The time that the metric was queried from its source dataset."
    sql: ${TABLE}.metric_collected_at ;;
  }

  dimension: forecast_start_date {
    type: date
    label: "Forecast Start Date"
    description: "The first date that was forecasted."
    sql: DATE(${TABLE}.forecast_start_date) ;;
  }

  dimension: forecast_end_date {
    type: date
    label: "Forecast End Date"
    description: "The final date that was forecasted."
    sql: DATE(${TABLE}.forecast_end_date) ;;
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
    type: number
    label: "Value"
    description: "The value of a particular Measurement."
    sql: ${TABLE}.value ;;
  }
}