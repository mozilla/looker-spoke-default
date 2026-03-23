view: claude_usage {
  sql_table_name: `moz-fx-data-shared-prod.ai_usage_derived.claude_usage_v1` ;;

  # ── Dimensions ────────────────────────────────────────────────────────────────

  dimension_group: date {
    description: "Date of the usage bucket"
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

  dimension: api_key_id {
    description: "ID of the API key used. Null for usage in the Anthropic Console."
    type: string
    sql: ${TABLE}.api_key_id ;;
  }

  dimension: model {
    description: "Model used (e.g., claude-sonnet-4-20250514)"
    type: string
    sql: ${TABLE}.model ;;
  }

  # ── Token measures ────────────────────────────────────────────────────────────

  measure: total_uncached_input_tokens {
    description: "Total uncached input tokens (billed at full input rate)"
    type: sum
    sql: ${TABLE}.uncached_input_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_cache_read_tokens {
    description: "Total input tokens served from cache (billed at reduced rate)"
    type: sum
    sql: ${TABLE}.cache_read_input_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_cache_creation_tokens {
    description: "Total tokens used to create cache entries (5m + 1h)"
    type: sum
    sql: ${TABLE}.cache_creation_5m_input_tokens + ${TABLE}.cache_creation_1h_input_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_output_tokens {
    description: "Total output tokens generated"
    type: sum
    sql: ${TABLE}.output_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_tokens {
    description: "Total tokens across all types"
    type: number
    sql: ${total_uncached_input_tokens} + ${total_cache_read_tokens} + ${total_cache_creation_tokens} + ${total_output_tokens} ;;
    value_format_name: decimal_0
  }

  measure: total_web_searches {
    description: "Total web search requests made via server-side tools"
    type: sum
    sql: ${TABLE}.web_search_requests ;;
    value_format_name: decimal_0
  }

  # ── Efficiency measures ────────────────────────────────────────────────────────

  measure: cache_hit_rate {
    description: "Fraction of input tokens served from cache. Higher is cheaper."
    type: number
    sql: SAFE_DIVIDE(
      SUM(${TABLE}.cache_read_input_tokens),
      SUM(${TABLE}.uncached_input_tokens + ${TABLE}.cache_read_input_tokens)
    ) ;;
    value_format_name: percent_2
  }

  measure: cache_reuse_ratio {
    description: "Cache reads divided by cache creation tokens. Values below 1.0 mean you spent more creating cache than reading it — wasted cache spend."
    type: number
    sql: SAFE_DIVIDE(
      SUM(${TABLE}.cache_read_input_tokens),
      NULLIF(SUM(${TABLE}.cache_creation_5m_input_tokens + ${TABLE}.cache_creation_1h_input_tokens), 0)
    ) ;;
    value_format_name: decimal_2
  }

  measure: output_to_input_ratio {
    description: "Output tokens divided by total input tokens. A sudden spike can indicate runaway generation, a removed max_tokens limit, or a prompt change."
    type: number
    sql: SAFE_DIVIDE(
      SUM(${TABLE}.output_tokens),
      NULLIF(SUM(
        ${TABLE}.uncached_input_tokens
        + ${TABLE}.cache_read_input_tokens
        + ${TABLE}.cache_creation_5m_input_tokens
        + ${TABLE}.cache_creation_1h_input_tokens
      ), 0)
    ) ;;
    value_format_name: decimal_2
  }

}
