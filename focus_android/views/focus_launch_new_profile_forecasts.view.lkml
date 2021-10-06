view: focus_launch_new_profile_forecasts {
  sql_table_name: `mozdata.analysis.loines_focus_launch_np_forecasts`
    ;;

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
    sql: ${TABLE}.date ;;
  }

  dimension: forecast_run_date {
    type: string
    sql: ${TABLE}.forecast_run_date ;;
    hidden: yes
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  measure: yhat_cumulative {
    hidden: yes
    type: number
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: yhat_lower_cumulative {
    hidden: yes
    type: number
    sql: ${TABLE}.yhat_lower_cumulative ;;
  }

  measure: yhat_upper_cumulative {
    hidden: yes
    type: number
    sql: ${TABLE}.yhat_upper_cumulative ;;
  }

  measure: forecast_half_lower {
    type: number
    sql: ${TABLE}.forecast_half_lower ;;
    hidden: yes
  }

  measure: forecast_half_median {
    type: number
    sql: ${TABLE}.forecast_half_median ;;
    hidden: yes
  }

  measure: forecast_half_upper {
    type: number
    sql: ${TABLE}.forecast_half_upper ;;
    hidden: yes
  }

  measure: forecast_year_lower {
    type: number
    sql: ${TABLE}.forecast_year_lower ;;
    hidden: yes
  }

  measure: forecast_year_median {
    type: number
    sql: ${TABLE}.forecast_year_median ;;
    hidden: yes
  }

  measure: forecast_year_upper {
    type: number
    sql: ${TABLE}.forecast_year_upper ;;
    hidden: yes
  }

  measure: yhat_upper {
    label: "New Profile Forecast (Upper Bound)"
    type: sum
    sql: ${TABLE}.yhat_upper ;;
  }

  measure: yhat {
    label: "New Profile Forecast (Median)"
    type: sum
    sql: ${TABLE}.yhat ;;
  }

  measure: yhat_lower {
    label: "New Profile Forecast (Lower Bound)"
    type: sum
    sql: ${TABLE}.yhat_lower ;;
  }

}
