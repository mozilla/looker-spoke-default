view: kpi_automated_forecast_confidences_v1 {
  view_label: "Automated KPI Forecasts: Confidence Intervals"
  sql_table_name: `moz-fx-data-shared-prod.telemetry_derived.kpi_automated_forecast_confidences_v1`;;

  dimension: as_of_date {
    label: "Forecast end date."
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

  dimension: device {
    label: "Target: desktop or mobile."
    type: string
    sql: ${TABLE}.target ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
    label: "Time unit: month."
  }

  measure: value {
    type: average
    sql: ${TABLE}.value ;;
    label: "Observed for past dates, estimated for future dates."
  }

  measure: Worst {
    type: average
    sql: ${TABLE}.yhat_p10;;
    label: "CI Lower: 10th Percentile"
  }

  measure: Best {
    type: average
    sql:  ${TABLE}.yhat_p90;;
    label: "CI Upper: 90th Percentile"
  }

  measure: Base {
    type: average
    sql: AVG(${Worst},${Best});;
    label: "Average of CI Lower and CI Upper"
  }

  measure: relative_CI_size {
    type: average
    sql: (${Best} - ${Worst}) / ${Base}  ;;
    label: "Relative CI Size: Size of CI / Base"
  }

  measure: percent_change_in_base {
    type: average
    sql: (${Base} - lag(${Base}) / lag(${Base})  ;;
    label: "(Base - Lag(Base)) / Lag(Base)"
  }


}
