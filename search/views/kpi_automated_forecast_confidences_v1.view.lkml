view: kpi_automated_forecast_confidences_v1 {
  view_label: "Automated KPI Forecasts: Confidence Intervals"
  sql_table_name: `moz-fx-data-shared-prod.telemetry_derived.kpi_automated_forecast_confidences_v1`;;

  dimension: as_of_date {
    label: "Forecast End Date"
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
    sql: CAST(${TABLE}.date as DATE);;
  }

  dimension: device {
    label: "Device"
    type: string
    sql: ${TABLE}.target ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
    label: "Time Unit"
  }

  dimension: forecast_date {
    type: string
    sql: ${TABLE}.forecast_date ;;
    description: "Must filter by date of latest forecast."
  }

  measure: value {
    type: average
    sql: ${TABLE}.value ;;
    description: "Observed in past, estimated in future."
    value_format: "#,##0.000"
  }

  measure: Worst {
    type: average
    sql: ${TABLE}.yhat_p10;;
    description: "CI Lower: 10th Percentile"
    value_format: "#,##0.000"
  }

  measure: Best {
    type: average
    sql:  ${TABLE}.yhat_p90;;
    description: "CI Upper: 90th Percentile"
    value_format: "#,##0.000"
    }

  # measure: Base {
  #   type: average
  #   sql: (${Worst} + ${Best})/2;;
  #   label: "Average of CI Lower and CI Upper"
  # }

  # measure: relative_CI_size {
  #   type: average
  #   sql: (${Best} - ${Worst}) / ${Base}  ;;
  #   label: "Relative CI Size: Size of CI / Base"
  # }

  # measure: percent_change_in_base {
  #   type: average
  #   sql: (${Base} - lag(${Base}) / lag(${Base})  ;;
  #   label: "(Base - Lag(Base)) / Lag(Base)"
  # }


}
