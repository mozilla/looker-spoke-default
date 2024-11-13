include: "//looker-hub/firefox_okrs/views/mobile_engagement.view.lkml"

view: +mobile_engagement {

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
    sql: DATE_ADD(${TABLE}.submission_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.submission_date, YEAR) YEAR) ;;
  }
  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} < CURRENT_DATE() ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }
  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  measure: dau_sum {
    group_label: "Client Counts"
    label: "(non-official) DAU"
    type: sum
    sql: ${TABLE}.dau ;;
    description: "Daily Active Users, but historical values underestimated due to shredder"
  }
  measure: wau_sum {
    group_label: "Client Counts"
    label: "(non-official) WAU"
    type: sum
    sql: ${TABLE}.wau ;;
    description: "Weekly Active Users, but historical values underestimated due to shredder"
  }
  measure: mau_sum {
    group_label: "Client Counts"
    label: "(non-official) MAU"
    type: sum
    sql: ${TABLE}.mau ;;
    description: "Monthly Active Users, but historical values underestimated due to shredder"
  }

  measure: engagement_rate {
    label: "Engagement Rate"
    type: number
    value_format_name: percent_2
    sql: ${dau_sum}/ NULLIF(${mau_sum},0) ;;
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
    description: "Based on time elapsed between first seen date and submission date. new_profile for 0 days, repeat_user for 1 to 27 days, and existing_user for 28 days or more"
    type: string
    sql: ${TABLE}.lifecycle_stage ;;
  }
}
