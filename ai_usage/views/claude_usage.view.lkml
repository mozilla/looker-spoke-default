include: "//looker-hub/ai_usage/views/claude_usage.view.lkml"

view: +claude_usage {
  # --- Token sum measures ---

  measure: total_uncached_input_tokens {
    type: sum
    sql: ${TABLE}.uncached_input_tokens ;;
    label: "Total Uncached Input Tokens"
    description: "Sum of input tokens not served from cache"
    value_format_name: decimal_0
  }

  measure: total_cache_read_tokens {
    type: sum
    sql: ${TABLE}.cache_read_input_tokens ;;
    label: "Total Cache Read Tokens"
    description: "Sum of input tokens read from cache"
    value_format_name: decimal_0
  }

  measure: total_cache_creation_tokens {
    type: sum
    sql: ${TABLE}.cache_creation_5m_input_tokens + ${TABLE}.cache_creation_1h_input_tokens ;;
    label: "Total Cache Creation Tokens"
    description: "Sum of tokens used to create cache entries (5-minute and 1-hour)"
    value_format_name: decimal_0
  }

  measure: total_output_tokens {
    type: sum
    sql: ${TABLE}.output_tokens ;;
    label: "Total Output Tokens"
    description: "Sum of output tokens generated"
    value_format_name: decimal_0
  }

  measure: total_input_tokens {
    type: number
    sql: ${total_uncached_input_tokens} + ${total_cache_read_tokens} + ${total_cache_creation_tokens} ;;
    label: "Total Input Tokens"
    description: "Sum of all input tokens (uncached + cache reads + cache creation)"
    value_format_name: decimal_0
  }

  measure: total_web_search_requests {
    type: sum
    sql: ${TABLE}.web_search_requests ;;
    label: "Total Web Search Requests"
    description: "Sum of web search requests made via server-side tools"
    value_format_name: decimal_0
  }

  # --- Ratio measures ---

  measure: cache_reuse_ratio {
    type: number
    sql: ${total_cache_read_tokens} / NULLIF(${total_input_tokens}, 0) ;;
    label: "Cache Reuse Ratio"
    description: "Fraction of all input tokens that were served from cache (cache reads / total input)"
    value_format_name: percent_2
  }

  measure: cache_hit_rate {
    type: number
    sql: ${total_cache_read_tokens} / NULLIF(${total_uncached_input_tokens} + ${total_cache_read_tokens}, 0) ;;
    label: "Cache Hit Rate"
    description: "Rate at which input tokens were found in cache (cache reads / uncached + cache reads)"
    value_format_name: percent_2
  }

  measure: output_to_input_ratio {
    type: number
    sql: ${total_output_tokens} / NULLIF(${total_input_tokens}, 0) ;;
    label: "Output-to-Input Ratio"
    description: "Ratio of output tokens to total input tokens"
    value_format_name: decimal_2
  }

  # --- Averages ---

  measure: avg_uncached_input_tokens_per_day {
    type: average
    sql: ${TABLE}.uncached_input_tokens ;;
    label: "Avg Uncached Input Tokens per Day"
    value_format_name: decimal_0
  }

  measure: avg_output_tokens_per_day {
    type: average
    sql: ${TABLE}.output_tokens ;;
    label: "Avg Output Tokens per Day"
    value_format_name: decimal_0
  }
}
