view: desktop_retention_v2 {

  derived_table: {
    sql: SELECT *
         FROM `moz-fx-data-shared-prod.telemetry.desktop_retention`
         WHERE metric_date < DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY)
           AND metric_date
           BETWEEN
             {% if submission_date_extension._parameter_value == "year_1" %}
               DATE_SUB(COALESCE(SAFE_CAST({% date_start metric_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 394 DAY)
             {% elsif submission_date_extension._parameter_value == "days_28" %}
               DATE_SUB(COALESCE(SAFE_CAST({% date_start metric_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 28 DAY)
             {% elsif submission_date_extension._parameter_value == "days_7" %}
               DATE_SUB(COALESCE(SAFE_CAST({% date_start metric_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 7 DAY)
             {% else %}
               COALESCE(SAFE_CAST({% date_start metric_date_range %} AS DATE), CURRENT_DATE())
             {% endif %}
           AND COALESCE(SAFE_CAST({% date_end metric_date_range %} AS DATE), CURRENT_DATE())
    ;;
  }

  # --- Parameters & Filters ---

  filter: metric_date_range {
    type: date
  }

  parameter: submission_date_extension {
    type: unquoted
    default_value: "None"
    allowed_value: { value: "None"    label: "None"    }
    allowed_value: { value: "days_7"  label: "7 days"  }
    allowed_value: { value: "days_28" label: "28 days" }
    allowed_value: { value: "year_1"  label: "1 year"  }
  }

  parameter: average_window {
    label: "Moving Average Window"
    type: unquoted
    default_value: "28"
    allowed_value: { label: "Single Day" value: "1"  }
    allowed_value: { label: "7-day"      value: "7"  }
    allowed_value: { label: "28-day"     value: "28" }
  }

  dimension: days_avg {
    label: "# of Days Average"
    description: "Value selected on Moving Average Window filter"
    type: number
    sql: {% parameter average_window %} ;;
  }

  # --- Date Dimensions ---

  dimension_group: metric {
    type: time
    sql: ${TABLE}.metric_date ;;
    timeframes: [raw, date, week, month, year]
    label: "Metric"
  }

  dimension: date_yoy {
    label: "Date (YoY)"
    view_label: "Year over Year"
    description: "Date offset to current year for YoY charts"
    type: date
    sql: CASE
            WHEN DATE(
              EXTRACT(YEAR FROM CURRENT_DATE()),
              EXTRACT(MONTH FROM ${TABLE}.metric_date),
              EXTRACT(DAY FROM ${TABLE}.metric_date)
            ) <= CURRENT_DATE()
            THEN DATE(
              EXTRACT(YEAR FROM CURRENT_DATE()),
              EXTRACT(MONTH FROM ${TABLE}.metric_date),
              EXTRACT(DAY FROM ${TABLE}.metric_date)
            )
            ELSE DATE(
              EXTRACT(YEAR FROM CURRENT_DATE()) - 1,
              EXTRACT(MONTH FROM ${TABLE}.metric_date),
              EXTRACT(DAY FROM ${TABLE}.metric_date)
            )
          END ;;
  }

  dimension: ytd_filter {
    label: "YTD Filter"
    view_label: "Year over Year"
    description: "Only include dates within the current year up until 28 days ago"
    type: yesno
    sql: DATE(${date_yoy}) >= DATE_TRUNC(CURRENT_DATE(), YEAR)
      AND DATE(${date_yoy}) <= DATE_SUB(CURRENT_DATE(), INTERVAL 28 DAY) ;;
  }


  # --- Base Dimensions ---

  dimension: is_desktop {
    label: "Included in KPI"
    description: "Filter that defines if record is included in the DAU KPI"
    type: yesno
    sql: ${TABLE}.is_desktop ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
    map_layer_name: countries
  }

  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }

  dimension: normalized_os {
    type: string
    sql: ${TABLE}.normalized_os ;;
  }

  dimension: normalized_os_version {
    type: string
    sql: ${TABLE}.normalized_os_version ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}.app_version ;;
  }

  dimension: lifecycle_stage {
    label: "Lifecycle Stage"
    description: "Based on time elapsed between first seen date and metric date. new_profile for 0 days, repeat_user for 1 to 27 days, and existing_user for 28 days or more"
    type: string
    sql: ${TABLE}.lifecycle_stage ;;
  }

  dimension: first_seen_date {
    type: date
    sql: ${TABLE}.first_seen_date ;;
  }

  dimension: paid_vs_organic {
    type: string
    sql: ${TABLE}.paid_vs_organic ;;
  }

  dimension: startup_profile_selection_reason {
    type: string
    sql: ${TABLE}.startup_profile_selection_reason ;;
  }

  # --- Attribution Dimensions ---

  dimension: attribution_campaign {
    group_label: "Attribution"
    label: "Campaign"
    type: string
    sql: ${TABLE}.attribution_campaign ;;
  }

  dimension: attribution_medium {
    group_label: "Attribution"
    label: "Medium"
    type: string
    sql: ${TABLE}.attribution_medium ;;
  }

  dimension: attribution_content {
    group_label: "Attribution"
    label: "Content"
    type: string
    sql: ${TABLE}.attribution_content ;;
  }

  dimension: attribution_dlsource {
    group_label: "Attribution"
    label: "Download Source"
    type: string
    sql: ${TABLE}.attribution_dlsource ;;
  }

  dimension: attribution_ua {
    group_label: "Attribution"
    label: "User Agent"
    type: string
    sql: ${TABLE}.attribution_ua ;;
  }

  dimension: attribution_experiment {
    group_label: "Attribution"
    label: "Experiment ID"
    type: string
    sql: ${TABLE}.attribution_experiment ;;
  }

  dimension: attribution_variation {
    group_label: "Attribution"
    label: "Experiment Variation ID"
    type: string
    sql: ${TABLE}.attribution_variation ;;
  }

  # --- Hidden Raw Columns (used by measures) ---

  dimension: ping_sent_metric_date        { hidden: yes sql: ${TABLE}.ping_sent_metric_date ;; }
  dimension: ping_sent_week_4             { hidden: yes sql: ${TABLE}.ping_sent_week_4 ;; }
  dimension: active_metric_date           { hidden: yes sql: ${TABLE}.active_metric_date ;; }
  dimension: retained_week_4              { hidden: yes sql: ${TABLE}.retained_week_4 ;; }
  dimension: new_profiles_metric_date     { hidden: yes sql: ${TABLE}.new_profiles_metric_date ;; }
  dimension: retained_week_4_new_profiles { hidden: yes sql: ${TABLE}.retained_week_4_new_profiles ;; }
  dimension: repeat_profiles              { hidden: yes sql: ${TABLE}.repeat_profiles ;; }

  # --- Client Count Measures ---

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

  # --- Retention Rate Measures ---

  measure: retention_rate {
    group_label: "Retention Rates"
    label: "Retention Rate"
    description: "4th week retention based on active status"
    type: number
    value_format_name: percent_2
    sql: ${retained_week_4_sum} / NULLIF(${active_metric_date_sum}, 0) ;;
  }

  measure: new_profile_retention {
    group_label: "Retention Rates"
    label: "New Profile Retention Rate"
    description: "4th week retention for new profiles"
    type: number
    value_format_name: percent_2
    sql: ${retained_week_4_new_profiles_sum} / NULLIF(${new_profiles_metric_date_sum}, 0) ;;
  }

  measure: new_profile_repeat {
    group_label: "Retention Rates"
    label: "New Profile Repeat Rate"
    description: "Repeat user rate for new profiles (days 2-28)"
    type: number
    value_format_name: percent_2
    sql: ${repeat_profiles_sum} / NULLIF(${new_profiles_metric_date_sum}, 0) ;;
  }
}
