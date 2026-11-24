view: azure_billing {
  derived_table: {
    sql:
      WITH billing AS (
        SELECT daily_load.*
        FROM `moz-fx-data-shared-prod.azure_billing_syndicate.fxci_daily_actual_load` AS daily_load
        INNER JOIN `moz-fx-data-shared-prod.azure_billing_syndicate.fxci_daily_actual_lookup`
          USING (sourceDataId)
        WHERE {% condition usage_date %} daily_load.date {% endcondition %}
        UNION ALL
        SELECT daily_load.*
        FROM `moz-fx-data-shared-prod.azure_billing_syndicate.taskcluster_daily_actual_load` AS daily_load
        INNER JOIN `moz-fx-data-shared-prod.azure_billing_syndicate.taskcluster_daily_actual_lookup`
          USING (sourceDataId)
        WHERE {% condition usage_date %} daily_load.date {% endcondition %}
      )
      SELECT
        date AS usage_date,
        SubscriptionId AS subscription_id,
        subscriptionName AS subscription_name,
        billingCurrency AS billing_currency,
        COALESCE(
          NULLIF(JSON_VALUE(tags, '$.worker-pool-id'), ''),
          NULLIF(JSON_VALUE(tags, '$.worker_pool_id'), ''),
          '(untagged)'
        ) AS worker_pool_id,
        SUM(costInBillingCurrency) AS billed_cost
      FROM billing
      WHERE SubscriptionId IN (
        '108d46d5-fe9b-4850-9a7d-8c914aa6c1f0',
        'a30e97ab-734a-4f3b-a0e4-c51c0bff0701',
        '8a205152-b25a-417f-a676-80465535a6c9'
      )
      GROUP BY 1, 2, 3, 4, 5 ;;
  }

  dimension: key {
    primary_key: yes
    hidden: yes
    sql: TO_JSON_STRING(STRUCT(${TABLE}.usage_date, ${TABLE}.subscription_id,
      ${TABLE}.billing_currency, ${TABLE}.worker_pool_id)) ;;
  }

  dimension_group: usage {
    type: time
    timeframes: [date, week, month]
    datatype: date
    sql: ${TABLE}.usage_date ;;
  }

  dimension: cloud_provider {
    type: string
    sql: 'azure' ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: subscription_name {
    type: string
    sql: ${TABLE}.subscription_name ;;
  }

  dimension: billing_currency {
    type: string
    sql: ${TABLE}.billing_currency ;;
  }

  dimension: worker_pool_id {
    type: string
    sql: ${TABLE}.worker_pool_id ;;
    description: "Worker pool from either Azure tag spelling. Untagged charges remain in the total."
  }

  measure: billed_cost {
    type: sum
    sql: ${TABLE}.billed_cost ;;
    value_format: "#,##0.00"
    description: "Actual charges in billing currency, including VM overhead and non-VM charges. Group by currency."
  }

  measure: latest_usage_date {
    type: date
    sql: MAX(${TABLE}.usage_date) ;;
    description: "Latest usage date in the selected export data. This does not prove that the day is complete."
  }
}
