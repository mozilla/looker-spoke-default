view: openai_costs {
  sql_table_name: `moz-fx-data-shared-prod.ai_usage_derived.openai_costs_v1` ;;

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

  dimension: project_id {
    description: "ID of the OpenAI project"
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: line_item {
    description: "Billing line item category (e.g., tokens, batch_tokens, audio_tokens)"
    type: string
    sql: ${TABLE}.line_item ;;
  }

  dimension: organization_id {
    description: "OpenAI organization ID"
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: currency {
    description: "Currency code (e.g., usd)"
    type: string
    sql: ${TABLE}.currency ;;
  }

  # ── Measures ──────────────────────────────────────────────────────────────────

  measure: total_cost {
    description: "Total cost in USD"
    type: sum
    sql: ${TABLE}.amount_value ;;
    value_format_name: usd
  }

}
