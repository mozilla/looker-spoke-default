view: firefox_desktop_ltv {
  label: "Firefox Desktop Lifetime Value (LTV)"
  derived_table: {
    sql: with first_country AS
(SELECT client_id, sample_id, country as first_reported_country
FROM `mozdata.telemetry.clients_first_seen`
)

SELECT client_id,
  sample_id,
  first_reported_country,
  total_historic_ad_clicks,
  total_future_ad_clicks,
  total_predicted_ad_clicks,
  revenue_per_click,
  historic_value,
  future_value,
  lifetime_value
FROM `mozdata.ltv.firefox_desktop_client_ltv`
LEFT JOIN first_country USING(client_id, sample_id)
      ;;
  }

  dimension: client_id {
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    hidden: yes
  }

  dimension: first_reported_country {
    sql: ${TABLE}.first_reported_country ;;
    type: string
  }

  measure: total_users {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: lifetime_value_total  {
    type: sum
    sql:${TABLE}.lifetime_value ;;
    description: "Total Value"
  }

  measure: average_ltv {
    type: number
    value_format: "$0.000"
    label: "Average LTV"
    sql: SAFE_DIVIDE(${lifetime_value_total},  ${total_users});;
    description: "The predicted LTV of a single user, in US dollars."
  }

  measure: future_ad_clicks_total  {
    type: sum
    sql: ${TABLE}.total_future_ad_clicks ;;
    description: "Total future ad clicks"
  }

  measure: historic_ad_clicks_total {
    type: sum
    sql:  ${TABLE}.total_historic_ad_clicks ;;
    description: "Total historic ad clicks"
  }

  measure: predicted_ad_clicks_total {
    type: sum
    sql:  ${TABLE}.total_predicted_ad_clicks ;;
    description: "Total predicted ad clicks"
  }

}
