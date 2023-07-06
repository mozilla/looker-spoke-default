view: google_uac_android_activation {

  derived_table: {
    sql: WITH uac AS (
         SELECT
           date,
           campaign_name as campaign,
           spend as cost
         FROM
           mozdata.google_ads.daily_campaign_stats
         WHERE
            campaign_name NOT LIKE '%iOS%'
            AND date >= '2022-12-01'
        ), activation AS (
         SELECT
           first_seen_date as date,
           REGEXP_REPLACE(adjust_campaign, '([\\w]+).*', '\\1') as campaign,
           SUM(activated) as activated,
           COUNT(*) as new_profiles,
         FROM `moz-fx-data-shared-prod.fenix.new_profile_activation`
         WHERE
           submission_date >= '2022-12-01'
           AND first_seen_date >= '2022-12-01'
           AND adjust_network = 'Google Ads ACI'
           AND adjust_campaign LIKE 'Mozilla_%'
         GROUP BY
           date,
           campaign
        )
        SELECT
          date,
          campaign,
          CASE WHEN campaign LIKE '%_US_%' OR campaign LIKE '%_CA_%' OR campaign LIKE '%NA%' THEN 'NA'
               WHEN campaign LIKE '%MGFQ3%' THEN 'Expansion'
               ELSE 'EU' END AS region,
          REGEXP_EXTRACT(campaign, '.*(Event\\d).*') as event,
          REGEXP_EXTRACT(campaign, '.*(Group\\d).*') as group_number,
          REGEXP_EXTRACT(campaign, 'Mozilla_FF_UAC_[\\w]{2,5}_([\\w]{2})_[\\w]{2}_.*') AS campaign_country_code,
          REGEXP_EXTRACT(campaign, 'Mozilla_FF_UAC_[\\w]{2,5}_[\\w]{2}_([\\w]{2})_.*') AS campaign_language,
          SUM(new_profiles) as new_profiles,
          SUM(activated) as activated,
          SUM(cost) as cost
        FROM uac
        LEFT JOIN activation USING (date, campaign)
        WHERE date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY)
        GROUP BY
          date,
          campaign
    ;;
  }

  dimension: region {
    description: "Region of the campaign: NA or EU"
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: event {
    description: "Event number used for campaign optimization"
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: group {
    description: "Group of locations targeted in the campaign"
    type: string
    sql: ${TABLE}.group_number ;;
  }

  dimension: campaign_country_code {
    description: "Country code from campaign name"
    type: string
    sql: ${TABLE}.campaign_country_code ;;
  }

  dimension: campaign_language {
    description: "Language from campaign name"
    type: string
    sql: ${TABLE}.campaign_language ;;
  }

  dimension: campaign {
    description: "Campaign name"
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: campaign_date {
    description: "Date of campaign spend"
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

  measure: new_profiles {
    description: "First run profiles"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: activated {
    description: "First run activations"
    type: sum
    sql: ${TABLE}.activated ;;
  }

  measure: cost {
    description: "Campaign cost"
    type: sum
    sql: ${TABLE}.cost ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activated}/ NULLIF(${new_profiles},0) ;;
  }

  measure: activated_per_dollar {
    label: "Activated/$"
    type: number
    value_format_name: decimal_4
    sql: ${activated}/ NULLIF(${cost},0) ;;
  }

  measure: cost_per_activation {
    label: "Cost per activation"
    type: number
    value_format_name: usd
    sql: ${cost}/ NULLIF(${activated},0) ;;
  }

}
