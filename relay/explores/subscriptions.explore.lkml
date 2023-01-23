include: "../views/subscriptions.view"
include: "/mozilla_vpn/views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"
include: "../views/table_metadata.view"

explore: subscriptions {

  join: metadata {
    from: table_metadata
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  # join: devices {
  #   relationship: many_to_one
  #   sql_on: ${devices.user_id} = ${user_id};;
  # }

  join: subscriptions__active {
    view_label: "Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    # sql: LEFT JOIN UNNEST(${subscriptions.active_dates}) AS subscriptions__active;;
    relationship: one_to_many
  }

  join: original_subscriptions__active {
    view_label: "Original Active Subscriptions"
    sql: LEFT JOIN UNNEST(${subscriptions.original_subscription_active_dates}) AS original_subscriptions__active;;
    relationship: one_to_many
  }

  # join: subscriptions__events {
  #   view_label: "Subscription Events"
  #   sql: CROSS JOIN UNNEST(${subscriptions.events}) AS subscriptions__events;;
  #   relationship: one_to_many
  # }

  join: subscriptions__retention {
    view_label: "Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.retention}) AS subscriptions__retention;;
    relationship: one_to_many
  }

  join: original_subscriptions__retention {
    view_label: "Original Subscription Retention"
    sql: CROSS JOIN UNNEST(${subscriptions.original_subscription_retention}) AS original_subscriptions__retention;;
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
      fields: [price]
      sql_on: UPPER(${subscriptions.plan_currency}) = UPPER(${exchange_rates_table.base_currency})
        AND ${subscriptions__active.active_raw} = ${exchange_rates_table.date_raw};;
      relationship: one_to_one
    }
  }

# Add aggregate tables lookML from Relay SaaSboard

explore: +subscriptions {
  aggregate_table: rollup__original_subscription_start_month__original_subscriptions__retention_months_since_original_subscription_start__0 {
    query: {
      dimensions: [original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
      measures: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        # "subscriptions.original_subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.original_subscription_start_date: "6 month",
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__original_subscriptions__retention_months_since_original_subscription_start__1 {
    query: {
      dimensions: [original_subscriptions__retention.months_since_original_subscription_start]
      measures: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        # "subscriptions.original_subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.original_subscription_start_date: "6 month",
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__metadata_last_modified_date__product_name__provider__2 {
    query: {
      dimensions: [metadata.last_modified_date, product_name, provider]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__original_subscription_start_month__original_subscriptions__retention_months_since_original_subscription_start__3 {
    query: {
      dimensions: [original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
      measures: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        # "subscriptions.original_subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.original_subscription_start_date: "6 month",
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__plan_type__subscriptions__retention_months_since_subscription_start__4 {
    query: {
      dimensions: [plan_type, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium",
        # "subscriptions.subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_date: "6 month",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__plan_type__subscriptions__retention_months_since_subscription_start__5 {
    query: {
      dimensions: [plan_type, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium",
        # "subscriptions.subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_date: "6 month",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

 aggregate_table: rollup__plan_type__subscriptions__retention_months_since_subscription_start__6 {
  query: {
    dimensions: [plan_type, subscriptions__retention.months_since_subscription_start]
    measures: [count, subscriptions__retention.retained]
    filters: [
      # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
      subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium",
      # "subscriptions.subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
      subscriptions.subscription_start_date: "6 month",
      subscriptions__retention.is_cohort_complete: "Yes"
    ]
  }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

 aggregate_table: rollup__original_subscription_start_month__original_subscriptions__retention_months_since_original_subscription_start__7 {
  query: {
    dimensions: [original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
    measures: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
    filters: [
      original_subscriptions__retention.is_cohort_complete: "Yes",
      # "subscriptions.original_subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
      subscriptions.original_subscription_start_date: "6 month",
      # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
      subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium"
    ]
  }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__original_subscription_start_month__original_subscriptions__retention_months_since_original_subscription_start__8 {
    query: {
      dimensions: [original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
      measures: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        # "subscriptions.original_subscription_start_date" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.original_subscription_start_date: "6 month",
        # "subscriptions.product_name" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.product_name: "Mozilla VPN & Firefox Relay,Relay Premium"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__subscription_start_month__subscriptions__retention_months_since_subscription_start__9 {
    query: {
      dimensions: [subscription_start_month, subscriptions__retention.months_since_subscription_start]
      measures: [count, subscriptions__retention.retained]
      filters: [
        # "subscriptions.subscription_start_month" was filtered by dashboard. The aggregate table will only optimize against exact match queries.
        subscriptions.subscription_start_month: "6 month",
        subscriptions__retention.is_cohort_complete: "Yes"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__original_subscription_start_date__original_subscriptions__retention_months_since_original_subscription_start__plan_type__pricing_plan__product_name__provider__0 {
    query: {
      dimensions: [
        country_name,
        original_subscription_start_date,
        original_subscriptions__retention.months_since_original_subscription_start,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        original_subscriptions__retention.months_since_original_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__original_subscription_start_date__plan_type__pricing_plan__product_name__provider__1 {
    query: {
      dimensions: [
        country_name,
        original_subscription_start_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
      filters: [original_subscriptions__retention.is_cohort_complete: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__original_subscription_start_date__original_subscriptions__retention_months_since_original_subscription_start__plan_type__pricing_plan__product_name__provider__2 {
    query: {
      dimensions: [
        country_name,
        original_subscription_start_date,
        original_subscriptions__retention.months_since_original_subscription_start,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
      filters: [original_subscriptions__retention.is_cohort_complete: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__original_subscription_start_date__original_subscriptions__retention_months_since_original_subscription_start__plan_type__pricing_plan__product_name__provider__3 {
    query: {
      dimensions: [
        country_name,
        original_subscription_start_date,
        original_subscriptions__retention.months_since_original_subscription_start,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        original_subscriptions__retention.months_since_original_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__original_subscription_start_date__original_subscriptions__retention_months_since_original_subscription_start__plan_type__pricing_plan__product_name__provider__4 {
    query: {
      dimensions: [
        country_name,
        original_subscription_start_date,
        original_subscriptions__retention.months_since_original_subscription_start,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
      filters: [
        original_subscriptions__retention.is_cohort_complete: "Yes",
        original_subscriptions__retention.months_since_original_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__metadata_last_modified_date__5 {
    query: {
      dimensions: [metadata.last_modified_date]
      filters: [subscriptions__active.is_max_active_date: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__plan_type__pricing_plan__product_name__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__6 {
    query: {
      dimensions: [
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider,
        subscription_start_date,
        subscriptions__retention.months_since_subscription_start
      ]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__plan_type__pricing_plan__product_name__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__7 {
    query: {
      dimensions: [
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider,
        subscription_start_date,
        subscriptions__retention.months_since_subscription_start
      ]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }

  aggregate_table: rollup__country_name__plan_type__pricing_plan__product_name__provider__subscription_start_date__subscriptions__retention_months_since_subscription_start__8 {
    query: {
      dimensions: [
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider,
        subscription_start_date,
        subscriptions__retention.months_since_subscription_start
      ]
      measures: [subscriptions__retention.churned, subscriptions__retention.previously_retained]
      filters: [
        subscriptions__retention.is_cohort_complete: "Yes",
        subscriptions__retention.months_since_subscription_start: ">0"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "subscriptions_v1";;
    }
  }
}
