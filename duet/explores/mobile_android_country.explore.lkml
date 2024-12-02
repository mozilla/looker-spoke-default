include: "../views/mobile_android_country.view.lkml"
include: "../views/country_buckets.view.lkml"

explore: mobile_android_country {
  label: "Mobile Android Funnel"
  description: "Consolidated view of the Android acquisition funnel by country."
  join: country_buckets {
    type: inner
    relationship: many_to_one
    sql_on:  ${country_buckets.code} = ${mobile_android_country.country} ;;
  }
  always_filter: {
    filters: [
      country_buckets.bucket: "Overall"
    ]
  }

  aggregate_table: rollup__submission_date__0 {
    query: {
      dimensions: [
        # "app_id" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # app_id,
        # "country_buckets.bucket" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # country_buckets.bucket,
        # "history_days" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # history_days,
        submission_date
      ]
      measures: [activated, event_installs, first_seen, first_time_visitor_count]
      filters: [
        # "country_buckets.bucket" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        country_buckets.bucket: "tier-1",
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
        # "country_buckets.bucket" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # country_buckets.bucket,
        # "history_days" is filtered on in the dashboard.
        # Uncomment to allow all possible filters to work with aggregate awareness.
        # history_days
      ]
      measures: [activated, event_installs, first_seen, first_time_visitor_count]
      filters: [
        # "country_buckets.bucket" is filtered on by the dashboard. The filter
        # value below may not optimize with other filter values.
        country_buckets.bucket: "tier-1",
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
