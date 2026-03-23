view: openai_completions {
  sql_table_name: `moz-fx-data-shared-prod.ai_usage_derived.openai_completions_v1` ;;

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

  dimension: model {
    description: "Model name (e.g., gpt-4o, o1-preview)"
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: project_id {
    description: "ID of the OpenAI project"
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: user_id {
    description: "ID of the user"
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: api_key_id {
    description: "ID of the API key"
    type: string
    sql: ${TABLE}.api_key_id ;;
  }

  dimension: batch {
    description: "Whether the request was a batch job (50% cheaper than realtime)"
    type: yesno
    sql: ${TABLE}.batch ;;
  }

  dimension: service_tier {
    description: "Service tier (e.g., default, scale)"
    type: string
    sql: ${TABLE}.service_tier ;;
  }

  # ── Token measures ────────────────────────────────────────────────────────────

  measure: total_input_tokens {
    description: "Total input tokens used"
    type: sum
    sql: ${TABLE}.input_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_output_tokens {
    description: "Total output tokens generated"
    type: sum
    sql: ${TABLE}.output_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_cached_tokens {
    description: "Total input tokens served from cache"
    type: sum
    sql: ${TABLE}.input_cached_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_audio_input_tokens {
    description: "Total input audio tokens. Non-zero values for projects not using voice may indicate misconfiguration."
    type: sum
    sql: ${TABLE}.input_audio_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_audio_output_tokens {
    description: "Total output audio tokens. Non-zero values for projects not using voice may indicate misconfiguration."
    type: sum
    sql: ${TABLE}.output_audio_tokens ;;
    value_format_name: decimal_0
  }

  measure: total_requests {
    description: "Total number of model API requests"
    type: sum
    sql: ${TABLE}.num_model_requests ;;
    value_format_name: decimal_0
  }

  # ── Efficiency measures ────────────────────────────────────────────────────────

  measure: cache_hit_rate {
    description: "Fraction of input tokens served from cache. Higher is cheaper."
    type: number
    sql: SAFE_DIVIDE(SUM(${TABLE}.input_cached_tokens), NULLIF(SUM(${TABLE}.input_tokens), 0)) ;;
    value_format_name: percent_2
  }

  measure: batch_adoption_rate {
    description: "Fraction of requests using batch mode (50% cost savings). Low values on high-volume, non-latency-sensitive models are a cost reduction opportunity."
    type: number
    sql: SAFE_DIVIDE(
      SUM(IF(${TABLE}.batch, ${TABLE}.num_model_requests, 0)),
      NULLIF(SUM(${TABLE}.num_model_requests), 0)
    ) ;;
    value_format_name: percent_2
  }

  measure: avg_tokens_per_request {
    description: "Average tokens per API request. Very low values suggest many small requests that could be batched or consolidated."
    type: number
    sql: SAFE_DIVIDE(
      SUM(${TABLE}.input_tokens + ${TABLE}.output_tokens),
      NULLIF(SUM(${TABLE}.num_model_requests), 0)
    ) ;;
    value_format_name: decimal_0
  }

  measure: output_to_input_ratio {
    description: "Output tokens divided by input tokens. A sudden spike can indicate runaway generation or a prompt change."
    type: number
    sql: SAFE_DIVIDE(SUM(${TABLE}.output_tokens), NULLIF(SUM(${TABLE}.input_tokens), 0)) ;;
    value_format_name: decimal_2
  }

}
