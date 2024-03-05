view: ctd_uac {

  derived_table: {
    sql: WITH
    on_platform as (
  SELECT  date, ad_group_name, ad_group_id, format_date('%m-%b', date) as month,
    sum(spend) as cost,
    sum(clicks) as clicks,
    sum(impressions) as impressions,
  FROM
    mozdata.google_ads.daily_ad_group_stats
  WHERE
    account_name = "Mozilla Firefox UAC"
    AND campaign_name = "Mozilla_FF_UAC_EU_DE_DE_AllGroups_Event7"
    AND date  >= '2023-06-01'
  GROUP BY 1, 2, 3, 4 
  ORDER BY 1
)
, telemetry as (
  SELECT
        first_seen_date as date, REGEXP_EXTRACT(adjust_adgroup, r'\((\d+)\)') AS ad_group_id,
        sum(activated) as activations,
        count(distinct client_id) as clients
  FROM `moz-fx-data-shared-prod.fenix.new_profile_activation`
  WHERE
        submission_date >= '2023-06-26'
     AND first_seen_date >= '2023-06-27' --and "2023-07-31"
     AND adjust_network = 'Google Ads ACI'
     AND adjust_campaign like r"%Mozilla\_FF\_UAC\_EU\_DE\_DE\_AllGroups\_Event7%"
        --AND adjust_adgroup <> "DE Ad Group (150957842358)"
  GROUP BY 1, 2 
  ORDER BY 1
)
SELECT uac.*, telemetry.activations, telemetry.clients
FROM on_platform uac
LEFT JOIN telemetry
USING(date, ad_group_id)
;;
}

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: ad_group_id {
    type: string
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: norm_month {
    label: "Month"
    description: "Normalized months to roll over June months into July"
    type: string
    sql:CASE WHEN DATE(${TABLE}.date) <= "2023-07-01" THEN '07-Jul' ELSE ${TABLE}.month END
       ;;
  }

  dimension_group: date {
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

 #150957842358
  dimension: creative_type {
    description: "Creative type - whether benchmark or ctd creative"
    type: string
    sql:CASE WHEN ${TABLE}.ad_group_id = "150957842358" THEN 'Benchmark' ELSE "CTD" END
      ;;
  }

  measure: cost {
    description: "cost of campaigns"
    type: sum
    sql: ${TABLE}.cost ;;
  }

  measure: clicks {
    description: "total clicks"
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: impressions {
    description: "total impressions"
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: activations {
    description: "number of clients who activated"
    type: sum
    sql: ${TABLE}.activations ;;
  }

  measure: clients {
    description: "number of clients who activated"
    type: sum
    sql: ${TABLE}.clients ;;
  }
}
