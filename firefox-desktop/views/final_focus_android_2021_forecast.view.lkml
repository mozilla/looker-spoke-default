view: final_focus_android_2021_forecast {
  derived_table: {
    sql: SELECT
        * EXCEPT(change_description)
        FROM `mozdata.analysis.final_focus_android_2021_forecast`
    ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  measure: yhat {
    type: sum
    sql: ${TABLE}.yhat ;;
  }

  measure: yhat_p0 {
    type: sum
    sql: ${TABLE}.yhat_p0 ;;
  }

  measure: yhat_p10 {
    type: sum
    sql: ${TABLE}.yhat_p10 ;;
  }

  measure: yhat_p100 {
    type: sum
    sql: ${TABLE}.yhat_p100 ;;
  }

  measure: yhat_p20 {
    type: sum
    sql: ${TABLE}.yhat_p20 ;;
  }

  measure: yhat_p30 {
    type: sum
    sql: ${TABLE}.yhat_p30 ;;
  }

  measure: yhat_p40 {
    type: sum
    sql: ${TABLE}.yhat_p40 ;;
  }

  measure: yhat_p50 {
    type: sum
    sql: ${TABLE}.yhat_p50 ;;
  }

  measure: yhat_p60 {
    type: sum
    sql: ${TABLE}.yhat_p60 ;;
  }

  measure: yhat_p70 {
    type: sum
    sql: ${TABLE}.yhat_p70 ;;
  }

  measure: yhat_p80 {
    type: sum
    sql: ${TABLE}.yhat_p80 ;;
  }

  measure: yhat_p90 {
    type: sum
    sql: ${TABLE}.yhat_p90 ;;
  }

  measure: yhat_p95 {
    type: sum
    sql: ${TABLE}.yhat_p95 ;;
  }

  measure: yhat_p97_5 {
    type: sum
    sql: ${TABLE}.yhat_p97_5 ;;
  }

  measure: yhat_p99 {
    type: sum
    sql: ${TABLE}.yhat_p99 ;;
  }

}
