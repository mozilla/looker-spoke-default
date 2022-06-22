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
}

# Aggregation for active users metrics for submission_date > 2021
explore: +active_users_aggregates {
  aggregate_table: rollup__active_users_metrics {
    query: {
      dimensions: [app_name, submission_date]
      measures: [daily_active_users, weekly_active_users, monthly_active_users, new_profile, ad_click]
      filters: [
        active_users_aggregates.submission_date: "after 2021/01/01"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
  }
}

# Aggregation for active users metrics with Period over Period calculation
explore: +active_users_aggregates {
  aggregate_table: rollup__period_over_period_pivot__period_over_period_row {
    query: {
      dimensions: [app_name, submission_date, period_over_period_pivot, period_over_period_row]
      measures: [daily_active_users, weekly_active_users, monthly_active_users, new_profile, ad_click]
      filters: [
        active_users_aggregates.choose_breakdown: "Month^_Day",
        active_users_aggregates.choose_comparison: "Year",
        active_users_aggregates.submission_date: "after 2021/01/01",
        active_users_aggregates.ytd_only: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
  }
}



explore: active_users_aggregates_mv {
  always_filter: {
    filters: [active_users_aggregates_mv.submission_date: "this year"]
  }
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates_mv.country} = ${countries.code} ;;
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
