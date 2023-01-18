include: "//looker-hub/revenue/views/ad_cost_breakdowns.view"

view: +ad_cost_breakdowns {

  dimension: campaign_name {
    sql: ${TABLE}.campaign_name ;;
    type: string
  }

  dimension: cost_per_dou_micros {
    sql: ${TABLE}.cost_per_dou_micros ;;
    type: number
    hidden: yes
  }

  dimension: cost_per_install_micros {
    sql: ${TABLE}.cost_per_install_micros ;;
    type: number
    hidden: yes
  }

  dimension: cost_per_marketing_ad_click_micros {
    sql: ${TABLE}.cost_per_marketing_ad_click_micros ;;
    type: number
    hidden: yes
  }

  dimension: cost_per_revenue_generating_ad_click_micros {
    sql: ${TABLE}.cost_per_revenue_generating_ad_click_micros ;;
    type: number
    hidden: yes
  }

  dimension: ad_conversions {
    sql: ${TABLE}.ad_conversions ;;
    type: number
  }

  dimension: ad_impressions {
    sql: ${TABLE}.ad_impressions ;;
    type: number
  }

  dimension: campaign_spend_in_micros {
    sql: ${TABLE}.campaign_spend_in_micros ;;
    type: number
  }

  dimension: dous {
    sql: ${TABLE}.dous ;;
    type: number
  }

  dimension: installs {
    sql: ${TABLE}.installs ;;
    type: number
  }

  dimension: marketing_ad_clicks {
    sql: ${TABLE}.marketing_ad_clicks ;;
    type: number
  }

  dimension: revenue_generating_ad_clicks {
    sql: ${TABLE}.revenue_generating_ad_clicks ;;
    type: number
  }

}
