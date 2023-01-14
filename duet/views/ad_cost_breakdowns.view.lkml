include: "//looker-hub/revenue/views/ad_cost_breakdowns.view"

view: +ad_cost_breakdowns {


  dimension: ad_conversions {
    sql: ${TABLE}.ad_conversions ;;
    type: number
    hidden: yes
  }

  measure: measure_ad_conversions {
    label: "ad_conversions"
    sql: ${TABLE}.ad_conversions ;;
    type: number
  }

  dimension: ad_impressions {
    sql: ${TABLE}.ad_impressions ;;
    type: number
    hidden: yes
  }

  measure: measure_ad_impressions {
    label: "ad_impressions"
    sql: ${TABLE}.ad_impressions ;;
    type: number
  }

  dimension: campaign_name {
    sql: ${TABLE}.campaign_name ;;
    type: string
  }

  dimension: campaign_spend_in_micros {
    sql: ${TABLE}.campaign_spend_in_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_campaign_spend_in_micros {
    label: "campaign_spend_in_micros"
    sql: ${TABLE}.campaign_spend_in_micros ;;
    type: number
  }

  dimension: cost_per_dou_micros {
    sql: ${TABLE}.cost_per_dou_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_cost_per_dou_micros {
    label: "cost_per_dou_micros"
    sql: ${TABLE}.cost_per_dou_micros ;;
    type: number
  }

  dimension: cost_per_install_micros {
    sql: ${TABLE}.cost_per_install_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_cost_per_install_micros {
    label: "cost_per_install_micros"
    sql: ${TABLE}.cost_per_install_micros ;;
    type: number
  }

  dimension: cost_per_marketing_ad_click_micros {
    sql: ${TABLE}.cost_per_marketing_ad_click_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_cost_per_marketing_ad_click_micros {
    label: "cost_per_marketing_ad_click_micros"
    sql: ${TABLE}.cost_per_marketing_ad_click_micros ;;
    type: number
  }

  dimension: cost_per_revenue_generating_ad_click_micros {
    sql: ${TABLE}.cost_per_revenue_generating_ad_click_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_cost_per_revenue_generating_ad_click_micros {
    label: "cost_per_revenue_generating_ad_click_micros"
    sql: ${TABLE}.cost_per_revenue_generating_ad_click_micros ;;
    type: number
  }

  dimension: dous {
    sql: ${TABLE}.dous ;;
    type: number
    hidden: yes
  }

  measure: measure_dous {
    label: "dous"
    sql: ${TABLE}.dous ;;
    type: number
  }

  dimension: installs {
    sql: ${TABLE}.installs ;;
    type: number
    hidden: yes
  }

  measure: measure_installs {
    label: "installs"
    sql: ${TABLE}.installs ;;
    type: number
  }

  dimension: marketing_ad_clicks {
    sql: ${TABLE}.marketing_ad_clicks ;;
    type: number
    hidden: yes
  }

  measure: measure_marketing_ad_clicks {
    label: "marketing_ad_clicks"
    sql: ${TABLE}.marketing_ad_clicks ;;
    type: number
  }

  dimension: revenue_generating_ad_clicks {
    sql: ${TABLE}.revenue_generating_ad_clicks ;;
    type: number
    hidden: yes
  }

  measure: measure_revenue_generating_ad_clicks {
    label: "revenue_generating_ad_clicks"
    sql: ${TABLE}.revenue_generating_ad_clicks ;;
    type: number
  }
}
