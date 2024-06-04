include: "//looker-hub/revenue/views/firefox_ios_ltv.view.lkml"

view: +firefox_ios_ltv {
  label: "Firefox iOS Life Time Value"

  dimension: lifetime_value {
    sql: ${TABLE}.lifetime_value ;;
    type: number
    hidden: yes
  }

  dimension: sample_id {
    sql: ${TABLE}.sample_id ;;
    type: number
    hidden: yes
  }

  dimension: total_future_ad_clicks {
    sql: ${TABLE}.total_future_ad_clicks ;;
    type: number
    hidden: yes
  }

  dimension: total_historic_ad_clicks {
    sql: ${TABLE}.total_historic_ad_clicks ;;
    type: number
    hidden: yes
  }

  dimension: total_predicted_ad_clicks {
    sql: ${TABLE}.total_predicted_ad_clicks ;;
    type: number
    hidden: yes
  }

  measure: lifetime_value_total  {
    type: sum
    sql:${TABLE}.lifetime_value ;;
    description: "Total life time revenue"
  }

  measure:future_ad_clicks_total  {
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
