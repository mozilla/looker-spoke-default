include: "//looker-hub/combined_browser_metrics/views/cohort_weekly_statistics.view.lkml"

view: +cohort_weekly_statistics {

#  dimension: normalized_app_name {
#    label: "Browser Name"
#    sql: ${TABLE}.normalized_app_name ;;
#    type: string
#  }
#
#  dimension: normalized_channel {
#    label: "Channel"
#    sql: ${TABLE}.normalized_channel ;;
#    type: string
#  }
#
#  dimension: app_version {
#    label: "Browser Version"
#    sql: ${TABLE}.app_version ;;
#    type: string
#  }
#
#  dimension: attribution_campaign {
#    label: "Attribution Campaign"
#    sql: ${TABLE}.attribution_campaign ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: attribution_content {
#    label: "Attribution Content"
#    sql: ${TABLE}.attribution_content ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: attribution_experiment {
#    label: "Attribution Experiment"
#    sql: ${TABLE}.attribution_experiment ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: attribution_medium {
#    label: "Attribution Medium"
#    sql: ${TABLE}.attribution_medium ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: attribution_source {
#    label: "Attribution Source"
#    sql: ${TABLE}.attribution_source ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: attribution_variation {
#    label: "Attribution Variation"
#    sql: ${TABLE}.attribution_variation ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: country {
#    label: "Country Code"
#    sql: ${TABLE}.country ;;
#    type: string
#  }
#
#  dimension: device_model {
#    label: "Device Model"
#    sql: ${TABLE}.device_model ;;
#    type: string
#  }
#
#  dimension: distribution_id {
#    label: "Distribution ID"
#    sql: ${TABLE}.distribution_id ;;
#    type: string
#  }
#
#  dimension: is_default_browser {
#    label: "Default Browser"
#    sql: ${TABLE}.distribution_id ;;
#    type: boolean
#  }
#
#  dimension: locale {
#    label: "Locale"
#    sql: ${TABLE}.locale ;;
#    type: string
#  }
#
#  dimension: normalized_os {
#    label: "OS"
#    sql: ${TABLE}.normalized_os ;;
#    type: string
#  }
#
#  dimension: normalized_os_version {
#    label: "OS Version"
#    sql: ${TABLE}.normalized_os_version ;;
#    type: string
#  }
#
#  dimension: adjust_ad_group {
#    label: "Adjust Ad Group"
#    sql: ${TABLE}.adjust_ad_group ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: adjust_campaign {
#    label: "Adjust Campaign"
#    sql: ${TABLE}.adjust_campaign ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: adjust_creative {
#    label: "Adjust Creative"
#    sql: ${TABLE}.adjust_creative ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: adjust_network {
#    label: "Adjust Network"
#    sql: ${TABLE}.adjust_network ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: play_store_attribution_campaign {
#    label: "Play Store Attribution Campaign"
#    sql: ${TABLE}.play_store_attribution_campaign ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: play_store_attribution_medium {
#    label: "Play Store Attribution Medium"
#    sql: ${TABLE}.play_store_attribution_medium ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: play_store_attribution_source {
#    label: "Play Store Attribution Source"
#    sql: ${TABLE}.play_store_attribution_source ;;
#    type: string
#    group_label: "Attribution"
#  }
#  
#  dimension: play_store_attribution_content {
#    label: "Play Store Attribution Content"
#    sql: ${TABLE}.play_store_attribution_content ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: play_store_attribution_term {
#    label: "Play Store Attribution Term"
#    sql: ${TABLE}.play_store_attribution_term ;;
#    type: string
#    group_label: "Attribution"
#  }
#
#  dimension: cohort_date_week {
#    label: "Week of First Seen Date"
#    sql: ${TABLE}.cohort_date_week ;;
#    type: date
#  }
#
#  dimension: activity_date_week {
#    label: "Activity Week"
#    sql: ${TABLE}.activity_date_week ;;
#    type: date
#  }
#
#  dimension: weeks_after_first_seen_week {
#    label: "Activity Week"
#    sql: ${TABLE}.weeks_after_first_seen_week ;;
#    type: number
#  }

  measure: total_nbr_active_clients {
    type: number
    SUM(${nbr_active_clients}) ;;
  }

  measure: total_clients_in_cohort {
    type: number
    SUM(${clients_in_cohort}) ;;
  }

  measure: percent_retained {
    type: number
    sql: SAFE_DIVIDE(SUM(${nbr_active_clients}), SUM(${clients_in_cohort})) ;;
    value_format: "0.00%"
  }
}
