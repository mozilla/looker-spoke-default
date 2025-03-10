view: mobile_prediction {
  derived_table: {
    sql:
    SELECT
      *,
      avg(dau_forecast) over window_7day AS dau_forecast_7day_ma,
      avg(dau_target) over window_7day as dau_target_7day_ma,
      avg(dau_forecast_lower) over window_7day as dau_forecast_lower_7day_ma,
      avg(dau_forecast_upper) over window_7day as dau_forecast_upper_7day_ma
    FROM
      mozdata.analysis.mobile_dou_forecasts
    WHERE
      key = ARRAY_TO_STRING(REGEXP_EXTRACT_ALL("""
      {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
      {% condition mobile_usage_2021.channel %} channel {% endcondition %}
      {% condition mobile_usage_2021.country %} country {% endcondition %}
      {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
      {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
      {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
      {% condition mobile_usage_2021.os %} os {% endcondition %}
      """, r"(\(.*\))"), '')
    WINDOW window_7day AS (partition by app_name order by submission_date rows between 6 preceding and current row);;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.app_name ;;
    description: "Snake-cased mobile application name."
  }

  dimension: date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: cdou_forecast {
    type: sum
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.cdou_forecast ;;
    description: "Forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: cdou_target {
    type: sum
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.cdou_target ;;
    description: "Targeted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast ;;
    description: "Forecasted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_forecast_format {
    type: sum
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.dau_forecast ;;
    description: "Forecasted value for Daily Active Users. Only relevant for 2021."
    hidden: yes
  }

  measure: dau_forecast_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_7day_ma ;;
    hidden: yes
  }

  measure: dau_target {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_target ;;
    description: "Targeted value for Daily Active Users. Only relevant for 2021."
  }

  measure: dau_target_format {
    type: sum
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.dau_target ;;
    description: "Targeted value for Daily Active Users. Only relevant for 2021."
    hidden: yes
  }

  measure: dau_target_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_target_7day_ma ;;
    hidden: yes
  }

  measure: dau_forecast_lower {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_lower ;;
    description: "Lower bound (10th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_lower_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_lower_7day_ma ;;
    hidden: yes
  }

  measure: dau_forecast_upper {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_upper ;;
    description: "Upper bound (90th percentile) of forecasted value for Cumulative Days of Use. Only relevant for 2021."
  }

  measure: dau_forecast_upper_7day_ma {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau_forecast_upper_7day_ma ;;
    hidden: yes
  }

  measure: recent_cdou_forecast {
    type: max
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.cdou_forecast ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }

  measure: recent_cdou_target {
    type: max
    value_format: "0.000,,, \"Billion\""
    sql: ${TABLE}.cdou_target ;;
    filters: [
      date: "after 2021-01-01"
    ]
    hidden: yes
  }
}
