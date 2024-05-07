view: android_app_campaign_stats {

  sql_table_name: `moz-fx-data-shared-prod.google_ads_derived.android_app_campaign_stats_v1` ;;

  #### The below is copied directly from looker-hub. Why?
  #### We needed to keep this new explore backwards-compatible with an old explore.
  #### That old explore had measure names that were the _same_ as some of the dimensions
  #### in the generated LookML. Because we can't remove dimensions from LookML with refinements,
  #### (only hide them), and measures cannot share names with dimensions, I couldn't include
  #### those backwards-compatible measures in a refined view from the generated LookML.
  #### Instead, I append "_dim" to their names, see e.g. new_profiles_dim

  dimension: ad_group {
    sql: ${TABLE}.ad_group ;;
    type: string
    description: "The name of the ad group"
  }

  dimension: campaign {
    sql: ${TABLE}.campaign ;;
    type: string
    description: "The name of the campaign"
  }

  dimension: campaign_country_code {
    sql: ${TABLE}.campaign_country_code ;;
    type: string
    description: "The country code, pulled from the campaign name (where possible)"
  }

  dimension: campaign_language {
    sql: ${TABLE}.campaign_language ;;
    type: string
    description: "The campaign language, pulled from the campaign name (where possible)"
  }

  dimension: campaign_region {
    sql: ${TABLE}.campaign_region ;;
    type: string
    description: "The campaign region, pulled from the campaign name"
  }

  dimension: activated_profiles_dim {
    sql: COALESCE(${TABLE}.activated_profiles, 0) ;;
    type: number
    hidden: yes
  }

  dimension: clicks_dim {
    sql: COALESCE(${TABLE}.clicks, 0) ;;
    type: number
    hidden: yes
  }

  dimension: impressions_dim {
    sql: COALESCE(${TABLE}.impressions, 0) ;;
    type: number
    hidden: yes
  }

  dimension: lifetime_value_dim {
    sql: COALESCE(${TABLE}.lifetime_value, 0) ;;
    type: number
    hidden: yes
  }

  dimension: new_profiles_dim {
    sql: COALESCE(${TABLE}.new_profiles, 0) ;;
    type: number
    hidden: yes
  }

  dimension: spend_dim {
    sql: COALESCE(${TABLE}.spend, 0) ;;
    type: number
    hidden: yes
  }

  dimension_group: date {
    description: "Date of campaign spend. Activation is determined a week later."
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
  }

  dimension_group: campaign_date {
    description: "Date of campaign spend"
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
    convert_tz: no
    hidden: yes
  }

  ### Below is the actual interesting bits of new LookML ####

  measure: total_spend {
    type: sum
    sql: ${spend_dim} ;;
    description: "Total ad spend"
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions_dim} ;;
    description: "Ad Impressions - The number of impressions of ads, reported by Google Ads"
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks_dim} ;;
    description: "Clicks - The number of clicks on our ads, reported by Google Ads"
  }

  measure: total_new_profiles {
    type: sum
    sql: ${new_profiles_dim} ;;
    description: "Total number of attributed new profiles for this campaign/ad group, as reported by Firefox Telemetry"
  }

  measure: total_activated_profiles {
    type: sum
    sql: ${activated_profiles_dim} ;;
    description: "Total number of activated profiles for this campaign/ad group, as reported by telemetry."
  }

  measure: total_lifetime_value {
    type: sum
    sql: ${lifetime_value_dim} ;;
    value_format_name: usd
    description: "Estimated value, in US dollars, of the clients attributed to this campaign/ad group."
  }

  measure: cost_per_impression {
    description: "Cost per ad impression"
    type: number
    value_format_name: usd
    sql: ${total_spend}/ NULLIF(${total_impressions},0) ;;
  }

  measure: cost_per_click {
    description: "Cost per ad click"
    type: number
    value_format_name: usd
    sql: ${total_spend}/ NULLIF(${total_clicks},0) ;;
  }

  measure: cost_per_new_profile {
    description: "Cost per new profile"
    type: number
    value_format_name: usd
    sql: ${total_spend}/ NULLIF(${total_new_profiles},0) ;;
  }

  measure: filtered_activated_spend {
    description: "Spend, but not including the last 7 days"
    hidden: yes
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${spend_dim}, 0)) ;;
  }

  measure: filtered_activated {
    description: "Filter activations using the same where clause as filtered_activated_spend"
    hidden: yes
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${activated_profiles_dim}, 0)) ;;
  }

  measure: filtered_new_profiles {
    description: "Filter new profiles using the same where clause as filtered_activated_spend"
    hidden: yes
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${new_profiles_dim}, 0)) ;;
  }

  measure: cost_per_activation {
    description: "Cost per activated user. Takes seven days for this value to appear."
    type: number
    value_format_name: usd
    sql: SAFE_DIVIDE(${filtered_activated_spend}, ${filtered_activated}) ;;
  }

  measure: ROAS {
    sql: SAFE_DIVIDE(${total_lifetime_value}, ${total_spend}) ;;
    description: "Return on Ad Spend, defined as LTV / Ad Spend. Value >1 means we expect to make money from this ad spend."
    value_format_name: percent_1
    type: number
  }

  ##### Hidden dims/measures to migrate old dashboards #####

  dimension: region {
    description: "Region of the campaign: NA or EU"
    type: string
    sql: ${campaign_region} ;;
    hidden: yes
  }

  dimension: event {
    description: "Event number used for campaign optimization"
    type: string
    sql: REGEXP_EXTRACT(${campaign}, '.*(Event\\d).*') ;;
    hidden: yes
  }

  dimension: group {
    description: "Group of locations targeted in the campaign"
    type: string
    sql: REGEXP_EXTRACT(${campaign}, '.*(Group\\d).*') ;;
    hidden: yes
  }

  measure: ad_impressions {
    description: "Ad Impressions - The number of impressions of ads, reported by Google Ads"
    sql: ${total_impressions} ;;
    type: number
    hidden: yes
  }

  measure: clicks {
    description: "Clicks - The number of clicks on our ads, reported by Google Ads"
    sql: ${total_clicks} ;;
    type: number
    hidden: yes
  }

  measure: new_profiles {
    description: "First run profiles"
    sql: ${total_new_profiles} ;;
    type: number
    hidden: yes
  }

  measure: activated {
    description: "First run activations"
    sql: ${total_activated_profiles} ;;
    type: number
    hidden: yes
  }

  measure: cost {
    description: "Campaign cost"
    sql: ${spend_dim} ;;
    type: number
    hidden: yes
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: SAFE_DIVIDE(${filtered_activated}, ${filtered_new_profiles}) ;;
    hidden: yes
  }

  measure: activated_per_dollar {
    label: "Activated/$"
    type: number
    value_format_name: decimal_4
    sql: SAFE_DIVIDE(${filtered_activated}, ${filtered_activated_spend}) ;;
    hidden: yes
  }
}
