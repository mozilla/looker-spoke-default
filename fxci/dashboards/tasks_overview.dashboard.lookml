---
- dashboard: fxci_tasks_overview
  title: Firefox-CI Tasks Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bLjcaW5TZ0ae4BYp0QoIdK
  elements:
  - title: Tasks By Worker Pool
    name: Tasks By Worker Pool
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [tasks.task_queue_id, num_task_runs]
    filters:
      tasks.submission_date: 6 months
    sorts: [num_task_runs desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Num Task Runs
      value_format:
      value_format_name:
      based_on: task_runs.key
      _kind_hint: measure
      measure: num_task_runs
      type: count_distinct
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Submission Date: task_runs.submission_date
    row: 6
    col: 0
    width: 12
    height: 8
  - title: Total Tasks
    name: Total Tasks
    model: fxci
    explore: tasks
    type: single_value
    fields: [num_tasks]
    filters: {}
    sorts: [num_tasks desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Num Tasks
      value_format:
      value_format_name:
      based_on: task_runs.key
      _kind_hint: measure
      measure: num_tasks
      type: count_distinct
      _type_hint: number
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
    hidden_pivots: {}
    listen:
      Submission Date: task_runs.submission_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Tasks By Trust Domain
    name: Tasks By Trust Domain
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [num_tasks, tasks.tags__trust_domain]
    filters:
      tasks.submission_date: 6 months
    sorts: [num_tasks desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Num Tasks
      value_format:
      value_format_name:
      based_on: task_runs.key
      _kind_hint: measure
      measure: num_tasks
      type: count_distinct
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    listen:
      Submission Date: task_runs.submission_date
    row: 14
    col: 0
    width: 12
    height: 8
  - title: Tasks By Kind
    name: Tasks By Kind
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [num_tasks, tasks.tags__trust_domain, tasks.tags__kind]
    filters:
      tasks.submission_date: 6 months
    sorts: [num_tasks desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Num Tasks
      value_format:
      value_format_name:
      based_on: task_runs.key
      _kind_hint: measure
      measure: num_tasks
      type: count_distinct
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Submission Date: task_runs.submission_date
    row: 22
    col: 0
    width: 12
    height: 8
  - title: Average Duration (Minutes)
    name: Average Duration (Minutes)
    model: fxci
    explore: tasks
    type: single_value
    fields: [average_duration]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: diff_minutes(${task_runs.started_date}, ${task_runs.resolved_date})
      label: Duration
      value_format:
      value_format_name: decimal_2
      dimension: duration
      _kind_hint: dimension
      _type_hint: number
    - category: measure
      expression:
      label: Average Duration
      value_format:
      value_format_name: decimal_1
      based_on: duration
      _kind_hint: measure
      measure: average_duration
      type: average
      _type_hint: number
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
    col: 8
    width: 8
    height: 6
  - title: Total Cost (USD)
    name: Total Cost (USD)
    model: fxci
    explore: tasks
    type: single_value
    fields: [sum_of_run_cost]
    filters:
      task_run_costs.submission_date: 6 months
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Run Cost
      value_format:
      value_format_name: decimal_2
      based_on: task_run_costs.run_cost
      _kind_hint: measure
      measure: sum_of_run_cost
      type: sum
      _type_hint: number
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
    note_text: All costs exclude worker overhead such as idle, setup and teardown
      time.
    listen:
      Submission Date: task_runs.submission_date
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Cost By Kind
    name: Cost By Kind
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [tasks.tags__trust_domain, tasks.tags__kind, sum_of_run_cost]
    filters:
      tasks.submission_date: 6 months
      task_run_costs.submission_date: 6 months
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Run Cost
      value_format:
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      _kind_hint: measure
      measure: sum_of_run_cost
      type: sum
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Submission Date: task_runs.submission_date
    row: 22
    col: 12
    width: 12
    height: 8
  - title: Cost By Trust Domain
    name: Cost By Trust Domain
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [sum_of_run_cost, tasks.tags__trust_domain]
    filters:
      tasks.submission_date: 6 months
      task_run_costs.submission_date: 6 months
    sorts: [sum_of_run_cost desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Sum of Run Cost
      value_format:
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      _kind_hint: measure
      measure: sum_of_run_cost
      type: sum
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    listen:
      Submission Date: task_runs.submission_date
    row: 14
    col: 12
    width: 12
    height: 8
  - title: Costs By Worker Pool
    name: Costs By Worker Pool
    model: fxci
    explore: tasks
    type: looker_grid
    fields: [tasks.task_queue_id, sum_of_run_cost]
    filters:
      tasks.submission_date: 6 months
      task_run_costs.submission_date: 6 months
    sorts: [sum_of_run_cost desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Num Task Runs
      value_format:
      value_format_name:
      based_on: task_runs.key
      _kind_hint: measure
      measure: num_task_runs
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Sum of Run Cost
      value_format:
      value_format_name: decimal_0
      based_on: task_run_costs.run_cost
      _kind_hint: measure
      measure: sum_of_run_cost
      type: sum
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    listen:
      Submission Date: task_runs.submission_date
    row: 6
    col: 12
    width: 12
    height: 8
  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 2025/01/24 to 2025/01/25
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
