connection: "telemetry"
label: "Firefox Focus for iOS"
include: "//looker-hub/focus_ios/explores/*"
# include: "//looker-hub/focus_ios/dashboards/*"
include: "views/*"
# include: "explores/*"
# include: "dashboards/*"

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
    
    # Whenever CURRENT_DATE() changes, the query will get re-executed and added to the aggregate table
    # The dashboard will then directly query the aggregate table instead of running the query, which makes loading dashboard tiles much faster
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

  sql_always_where: submission_date >= "2020-01-01" ;;
}
