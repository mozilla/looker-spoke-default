view: firefox_desktop_usage_2021 {
  sql_table_name: `mozdata.telemetry.firefox_desktop_usage_2021`
    ;;

  dimension: activity_segment {
    type: string
    sql: ${TABLE}.activity_segment ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  measure: cdou_computed {
    type: running_total
    sql: ${dau} ;;
  }

  measure: cdou {
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  dimension: distribution_id {
    type: string
    sql: ${TABLE}.distribution_id ;;
  }

  dimension: id_bucket {
    type: number
    sql: ${TABLE}.id_bucket ;;
  }

  measure: mau {
    type: sum
    sql: ${TABLE}.mau ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  measure: new_profiles {
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: running_total
    sql: ${new_profiles} ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension_group: submission {
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
    sql: ${TABLE}.submission_date ;;
  }

  measure: wau {
    type: sum
    sql: ${TABLE}.wau ;;
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.000%"
    sql: (${cdou_computed} / ${loines_desktop_dau_forecast_20210119.yhat_cumulative} ) - 1 ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.000%"
    sql: (${cdou_computed} / ${loines_desktop_dau_forecast_20210119.dau_forecast_plus5} ) - 1 ;;
  }

  measure: delta_from_target_count {
    type: number
    value_format: "0"
    sql: ${cdou_computed} - ${loines_desktop_dau_forecast_20210119.cumulative_forecast_plus5}  ;;
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "0"
    sql: ${cdou_computed} - ${loines_desktop_dau_forecast_20210119.dau_forecast}  ;;
  }

  measure: delta_from_forecast_count_running {
    type: running_total
    value_format: "0"
    sql: ${delta_from_forecast_count}  ;;
  }

  measure: delta_from_forecast_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${new_profiles_cumulative} / ${loines_desktop_new_profiles_forecast_20210119.yhat_cumulative} ) - 1 ;;
  }

  measure: delta_from_target_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${new_profiles_cumulative} / ${loines_desktop_new_profiles_forecast_20210119.forecast_plus5} ) - 1 ;;
  }

  measure: delta_from_forecast_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${loines_desktop_new_profiles_forecast_20210119.yhat}  ;;
  }

  measure: delta_from_target_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${loines_desktop_new_profiles_forecast_20210119.cumulative_new_profiles_forecast_plus5} ;;
  }

  measure: delta_from_forecast_new_profiles_count_running {
    type: running_total
    value_format: "0"
    sql: ${delta_from_forecast_new_profiles_count}  ;;
  }

}
