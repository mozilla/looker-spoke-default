include: "//looker-hub/contextual_services/views/suggest_revenue_levers_daily.view.lkml"

view: +suggest_revenue_levers_daily {

  dimension: eligible_share_country {
    hidden: yes
  }

  dimension: live_market_dau {
    hidden: yes
  }

  dimension: urlbar_search_dau {
    hidden: yes
  }

  dimension: suggest_exposed_clients {
    hidden: yes
  }

  dimension: urlbar_search {
    hidden: yes
  }

  dimension: total_impressions {
    hidden: yes
  }

  dimension: spons_impressions {
    hidden: yes
  }

  dimension: spons_clicks {
    hidden: yes
  }

  measure: eligible_share_country_avg {
    label: "Eligible Share of DAU per Country"
    description: "Used to scale global KPI forecasts to specific live markets."
    sql: ${TABLE}.eligible_share_country ;;
    type: average
  }

  measure: live_market_dau_sum {
    label: "Cumulative DAU in Live Markets"
    sql: ${TABLE}.live_market_dau ;;
    type: sum
  }

  measure: urlbar_search_dau_sum {
    label: "DAU w/ 1+ Urlbar Search"
    sql: ${TABLE}.urlbar_search_dau ;;
    type: sum
  }

  measure: suggest_exposed_clients_sum {
    label: "Cumulative DAU exposed to Suggest"
    sql: ${TABLE}.suggest_exposed_clients ;;
    type: sum
  }

  measure: urlbar_search_sum {
    label: "Total Urlbar Search Volume"
    sql: ${TABLE}.urlbar_search ;;
    type: sum
  }

  measure: total_impressions_sum {
    label: "Total Suggestion Impressions"
    description: "Sponsored and Non-Sponsored Suggest Impressions"
    sql: ${TABLE}.total_impressions ;;
    type: sum
  }

  measure: spons_impressions_sum {
    label: "Total Suggest Ad Impressions"
    sql: ${TABLE}.spons_impressions ;;
    type: sum
  }

  measure: spons_clicks_sum {
    label: "Suggest Ad Clicks"
    sql: ${TABLE}.spons_clicks ;;
    type: sum
  }

}
