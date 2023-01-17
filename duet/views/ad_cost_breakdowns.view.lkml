include: "//looker-hub/revenue/views/ad_cost_breakdowns.view"

view: +ad_cost_breakdowns {

  dimension: campaign_name {
    sql: ${TABLE}.campaign_name ;;
    type: string
  }

  dimension: ad_conversions {
    sql: ${TABLE}.ad_conversions ;;
    type: number
    hidden: yes
  }

  measure: measure_ad_conversions {
    label: "ad_conversions"
    sql: ${TABLE}.ad_conversions ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: ad_impressions {
    sql: ${TABLE}.ad_impressions ;;
    type: number
    hidden: yes
  }

  measure: measure_ad_impressions {
    label: "ad_impressions"
    sql: ${TABLE}.ad_impressions ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_spend_in_micros {
    sql: ${TABLE}.campaign_spend_in_micros ;;
    type: number
    hidden: yes
  }

  measure: measure_campaign_spend_in_micros {
    label: "campaign_spend_in_micros"
    sql: ${TABLE}.campaign_spend_in_micros ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: dous {
    sql: ${TABLE}.dous ;;
    type: number
    hidden: yes
  }

  measure: measure_dous {
    label: "dous"
    sql: ${TABLE}.dous ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: installs {
    sql: ${TABLE}.installs ;;
    type: number
    hidden: yes
  }

  measure: measure_installs {
    label: "installs"
    sql: ${TABLE}.installs ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: marketing_ad_clicks {
    sql: ${TABLE}.marketing_ad_clicks ;;
    type: number
    hidden: yes
  }

  measure: measure_marketing_ad_clicks {
    label: "marketing_ad_clicks"
    sql: ${TABLE}.marketing_ad_clicks ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }

  dimension: revenue_generating_ad_clicks {
    sql: ${TABLE}.revenue_generating_ad_clicks ;;
    type: number
    hidden: yes
  }

  measure: measure_revenue_generating_ad_clicks {
    label: "revenue_generating_ad_clicks"
    sql: ${TABLE}.revenue_generating_ad_clicks ;;
    type: sum_distinct
    sql_distinct_key: ${TABLE}.campaign_name ;;
  }
}
