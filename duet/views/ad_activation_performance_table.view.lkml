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

  dimension: impressions {
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  measure: impressions_sum {
    label: "Impressions"
    type: sum
    sql: ${TABLE}.impressions ;;
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
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_sum {
    label: "New Profiles"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${clients_activated_sum}/ NULLIF(${new_profiles_sum},0) ;;
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
