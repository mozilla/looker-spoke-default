- dashboard: experiment_analysis_errors
  title: Experiment Analysis Errors
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: All Analysis Errors
    name: All Analysis Errors
    model: experimentation
    explore: logs
    type: looker_grid
    fields: [logs.timestamp_time, logs.experiment, logs.exception_type, logs.message]
    sorts: [logs.timestamp_time desc]
    limit: 500
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
    series_types: {}
    listen:
      Experiment: logs.experiment
      Timestamp Date: logs.timestamp_date
    row: 3
    col: 0
    width: 24
    height: 9
  - title: Errors by Type
    name: Errors by Type
    model: experimentation
    explore: logs
    type: looker_column
    fields: [logs.timestamp_date, count, logs.exception_type]
    pivots: [logs.exception_type]
    fill_fields: [logs.timestamp_date]
    sorts: [logs.timestamp_date desc, logs.exception_type]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Count, value_format: !!null '',
        value_format_name: !!null '', based_on: logs.message, _kind_hint: measure,
        measure: count, type: count_distinct, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
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
    y_axes: [{label: Total, orientation: left, series: [{axisId: count, id: BadRequest
              - count, name: BadRequest}, {axisId: count, id: CancelledError - count,
            name: CancelledError}, {axisId: count, id: EndedException - count, name: EndedException},
          {axisId: count, id: EnrollmentLongerThanAnalysisException - count, name: EnrollmentLongerThanAnalysisException},
          {axisId: count, id: Exception - count, name: Exception}, {axisId: count,
            id: ExplicitSkipException - count, name: ExplicitSkipException}, {axisId: count,
            id: Forbidden - count, name: Forbidden}, {axisId: count, id: GitCommandError
              - count, name: GitCommandError}, {axisId: count, id: HighPopulationException
              - count, name: HighPopulationException}, {axisId: count, id: KilledWorker
              - count, name: KilledWorker}, {axisId: count, id: NoEnrollmentPeriodException
              - count, name: NoEnrollmentPeriodException}, {axisId: count, id: NoSlugException
              - count, name: NoSlugException}, {axisId: count, id: NoStartDateException
              - count, name: NoStartDateException}, {axisId: count, id: PreconditionFailed
              - count, name: PreconditionFailed}, {axisId: count, id: RuntimeError
              - count, name: RuntimeError}, {axisId: count, id: TypeError - count,
            name: TypeError}, {axisId: count, id: ValueError - count, name: ValueError},
          {axisId: count, id: logs.exception_type___null - count, name: "∅"}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      Experiment: logs.experiment
      Timestamp Date: logs.timestamp_date
    row: 12
    col: 0
    width: 24
    height: 9
  - title: Warnings
    name: Warnings
    model: experimentation
    explore: logs
    type: single_value
    fields: [warning_count]
    filters:
      logs.log_level: ERROR,WARNING
      logs.exception_type: EndedException,NoEnrollmentPeriodException,HighPopulationException,EnrollmentLongerThanAnalysisException,ExplicitSkipException,NoStartDateException,null
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Count, value_format: !!null '',
        value_format_name: !!null '', based_on: logs.exception_type, _kind_hint: measure,
        measure: count, type: count_distinct, _type_hint: number}, {category: table_calculation,
        expression: 'count(${logs.timestamp_date})', label: Total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: total,
        _type_hint: number, is_disabled: true}, {measure: count_of_timestamp_date,
        based_on: logs.timestamp_date, expression: '', label: Count of Timestamp Date,
        type: count_distinct, _kind_hint: measure, _type_hint: number}, {category: measure,
        expression: '', label: Warning Count, based_on: logs.timestamp_time, _kind_hint: measure,
        measure: warning_count, type: count_distinct, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
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
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      Experiment: logs.experiment
      Timestamp Date: logs.timestamp_date
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Overall Critical Errors
    name: Overall Critical Errors
    model: experimentation
    explore: logs
    type: single_value
    fields: [error_count]
    filters:
      logs.exception_type: "-EndedException,-NoEnrollmentPeriodException,-HighPopulationException,-EnrollmentLongerThanAnalysisException,-ExplicitSkipException,-NoStartDateException"
      logs.log_level: ERROR
      logs.message: "-%Error while computing statistic%"
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Count, value_format: !!null '',
        value_format_name: !!null '', based_on: logs.message, _kind_hint: measure,
        measure: count, type: count_distinct, _type_hint: number}, {measure: count_of_timestamp_date,
        based_on: logs.timestamp_date, expression: '', label: Count of Timestamp Date,
        type: count_distinct, _kind_hint: measure, _type_hint: number}, {category: measure,
        expression: '', label: Error Count, based_on: logs.timestamp_time, _kind_hint: measure,
        measure: error_count, type: count_distinct, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#b2e0b4",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
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
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      Experiment: logs.experiment
      Timestamp Date: logs.timestamp_date
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Critical Errors Last 3 days
    name: Critical Errors Last 3 days
    model: experimentation
    explore: logs
    type: single_value
    fields: [error_count]
    filters:
      logs.timestamp_date: 3 days
      logs.exception_type: "-EndedException,-NoEnrollmentPeriodException,-HighPopulationException,-EnrollmentLongerThanAnalysisException,-ExplicitSkipException,-NoStartDateException"
      logs.log_level: ERROR
      logs.message: "-%Error while computing statistic%"
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Error Count, based_on: logs.timestamp_time,
        _kind_hint: measure, measure: error_count, type: count_distinct, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    listen:
      Experiment: logs.experiment
    row: 0
    col: 8
    width: 8
    height: 3
  filters:
  - name: Experiment
    title: Experiment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: logs
    listens_to_filters: []
    field: logs.experiment
  - name: Timestamp Date
    title: Timestamp Date
    type: field_filter
    default_value: 14 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: experimentation
    explore: logs
    listens_to_filters: []
    field: logs.timestamp_date
