include: "//looker-hub/firefox_okrs/views/mobile_retention.view.lkml"

view: +mobile_retention {

  parameter: average_window {
    label: "Moving average"
    type: string
    allowed_value: {
      label: "Single Day"
      value: "1"
    }
    allowed_value: {
      label: "7-day"
      value: "7"
    }
    allowed_value: {
      label: "28-day"
      value: "28"
    }
  }
  dimension: days_avg {
    label: "# of Days average"
    description: "Value selected on Moving average filter"
    type: number
    sql: {% parameter average_window %} ;;
  }

  dimension: is_mobile {
    label: "Included in KPI"
    description: "Filter that define if record is included in the DAU KPI"
    sql: ${TABLE}.is_mobile ;;
  }

  dimension: date_yoy {
    label: "Date (YoY)"
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.metric_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.metric_date, YEAR) YEAR) ;;
  }
  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY) ;;
  }

  dimension: ping_sent_metric_date {
    hidden: yes
    sql: ${TABLE}.ping_sent_metric_date ;;
  }
  dimension: ping_sent_week_4 {
    hidden: yes
    sql: ${TABLE}.ping_sent_week_4 ;;
  }
  dimension: active_metric_date {
    hidden: yes
    sql: ${TABLE}.active_metric_date ;;
  }
  dimension: retained_week_4 {
    hidden: yes
    sql: ${TABLE}.retained_week_4 ;;
  }
  dimension: new_profiles_metric_date {
    hidden: yes
    sql: ${TABLE}.new_profiles_metric_date ;;
  }
  dimension: retained_week_4_new_profiles {
    hidden: yes
    sql: ${TABLE}.retained_week_4_new_profiles ;;
  }
  dimension: repeat_profiles {
    hidden: yes
    sql: ${TABLE}.repeat_profiles ;;
  }

  measure: ping_sent_metric_date_sum {
    group_label: "Client Counts"
    label: "Ping: Clients"
    type: sum
    sql: ${TABLE}.ping_sent_metric_date ;;
    description: "Clients that sent a ping on metric date"
  }
  measure: ping_sent_week_4_sum {
    group_label: "Client Counts"
    label: "Ping: Retained"
    type: sum
    sql: ${TABLE}.ping_sent_week_4 ;;
    description: "Clients that sent a ping on 4th week and metric date"
  }
  measure: active_metric_date_sum {
    group_label: "Client Counts"
    label: "Active: Clients"
    type: sum
    sql: ${TABLE}.active_metric_date ;;
    description: "Clients active on metric date"
  }
  measure: retained_week_4_sum {
    group_label: "Client Counts"
    label: "Active: Retained"
    type: sum
    sql: ${TABLE}.retained_week_4 ;;
    description: "Clients active on 4th week and metric date"
  }
  measure: new_profiles_metric_date_sum {
    group_label: "Client Counts"
    label: "New Profiles"
    type: sum
    sql: ${TABLE}.new_profiles_metric_date ;;
    description: "New profiles on metric date"
  }
  measure: retained_week_4_new_profiles_sum {
    group_label: "Client Counts"
    label: "New Profiles: Retained"
    type: sum
    sql: ${TABLE}.retained_week_4_new_profiles ;;
    description: "New profiles active on 4th week"
  }
  measure: repeat_profiles_sum {
    group_label: "Client Counts"
    label: "New Profiles: Repeat"
    type: sum
    sql: ${TABLE}.repeat_profiles ;;
    description: "New profiles active between days 2 to 28"
  }

  measure: retention_rate {
    group_label: "Retention Rates"
    label: "Retention Rate"
    description: "4th week retention based on active status"
    type: number
    value_format_name: percent_2
    sql: ${retained_week_4_sum}/ NULLIF(${active_metric_date_sum},0) ;;
  }
  measure: new_profile_retention{
    group_label: "Retention Rates"
    label: "New Profile Retention Rate"
    description: "4th week retention for new profiles"
    type: number
    value_format_name: percent_2
    sql: ${retained_week_4_new_profiles_sum}/ NULLIF(${new_profiles_metric_date_sum},0) ;;
  }
  measure: new_profile_repeat{
    group_label: "Retention Rates"
    label: "New Profile Repeat Rate"
    description: "Repeat user rate for new profiles (days 2-28)"
    type: number
    value_format_name: percent_2
    sql: ${repeat_profiles_sum}/ NULLIF(${new_profiles_metric_date_sum},0) ;;
  }

  dimension: adjust_campaign {
    group_label: "Attribution"
    label: "Adjust Campaign"
    type: string
    sql: ${TABLE}.adjust_campaign ;;
  }
  dimension: adjust_network {
    group_label: "Attribution"
    label: "Adjust Network"
    type: string
    sql: ${TABLE}.adjust_network ;;
  }
  dimension: adjust_ad_group {
    group_label: "Attribution"
    label: "Adjust Ad Group"
    type: string
    sql: ${TABLE}.adjust_ad_group ;;
  }
  dimension: adjust_creative {
    group_label: "Attribution"
    label: "Adjust Creative"
    type: string
    sql: ${TABLE}.adjust_creative ;;
  }

  dimension: play_store_attribution_campaign {
    group_label: "Attribution"
    label: "GooglePlay Campaign"
    description: "Android only"
    type: string
    sql: ${TABLE}.play_store_attribution_campaign ;;
  }
  dimension: play_store_attribution_medium {
    group_label: "Attribution"
    label: "GooglePlay Medium"
    description: "Android only"
    type: string
    sql: ${TABLE}.play_store_attribution_medium ;;
  }
  dimension: play_store_attribution_source {
    group_label: "Attribution"
    label: "GooglePlay Source"
    description: "Android only"
    type: string
    sql: ${TABLE}.play_store_attribution_source ;;
  }
  dimension: meta_attribution_app {
    group_label: "Attribution"
    label: "Meta App ID"
    description: "Android only"
    type: string
    sql: ${TABLE}.meta_attribution_app ;;
  }

  dimension: install_source {
    group_label: "Funnel filters"
    label: "Install Source (Android)"
    description: "For funnel, we only use Google Play"
    type: string
    sql: ${TABLE}.install_source ;;
  }
  dimension: is_suspicious_device_client {
    group_label: "Funnel filters"
    label: "Suspicious Device (iOS)"
    description: "For funnel, we remove certain old version clients we deem to be suspicious"
    type: string
    sql: ${TABLE}.is_suspicious_device_client ;;
  }
  dimension: lifecycle_stage {
    label: "Lifecycle Stage"
    description: "Based on time elapsed between first seen date and metric date. new_profile for 0 days, repeat_user for 1 to 27 days, and existing_user for 28 days or more"
    type: string
    sql: ${TABLE}.lifecycle_stage ;;
  }
}
