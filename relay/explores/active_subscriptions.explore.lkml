include: "../views/active_subscriptions.view"
include: "../views/table_metadata.view"
include: "/mozilla_vpn/views/vat_rates.view"
include: "//looker-hub/mozilla_vpn/views/exchange_rates_table.view"

explore: active_subscriptions {
  # from: active_subscriptions
  from: active_subscriptions


  join: metadata {
    from: table_metadata
    view_label: "Metadata"
    sql_on: ${metadata.table_name} = "active_subscriptions_v1";;
    # Using a one_to_one relationship here, instead of the technically correct many_to_one, makes
    # Looker understand that this join does not impact aggregation, which only works because this
    # view does not contain any aggregates.
    relationship: one_to_one
  }

  join: vat_rates {
    view_label: "VAT Rates"
    fields: [vat]
    sql_on: LOWER(${active_subscriptions.country}) = LOWER(${vat_rates.country_code})
          AND (
            ${active_subscriptions.active_raw} BETWEEN ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} - 1
            OR (${active_subscriptions.active_raw} < ${vat_rates.effective_raw} AND ${vat_rates.prev_effective_raw} IS NULL)
            OR (${active_subscriptions.active_raw} >= ${vat_rates.effective_raw} AND ${vat_rates.next_effective_raw} IS NULL)
          );;
    relationship: one_to_one
  }

  join: exchange_rates_table {
    view_label: "Exchange Rates"
    fields: [price]
    sql_on: UPPER(${active_subscriptions.plan_currency}) = UPPER(${exchange_rates_table.base_currency})
      AND ${active_subscriptions.active_raw} = ${exchange_rates_table.date_raw};;
    relationship: one_to_one
  }
}

# Add aggregate tables lookML from Relay SaaSboard - Active Subscriptions

explore: +active_subscriptions {
  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__0 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__1 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_max_active_date: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__2 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__3 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__4 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_max_active_date: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__5 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_max_active_date: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__6 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__7 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_max_active_date: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_end_of_month__plan_type__pricing_plan__product_name__provider__8 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_end_of_month,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_end_of_month__plan_type__pricing_plan__provider__9 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_end_of_month,
        plan_type,
        pricing_plan,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__is_max_active_date__plan_type__pricing_plan__product_name__provider__10 {
    query: {
      dimensions: [
        active_date,
        country_name,
        is_max_active_date,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [count_sum]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

# Add aggregate tables lookML from Relay SaaSboard - Revenue

  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__0 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [annual_recurring_revenue, count_sum, monthly_recurring_revenue]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__1 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [annual_recurring_revenue]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__2 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [annual_recurring_revenue]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__metadata_last_modified_date__3 {
    query: {
      dimensions: [metadata.last_modified_date]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__4 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [monthly_recurring_revenue]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }

  aggregate_table: rollup__active_date__country_name__plan_type__pricing_plan__product_name__provider__5 {
    query: {
      dimensions: [
        active_date,
        country_name,
        plan_type,
        pricing_plan,
        product_name,
        provider
      ]
      measures: [monthly_recurring_revenue]
      filters: [active_subscriptions.is_end_of_month: "Yes"]
    }

    materialization: {
      sql_trigger_value: SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.relay_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "active_subscriptions_v1";;
    }
  }
}
