view: ai_costs_combined {
  derived_table: {
    sql:
      SELECT 'anthropic' AS provider, date, amount / 100.0 AS amount_usd
      FROM `moz-fx-data-shared-prod.ai_usage_derived.claude_costs_v1`
      UNION ALL
      SELECT 'openai' AS provider, date, amount_value AS amount_usd
      FROM `moz-fx-data-shared-prod.ai_usage_derived.openai_costs_v1`
    ;;
  }

  # ── Dimensions ────────────────────────────────────────────────────────────────

  dimension: provider {
    description: "AI provider (anthropic or openai)"
    type: string
    sql: ${TABLE}.provider ;;
  }

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

  # ── Measures ──────────────────────────────────────────────────────────────────

  measure: total_cost {
    description: "Total cost in USD across all providers"
    type: sum
    sql: ${TABLE}.amount_usd ;;
    value_format_name: usd
  }

}
