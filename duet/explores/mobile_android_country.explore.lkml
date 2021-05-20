include: "../views/*.view.lkml"

explore: mobile_android_country {
  aggregate_table: rollup__submission_date__0 {
    query: {
      dimensions: [
        # "app_id" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # app_id,
        # "history_days" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # history_days,
        submission_date
      ]
      measures: [activated, event_installs, first_seen, first_time_visitor_count]
      filters: [
        # "mobile_android_country.app_id" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        mobile_android_country.app_id: "firefox",
        # "mobile_android_country.history_days" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        mobile_android_country.history_days: "7"
      ]
    }

    # Please specify a datagroup_trigger or sql_trigger_value
    # See https://looker.com/docs/r/lookml/types/aggregate_table/materialization
    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__activated__event_installs__first_seen__first_time_visitor_count__1 {
    query: {
      dimensions: [
        # "app_id" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # app_id,
        # "history_days" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # history_days
      ]
      measures: [activated, event_installs, first_seen, first_time_visitor_count]
      filters: [
        # "mobile_android_country.app_id" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        mobile_android_country.app_id: "firefox",
        # "mobile_android_country.history_days" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        mobile_android_country.history_days: "7"
      ]
    }

    # Please specify a datagroup_trigger or sql_trigger_value
    # See https://looker.com/docs/r/lookml/types/aggregate_table/materialization
    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}
