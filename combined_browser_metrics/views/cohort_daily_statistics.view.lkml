include: "//looker-hub/combined_browser_metrics/views/cohort_daily_statistics.view.lkml"

view: +cohort_daily_statistics {

  dimension: days_retained {
    type: number
    sql: DATE_DIFF(${activity_date}, ${cohort_date}, DAY) ;;
  }

  dimension: normalized_app_name {
    label: "Browser Name"
    sql: ${TABLE}.normalized_app_name ;;
    type: string
  }

  dimension: normalized_channel {
    label: "Channel"
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: normalized_os {
    label: "OS"
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: normalized_os_version {
    label: "OS Version"
    sql: ${TABLE}.normalized_os_version ;;
    type: string
  }

  dimension: attribution_source {
    sql: ${TABLE}.attribution_source ;;
    group_label: "Attribution"
  }
  dimension: attribution_medium {
    sql: ${TABLE}.attribution_medium ;;
    group_label: "Attribution"
  }
  dimension: attribution_campaign {
    sql: ${TABLE}.attribution_campaign ;;
    group_label: "Attribution"
  }
  dimension: attribution_content {
    sql: ${TABLE}.attribution_content ;;
    group_label: "Attribution"
  }

  dimension: attribution_experiment {
    sql: ${TABLE}.attribution_experiment ;;
    group_label: "Attribution - Experiments"
  }

  dimension: attribution_variation {
    sql: ${TABLE}.attribution_variation ;;
    group_label: "Attribution - Experiments"
  }

  measure: clients_active_on_day {
    type: number
    sql: SUM(${num_clients_active_on_day}) ;;
  }

  measure: clients_in_cohort {
    type: number
    sql: SUM(${num_clients_in_cohort}) ;;
  }

  measure: retention {
    type: number
    sql: SAFE_DIVIDE(${clients_active_on_day}, ${clients_in_cohort}) ;;
    value_format: "0.00%"
  }

  dimension: num_clients_in_cohort {
    hidden: yes
  }

  dimension: num_clients_active_on_day {
    hidden: yes
  }

}
