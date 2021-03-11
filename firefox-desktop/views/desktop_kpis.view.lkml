view: desktop_kpis {
  derived_table: {
    sql: WITH base AS (
          SELECT
            TIMESTAMP(submission_date) as date
            , SUM(cdou) as cdou
            , SUM(dau) as dau
            , SUM(new_profiles) as new_profiles
        FROM `mozdata.telemetry.firefox_desktop_usage_2021`
        GROUP BY submission_date
      )

      SELECT
        *
        , SUM(new_profiles) OVER (PARTITION BY EXTRACT(YEAR FROM date) ORDER BY date) AS new_profiles_cumulative
      FROM base
      ORDER BY 1
      ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  measure: new_profiles {
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: sum
    sql: ${TABLE}.new_profiles_cumulative ;;
  }

  measure: recent_new_profiles_cumulative {
    type: max
    sql: ${TABLE}.new_profiles_cumulative ;;
  }

  measure: cdou {
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  measure: recent_cdou {
    type: max
    sql: ${TABLE}.cdou ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${loines_desktop_dau_forecast_20210119.recent_yhat_cumulative} ) - 1 ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${loines_desktop_dau_forecast_20210119.recent_cumulative_forecast_plus5} ) - 1 ;;
  }

  measure: delta_from_target_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${loines_desktop_dau_forecast_20210119.cumulative_forecast_plus5} ;;
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${loines_desktop_dau_forecast_20210119.yhat_cumulative}  ;;
  }

  measure: delta_from_forecast_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / ${loines_desktop_new_profiles_forecast_20210119.recent_yhat_cumulative} ) - 1 ;;
  }

  measure: delta_from_target_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / ${loines_desktop_new_profiles_forecast_20210119.recent_cumulative_forecast_plus5} ) - 1 ;;
  }

  measure: delta_from_forecast_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${loines_desktop_new_profiles_forecast_20210119.yhat_cumulative}  ;;
  }

  measure: delta_from_target_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${loines_desktop_new_profiles_forecast_20210119.cumulative_new_profiles_forecast_plus5} ;;
  }

}
