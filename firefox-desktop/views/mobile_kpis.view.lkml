# Mapping of forecast `product` column to mobile_usage_2021 `canonical_app_name`` (for join)
# Focus Android == Firefox Focus for Android
# Focus iOS == Firefox Focus for iOS
# Firefox Android == Firefox for Android (Fenix)
# Firefox Android == Firefox for Android (Fennec)
# Firefox iOS == Firefox for iOS

view: mobile_kpis {
  derived_table: {
    sql: SELECT
            TIMESTAMP(submission_date) as date
            , CASE WHEN canonical_app_name = "Firefox Focus for Android" THEN "Focus Android"
                WHEN canonical_app_name = "Firefox Focus for iOS" THEN "Focus iOS"
                WHEN canonical_app_name IN ("Firefox for Android (Fenix)", "Firefox for Android (Fennec)") THEN "Firefox Android"
                WHEN canonical_app_name = "Firefox for iOS" THEN "Firefox iOS"
                ELSE "UhOh" END AS product
            , SUM(cdou) as cdou
            , SUM(dau) as dau
        FROM `mozdata.telemetry.mobile_usage_2021`
        WHERE canonical_app_name IN ("Firefox Focus for Android", "Firefox Focus for iOS", "Firefox for Android (Fenix)", "Firefox for Android (Fennec)", "Firefox for iOS")
        GROUP BY 1, 2
        ORDER BY 1, 2
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

  measure: cdou {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: recent_cdou {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: dau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${mobile_forecasts.recent_yhat_cumulative} ) - 1 ;;
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${mobile_forecasts.yhat_cumulative}  ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${mobile_forecasts.recent_target_pace} ) - 1 ;;
  }

  measure: delta_from_target_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${mobile_forecasts.target_pace}  ;;
  }

}
