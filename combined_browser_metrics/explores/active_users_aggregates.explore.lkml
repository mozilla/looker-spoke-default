include: "../views//active_users_aggregates.view.lkml"
include: "/shared/views/*"

explore: active_users_aggregates {
  always_filter: {
    filters: [active_users_aggregates.app_name: "Firefox Desktop, Fenix, Fenix BrowserStack, Firefox iOS, Firefox iOS BrowserStack,
      Focus Android,  Focus iOS, Focus iOS BrowserStack",
      active_users_aggregates.submission_date: "after 4 weeks ago"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates.country} = ${countries.code} ;;
  }

  aggregate_table: rollup__period_over_period {
    query: {
      dimensions: [period_over_period_pivot, period_over_period_row, active_users_aggregates.app_name, active_users_aggregates.submission_date]
      measures: [daily_active_users, weekly_active_users, monthly_active_users, new_profile, ad_click, organic_search_counts, search_counts, search_with_ad, uri_counts, active_hour]
      filters: [
        active_users_aggregates.choose_breakdown: "Month^_Day",
        active_users_aggregates.choose_comparison: "Year",
        active_users_aggregates.submission_date: "after 1 year ago",
        active_users_aggregates.ytd_only: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
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
