- dashboard: ai_usage_overview
  title: AI Usage Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: 'Cost and efficiency overview for Anthropic Claude and OpenAI usage.'

  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: "30 days ago for 30 days"
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []

  elements:

  # ── Combined cost KPIs ───────────────────────────────────────────────────────

  - title: Total Anthropic Cost
    name: Total Anthropic Cost
    model: ai_usage
    explore: ai_costs_combined
    type: single_value
    fields: [ai_costs_combined.total_cost]
    filters:
      ai_costs_combined.provider: "anthropic"
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    defaults_version: 1
    listen:
      Date: ai_costs_combined.date_date
    row: 0
    col: 0
    width: 8
    height: 4

  - title: Total OpenAI Cost
    name: Total OpenAI Cost
    model: ai_usage
    explore: ai_costs_combined
    type: single_value
    fields: [ai_costs_combined.total_cost]
    filters:
      ai_costs_combined.provider: "openai"
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    defaults_version: 1
    listen:
      Date: ai_costs_combined.date_date
    row: 0
    col: 8
    width: 8
    height: 4

  - title: Total Combined AI Cost
    name: Total Combined AI Cost
    model: ai_usage
    explore: ai_costs_combined
    type: single_value
    fields: [ai_costs_combined.total_cost]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    defaults_version: 1
    listen:
      Date: ai_costs_combined.date_date
    row: 0
    col: 16
    width: 8
    height: 4

  # ── Daily cost by provider ───────────────────────────────────────────────────

  - title: Daily Cost by Provider
    name: Daily Cost by Provider
    model: ai_usage
    explore: ai_costs_combined
    type: looker_line
    fields: [ai_costs_combined.date_date, ai_costs_combined.provider, ai_costs_combined.total_cost]
    pivots: [ai_costs_combined.provider]
    sorts: [ai_costs_combined.date_date asc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    point_style: none
    interpolation: linear
    defaults_version: 1
    listen:
      Date: ai_costs_combined.date_date
    row: 4
    col: 0
    width: 24
    height: 6

  # ── Weekly cost by provider ──────────────────────────────────────────────────

  - title: Weekly Cost by Provider
    name: Weekly Cost by Provider
    model: ai_usage
    explore: ai_costs_combined
    type: looker_column
    fields: [ai_costs_combined.date_week, ai_costs_combined.provider, ai_costs_combined.total_cost]
    pivots: [ai_costs_combined.provider]
    sorts: [ai_costs_combined.date_week asc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_x_axis_label: false
    stacking: normal
    defaults_version: 1
    listen:
      Date: ai_costs_combined.date_date
    row: 10
    col: 0
    width: 24
    height: 6

  # ── Claude efficiency ────────────────────────────────────────────────────────

  - title: Claude Cache Reuse Ratio by Model
    name: Claude Cache Reuse Ratio by Model
    note_state: expanded
    note_display: above
    note_text: "Values below 1.0 mean cache creation spend exceeded cache read savings."
    model: ai_usage
    explore: claude_usage
    type: looker_bar
    fields: [claude_usage.model, claude_usage.cache_reuse_ratio]
    sorts: [claude_usage.cache_reuse_ratio asc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_x_axis_label: false
    defaults_version: 1
    listen:
      Date: claude_usage.date_date
    row: 16
    col: 0
    width: 12
    height: 6

  - title: Claude Output-to-Input Ratio Over Time
    name: Claude Output-to-Input Ratio Over Time
    note_state: expanded
    note_display: above
    note_text: "Sudden spikes may indicate runaway generation, a removed max_tokens limit, or a prompt change."
    model: ai_usage
    explore: claude_usage
    type: looker_line
    fields: [claude_usage.date_date, claude_usage.model, claude_usage.output_to_input_ratio]
    pivots: [claude_usage.model]
    sorts: [claude_usage.date_date asc]
    limit: 500
    point_style: none
    interpolation: linear
    show_view_names: false
    defaults_version: 1
    listen:
      Date: claude_usage.date_date
    row: 16
    col: 12
    width: 12
    height: 6

  - title: Claude Cache Hit Rate by User
    name: Claude Cache Hit Rate by User
    note_state: expanded
    note_display: above
    note_text: "Low cache hit rate for a user/key that sends repeated context is a prompt caching opportunity."
    model: ai_usage
    explore: claude_usage
    type: looker_bar
    fields: [claude_api_keys.user_email, claude_usage.cache_hit_rate]
    sorts: [claude_usage.cache_hit_rate asc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: claude_usage.date_date
    row: 22
    col: 0
    width: 12
    height: 6

  - title: Claude Tokens by Model
    name: Claude Tokens by Model
    model: ai_usage
    explore: claude_usage
    type: looker_bar
    fields: [claude_usage.model, claude_usage.total_uncached_input_tokens, claude_usage.total_cache_read_tokens, claude_usage.total_cache_creation_tokens, claude_usage.total_output_tokens]
    sorts: [claude_usage.total_tokens desc]
    limit: 20
    show_view_names: false
    stacking: normal
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: claude_usage.date_date
    row: 22
    col: 12
    width: 12
    height: 6

  # ── OpenAI efficiency ────────────────────────────────────────────────────────

  - title: OpenAI Batch Adoption Rate by Model
    name: OpenAI Batch Adoption Rate by Model
    note_state: expanded
    note_display: above
    note_text: "Low batch adoption on high-volume models is a 50% cost reduction opportunity."
    model: ai_usage
    explore: openai_completions
    type: looker_bar
    fields: [openai_completions.model, openai_completions.batch_adoption_rate]
    sorts: [openai_completions.batch_adoption_rate asc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: openai_completions.date_date
    row: 28
    col: 0
    width: 12
    height: 6

  - title: OpenAI Cache Hit Rate by Model
    name: OpenAI Cache Hit Rate by Model
    note_state: expanded
    note_display: above
    note_text: "Low cache hit rate on models with repetitive prompts indicates a prompt caching opportunity."
    model: ai_usage
    explore: openai_completions
    type: looker_bar
    fields: [openai_completions.model, openai_completions.cache_hit_rate]
    sorts: [openai_completions.cache_hit_rate asc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: openai_completions.date_date
    row: 28
    col: 12
    width: 12
    height: 6

  - title: OpenAI Avg Tokens per Request by Model
    name: OpenAI Avg Tokens per Request by Model
    note_state: expanded
    note_display: above
    note_text: "Very low values suggest many tiny requests that could be consolidated or batched."
    model: ai_usage
    explore: openai_completions
    type: looker_bar
    fields: [openai_completions.model, openai_completions.avg_tokens_per_request]
    sorts: [openai_completions.avg_tokens_per_request asc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: openai_completions.date_date
    row: 34
    col: 0
    width: 12
    height: 6

  - title: OpenAI Cost by Line Item
    name: OpenAI Cost by Line Item
    model: ai_usage
    explore: openai_costs
    type: looker_bar
    fields: [openai_costs.line_item, openai_costs.total_cost]
    sorts: [openai_costs.total_cost desc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: openai_costs.date_date
    row: 34
    col: 12
    width: 12
    height: 6

  # ── Claude costs breakdown ────────────────────────────────────────────────────

  - title: Claude Cost by Model
    name: Claude Cost by Model
    model: ai_usage
    explore: claude_costs
    type: looker_bar
    fields: [claude_costs.model, claude_costs.total_cost]
    sorts: [claude_costs.total_cost desc]
    limit: 20
    show_view_names: false
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: claude_costs.date_date
    row: 40
    col: 0
    width: 12
    height: 6

  - title: Claude Cost by Type
    name: Claude Cost by Type
    note_state: expanded
    note_display: above
    note_text: "Breakdown by cost_type (tokens, web_search, code_execution) and service tier."
    model: ai_usage
    explore: claude_costs
    type: looker_bar
    fields: [claude_costs.cost_type, claude_costs.service_tier, claude_costs.total_cost]
    pivots: [claude_costs.service_tier]
    sorts: [claude_costs.total_cost desc]
    limit: 20
    show_view_names: false
    stacking: normal
    x_axis_gridlines: false
    defaults_version: 1
    listen:
      Date: claude_costs.date_date
    row: 40
    col: 12
    width: 12
    height: 6
