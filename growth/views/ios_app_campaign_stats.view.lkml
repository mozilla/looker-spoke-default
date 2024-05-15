include: "//looker-hub/growth/views/ios_app_campaign_stats.view.lkml"

view: +ios_app_campaign_stats {

# These dimensions will need to change ones we standardize the campaign namesand write appropriate UDF to parse the campaign names
  dimension: campaign_country_code {
    sql: CASE WHEN ${TABLE}.campaign_country_code LIKE "CA%" THEN "CA" ELSE  ${TABLE}.campaign_country_code END;;
    type: string
    description: "Campaign Country Code"
  }

#This dimension needs to be done with a UDF for sure
  dimension: campaign_region {
    sql: CASE WHEN ${TABLE}.campaign_country_code IN ("CA","CAN", "US") THEN "NA"  ELSE "EU" END;;
    type: string
    description: "Campaign Country Region"
  }



  dimension: activated_profiles {
    sql: ${TABLE}.activated_profiles ;;
    type: number
    hidden: yes
    description: "Number of Activated Profiles"
  }

  dimension: clicks {
    sql: ${TABLE}.clicks ;;
    type: number
    hidden:  yes
    description: "Number of Clicks"
  }

  dimension: downloads {
    sql: ${TABLE}.downloads ;;
    type: number
    hidden:  yes
    description: "Number of Downloads"
  }

  dimension: impressions {
    sql: ${TABLE}.impressions ;;
    type: number
    hidden:  yes
    description: "Number of Impressions"
  }

  dimension: lifetime_value {
    sql: ${TABLE}.lifetime_value ;;
    type: number
    hidden:  yes
    description: "Lifetime Value"
  }

  dimension: new_profiles{
    sql: ${TABLE}.new_profiles ;;
    type: number
    hidden:  yes
    description: "Number of New Profiles"
  }

  dimension: repeat_users {
    sql: ${TABLE}.repeat_users ;;
    type: number
    hidden:  yes
    description: "Number of Repeat Users"
  }

  dimension: spend {
    sql: ${TABLE}.spend ;;
    type: string
    hidden:  yes
    description: "Marketing Spend"
  }

  dimension: week_4_retained_users {
    sql: ${TABLE}.week_4_retained_users ;;
    type: number
    hidden:  yes
    description: "Number of Week 4 Retained Users"
  }

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
    description: "Total ad spend"
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    description: "Ad Impressions - The number of impressions of ads, reported by Google Ads"
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    description: "Clicks - The number of clicks on our ads, reported by Google Ads"
  }

  measure: total_new_profiles {
    type: sum
    sql: ${new_profiles} ;;
    description: "Total number of attributed new profiles for this campaign/ad group, as reported by Firefox Telemetry"
  }

  measure: total_activated_profiles {
    type: sum
    sql: ${activated_profiles} ;;
    description: "Total number of activated profiles for this campaign/ad group, as reported by telemetry."
  }

  measure: total_lifetime_value {
    type: sum
    sql: ${lifetime_value} ;;
    value_format_name: usd
    description: "Estimated value, in US dollars, of the clients attributed to this campaign/ad group."
  }

  measure: total_repeat_users {
    type: sum
    sql: ${repeat_users} ;;
    description: "Total number of attributed repeat new profiles for this campaign/ad group, as reported by Firefox Telemetry"
  }

  measure: total_week_4_retained_users {
    type: sum
    sql: ${week_4_retained_users} ;;
    description: "Total number of attributed week 4 retained new profiles for this campaign/ad group, as reported by Firefox Telemetry"
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
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${spend}, 0)) ;;
  }

  measure: filtered_activated {
    description: "Filter activations using the same where clause as filtered_activated_spend"
    hidden: yes
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${activated_profiles}, 0)) ;;
  }

  measure: filtered_retention_spend {
    description: "Spend, but not including the last 28 days"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${spend}, 0)) ;;
  }

  measure: filtered_retention_impressions {
    description: "Spend, but not including the last 28 days"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${impressions}, 0)) ;;
  }

  measure: filtered_retention_clicks {
    description: "Spend, but not including the last 28 days"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${clicks}, 0)) ;;
  }

  measure: filtered_repeat_users {
    description: "Filter repeat users using the same where clause as filtered_retention_spend"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${repeat_users}, 0)) ;;
  }

  measure: filtered_week_4_retained_users {
    description: "Filter week 4 retained users using the same where clause as filtered_retention_spend"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${week_4_retained_users}, 0)) ;;
  }


  measure: filtered_new_profiles {
    description: "Filter new profiles using the same where clause as filtered_activated_spend"
    hidden: yes
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -7 DAY), ${new_profiles}, 0)) ;;
  }

  measure: filtered_ret_new_profiles {
    description: "Filter new profiles using the same where clause as filtered_activated_spend"
    type: number
    view_label: "Filtered Retention measure"
    sql: SUM(IF(${TABLE}.date < DATE_ADD(CURRENT_DATE(), INTERVAL -28 DAY), ${new_profiles}, 0)) ;;
  }

  measure: cost_per_activation {
    description: "Cost per activated user. Takes seven days for this value to appear."
    type: number
    value_format_name: usd
    sql: SAFE_DIVIDE(${filtered_activated_spend}, ${filtered_activated}) ;;
  }

  measure: cost_per_repeat_user {
    description: "Cost per repeat user. Takes 28 days for this value to appear."
    type: number
    value_format_name: usd
    sql: SAFE_DIVIDE(${filtered_retention_spend}, ${filtered_repeat_users}) ;;
  }

  measure: cost_per_week_4_retained_users {
    description: "Cost per week 4 retained user. Takes 28 days for this value to appear."
    type: number
    value_format_name: usd
    sql: SAFE_DIVIDE(${filtered_retention_spend}, ${filtered_week_4_retained_users}) ;;
  }


  measure: ROAS {
    sql: SAFE_DIVIDE(${total_lifetime_value}, ${total_spend}) ;;
    description: "Return on Ad Spend, defined as LTV / Ad Spend. Value >1 means we expect to make money from this ad spend."
    value_format_name: percent_1
    type: number
  }

}
