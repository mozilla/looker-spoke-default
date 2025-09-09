view: firefox_desktop_ltv {
  label: "Firefox Desktop Lifetime Value (LTV)"
  sql_table_name: mozdata.ltv.firefox_desktop_client_ltv;;

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
