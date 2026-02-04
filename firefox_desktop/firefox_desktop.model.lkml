connection: "telemetry"

# TODO: remove unnecessary view imports
include: "//looker-hub/firefox_desktop/views/active_users_aggregates_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/adclick_history_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/baseline.view.lkml"
include: "//looker-hub/firefox_desktop/views/baseline_clients_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/baseline_clients_last_seen_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/baseline_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/broken_site_report.view.lkml"
include: "//looker-hub/firefox_desktop/views/broken_site_report_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/client_counts.view.lkml"
include: "//looker-hub/firefox_desktop/views/client_ltv_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/clients_daily_joined_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/clients_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/clients_first_seen_v2.view.lkml"
include: "//looker-hub/firefox_desktop/views/clients_last_seen_joined_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/clients_last_seen_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/crash.view.lkml"
include: "//looker-hub/firefox_desktop/views/crash_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/deletion_request_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/desktop_acquisition_funnel_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/desktop_cohort_daily_retention.view.lkml"
include: "//looker-hub/firefox_desktop/views/desktop_events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/desktop_installs_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/events.view.lkml"
include: "//looker-hub/firefox_desktop/views/events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/events_unnested_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/firefox_desktop_use_counters_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/first_startup.view.lkml"
include: "//looker-hub/firefox_desktop/views/first_startup_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/fx_accounts.view.lkml"
include: "//looker-hub/firefox_desktop/views/fx_accounts_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/glean_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/health.view.lkml"
include: "//looker-hub/firefox_desktop/views/ltv_states_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/messaging_system.view.lkml"
include: "//looker-hub/firefox_desktop/views/messaging_system_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_activity_stream_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_browser_launched_to_handle_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_clients_daily.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_clients_first_seen_28_days_later.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_clients_first_seen_v2.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_crash.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_desktop_cohort_daily_retention.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_desktop_engagement_v1.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_desktop_engagement_view.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_desktop_retention_view.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_events_memory.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_firefox_desktop_active_users_aggregates_view.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_firefox_desktop_active_users_view.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_main.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_metrics.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_newtab_clients_daily.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_normandy_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_search_clients_engines_sources_daily.view.lkml"
include: "//looker-hub/firefox_desktop/views/metric_definitions_serp_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/metrics.view.lkml"
include: "//looker-hub/firefox_desktop/views/metrics_clients_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/metrics_clients_last_seen_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/metrics_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/newtab.view.lkml"
include: "//looker-hub/firefox_desktop/views/newtab_interactions_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/newtab_live_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/newtab_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/newtab_visits_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/onboarding_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/prototype_no_code_events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/pseudo_main_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/quick_suggest.view.lkml"
include: "//looker-hub/firefox_desktop/views/quick_suggest_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/review_checker_clients_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/review_checker_events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/review_checker_microsurvey_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/search_with.view.lkml"
include: "//looker-hub/firefox_desktop/views/search_with_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/serp_categorization_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/serp_events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/snippets_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/spoc.view.lkml"
include: "//looker-hub/firefox_desktop/views/spoc_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/sponsored_tiles_clients_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/suggest_clients_daily.view.lkml"
include: "//looker-hub/firefox_desktop/views/suggest_clients_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/top_sites_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/urlbar_events.view.lkml"
include: "//looker-hub/firefox_desktop/views/urlbar_events_daily_engagement_by_position_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/urlbar_events_daily_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/urlbar_events_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/urlbar_potential_exposure_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/use_counters.view.lkml"
include: "//looker-hub/firefox_desktop/views/use_counters_table.view.lkml"
include: "//looker-hub/firefox_desktop/views/user_characteristics_table.view.lkml"
include: "//looker-hub/firefox_desktop/explores/*.explore.lkml"
include: "explores/*"
include: "views/acquisition_funnel.view.lkml"
include: "views/client_counts.view.lkml"
include: "views/desktop_daily_retention.view.lkml"
include: "views/urlbar_events_daily_table.view.lkml"
include: "views/newtab_clients_daily_aggregates.view.lkml"
include: "views/newtab_items_daily.view.lkml"


explore: newtab_clients_daily_aggregates {
  label: "Newtab Clients Daily Aggregates"
  always_filter: {
    filters: [
      newtab_clients_daily_aggregates.submission_date_range: "7 days"
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_clients_daily_aggregates.country} = ${countries.code} ;;
  }

  fields: [ALL_FIELDS*]
}

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

explore: +newtab_items_daily {
  label: "Newtab Items Daily (Editorial)"
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


explore: +baseline {
  label: "Baseline (Glean)"
  always_filter: {
    filters: [
      baseline.submission_date: "7 days",
      baseline.sample_id: "0"
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

view: +health {
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


datagroup: baseline_agg_daily_tou {
  # changes once per day → triggers a rebuild once per day
  sql_trigger: SELECT CURRENT_DATE() ;;
  max_cache_age: "24 hours"
}
