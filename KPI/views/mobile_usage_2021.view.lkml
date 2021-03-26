view: mobile_usage_2021 {
  derived_table: {
    sql:
    select
        submission_date,
        app_name,
        sum(dau) as dau,
        sum(wau) as wau,
        sum(mau) as mau,
        sum(cdou) as cdou
    from
        ${mobile_usage_fields.SQL_TABLE_NAME} AS mobile_usage_fields
    where
        {% condition mobile_usage_2021.campaign %} campaign {% endcondition %}
        AND {% condition mobile_usage_2021.canonical_app_name %} canonical_app_name {% endcondition %}
        AND {% condition mobile_usage_2021.channel %} channel {% endcondition %}
        AND {% condition mobile_usage_2021.country %} country {% endcondition %}
        AND {% condition mobile_usage_2021.country_name %} country_name {% endcondition %}
        AND {% condition mobile_usage_2021.distribution_id %} distribution_id {% endcondition %}
        AND {% condition mobile_usage_2021.id_bucket %} id_bucket {% endcondition %}
        AND {% condition mobile_usage_2021.os %} os {% endcondition %}
    group by 1,2 ;;
  }

  filter: campaign {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.campaign
    type: string
  }

  filter: channel {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.channel
    type: string
  }

  filter: country {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.country
    type: string
  }

  filter: country_name {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.country_name
    type: string
  }

  filter: distribution_id {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.distribution_id
    type: string
  }

  filter: id_bucket {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.id_bucket
    type: number
  }

  filter: os {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.os
    type: string
  }

  dimension: app_name {
    type: string
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.app_name
    sql: ${TABLE}.app_name ;;
  }

  dimension: canonical_app_name {
    suggest_explore: mobile_usage_fields
    suggest_dimension: mobile_usage_fields.canonical_app_name
    type: string
  }

  dimension: date {
    type: date
    convert_tz: no
    sql: CAST(${TABLE}.submission_date AS TIMESTAMP) ;;
  }

  measure: cdou {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: dau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
  }

  measure: mau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.mau ;;
  }

  measure: recent_cdou {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.cdou ;;
  }

  measure: recent_date {
    type: date
    sql: MAX(CAST(${TABLE}.submission_date AS TIMESTAMP)) ;;
  }

  measure: wau {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.wau ;;
  }

  measure: delta_from_forecast {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${mobile_prediction.recent_cdou_forecast} ) - 1 ;;
  }

  measure: delta_from_target {
    type: number
    value_format: "0.000%"
    sql: (${recent_cdou} / ${mobile_prediction.recent_cdou_target} ) - 1 ;;
  }

  measure: delta_from_forecast_count {
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${mobile_prediction.cdou_forecast}  ;;
  }

  measure: delta_from_target_count {
    type: number
    value_format: "#,##0"
    sql: ${cdou} - ${mobile_prediction.cdou_target}  ;;
  }

}
