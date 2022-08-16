include: "//looker-hub/kpi/views/automated_kpi_forecasts.view.lkml"

view: +automated_kpi_forecasts {

  dimension_group: ds {
    label: "Submission"
    sql: ${TABLE}.ds ;;
    type: time
    timeframes: [
      date,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: forecast_date {
    label: "Date of Forecast"
  }

  dimension: yhat {
    hidden:  yes
    sql: ${TABLE}.yhat ;;
  }

  dimension: yhat_lower {
    hidden:  yes
    sql: ${TABLE}.yhat_lower ;;
  }

  dimension: yhat_upper {
    hidden:  yes
    sql: ${TABLE}.yhat_upper ;;
  }

  measure: Forecasted_Value {
    type: number
    sql: SUM(CAST(${TABLE}.yhat as NUMERIC)) ;;
  }

  measure: Forecasted_Lower_Bound {
    type: number
    sql: SUM(CAST(${TABLE}.yhat_lower as NUMERIC)) ;;
  }

  measure: Forecasted_Upper_Bound {
    type: number
    sql: SUM(CAST(${TABLE}.yhat_upper as NUMERIC)) ;;
  }

}
