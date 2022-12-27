- dashboard: opmon_preview
  title: OpMon Preview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: C3YIW6C128E8PwSfoD91nH
  elements:
  - title: OpMon Preview
    name: OpMon Preview
    model: operational_monitoring
    explore: preview
    type: ci-line-chart
    fields: [preview.submission_date, preview.branch, preview.upper, preview.point,
      preview.lower]
    pivots: [preview.branch]
    fill_fields: [preview.submission_date]
    filters: {}
    sorts: [preview.submission_date desc, preview.branch]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    field_x: preview.submission_date
    field_y: preview.point
    ci_lower: preview.lower
    ci_upper: preview.upper
    NONE: "#3FE1B0"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 0
    series_types: {}
    listen:
      Table: preview.table
      Submission Date: preview.submission_date
      Metric: preview.metric
      Statistic: preview.statistic
    row: 0
    col: 0
    width: 15
    height: 10
  filters:
  - name: Table
    title: Table
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: operational_monitoring
    explore: preview
    listens_to_filters: []
    field: preview.table
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: operational_monitoring
    explore: preview
    listens_to_filters: []
    field: preview.submission_date
  - name: Metric
    title: Metric
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: operational_monitoring
    explore: preview
    listens_to_filters: []
    field: preview.metric
  - name: Statistic
    title: Statistic
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: operational_monitoring
    explore: preview
    listens_to_filters: [Metric]
    field: preview.statistic
