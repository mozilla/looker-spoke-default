include: "//looker-hub/firefox_ios/views/ad_activation_performance_table.view.lkml"

view: +ad_activation_performance_table {

  dimension: campaign_spend {
    hidden: yes
    sql: ${TABLE}.campaign_spend ;;
  }

  measure: campaign_spend_sum {
    label: "Spend"
    type: sum
    sql: ${TABLE}.campaign_spend ;;
    description: "Total spend in USD"
  }

  dimension: clients_activated {
    hidden: yes
    sql: ${TABLE}.clients_activated ;;
  }

  measure: clients_activated_sum {
    label: "Clients Activated"
    type: sum
    sql: ${TABLE}.clients_activated ;;
    description: "Number of clients who activated. Activation is defined as active at least 3 days in the first week, and search at least once in the latter half of that week. Reported by telemetry"
  }

  dimension: campaign_spend_per_activation {
    hidden: yes
    sql: ${TABLE}.campaign_spend_per_activation ;;
  }

  measure: campaign_spend_per_activation_ratio {
    label: "Cost per Activation"
    type: number
    value_format_name: usd
    sql: ${campaign_spend_sum}/ NULLIF(${clients_activated_sum},0) ;;
  }

  measure: campaign_spend_per_new_profile_ratio {
    label: "Cost per New Profile"
    type: number
    value_format_name: usd
    sql: ${campaign_spend_sum}/ NULLIF(${new_profiles_sum},0) ;;
    description: "Campaign Spend per new profile. Can be directly compared to iOS Paid User LTV"
  }

  dimension: impressions {
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  measure: impressions_sum {
    label: "Impressions"
    type: sum
    sql: ${TABLE}.impressions ;;
    description: "The number of times your ad appeared on the App Store"
  }

  dimension: new_downloads {
    hidden: yes
    sql: ${TABLE}.new_downloads ;;
  }

  measure: new_downloads_sum {
    label: "New Downloads"
    group_label: "Downloads"
    type: sum
    sql: ${TABLE}.new_downloads ;;
    description: "These represent app downloads from new users who have never before downloaded your app"
  }

  dimension: redownloads {
    hidden: yes
    sql: ${TABLE}.redownloads ;;
  }

  measure: redownloads_sum {
    label: "Redownloads"
    group_label: "Downloads"
    type: sum
    sql: ${TABLE}.redownloads ;;
    description: "Redownloads occur when a user downloads your app, deletes it, and downloads the same app again following a tap on an ad on the App Store, or downloads the same app on an additional device."
  }

  dimension: total_downloads {
    hidden: yes
    sql: ${TABLE}.total_downloads ;;
  }

  measure: total_downloads_sum {
    label: "Total Downloads"
    group_label: "Downloads"
    type: sum
    sql: ${TABLE}.total_downloads ;;
  }

  dimension: taps {
    hidden: yes
    sql: ${TABLE}.taps ;;
  }

  measure: taps_sum {
    label: "Taps"
    type: sum
    sql: ${TABLE}.taps ;;
    description: "The number of times your ad was tapped by users"
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_sum {
    label: "New Profiles"
    type: sum
    sql: ${TABLE}.new_profiles ;;
    description: "Number of new profiles, as reported by telemetry"
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${clients_activated_sum}/ NULLIF(${new_profiles_sum},0) ;;
    description: "Fraction of new profiles that activate, as reported by telemetry"
  }

  dimension: campaign_name {
    label: "Campaign Name"
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_id {
    label: "Campaign ID"
    type: string
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
  }

  dimension_group: date_day {
    label: "Date"
    sql: ${TABLE}.date_day ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

}
