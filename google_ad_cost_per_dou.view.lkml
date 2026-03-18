view: google_ad_cost_per_dou {
  derived_table: {
    sql: SELECT
          ad_cost_breakdowns.campaign_name  AS ad_cost_breakdowns_campaign_name,
          SUM(ad_cost_breakdowns.campaign_spend_in_micros) AS ad_cost_breakdowns_measure_campaign_spend_in_micros,
          SUM(ad_cost_breakdowns.dous) AS ad_cost_breakdowns_measure_dous
      FROM `moz-fx-data-shared-prod.fenix_derived.google_ads_campaign_cost_breakdowns_v1`  AS ad_cost_breakdowns
      GROUP BY
          1
      ORDER BY
          2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ad_cost_breakdowns_campaign_name {
    type: string
    sql: ${TABLE}.ad_cost_breakdowns_campaign_name ;;
  }

  dimension: ad_cost_breakdowns_measure_campaign_spend_in_micros {
    type: number
    sql: ${TABLE}.ad_cost_breakdowns_measure_campaign_spend_in_micros ;;
  }

  dimension: ad_cost_breakdowns_measure_dous {
    type: number
    sql: ${TABLE}.ad_cost_breakdowns_measure_dous ;;
  }

  set: detail {
    fields: [ad_cost_breakdowns_campaign_name, ad_cost_breakdowns_measure_campaign_spend_in_micros, ad_cost_breakdowns_measure_dous]
  }
}
