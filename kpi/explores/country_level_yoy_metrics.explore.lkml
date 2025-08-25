include: "../views/country_level_yoy_metrics.view.lkml"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/combined_browser_metrics/datagroups/active_users_aggregates_last_updated.datagroup.lkml"

explore: country_level_yoy_metrics {
  label: "Country-Level Year-over-Year Browser Metrics"
  description: "Country-Level Year-over-Year Browser Metrics"
  view_name: country_level_yoy_metrics

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${country_level_yoy_metrics.country} = ${countries.code} ;;
  }

  aggregate_table: rollup__kpi_product_group__metric__submission_date {
    query: {
      dimensions: [kpi_product_group, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        country_level_yoy_metrics.app_name: "Firefox Desktop,Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "3 day ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__metric__submission_date__desktop {
    query: {
      dimensions: [countries.continent, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World,-Antarctica",
        country_level_yoy_metrics.app_name: "Firefox Desktop",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2 days ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__metric__submission_date__mobile {
    query: {
      dimensions: [countries.continent, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World,-Antarctica",
        country_level_yoy_metrics.app_name: "Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "3 day ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__countries_continent__metric__submission_date__mobile {
    query: {
      dimensions: [countries.continent, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World,-Antarctica",
        country_level_yoy_metrics.app_name: "Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2024/05/15"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__desktop {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World",
        country_level_yoy_metrics.app_name: "Firefox Desktop",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2 days ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__mobile {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World",
        country_level_yoy_metrics.app_name: "Fenix,Firefox iOS,Focus Android,Focus iOS,\"focus_android\",\"focus_ios\"",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "3 day ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__fenix {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World",
        country_level_yoy_metrics.app_name: "Fenix",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2024/05/15"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__firefox_ios {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Rest of World,-Unknown",
        country_level_yoy_metrics.app_name: "Firefox iOS",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2024/05/15"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__focus_android {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World",
        country_level_yoy_metrics.app_name: "Focus Android",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2 days ago"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }

  aggregate_table: rollup__continent__countries_name__metric__submission_date__focus_ios {
    query: {
      dimensions: [countries.continent, countries.name, metric, submission_date]
      measures: [previous_value, value, yoy_difference]
      filters: [
        countries.region_name: "-Unknown,-Rest of World",
        country_level_yoy_metrics.app_name: "Focus iOS",
        country_level_yoy_metrics.metric: "MAU,WAU,DAU 28-day Moving Average",
        country_level_yoy_metrics.user_input_date: "2024/05/15"
      ]
    }

    materialization: {
      datagroup_trigger: active_users_aggregates_last_updated
    }
  }
}
