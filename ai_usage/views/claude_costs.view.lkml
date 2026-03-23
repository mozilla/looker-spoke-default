view: claude_costs {
  sql_table_name: `moz-fx-data-shared-prod.ai_usage_derived.claude_costs_v1` ;;

  # ── Dimensions ────────────────────────────────────────────────────────────────

  dimension_group: date {
    description: "Date of the cost bucket"
    type: time
    sql: ${TABLE}.date ;;
    datatype: date
    convert_tz: no
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
  }

  dimension: workspace_id {
    description: "Anthropic workspace ID (null for default workspace)"
    type: string
    sql: ${TABLE}.workspace_id ;;
  }

  dimension: cost_type {
    description: "Billing category: tokens, web_search, or code_execution"
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: token_type {
    description: "Token category: uncached_input_tokens, output_tokens, cache_read_input_tokens, etc."
    type: string
    sql: ${TABLE}.token_type ;;
  }

  dimension: context_window {
    description: "Context window size bucket (e.g., 0-200k, 200k-1M)"
    type: string
    sql: ${TABLE}.context_window ;;
  }

  dimension: model {
    description: "Claude model name (e.g., claude-sonnet-4-20250514)"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: service_tier {
    description: "Request tier: standard or batch"
    type: string
    sql: ${TABLE}.service_tier ;;
  }

  dimension: inference_geo {
    description: "Inference geography: global, us, or not_available"
    type: string
    sql: ${TABLE}.inference_geo ;;
  }

  dimension: currency {
    description: "Currency code (always USD)"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: description {
    description: "Human-readable cost line item description"
    type: string
    sql: ${TABLE}.description ;;
  }

  # ── Measures ──────────────────────────────────────────────────────────────────

  measure: total_cost {
    description: "Total Claude cost in USD (raw amounts are in cents)"
    type: sum
    sql: ${TABLE}.amount / 100.0 ;;
    value_format_name: usd
  }

}
