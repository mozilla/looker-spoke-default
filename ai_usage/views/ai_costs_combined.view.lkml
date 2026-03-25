view: ai_costs_combined {
  derived_table: {
    sql:
      SELECT
        date,
        'OpenAI' AS provider,
        amount_value AS amount,
        currency,
        project_id,
        organization_id,
        line_item AS cost_description,
        CAST(NULL AS STRING) AS workspace_id,
        CAST(NULL AS STRING) AS model,
        CAST(NULL AS STRING) AS token_type,
        CAST(NULL AS STRING) AS cost_type,
        CAST(NULL AS STRING) AS context_window,
        CAST(NULL AS STRING) AS service_tier,
        CAST(NULL AS STRING) AS inference_geo
      FROM `moz-fx-data-shared-prod.ai_usage_derived.openai_costs_v1`

      UNION ALL

      SELECT
        date,
        'Claude' AS provider,
        amount / 100.0 AS amount,
        currency,
        CAST(NULL AS STRING) AS project_id,
        CAST(NULL AS STRING) AS organization_id,
        description AS cost_description,
        workspace_id,
        model,
        token_type,
        cost_type,
        context_window,
        service_tier,
        inference_geo
      FROM `moz-fx-data-shared-prod.ai_usage_derived.claude_costs_v1`
    ;;
  }

  dimension_group: date {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.date ;;
    description: "Date of the cost record"
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
    description: "AI provider: OpenAI or Claude (Anthropic)"
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: cost_description {
    type: string
    sql: ${TABLE}.cost_description ;;
    description: "Line item (OpenAI) or description (Claude) for the cost"
  }

  # OpenAI-specific dimensions

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
    description: "OpenAI project ID (OpenAI only)"
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
    description: "OpenAI organization ID (OpenAI only)"
  }

  # Claude-specific dimensions

  dimension: workspace_id {
    type: string
    sql: ${TABLE}.workspace_id ;;
    description: "Anthropic workspace ID (Claude only)"
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
    description: "Claude model name (Claude only)"
  }

  dimension: token_type {
    type: string
    sql: ${TABLE}.token_type ;;
    description: "Token type, e.g. input/output (Claude only)"
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
    description: "Cost type (Claude only)"
  }

  dimension: context_window {
    type: string
    sql: ${TABLE}.context_window ;;
    description: "Context window size (Claude only)"
  }

  dimension: service_tier {
    type: string
    sql: ${TABLE}.service_tier ;;
    description: "Service tier (Claude only)"
  }

  dimension: inference_geo {
    type: string
    sql: ${TABLE}.inference_geo ;;
    description: "Inference geography (Claude only)"
  }

  # Measures

  measure: total_amount {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: decimal_2
    description: "Total cost in the record's currency"
  }

  measure: total_amount_usd {
    type: sum
    sql: CASE WHEN ${TABLE}.currency = 'usd' OR ${TABLE}.currency = 'USD' THEN ${TABLE}.amount ELSE NULL END ;;
    value_format_name: usd
    description: "Total cost in USD (excludes non-USD records)"
  }

  measure: count {
    type: count
    description: "Number of cost records"
  }
}
