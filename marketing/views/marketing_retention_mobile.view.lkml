include: "//looker-hub/firefox_okrs/views/mobile_retention.view.lkml"

view: marketing_retention_mobile {
 extends: [mobile_retention]
  filter: current_date {
    type: date
    view_label: "Period over Period"
    label: "1. Current Date"
    description: "Select the last date of the period you are interested in"
    convert_tz: no
  }

  dimension: filter_end_date {
    type: date
    hidden: yes
    description: "Select the last date of the period you are interested in"
    sql: {% date_end current_date%};;

  }

  dimension: month {
    description: "this dimension will help us trend period over period analysis for YoY, MoM and QoQ at monthly granularity"
    type:  string
    hidden: no
    view_label: "Period over Period"
    sql: FORMAT_DATE("%m-%B", ${TABLE}.first_seen_date);;
  }

  dimension_group: first_seen {
    sql: ${TABLE}.first_seen_date ;;
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

  dimension_group: metric {
    sql: ${TABLE}.metric_date ;;
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

  dimension: quarter_abr {
    description: "this dimension will help us trend period over period analysis for QR"
    type:  string
    hidden: no
    view_label: "Period over Period"
    sql: CASE WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "01" then "Q1"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "04" then "Q2"
              WHEN FORMAT_DATE("%m",  DATE_TRUNC(${TABLE}.first_seen_date, QUARTER)) = "07" then "Q3"
              ELSE "Q4" end;;
  }

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
    view_label: "Period over Period"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: DATE_ADD(${TABLE}.first_seen_date, INTERVAL DATE_DIFF(CURRENT_DATE(), ${TABLE}.first_seen_date, YEAR) YEAR) ;;
  }
  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Period over Period"
    description: "Only include dates up until yesterday"
    type: yesno
    sql: ${date_yoy} <= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY) ;;
  }

  dimension: acquired_current_year {
    label: "New Profiles in curr year"
    description: "Only filters to new profiles acquired in Current Year"
    type: yesno
    sql: DATE_TRUNC(YEAR, ${first_seen_date}) = DATE_TRUNC(YEAR, CURRENT_DATE()) ;;
  }

  parameter: compare_to {
    view_label: "Period over Period"
    description: "Select the templated previous period you would like to compare to. Must be used with Current Date filter"
    label: "2. Compare To:"
    type: unquoted
    # allowed_value: {
    #   label: "Previous Period"
    #   value: "Period"
    # }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }
    default_value: "Year"
  }

  dimension: first_date_in_period {
    description: "For a well defined period (YoY, QoQ, MoM, WoW), we use date trunc to get the period start date, for arbitrary period modify this dimension to use date sub and number of days in period"
    type: date
    hidden: yes
    sql: DATE_TRUNC(${filter_end_date}, {% parameter compare_to %});;
  }

  dimension: period_2_start {
    hidden:  yes
    description: "Calculates the start of the previous period"
    type: date
    sql:
        DATE_SUB(${first_date_in_period}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }

  dimension: period_2_end {
    hidden:  yes
    description: "Calculates the end of the previous period"
    type: date
    sql:
        DATE_SUB(${filter_end_date}, INTERVAL 1 {% parameter compare_to %});;
    convert_tz: no
  }


  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this to create the measures for the respective periods (this = current period, last = previous period)"
    type: string
    sql:
        {% if current_date._is_filtered %}
            CASE
            WHEN DATE(${TABLE}.first_seen_date) BETWEEN DATE(${first_date_in_period}) AND DATE(${filter_end_date}) THEN 'this'
            WHEN DATE(${TABLE}.first_seen_date) between ${period_2_start} and ${period_2_end} THEN 'last' END
        {% else %} NULL {% endif %} ;;
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
    label: "Install Source (Android)"
    description: "For Marketing, we only use Google Play"
    type: string
    sql: ${TABLE}.install_source ;;
  }
  dimension: is_suspicious_device_client {
    label: "Suspicious Device (iOS)"
    description: "For funnel, we remove certain old version clients we deem to be suspicious"
    type: string
    sql: ${TABLE}.is_suspicious_device_client ;;
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    map_layer_name: countries
  }


  dimension: lifecycle_stage {
    label: "Lifecycle Stage"
    description: "Based on time elapsed between first seen date and metric date. new_profile for 0 days, repeat_user for 1 to 27 days, and existing_user for 28 days or more"
    type: string
    sql: ${TABLE}.lifecycle_stage ;;
  }

  dimension: paid_vs_organic {
    sql: ${TABLE}.paid_vs_organic ;;
    type: string
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

  measure: current_period_active_metric_date_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.active_metric_date;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_active_metric_date_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.active_metric_date;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_retained_week_4_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_retained_week_4_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_new_profiles_metric_date_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles_metric_date;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_new_profiles_metric_date_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.new_profiles_metric_date;;
    filters: [period_filtered_measures: "last"]
  }
  measure: current_period_retained_week_4_new_profiles_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4_new_profiles;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_retained_week_4_new_profiles_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.retained_week_4_new_profiles;;
    filters: [period_filtered_measures: "last"]
  }

  measure: current_period_repeat_profiles_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.repeat_profiles;;
    filters: [period_filtered_measures: "this"]
  }

  measure: previous_period_repeat_profiles_sum {
    view_label: "Filtered metrics"
    type: sum
    sql: ${TABLE}.repeat_profiles;;
    filters: [period_filtered_measures: "last"]
  }


}
