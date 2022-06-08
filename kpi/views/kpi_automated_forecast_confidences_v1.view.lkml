view: kpi_automated_forecast_confidences_v1 {
  view_label: "Automated KPI Forecasts: Confidence Intervals"
  sql_table_name: `moz-fx-data-shared-prod.telemetry_derived.kpi_automated_forecast_confidences_v1`;;

  dimension: as_of_date {
    description: "Forecast end date."
    type: date
    sql: ${TABLE}.asofdate ;;
    hidden: no
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date;;
  }

  dimension: target {
    description: "Device_Metric."
    type: string
    sql: ${TABLE}.target ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
    description: "Time unit: month."
  }

  dimension: forecast_parameters {
    description: "Parameters used in fitting Prophet model."
    type: string
    sql: ${TABLE}.forecast_parameters ;;
  }

  dimension: forecast_date {
    description: "Date forecast was run."
    type: string
    sql: ${TABLE}.forecast_date ;;
  }

  measure: value {
    type: average
    sql: ${TABLE}.value ;;
    description: "Observed for past dates, estimated for future dates."
  }

  measure: Worst {
    type: average
    sql: ${TABLE}.yhat_p10;;
    description: "CI Lower: 10th Percentile"
  }

  measure: Best {
    type: average
    sql:  ${TABLE}.yhat_p90;;
    description: "CI Upper: 90th Percentile"
  }

  measure: Base {
    type: average
    sql: AVG(${TABLE}.yhat_p10 + ${TABLE}.yhat_p90);;
    description: "Average of CI Lower and CI Upper"
  }

  measure: relative_CI_size {
    type: average
    sql: (${TABLE}.yhat_p90 - ${TABLE}.yhat_p10) / AVG(${TABLE}.yhat_p10 + ${TABLE}.yhat_p90)  ;;
    label: "Relative CI Size: Size of CI / Base"
  }

  measure: percent_change_in_base {
    type: average
    sql: (AVG(${TABLE}.yhat_p10 + ${TABLE}.yhat_p90) - lag(AVG(${TABLE}.yhat_p10 + ${TABLE}.yhat_p90)) / lag(AVG(${TABLE}.yhat_p10 + ${TABLE}.yhat_p90))  ;;
    description: "(Base - Lag(Base)) / Lag(Base)"
  }


}
