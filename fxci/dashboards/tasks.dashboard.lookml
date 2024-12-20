- name: Firefox-CI Tasks
  title: Untitled Visualization
  model: fxci
  explore: tasks
  type: looker_grid
  fields: [task_runs.resolved_month, num_task_runs]
  fill_fields: [task_runs.resolved_month]
  filters:
    task_runs.submission_date: 3 months
  sorts: [task_runs.resolved_month desc]
  limit: 500
  column_limit: 50
  dynamic_fields:
  - category: dimension
    expression: concat(${task_runs.task_id}, "-", ${task_runs.run_id})
    label: Key
    value_format:
    value_format_name:
    dimension: key
    _kind_hint: dimension
    _type_hint: string
  - category: measure
    expression:
    label: Num Task Runs
    value_format:
    value_format_name:
    based_on: key
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
  hidden_pivots: {}
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
  show_null_points: true
  interpolation: linear
  defaults_version: 1
