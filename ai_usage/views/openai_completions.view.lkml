include: "//looker-hub/ai_usage/views/openai_completions.view.lkml"

view: +openai_completions {
  # --- Token sum measures ---

  measure: total_input_tokens {
    type: sum
    sql: ${TABLE}.input_tokens ;;
    label: "Total Input Tokens"
    description: "Sum of all input (prompt) tokens"
    value_format_name: decimal_0
  }

  measure: total_output_tokens {
    type: sum
    sql: ${TABLE}.output_tokens ;;
    label: "Total Output Tokens"
    description: "Sum of all output (completion) tokens"
    value_format_name: decimal_0
  }

  measure: total_cached_tokens {
    type: sum
    sql: ${TABLE}.input_cached_tokens ;;
    label: "Total Cached Input Tokens"
    description: "Sum of input tokens served from cache"
    value_format_name: decimal_0
  }

  measure: total_requests {
    type: sum
    sql: ${TABLE}.num_model_requests ;;
    label: "Total Requests"
    description: "Total number of model API requests"
    value_format_name: decimal_0
  }

  measure: total_batch_requests {
    type: sum
    sql: CASE WHEN ${TABLE}.batch THEN ${TABLE}.num_model_requests ELSE 0 END ;;
    label: "Total Batch Requests"
    description: "Number of requests made via the batch API"
    value_format_name: decimal_0
  }

  # --- Ratio measures ---

  measure: cache_hit_rate {
    type: number
    sql: ${total_cached_tokens} / NULLIF(${total_input_tokens}, 0) ;;
    label: "Cache Hit Rate"
    description: "Fraction of input tokens served from cache"
    value_format_name: percent_2
  }

  measure: batch_adoption_rate {
    type: number
    sql: ${total_batch_requests} / NULLIF(${total_requests}, 0) ;;
    label: "Batch Adoption Rate"
    description: "Fraction of requests made via the batch API"
    value_format_name: percent_2
  }

  measure: output_to_input_ratio {
    type: number
    sql: ${total_output_tokens} / NULLIF(${total_input_tokens}, 0) ;;
    label: "Output-to-Input Ratio"
    description: "Ratio of output tokens to input tokens"
    value_format_name: decimal_2
  }

  measure: avg_tokens_per_request {
    type: number
    sql: (${total_input_tokens} + ${total_output_tokens}) / NULLIF(${total_requests}, 0) ;;
    label: "Avg Tokens per Request"
    description: "Average total tokens (input + output) per API request"
    value_format_name: decimal_0
  }

  measure: avg_input_tokens_per_request {
    type: number
    sql: ${total_input_tokens} / NULLIF(${total_requests}, 0) ;;
    label: "Avg Input Tokens per Request"
    value_format_name: decimal_0
  }

  measure: avg_output_tokens_per_request {
    type: number
    sql: ${total_output_tokens} / NULLIF(${total_requests}, 0) ;;
    label: "Avg Output Tokens per Request"
    value_format_name: decimal_0
  }
}
