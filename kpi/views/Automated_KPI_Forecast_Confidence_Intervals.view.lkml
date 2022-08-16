include: "//looker-hub/kpi/views/automated_kpi_confidence_intervals.view.lkml"

view: +automated_kpi_confidence_intervals {

  dimension: asofdate {
    label: "Last Forecasted Date"
  }

  dimension: date {
    hidden: yes
    sql: ${TABLE}.date ;;
    }

  dimension_group: submission {
    sql: ${TABLE}.date ;;
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
    label: "Forecast Run Date"
    }

  dimension: value {
    hidden:  yes
    sql: ${TABLE}.value ;;
  }

  measure: Estimated_Value {
    type: number
    description: "Forecasted if after forecast date, observed if before."
    sql: SUM(CAST(${TABLE}.value as NUMERIC)) ;;
  }

  dimension: yhat_p5 {
    hidden:  yes
    sql: ${TABLE}.yhat_p5 ;;
  }

  measure: Estimated_05th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p5 as NUMERIC)) ;;
  }

  dimension: yhat_p10 {
    hidden:  yes
    sql: ${TABLE}.yhat_p10 ;;
  }

  measure: Estimated_10th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p10 as NUMERIC)) ;;
  }

  dimension: yhat_p20 {
    hidden:  yes
    sql: ${TABLE}.yhat_p20 ;;
  }

  measure: Estimated_20th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p20 as NUMERIC)) ;;
  }

  dimension: yhat_p30 {
    hidden:  yes
    sql: ${TABLE}.yhat_p30 ;;
  }

  measure: Estimated_30th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p30 as NUMERIC)) ;;
  }

  dimension: yhat_p40 {
    hidden:  yes
    sql: ${TABLE}.yhat_p40 ;;
  }

  measure: Estimated_40th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p40 as NUMERIC)) ;;
  }

  dimension: yhat_p50 {
    hidden:  yes
    sql: ${TABLE}.yhat_p50 ;;
  }

  measure: Estimated_50th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p50 as NUMERIC)) ;;
  }

  dimension: yhat_p60 {
    hidden:  yes
    sql: ${TABLE}.yhat_p60 ;;
  }

  measure: Estimated_60th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p60 as NUMERIC)) ;;
  }

  dimension: yhat_p70 {
    hidden:  yes
    sql: ${TABLE}.yhat_p70 ;;
  }

  measure: Estimated_70th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p70 as NUMERIC)) ;;
  }

  dimension: yhat_p80 {
    hidden:  yes
    sql: ${TABLE}.yhat_p80 ;;
  }

  measure: Estimated_80th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p80 as NUMERIC)) ;;
  }

  dimension: yhat_p90 {
    hidden:  yes
    sql: ${TABLE}.yhat_p90 ;;
  }

  measure: Estimated_90th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p90 as NUMERIC)) ;;
  }

  dimension: yhat_p95 {
    hidden:  yes
    sql: ${TABLE}.yhat_p95 ;;
  }

  measure: Estimated_95th_Percentile{
    type: number
    sql: SUM(CAST(${TABLE}.yhat_p95 as NUMERIC)) ;;
  }


}
