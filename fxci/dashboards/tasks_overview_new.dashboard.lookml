# Dashboard 2861. Exported from Looker on 2026-09-16.
- dashboard: fxci_tasks_overview_new
  title: Tasks Overview - New
  preferred_viewer: dashboards-next
  description: Task runs, task-runtime costs, and Azure billed costs from available exports. Billing-source
    coverage is shown in the billed-cost tiles.
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Tasks By Worker Pool
    name: Tasks By Worker Pool
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - tasks.task_queue_id
    - num_task_runs
    filters:
      task_runs.submission_date: 6 months
      tasks.submission_date: 6 months
    sorts:
    - num_task_runs desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Num Task Runs
      based_on: task_runs.key
      measure: num_task_runs
      type: count_distinct
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
    row: 12
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Total Task Runs
    name: Total Tasks
    model: fxci
    explore: tasks
    type: single_value
    fields:
    - num_tasks
    filters:
      task_runs.submission_date: 6 months
    sorts:
    - num_tasks desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Num Tasks
      based_on: task_runs.key
      measure: num_tasks
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: Counts task runs, including retries and runs without cost records. The cloud filter applies only to cost tiles.
    listen:
      Submission Date: task_runs.submission_date
    row: 0
    col: 0
    width: 24
    height: 12
    tab_name: ''
  - title: Tasks By Trust Domain
    name: Tasks By Trust Domain
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - num_tasks
    - tasks.tags__trust_domain
    filters:
      tasks.submission_date: 6 months
      task_runs.submission_date: 6 months
      tasks.tags__trust_domain: -NULL,-EMPTY
    sorts:
    - num_tasks desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Num Tasks
      based_on: task_runs.key
      measure: num_tasks
      type: count_distinct
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
    row: 28
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Tasks By Kind
    name: Tasks By Kind
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - num_tasks
    - tasks.tags__trust_domain
    - tasks.tags__kind
    filters:
      tasks.submission_date: 6 months
      task_runs.submission_date: 6 months
      tasks.tags__trust_domain: -NULL,-EMPTY
      tasks.tags__kind: -NULL,-EMPTY
    sorts:
    - num_tasks desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Num Tasks
      based_on: task_runs.key
      measure: num_tasks
      type: count_distinct
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
    row: 44
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Average Duration (Minutes)
    name: Average Duration (Minutes)
    model: fxci
    explore: tasks
    type: single_value
    fields:
    - average_duration
    filters:
      task_runs.submission_date: 14 days
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: diff_minutes(${task_runs.started_date}, ${task_runs.resolved_date})
      label: Duration
      value_format_name: decimal_2
      dimension: duration
    - category: measure
      label: Average Duration
      value_format_name: decimal_1
      based_on: duration
      measure: average_duration
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
    row: 0
    col: 24
    width: 24
    height: 12
    tab_name: ''
  - title: Task Runtime Cost (USD)
    name: Total Cost (USD)
    model: fxci
    explore: tasks
    type: single_value
    fields:
    - sum_of_run_cost
    filters:
      task_run_costs.submission_date: 6 months
      task_runs.submission_date: 6 months
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Run Cost
      value_format_name: decimal_2
      based_on: task_run_costs.run_cost
      measure: sum_of_run_cost
      type: sum_distinct
      sql_distinct_key: ${task_run_costs.key}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: All costs exclude worker overhead such as idle, setup and teardown time.
    listen:
      Submission Date: task_runs.submission_date
      Cloud Provider: task_run_costs.cloud_provider
    row: 0
    col: 48
    width: 24
    height: 12
    tab_name: ''
  - title: Cost By Kind
    name: Cost By Kind
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - tasks.tags__trust_domain
    - tasks.tags__kind
    - sum_of_run_cost
    filters:
      tasks.submission_date: 6 months
      task_runs.submission_date: 6 months
      task_run_costs.submission_date: 6 months
      tasks.tags__trust_domain: -NULL,-EMPTY
      tasks.tags__kind: -NULL,-EMPTY
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Run Cost
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      measure: sum_of_run_cost
      type: sum_distinct
      sql_distinct_key: ${task_run_costs.key}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
      Cloud Provider: task_run_costs.cloud_provider
    row: 44
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - title: Cost By Trust Domain
    name: Cost By Trust Domain
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - sum_of_run_cost
    - tasks.tags__trust_domain
    filters:
      tasks.submission_date: 6 months
      task_runs.submission_date: 6 months
      task_run_costs.submission_date: 6 months
      tasks.tags__trust_domain: -NULL,-EMPTY
    sorts:
    - sum_of_run_cost desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Run Cost
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      measure: sum_of_run_cost
      type: sum_distinct
      sql_distinct_key: ${task_run_costs.key}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
      Cloud Provider: task_run_costs.cloud_provider
    row: 28
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - title: Costs By Worker Pool
    name: Costs By Worker Pool
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - tasks.task_queue_id
    - sum_of_run_cost
    filters:
      task_runs.submission_date: 6 months
      tasks.submission_date: 6 months
      task_run_costs.submission_date: 6 months
    sorts:
    - sum_of_run_cost desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Run Cost
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      measure: sum_of_run_cost
      type: sum_distinct
      sql_distinct_key: ${task_run_costs.key}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
      Cloud Provider: task_run_costs.cloud_provider
    row: 12
    col: 36
    width: 36
    height: 16
    tab_name: ''
  - title: Cost By Branch
    name: Cost By Branch
    model: fxci
    explore: tasks
    type: looker_grid
    fields:
    - tasks.tags__project
    - sum_of_run_cost
    filters:
      tasks.submission_date: 6 months
      task_runs.submission_date: 6 months
      task_run_costs.submission_date: 6 months
      tasks.tags__project: -NULL,-EMPTY
    sorts:
    - sum_of_run_cost desc 0
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Total Run Cost
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      measure: sum_of_run_cost
      type: sum_distinct
      sql_distinct_key: ${task_run_costs.key}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
      Cloud Provider: task_run_costs.cloud_provider
    row: 60
    col: 0
    width: 36
    height: 16
    tab_name: ''
  - title: Azure Billed Cost by Subscription (Available Exports)
    name: Azure Billed Cost by Subscription
    model: fxci
    explore: azure_billing
    type: looker_grid
    fields:
    - azure_billing.subscription_name
    - azure_billing.billing_currency
    - azure_billing.billed_cost
    - azure_billing.latest_usage_date
    sorts:
    - azure_billing.billed_cost desc
    limit: 500
    note_display: above
    note_state: expanded
    note_text: Actual charges by usage date, including VM overhead and non-VM charges. Only available
      export sources are included; this is not the full Azure bill. The latest usage date can be incomplete.
    listen:
      Submission Date: azure_billing.usage_date
      Cloud Provider: azure_billing.cloud_provider
    row: 76
    col: 0
    width: 72
    height: 12
    tab_name: ''
  - title: Azure Billed Cost by Worker Pool (Available Exports)
    name: Azure Billed Cost by Worker Pool
    model: fxci
    explore: azure_billing
    type: looker_grid
    fields:
    - azure_billing.worker_pool_id
    - azure_billing.subscription_name
    - azure_billing.billing_currency
    - azure_billing.billed_cost
    sorts:
    - azure_billing.billed_cost desc
    limit: 500
    note_display: above
    note_state: expanded
    note_text: Uses both worker-pool-id and worker_pool_id tags. Untagged charges remain visible. This
      table has the same source coverage as the billed-cost table above.
    listen:
      Submission Date: azure_billing.usage_date
      Cloud Provider: azure_billing.cloud_provider
    row: 88
    col: 0
    width: 72
    height: 12
    tab_name: ''
  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: fxci
    explore: tasks
    listens_to_filters: []
    field: task_runs.submission_date
  - name: Cloud Provider
    title: Cloud Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options:
      - azure
      - gcp
    model: fxci
    explore: tasks
    listens_to_filters: []
    field: task_run_costs.cloud_provider
