# note that to get the union to work I had to re-order the columns of the fx_ios forecast tablefor some reason they are in a different order.
# Mapping of forecast `product` column to mobile_usage_2021 `canonical_app_name`` (for join)
# Focus Android == Firefox Focus for Android
# Focus iOS == Firefox Focus for iOS
# Firefox Android == Firefox for Android (Fenix)
# Firefox Android == Firefox for Android (Fennec)
# Firefox iOS == Firefox for iOS

view: mobile_forecasts {
  derived_table: {
    sql: WITH base as (
          SELECT
            * EXCEPT(change_description),
            .1 AS target_lift
          FROM `mozdata.analysis.final_focus_android_2021_forecast`
          UNION ALL
          SELECT
            *,
            .029 AS target_lift
          FROM  `mozdata.analysis.final_focus_ios_2021_forecast`
          UNION ALL
          SELECT
            *,
            .004 AS target_lift
          FROM  `mozdata.analysis.final_fx_android_2021_forecast`
          UNION ALL
          SELECT
            date,
            yhat,
            yhat_p0,
            * EXCEPT(dateyhatyhat_p0),
            .028 AS target_lift
          FROM  `mozdata.analysis.final_fx_ios_2021_forecast`
        )

        SELECT
          *,
          CASE WHEN product = "Focus Android" THEN "focus_android"
              WHEN product = "Focus iOS" THEN "focus_ios"
              WHEN product = "Firefox Android" THEN "fennec_fenix"
              WHEN product = "Firefox iOS" THEN "focus_ios" END AS app_name,
          SUM(yhat) OVER (PARTITION BY product EXTRACT(year FROM DATE(date)) ORDER BY date) AS yhat_cumulative,
          SUM(yhat) OVER (PARTITION BY product EXTRACT(year FROM DATE(date)) ORDER BY date) * (1 + target_lift) AS target_pace
        FROM base
      ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: app_name {
    type: string
    hidden: yes
    sql: ${TABLE}.app_name ;;
  }

  measure: yhat {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat ;;
  }

  measure: yhat_p0 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p0 ;;
  }

  measure: yhat_p10 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p10 ;;
  }

  measure: yhat_p100 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p100 ;;
  }

  measure: yhat_p20 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p20 ;;
  }

  measure: yhat_p30 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p30 ;;
  }

  measure: yhat_p40 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p40 ;;
  }

  measure: yhat_p50 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p50 ;;
  }

  measure: yhat_p60 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p60 ;;
  }

  measure: yhat_p70 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p70 ;;
  }

  measure: yhat_p80 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p80 ;;
  }

  measure: yhat_p90 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p90 ;;
  }

  measure: yhat_p95 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p95 ;;
  }

  measure: yhat_p97_5 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p97_5 ;;
  }

  measure: yhat_p99 {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_p99 ;;
  }

  measure: yhat_cumulative {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: recent_yhat_cumulative {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.yhat_cumulative ;;
  }

  measure: target_pace {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.target_pace ;;
  }

  measure: recent_target_pace {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.target_pace ;;
  }


}
