view: prediction {
  derived_table: {
    sql:
    SELECT
      *,
      AVG(dau_forecast) OVER window_7day AS dau_forecast_7day_ma,
      avg(dau_target) over window_7day as dau_target_7day_ma,
      avg(dau_forecast_lower) over window_7day as dau_forecast_lower_7day_ma,
      avg(dau_forecast_upper) over window_7day as dau_forecast_upper_7day_ma,
      avg(new_profiles_forecast) over window_7day as new_profiles_forecast_7day_ma,
      avg(new_profiles_target) over window_7day as new_profiles_target_7day_ma,
      avg(new_profiles_forecast_lower) over window_7day as new_profiles_forecast_lower_7day_ma,
      avg(new_profiles_forecast_upper) over window_7day as new_profiles_forecast_upper_7day_ma
    FROM
      mozdata.analysis.dou_forecasts
    WHERE
      key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '')
    WINDOW window_7day AS (order by submission_date rows between 6 preceding and current row);;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
    hidden: yes
  }

  measure: cdou_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_forecast) ;;
    description: "Forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cdou_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cdou_target) ;;
    description: "Targeted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cum_new_profiles_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_forecast) ;;
    description: "Forecasted value for Cumulative New Profiles. Only relevant for 2021."
  }

  measure: cum_new_profiles_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.cum_new_profiles_target) ;;
    description: "Targeted value for Cumulative New Profiles. Only relevant for 2021."
  }

  measure: dau_forecast {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast ;;
    description: "Forecasted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_7day_ma) ;;
    hidden: yes
  }

  measure: dau_forecast_lower {
    label: "DAU Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower) ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_lower_7day_ma) ;;
    hidden: yes
  }

  measure: dau_forecast_upper {
    label: "DAU Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper) ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_forecast_upper_7day_ma) ;;
    hidden: yes
  }

  measure: dau_target {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_target ;;
    description: "Targeted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_target_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.dau_target_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast) ;;
    description: "Forecasted value for New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_lower {
    label: "New Profiles Forecast Lower Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower) ;;
    description: "Lower bound (10th percentile) value for Forecasted New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_lower_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_lower_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_forecast_upper {
    label: "New Profiles Forecast Upper Bound"
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper) ;;
    description: "Upper bound (90th percentile) value for Forecasted New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_forecast_upper_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_forecast_upper_7day_ma) ;;
    hidden: yes
  }

  measure: new_profiles_target {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target) ;;
    description: "Targeted value for New Profiles. Only relevant for 2021."
  }

  measure: new_profiles_target_7day_ma {
    type: number
    value_format: "#,##0"
    sql: ANY_VALUE(${TABLE}.new_profiles_target_7day_ma) ;;
    hidden: yes
  }

  measure: recent_cum_new_profiles_forecast {
    type: max
    value_format: "0.000,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cum_new_profiles_target {
    type: max
    value_format: "0.00,, \"Million\""
    sql: ${TABLE}.cum_new_profiles_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cdou_target {
    type: max
    value_format: "0.00,,, \"Billion\""
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }
}

view: key_in_cache {
  derived_table: {
    sql:
      SELECT COUNT(*) AS row_count
      FROM mozdata.analysis.dou_forecasts
      WHERE key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition firefox_desktop_usage_2021.activity_segment %} activity_segment {% endcondition %}
      {% condition firefox_desktop_usage_2021.campaign %} campaign {% endcondition %}
      {% condition firefox_desktop_usage_2021.channel %} channel {% endcondition %}
      {% condition firefox_desktop_usage_2021.content %} content {% endcondition %}
      {% condition firefox_desktop_usage_2021.country %} country {% endcondition %}
      {% condition firefox_desktop_usage_2021.country_name %} country_name {% endcondition %}
      {% condition firefox_desktop_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition firefox_desktop_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition firefox_desktop_usage_2021.medium %} medium {% endcondition %}
      {% condition firefox_desktop_usage_2021.os %} os {% endcondition %}
      {% condition firefox_desktop_usage_2021.source %} source {% endcondition %}
      {% condition firefox_desktop_usage_2021.attributed %} (attributed) {% endcondition %}
      """, r"(\(.*\))"), '') ;;
  }

  measure: is_cached {
    type: string
    sql: if(MAX(row_count) > 0, "Forecast for current selection is cached.", "Building forecast model, will take 2-3 minutes...") ;;
  }
}
