view: firefox_desktop_usage_2021 {
derived_table: {
  sql:
    select
        submission_date,
        sum(dau) as dau,
        sum(wau) as wau,
        sum(mau) as mau,
        sum(cdou) as cdou,
        sum(new_profiles) as new_profiles,
        sum(cumulative_new_profiles) as cumulative_new_profiles,
    from
        `mozdata.telemetry.firefox_desktop_usage_2021`
    where
        {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
        AND {% condition firefox_desktop_usage_2021.attributed %} attributed {% endcondition %}
    group by 1 ;;
}

  filter: activity_segment {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.activity_segment
    type: string
  }

  filter: campaign {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.campaign
    type: string
  }

  filter: channel {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.channel
    type: string
  }

  filter: content {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.content
    type: string
  }

  filter: country {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.country
    type: string
  }

  filter: distribution_id {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.distribution_id
    type: string
  }

  filter: id_bucket {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.id_bucket
    type: number
  }

  filter: medium {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.medium
    type: string
  }

  filter: os {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.os
    type: string
  }

  filter: source {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.source
    type: string
  }

  filter: attributed {
    suggest_explore: firefox_desktop_usage_fields
    suggest_dimension: firefox_desktop_usage_fields.attributed
    type: yesno
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: mau {
    type: sum
    sql: ${TABLE}.mau ;;
  }

  measure: new_profiles {
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_cumulative {
    type: sum
    sql: ${TABLE}.cumulative_new_profiles ;;
  }

  measure: cdou {
    type: sum
    sql: ${TABLE}.cdou ;;
  }

  measure: new_profiles_cumulative_2021 {
    type: sum
    sql: ${TABLE}.cumulative_new_profiles ;;
    filters: [
      date: "after 2021-01-01"
    ]
  }

  measure: recent_new_profiles_cumulative {
    type: max
    sql: ${TABLE}.cumulative_new_profiles ;;
  }

  measure: recent_cdou {
    type: max
    sql: ${TABLE}.cdou ;;
  }

  measure: wau {
    type: sum
    sql: ${TABLE}.wau ;;
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${prediction.recent_cdou_forecast} ) - 1 ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / (${prediction.recent_cdou_target}) ) - 1 ;;
  }

  measure: delta_from_target_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${prediction.cdou_target} ;;
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "0"
    sql: ${cdou} - ${prediction.cdou_forecast}  ;;
  }

  measure: delta_from_forecast_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / ${prediction.recent_cum_new_profiles_forecast} ) - 1 ;;
  }

  measure: delta_from_target_new_profiles {
    type: number
    value_format: "0.000%"
    sql: (${recent_new_profiles_cumulative} / (${prediction.recent_cum_new_profiles_target}) ) - 1 ;;
  }

  measure: delta_from_forecast_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${prediction.cum_new_profiles_forecast}  ;;
  }

  measure: delta_from_target_new_profiles_count {
    type: number
    value_format: "0"
    sql: ${new_profiles_cumulative} - ${prediction.cum_new_profiles_target} ;;
  }
}
