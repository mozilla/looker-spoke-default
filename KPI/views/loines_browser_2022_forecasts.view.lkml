view: loines_browser_2022_forecasts {
  view_label: "2022 Browser Forecasts"
  sql_table_name: `mozdata.analysis.loines_browser_2022_forecasts`
    ;;

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
    hidden: yes
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
    sql: DATE(${TABLE}.date);;
  }

  dimension: migration {
    type: number
    sql: ${TABLE}.migration ;;
    hidden: yes
  }

  dimension: platform {
    type: string
    sql: CASE WHEN ${TABLE}.platform = 'desktop' THEN 'Firefox Desktop' ELSE 'Firefox Mobile' END;;
    label: "Platform (Firefox Desktop or Mobile)"
  }

  dimension: reg {
    type: number
    sql: ${TABLE}.reg ;;
    hidden: yes
  }

  measure: yhat {
    type: sum
    sql: ${TABLE}.yhat ;;
    label: "Forecast"
  }

  measure: lower_target_pace {
    type: sum
    sql: ${TABLE}.yhat * 0.959120747;;
    label: "Low-End Target Daily Pace"
  }

  measure: baseline_target_pace {
    type: sum
    sql: ${TABLE}.yhat * 0.990897496;;
    label: "Baseline Target Daily Pace"
  }

  measure: stretch_target_pace {
    type: sum
    sql: ${TABLE}.yhat * 1.006562090;;
    label: "Stretch Target Daily Pace"
  }

  measure: yhat_cumulative {
    type: sum
    sql: ${TABLE}.yhat_cumulative;;
    label: "Cumulative Forecast (Starting Jan 1st)"
  }

  measure: lower_target_pace_cumulative {
    type: sum
    sql: ${TABLE}.yhat_cumulative  * 0.959120747 ;;
    label: "Cumulative Low-End Target Pace (Starting Jan 1st)"
  }

  measure: baseline_target_pace_cumulative {
    type: sum
    sql: ${TABLE}.yhat_cumulative * 0.990897496;;
    label: "Cumulative Baseline Target Pace (Starting Jan 1st)"
  }

  measure: stretch_target_pace_cumulative {
    type: sum
    sql: ${TABLE}.yhat_cumulative * 1.006562090;;
    label: "Cumulative Stretch Target Pace (Starting Jan 1st)"
  }

  measure: yhat_lower {
    type: sum
    sql: ${TABLE}.yhat_lower ;;
    label: "Forecast Lower Bound"
  }

  measure: yhat_lower_cumulative {
    type: sum
    sql: ${TABLE}.yhat_lower_cumulative ;;
    label: "Cumulative Forecast Lower Bound"
  }

  measure: yhat_upper {
    type: sum
    sql: ${TABLE}.yhat_upper ;;
    label: "Forecast Upper Bound"
  }

  measure: yhat_upper_cumulative {
    type: sum
    sql: ${TABLE}.yhat_upper_cumulative ;;
    label: "Cumulative Forecast Upper Bound"
  }
}
