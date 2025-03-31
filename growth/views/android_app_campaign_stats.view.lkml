view: android_app_campaign_stats {

  sql_table_name: `moz-fx-data-shared-prod.google_ads.android_app_campaign_stats` ;;

  #### The below is copied directly from looker-hub. Why?
  #### We needed to keep this new explore backwards-compatible with an old explore.
  #### That old explore had measure names that were the _same_ as some of the dimensions
  #### in the generated LookML. Because we can't remove dimensions from LookML with refinements,
  #### (only hide them), and measures cannot share names with dimensions, I couldn't include
  #### those backwards-compatible measures in a refined view from the generated LookML.
  #### Instead, I append "_dim" to their names, see e.g. new_profiles_dim


  dimension: country {
    sql: ${TABLE}.country_code ;;
    type: string
    description: "The country code"
  }

  dimension: region {
    sql: ${TABLE}.campaign_region ;;
    type: string
    description: "The region,"
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




  measure: ROAS {
    sql: SAFE_DIVIDE(${total_lifetime_value}, ${total_spend}) ;;
    description: "Return on Ad Spend, defined as LTV / Ad Spend. Value >1 means we expect to make money from this ad spend."
    value_format_name: percent_1
    type: number
  }

  }

  ##### Hidden dims/measures to migrate old dashboards #####
