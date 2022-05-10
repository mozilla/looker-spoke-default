connection: "telemetry"
label: "Firefox Focus for Android"
include: "//looker-hub/focus_android/explores/*"
include: "views/*"

explore: period_over_period_parameters {
  sql_always_where:
  {% if period_over_period_parameters.current_vs_previous_period._in_query %} ${period_over_period_parameters.current_vs_previous_period} is not null {% else %} 1=1 {% endif %}
  ;;
}

explore: pop_method1 {}

explore: pop_method2 {}

explore: pop_method3 {
  label: "PoP Method 3: Custom choice of current and previous periods with parameters"
  always_filter: {
    filters: [current_date_range: "6 months", compare_to: "Year" ]
  }}

explore:  pop_method7 {}

explore: usage {
  always_filter: {
    filters: [
      submission_date: "26 weeks",
    ]
  }

  aggregate_table: rollup__new_profile_activated__submission_date {
    query: {
      dimensions: [new_profile_activated, submission_date]
      measures: [user_count_active_28_days]
      filters: [
        usage.new_profile_7days_ago: "Yes",
        usage.submission_date: "after 2021/01/01"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__active_8_days_active_last_28__submission_date {
    query: {
      dimensions: [active_8_days_active_last_28, submission_date]
      measures: [user_count_active_28_days]
      filters: [usage.submission_date: "after 2021/01/01"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__submission_date {
    query: {
      dimensions: [submission_date]
      measures: [user_count_active_this_day]
      filters: [
        usage.is_new_profile: "Yes",
        usage.submission_date: "after 2021/01/01"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}

explore: focus_launch_new_profile_forecasts {
  sql_always_where: date >= "2020-01-01" ;;
}
