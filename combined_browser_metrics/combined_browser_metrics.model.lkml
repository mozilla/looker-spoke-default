connection: "telemetry"
label: "Combined Browser Metrics"
include: "//looker-hub/combined_browser_metrics/views/*"
include: "views/*"
include: "/shared/views/*"

explore: active_users_aggregates {
  always_filter: {
    filters: [active_users_aggregates.submission_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates.country} = ${countries.code} ;;
  }

  aggregate_table: rollup__active_users_aggregates_2022_usage {
    query: {
      dimensions: [active_users_aggregates.app_name, active_users_aggregates.submission_date]
      measures: [daily_active_users, weekly_active_users, monthly_active_users, new_profile, ad_click, organic_search_counts, search_counts, search_with_ad, uri_counts, active_hour]
      filters: [
        active_users_aggregates.submission_date: "this year"
      ]
    }
    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__active_users_aggregates_2021_common {
    query: {
      dimensions: [active_users_aggregates.app_name, active_users_aggregates.submission_date, active_users_aggregates.country, active_users_aggregates.channel, active_users_aggregates.attribution_medium]
      measures: [daily_active_users, weekly_active_users, monthly_active_users, new_profile, ad_click, organic_search_counts, search_counts, search_with_ad, uri_counts, active_hour]
      filters: [
        active_users_aggregates.submission_date: "2 years"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
  }
}

explore: active_users_aggregates_device {
  always_filter: {
    filters: [active_users_aggregates_device.submission_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates_device.country} = ${countries.code} ;;
  }
}

explore: active_users_aggregates_attribution {
  always_filter: {
    filters: [active_users_aggregates_attribution.submission_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates_attribution.country} = ${countries.code} ;;
  }
}

explore: user_retention {
  view_name: cohort_daily_statistics

  always_filter: {
    filters: [cohort_daily_statistics.activity_date: "this year"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cohort_daily_statistics.country} = ${countries.code} ;;
  }

}
