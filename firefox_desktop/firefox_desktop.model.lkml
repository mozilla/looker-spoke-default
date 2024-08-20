connection: "telemetry"

include: "//looker-hub/firefox_desktop/views/*.view.lkml"
include: "//looker-hub/firefox_desktop/explores/*.explore.lkml"
include: "explores/*"
include: "views/desktop_daily_retention.view.lkml"


explore: firefox_desktop_last_seen {
  label: "Firefox Dekstop Clients Last Seen"
  from: clients_last_seen_table
  hidden: yes
}

explore: +client_counts {
  label: "Client Counts (Legacy Telemetry)"
  always_filter: {
    filters: [
      client_counts.submission_date: "7 days",
      client_counts.sample_id: "0"
    ]
  }
}

explore: +event_counts {
  label: "Event Counts (Legacy Telemetry)"
  always_filter: {
    filters: [
      events.submission_date: "7 days",
      events.sample_id: "0"
    ]
  }
}

explore: +funnel_analysis {
  label: "Funnel Analysis (Legacy Telemetry)"
  always_filter: {
    filters: [
      funnel_analysis.submission_date: "7 days",
      funnel_analysis.sample_id: "0"
    ]
  }
}

explore: +growth_accounting {
  label: "Growth Accounting (Legacy Telemetry)"
  always_filter: {
    filters: [
      growth_accounting.submission_date: "7 days",
      growth_accounting.sample_id: "0"
    ]
  }
}

explore: +baseline {
  label: "Baseline (Glean)"
  always_filter: {
    filters: [
      baseline.submission_date: "7 days",
      baseline.sample_id: "0"
    ]
  }
}

explore: feature_usage {
  view_name: feature_usage_table
  label: "Feature Usage (Legacy Telemetry)"
  description: "A daily aggregation of specific browser feature usages by 1% of Firefox desktop client."

  always_filter: {
    filters: [
      feature_usage_table.submission_date: "7 days"
    ]
  }
}

explore: +metrics {
  label: "Metrics (Glean)"
  always_filter: {
    filters: [
      metrics.submission_date: "7 days",
      metrics.sample_id: "0"
    ]
  }
}

explore: acquisition_funnel {
  view_name:  desktop_acquisition_funnel_table
  label: " Desktop Acquisition Funnel"
  description: "Desktop Acquisition Funnel Metrics"

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_acquisition_funnel_table.country_code} = ${countries.code} ;;
  }
}

explore: desktop_daily_retention {
  view_name:  desktop_cohort_daily_retention
  label: "Desktop Cohort Daily Retention"
  description: "Desktop Daily Retention Outcomes for New Profile Cohorts"
  always_filter: {
    filters: [
      desktop_cohort_daily_retention.retention_period_picker: "7",
      desktop_cohort_daily_retention.retention_period: "NOT NULL",
      desktop_cohort_daily_retention.first_seen_date: "56 Days",
      desktop_cohort_daily_retention.submission_date: "56 Days"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${desktop_cohort_daily_retention.country} = ${countries.code} ;;
  }
}



view: +metrics {
  dimension: client_info__build_date_datetime {
    label: "Build Date (Datetime)"
    description: "The date & time the application was built as a timestamp"
    group_label: "Client Info"
    group_item_label: "Build Date (Datetime)"
    sql: PARSE_TIMESTAMP("%Y%m%d%H%M%S", ${TABLE}.client_info.app_build) ;;
    type: date_time
  }
}


view: +clients_daily_table__contextual_services_quicksuggest_click_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_help_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}

view: +clients_daily_table__contextual_services_quicksuggest_impression_sum {
  dimension: value {
    hidden: yes
  }

  measure: count {
    sql:  SUM(${TABLE}.value) ;;
    type: number
  }
}
