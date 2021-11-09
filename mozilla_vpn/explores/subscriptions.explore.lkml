include: "../views/subscriptions.view"
include: "../views/devices.view"
include: "../views/information_schema_partitions.view"
include: "../views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: subscriptions {

  join: metadata {
    from: information_schema_partitions
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "all_subscriptions_v1" AND ${metadata.partition_id} IS NULL;;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  join: devices {
    relationship: many_to_one
    sql_on: ${devices.user_id} = ${user_id};;
  }

  join: subscriptions__active {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    relationship: one_to_many
  }

  join: subscriptions__events {
    view_label: "Subscription Events"
    sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
    relationship: one_to_many
  }

  join: subscriptions__retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
    relationship: one_to_many
  }

  join: vat_rates {
    view_label: "VAT Rates"
    fields: [vat]
    sql_on: LOWER(${subscriptions.country}) = LOWER(${vat_rates.country_code})
    AND (
      ${subscriptions__active.active_raw} BETWEEN ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} - 1
      OR (${subscriptions__active.active_raw} < ${vat_rates.effective_raw} AND ${vat_rates.prev_effective_raw} IS NULL)
      OR (${subscriptions__active.active_raw} >= ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} IS NULL)
    );;
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    fields: []
    sql_on: UPPER(${subscriptions.plan_currency}) = UPPER(${exchange_rates_table.base_currency})
      AND ${subscriptions__active.active_raw} = ${exchange_rates_table.date_raw};;
    relationship: one_to_one
  }
}

# Add aggregate tables lookML from VPN SaaSboard - Active Subscriptions
explore: +subscriptions {
  aggregate_table: rollup__subscriptions__active_active_date__0 {
    query: {
      dimensions: [subscriptions__active.active_date]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
      }
  }

  aggregate_table: rollup__subscriptions__active_active_date__1 {
    query: {
      dimensions: [subscriptions__active.active_date]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value:  v
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscriptions__active_active_date__2 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscriptions__active.active_date]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__subscriptions__active_active_month__3 {
    query: {
      dimensions: [country_name, subscriptions__active.active_month]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_end_of_month: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__subscriptions__active_active_month__4 {
    query: {
      dimensions: [pricing_plan, subscriptions__active.active_month]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_end_of_month: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__provider__subscriptions__active_active_month__5 {
    query: {
      dimensions: [provider, subscriptions__active.active_month]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_end_of_month: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscriptions__active_active_date__6 {
    query: {
      dimensions: [subscriptions__active.active_date]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__7 {
    query: {
      dimensions: [country_name]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_max_active_date: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__8 {
    query: {
      dimensions: [pricing_plan]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_max_active_date: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__provider__9 {
    query: {
      dimensions: [provider]
      measures: [count]
      filters: [
        # "subscriptions__active.active_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__active.active_date: "2020/07/20 to today",
        subscriptions__active.is_max_active_date: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}

# Add aggregate tables lookML from VPN SaaSboard - Subscriptions Growth

explore: +subscriptions {
  aggregate_table: rollup__country_name__pricing_plan__provider__subscriptions__active_active_date__subscriptions__events_event_date__0 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscriptions__active.active_date, subscriptions__events.event_date]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__subscriptions__events_event_month__1 {
    query: {
      dimensions: [country_name, subscriptions__events.event_month]
      measures: [count]
      filters: [
        # "subscriptions__events.event_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__events.event_date: "2020/07/20 to today",
        subscriptions__events.type: "New"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__subscriptions__events_event_month__2 {
    query: {
      dimensions: [pricing_plan, subscriptions__events.event_month]
      measures: [count]
      filters: [
        # "subscriptions__events.event_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__events.event_date: "2020/07/20 to today",
        subscriptions__events.type: "New"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscriptions__events_event_date__subscriptions__events_granular_type__3 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscriptions__events.event_date, subscriptions__events.granular_type]
      measures: [subscriptions__events.delta]
      filters: [subscriptions__events.type: "New"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscriptions__events_event_date__subscriptions__events_granular_type__4 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscriptions__events.event_date, subscriptions__events.granular_type]
      measures: [subscriptions__events.delta]
      filters: [subscriptions__events.type: "Cancelled"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscriptions__events_event_date__subscriptions__events_type__5 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscriptions__events.event_date, subscriptions__events.type]
      measures: [subscriptions__events.delta]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__provider__subscriptions__events_event_month__6 {
    query: {
      dimensions: [provider, subscriptions__events.event_month]
      measures: [count]
      filters: [
        # "subscriptions__events.event_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions__events.event_date: "2020/07/20 to today",
        subscriptions__events.type: "New"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}


# Add aggregate tables lookML from VPN SaaSboard - retention

explore: +subscriptions {
  aggregate_table: rollup__subscription_start_month__subscriptions__retention_months_since_subscription_start__0 {
    query: {
      dimensions: [subscription_start_month, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscription_start_month__1 {
    query: {
      dimensions: [subscription_start_month]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_current_months_since_subscription_start: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscription_start_month__subscriptions__retention_months_since_subscription_start__2 {
    query: {
      dimensions: [subscription_start_month, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscription_start_month__3 {
    query: {
      dimensions: [subscription_start_month]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_current_months_since_subscription_start: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscriptions__retention_months_since_subscription_start__4 {
    query: {
      dimensions: [subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__subscription_start_date__5 {
    query: {
      dimensions: [subscription_start_date]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__subscriptions__retention_months_since_subscription_start__6 {
    query: {
      dimensions: [pricing_plan, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__subscriptions__retention_months_since_subscription_start__7 {
    query: {
      dimensions: [pricing_plan, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__pricing_plan__subscriptions__retention_months_since_subscription_start__8 {
    query: {
      dimensions: [pricing_plan, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "2020/07/20 to today"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__subscriptions__retention_months_since_subscription_start__9 {
    query: {
      dimensions: [country_name, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        subscriptions.subscription_start_month: "2020/07/20 to today",
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: "1,3,6,9,12,0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}

# Add aggregate tables lookML from VPN SaaSboard - churn

explore: +subscriptions {
  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__0 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__1 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__2 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [subscriptions__retention.is_cohort_complete: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__3 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__4 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [subscriptions__retention.months_since_subscription_start: ">0"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__5 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__6 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

  aggregate_table: rollup__country_name__pricing_plan__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__7 {
    query: {
      dimensions: [country_name, pricing_plan, provider, subscription_start_date, subscriptions__retention.months_since_subscription_start]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }
}
