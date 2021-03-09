view: final_fx_android_2021_forecast {
  sql_table_name: `mozdata.analysis.final_fx_android_2021_forecast`
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

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: yhat {
    type: number
    sql: ${TABLE}.yhat ;;
  }

  dimension: yhat_p0 {
    type: number
    sql: ${TABLE}.yhat_p0 ;;
  }

  dimension: yhat_p10 {
    type: number
    sql: ${TABLE}.yhat_p10 ;;
  }

  dimension: yhat_p100 {
    type: number
    sql: ${TABLE}.yhat_p100 ;;
  }

  dimension: yhat_p20 {
    type: number
    sql: ${TABLE}.yhat_p20 ;;
  }

  dimension: yhat_p30 {
    type: number
    sql: ${TABLE}.yhat_p30 ;;
  }

  dimension: yhat_p40 {
    type: number
    sql: ${TABLE}.yhat_p40 ;;
  }

  dimension: yhat_p50 {
    type: number
    sql: ${TABLE}.yhat_p50 ;;
  }

  dimension: yhat_p60 {
    type: number
    sql: ${TABLE}.yhat_p60 ;;
  }

  dimension: yhat_p70 {
    type: number
    sql: ${TABLE}.yhat_p70 ;;
  }

  dimension: yhat_p80 {
    type: number
    sql: ${TABLE}.yhat_p80 ;;
  }

  dimension: yhat_p90 {
    type: number
    sql: ${TABLE}.yhat_p90 ;;
  }

  dimension: yhat_p95 {
    type: number
    sql: ${TABLE}.yhat_p95 ;;
  }

  dimension: yhat_p97_5 {
    type: number
    sql: ${TABLE}.yhat_p97_5 ;;
  }

  dimension: yhat_p99 {
    type: number
    sql: ${TABLE}.yhat_p99 ;;
  }

}
