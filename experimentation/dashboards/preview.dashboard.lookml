- dashboard: jetstream_preview
  title: Jetstream Preview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oK2Z3DwFbGeEggCSuFJTFy
  elements:
  - title: Jetstream Preview
    name: Jetstream Preview
    model: experimentation
    explore: preview
    type: ci-line-chart
    fields: [preview.point, preview.window_index, preview.branch, preview.lower, preview.upper]
    pivots: [preview.branch]
    sorts: [preview.branch, preview.point desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: upper, _type_hint: number}, {category: table_calculation,
        expression: "${preview.point}-${preview.lower}", label: Lower, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: lower,
        _type_hint: number}]
    hidden_fields: [preview.lower, preview.upper]
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    field_x: preview.window_index
    field_y: preview.point
    log_scale: false
    ci_lower: lower
    ci_upper: upper
    show_grid: false
    control: "#3FE1B0"
    treatment-a: "#0060E0"
    series_types: {}
    defaults_version: 0
    listen:
      Analysis Basis: preview.analysis_basis
      Metric: preview.metric
      Parameter: preview.parameter
      Segment: preview.segment
      Analysis Period: preview.analysis_period
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 2
    col: 0
    width: 24
    height: 9
  - title: Raw results data
    name: Raw results data
    model: experimentation
    explore: preview
    type: looker_grid
    fields: [preview.lower, preview.point, preview.upper, preview.window_index, preview.branch,
      preview.metric, preview.parameter, preview.segment, preview.statistic, preview.comparison,
      preview.ci_width, preview.analysis_basis]
    sorts: [preview.upper desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper Limit, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: upper_limit, _type_hint: number},
      {category: table_calculation, expression: "${preview.point}-${preview.lower}",
        label: Lower Limit, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: lower_limit, _type_hint: number}]
    show_view_names: true
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
    hidden_fields: [preview.lower, preview.upper]
    hidden_points_if_no: []
    series_labels: {}
    field_x: preview.window_index
    field_y: preview.point
    ci_lower: preview.lower
    ci_upper: preview.upper
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Analysis Basis: preview.analysis_basis
      Parameter: preview.parameter
      Metric: preview.metric
      Analysis Period: preview.analysis_period
      Segment: preview.segment
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 11
    col: 0
    width: 24
    height: 8
  - title: New Tile
    name: New Tile
    model: experimentation
    explore: preview
    type: single_value
    fields: [experimenter_experiments.start_date]
    fill_fields: [experimenter_experiments.start_date]
    sorts: [experimenter_experiments.start_date desc]
    limit: 1
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: upper, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${preview.point}-${preview.lower}", label: Lower, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: lower,
        _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Start Date
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    field_x: preview.window_index
    field_y: preview.point
    log_scale: false
    ci_lower: lower
    ci_upper: upper
    show_grid: false
    control: "#3FE1B0"
    treatment-a: "#0060E0"
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Analysis Basis: preview.analysis_basis
      Parameter: preview.parameter
      Metric: preview.metric
      Analysis Period: preview.analysis_period
      Segment: preview.segment
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 0
    col: 0
    width: 5
    height: 2
  - title: Status
    name: Status
    model: experimentation
    explore: preview
    type: single_value
    fields: [experimenter_experiments.status]
    sorts: [experimenter_experiments.status]
    limit: 1
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: upper, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${preview.point}-${preview.lower}", label: Lower, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: lower,
        _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Status
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    field_x: preview.window_index
    field_y: preview.point
    log_scale: false
    ci_lower: lower
    ci_upper: upper
    show_grid: false
    control: "#3FE1B0"
    treatment-a: "#0060E0"
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Analysis Basis: preview.analysis_basis
      Parameter: preview.parameter
      Metric: preview.metric
      Analysis Period: preview.analysis_period
      Segment: preview.segment
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 0
    col: 5
    width: 5
    height: 2
  - title: End Date
    name: End Date
    model: experimentation
    explore: preview
    type: single_value
    fields: [experimenter_experiments.end_date]
    fill_fields: [experimenter_experiments.end_date]
    sorts: [experimenter_experiments.end_date desc]
    limit: 1
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: upper, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${preview.point}-${preview.lower}", label: Lower, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: lower,
        _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: End Date
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    field_x: preview.window_index
    field_y: preview.point
    log_scale: false
    ci_lower: lower
    ci_upper: upper
    show_grid: false
    control: "#3FE1B0"
    treatment-a: "#0060E0"
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Analysis Basis: preview.analysis_basis
      Parameter: preview.parameter
      Metric: preview.metric
      Analysis Period: preview.analysis_period
      Segment: preview.segment
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 0
    col: 10
    width: 5
    height: 2
  - title: Enrollment End Date
    name: Enrollment End Date
    model: experimentation
    explore: preview
    type: single_value
    fields: [experimenter_experiments.enrollment_end_date]
    fill_fields: [experimenter_experiments.enrollment_end_date]
    sorts: [experimenter_experiments.enrollment_end_date desc]
    limit: 1
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${preview.point}+${preview.upper}",
        label: Upper, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: upper, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${preview.point}-${preview.lower}", label: Lower, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: lower,
        _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Enrollment End Date
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    field_x: preview.window_index
    field_y: preview.point
    log_scale: false
    ci_lower: lower
    ci_upper: upper
    show_grid: false
    control: "#3FE1B0"
    treatment-a: "#0060E0"
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Analysis Basis: preview.analysis_basis
      Parameter: preview.parameter
      Metric: preview.metric
      Analysis Period: preview.analysis_period
      Segment: preview.segment
      Statistic: preview.statistic
      Project: preview.project
      Dataset: preview.dataset
      Comparison: preview.comparison
      Slug: preview.slug
    row: 0
    col: 15
    width: 5
    height: 2
  - title: Logs
    name: Logs
    model: experimentation
    explore: preview_logs
    type: looker_grid
    fields: [preview_logs.analysis_basis, preview_logs.exception, preview_logs.filename,
      preview_logs.func_name, preview_logs.message, preview_logs.metric, preview_logs.segment,
      preview_logs.statistic, preview_logs.timestamp]
    filters:
      preview_logs.dataset: tmp
      preview_logs.project: mozdata
      preview_logs.log_level: "-INFO"
    sorts: [preview_logs.timestamp desc]
    limit: 500
    column_limit: 50
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
    series_types: {}
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", preview_logs.timestamp, preview_logs.experiment,
      preview_logs.analysis_basis, preview_logs.exception, preview_logs.exception_type,
      preview_logs.filename, preview_logs.func_name, preview_logs.log_level, preview_logs.message,
      preview_logs.metric, preview_logs.normalized_slug, preview_logs.segment, preview_logs.statistic]
    listen:
      Slug: preview_logs.slug
    row: 19
    col: 0
    width: 24
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: experimentation
    explore: preview_logs
    type: single_value
    fields: [query_cost, preview_logs.experiment]
    filters:
      preview_logs.dataset: tmp
      preview_logs.project: mozdata
      preview_logs.log_level: INFO
      preview_logs.message: "%query cost%"
    sorts: [query_cost desc]
    limit: 400
    column_limit: 50
    dynamic_fields: [{category: measure, expression: !!null '', label: Query Cost,
        value_format: !!null '', value_format_name: decimal_3, based_on: preview_logs.cost,
        _kind_hint: measure, measure: query_cost, type: sum, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Query Cost ($)
    value_format: ''
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    series_types: {}
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", preview_logs.timestamp, preview_logs.experiment,
      preview_logs.analysis_basis, preview_logs.exception, preview_logs.exception_type,
      preview_logs.filename, preview_logs.func_name, preview_logs.log_level, preview_logs.message,
      preview_logs.metric, preview_logs.normalized_slug, preview_logs.segment, preview_logs.statistic]
    hidden_pivots: {}
    listen:
      Slug: preview_logs.slug
    row: 0
    col: 20
    width: 4
    height: 2
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: mozdata
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.project
  - name: Parameter
    title: Parameter
    type: field_filter
    default_value: 'null'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.parameter
  - name: Slug
    title: Slug
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.slug
  - name: Dataset
    title: Dataset
    type: field_filter
    default_value: tmp
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.dataset
  - name: Analysis Period
    title: Analysis Period
    type: field_filter
    default_value: daily
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.analysis_period
  - name: Analysis Basis
    title: Analysis Basis
    type: field_filter
    default_value: enrollments
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - enrollments
      - exposures
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.analysis_basis
  - name: Metric
    title: Metric
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: experimentation
    explore: preview
    listens_to_filters: [Statistic, Project, Analysis Period, Dataset, Slug]
    field: preview.metric
  - name: Statistic
    title: Statistic
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: [Metric, Project, Dataset, Slug]
    field: preview.statistic
  - name: Segment
    title: Segment
    type: field_filter
    default_value: all
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: [Analysis Period]
    field: preview.segment
  - name: Comparison
    title: Comparison
    type: field_filter
    default_value: 'NULL'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: preview
    listens_to_filters: []
    field: preview.comparison
