include: "../views//active_users_aggregates.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "/firefox_desktop/views/key_tentpole_dates.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/active_users_aggregates_last_updated.datagroup.lkml"

explore: active_users_aggregates {
  # persist_with: active_users_aggregates_v1_last_updated
  always_filter: {
    filters: [active_users_aggregates.app_name: "Firefox Desktop, Firefox Desktop BrowserStack, Fenix, Fenix BrowserStack, Firefox iOS, Firefox iOS BrowserStack,
      Focus Android,  Focus iOS, Focus iOS BrowserStack",
      active_users_aggregates.submission_date: "after 4 weeks ago"]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${active_users_aggregates.country} = ${countries.code} ;;
  }

  sql_always_where: NOT (${active_users_aggregates.is_leap_year} AND EXTRACT(DAYOFYEAR FROM ${submission_date}) = 60) ;;

  aggregate_table: rollup__period_over_period {
    query: {
      dimensions: [period_over_period_pivot, period_over_period_row, active_users_aggregates.app_name, active_users_aggregates.submission_date, active_users_aggregates.ytd_only]
      measures: [daily_active_users, weekly_active_users, monthly_active_users]
      filters: [
        active_users_aggregates.choose_breakdown: "Month^_Day",
        active_users_aggregates.choose_comparison: "Year",
        active_users_aggregates.submission_date: "after 1 year ago"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: active_users_aggregates.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__kpi_reporting_group__submission_date__56_weeks {
    query: {
      dimensions: [kpi_reporting_group, submission_date]
      measures: [daily_active_users]
      filters: [
        active_users_aggregates.app_name: "Firefox Desktop,Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        active_users_aggregates.submission_date: "after 56 weeks ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__kpi_reporting_group__submission_date__110_weeks {
    query: {
      dimensions: [kpi_reporting_group, submission_date]
      measures: [daily_active_users]
      filters: [
        active_users_aggregates.app_name: "Firefox Desktop,Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        active_users_aggregates.submission_date: "after 110 weeks ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__submission_date__desktop {
    query: {
      dimensions: [countries.continent, submission_date]
      measures: [daily_active_users]
      filters: [
        active_users_aggregates.app_name: "Firefox Desktop",
        active_users_aggregates.submission_date: "after 56 weeks ago",
        countries.region_name: "Europe,North America,South America,Asia,Africa,Oceania"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__submission_date__mobile {
    query: {
      dimensions: [countries.continent, submission_date]
      measures: [daily_active_users]
      filters: [
        active_users_aggregates.app_name: "Fenix,Firefox iOS,Focus Android,Focus iOS",
        active_users_aggregates.submission_date: "after 56 weeks ago",
        countries.region_name: "Europe,North America,South America,Asia,Africa,Oceania"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__submission_date__110_weeks {
    query: {
      dimensions: [countries.continent, submission_date]
      measures: [daily_active_users]
      filters: [
        active_users_aggregates.app_name: "Fenix,Firefox iOS,Focus Android,Focus iOS",
        active_users_aggregates.submission_date: "after 110 weeks ago",
        countries.region_name: "Europe,North America,South America,Asia,Africa,Oceania"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  persist_with: active_users_aggregates_last_updated
}
