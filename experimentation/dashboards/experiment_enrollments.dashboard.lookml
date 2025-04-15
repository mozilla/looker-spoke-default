---
- dashboard: experiment_enrollments
  title: Experiment Enrollments
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: tvepcCRz7lG1J7fpxvCMzp
  elements:
  - title: Daily Active Population by Branch
    name: Daily Active Population by Branch
    model: experimentation
    explore: experiment_enrollment_daily_active_population
    type: looker_line
    fields: [experiment_enrollment_daily_active_population.branch, experiment_enrollment_daily_active_population.time_time,
      experiment_enrollment_daily_active_population.Total]
    pivots: [experiment_enrollment_daily_active_population.branch]
    filters: {}
    sorts: [experiment_enrollment_daily_active_population.time_time desc, experiment_enrollment_daily_active_population.branch]
    limit: 500
    column_limit: 5000
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_daily_active_population.Total,
            id: control - experiment_enrollment_daily_active_population.Total, name: control}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Updated daily
    listen:
      Time Range [UTC]: experiment_enrollment_daily_active_population.time_time
      Experiment: experiment_enrollment_daily_active_population.experiment
    row: 10
    col: 12
    width: 12
    height: 8
  - title: Daily Active Population
    name: Daily Active Population
    model: experimentation
    explore: experiment_enrollment_daily_active_population
    type: looker_line
    fields: [experiment_enrollment_daily_active_population.Total, experiment_enrollment_daily_active_population.time_time]
    filters: {}
    sorts: [experiment_enrollment_daily_active_population.time_time desc]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    x_axis_label: Time [UTC]
    defaults_version: 1
    y_axes: []
    note_state: expanded
    note_display: above
    note_text: Updated daily
    listen:
      Time Range [UTC]: experiment_enrollment_daily_active_population.time_time
      Experiment: experiment_enrollment_daily_active_population.experiment
    row: 10
    col: 0
    width: 12
    height: 8
  - title: Cumulative Population Estimate
    name: Cumulative Population Estimate
    model: experimentation
    explore: experiment_enrollment_cumulative_population_estimate
    type: looker_line
    fields: [experiment_enrollment_cumulative_population_estimate.Total, experiment_enrollment_cumulative_population_estimate.time_time]
    filters: {}
    sorts: [experiment_enrollment_cumulative_population_estimate.time_time desc]
    limit: 5000
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    x_axis_label: Time [UTC]
    defaults_version: 1
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_cumulative_population_estimate.timeframe
      Experiment: experiment_enrollment_cumulative_population_estimate.experiment
    row: 18
    col: 0
    width: 12
    height: 7
  - title: Cumulative Population Estimate by Branch
    name: Cumulative Population Estimate by Branch
    model: experimentation
    explore: experiment_enrollment_cumulative_population_estimate
    type: looker_line
    fields: [experiment_enrollment_cumulative_population_estimate.time_time, experiment_enrollment_cumulative_population_estimate.branch,
      experiment_enrollment_cumulative_population_estimate.Total]
    pivots: [experiment_enrollment_cumulative_population_estimate.branch]
    filters: {}
    sorts: [experiment_enrollment_cumulative_population_estimate.time_time desc, experiment_enrollment_cumulative_population_estimate.branch]
    limit: 5000
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_cumulative_population_estimate.Total,
            id: control - experiment_enrollment_cumulative_population_estimate.Total,
            name: control}, {axisId: experiment_enrollment_cumulative_population_estimate.Total,
            id: treatment-admarketplace - experiment_enrollment_cumulative_population_estimate.Total,
            name: treatment-admarketplace}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_cumulative_population_estimate.timeframe
      Experiment: experiment_enrollment_cumulative_population_estimate.experiment
    row: 18
    col: 12
    width: 12
    height: 7
  - title: Unenrollment Overall
    name: Unenrollment Overall
    model: experimentation
    explore: experiment_unenrollment_overall
    type: looker_column
    fields: [experiment_unenrollment_overall.timestamp, experiment_unenrollment_overall.Total]
    filters: {}
    sorts: [experiment_unenrollment_overall.timestamp desc]
    limit: 5000
    column_limit: 50
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Time [UTC]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_unenrollment_overall.timeframe
      Experiment: experiment_unenrollment_overall.experiment
    row: 39
    col: 0
    width: 12
    height: 7
  - title: Unenrollment Overall by Branch
    name: Unenrollment Overall by Branch
    model: experimentation
    explore: experiment_unenrollment_overall
    type: looker_line
    fields: [experiment_unenrollment_overall.timestamp, experiment_unenrollment_overall.Total,
      experiment_unenrollment_overall.branch]
    pivots: [experiment_unenrollment_overall.branch]
    filters: {}
    sorts: [experiment_unenrollment_overall.timestamp desc, experiment_unenrollment_overall.branch]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: control - experiment_unenrollment_overall.Total,
            id: control - experiment_unenrollment_overall.Total, name: control}, {
            axisId: treatment-admarketplace-12 - experiment_unenrollment_overall.Total,
            id: treatment-admarketplace-12 - experiment_unenrollment_overall.Total,
            name: treatment-admarketplace-12}, {axisId: treatment-admarketplace-78
              - experiment_unenrollment_overall.Total, id: treatment-admarketplace-78
              - experiment_unenrollment_overall.Total, name: treatment-admarketplace-78}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_unenrollment_overall.timeframe
      Experiment: experiment_unenrollment_overall.experiment
    row: 39
    col: 12
    width: 12
    height: 7
  - title: Enrollment Overall
    name: Enrollment Overall
    model: experimentation
    explore: experiment_enrollment_overall
    type: looker_column
    fields: [experiment_enrollment_overall.timestamp, experiment_enrollment_overall.Total]
    filters: {}
    sorts: [experiment_enrollment_overall.timestamp desc]
    limit: 5000
    column_limit: 50
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
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_overall.Total,
            id: experiment_enrollment_overall.Total, name: Total}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_overall.timeframe
      Experiment: experiment_enrollment_overall.experiment
    row: 32
    col: 0
    width: 12
    height: 7
  - title: Enrollment Overall by Branch
    name: Enrollment Overall by Branch
    model: experimentation
    explore: experiment_enrollment_overall
    type: looker_line
    fields: [experiment_enrollment_overall.timestamp, experiment_enrollment_overall.Total,
      experiment_enrollment_overall.branch]
    pivots: [experiment_enrollment_overall.branch]
    filters: {}
    sorts: [experiment_enrollment_overall.timestamp desc, experiment_enrollment_overall.branch]
    limit: 5000
    column_limit: 50
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
    show_null_points: true
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_overall.Total,
            id: experiment_enrollment_overall.Total, name: Total}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time [UTC]
    hidden_series: [fission-disabled - experiment_enrollment_overall.Total]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_overall.timeframe
      Experiment: experiment_enrollment_overall.experiment
    row: 32
    col: 12
    width: 12
    height: 7
  - title: 'Other Events Overall '
    name: 'Other Events Overall '
    model: experimentation
    explore: experiment_enrollment_other_events_overall
    type: looker_column
    fields: [experiment_enrollment_other_events_overall.Total, experiment_enrollment_other_events_overall.timestamp,
      experiment_enrollment_other_events_overall.event]
    pivots: [experiment_enrollment_other_events_overall.event]
    filters: {}
    sorts: [experiment_enrollment_other_events_overall.timestamp desc, experiment_enrollment_other_events_overall.event]
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
    stacking: normal
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
    x_axis_label: Time [UTC]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_other_events_overall.timeframe
      Experiment: experiment_enrollment_other_events_overall.experiment
    row: 46
    col: 0
    width: 12
    height: 7
  - title: Other Events Overall by Branch
    name: Other Events Overall by Branch
    model: experimentation
    explore: experiment_enrollment_other_events_overall
    type: looker_column
    fields: [experiment_enrollment_other_events_overall.Total, experiment_enrollment_other_events_overall.timestamp,
      branch_event]
    pivots: [branch_event]
    filters: {}
    sorts: [experiment_enrollment_other_events_overall.timestamp desc, branch_event]
    dynamic_fields:
    - category: dimension
      expression: concat(${experiment_enrollment_other_events_overall.branch}," -
        ", ${experiment_enrollment_other_events_overall.event})
      label: Branch + Event
      value_format:
      value_format_name:
      dimension: branch_event
      _kind_hint: dimension
      _type_hint: string
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
    stacking: normal
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
    x_axis_label: Time [UTC]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Updated every 10 minutes
    listen:
      Time Range [UTC]: experiment_enrollment_other_events_overall.timeframe
      Experiment: experiment_enrollment_other_events_overall.experiment
    row: 46
    col: 12
    width: 12
    height: 7
  - title: Unenrollment Reasons
    name: Unenrollment Reasons
    model: experimentation
    explore: unenrollment_reasons
    type: looker_grid
    fields: [events.reason, events.event_method, events.event_count]
    filters:
      events.sample_id: '0'
    sorts: [events.event_count desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: "${events.event_count} * 100"
      label: Approximate Event Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: approx_count
      _type_hint: number
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
    y_axes: []
    note_state: expanded
    note_display: above
    note_text: Event counts are *approximate* due to sampling (1% sample).
    listen:
      Time Range [UTC]: events.submission_date
      Experiment: events.event_string_value
    row: 53
    col: 0
    width: 24
    height: 6
  - title: Enrollment Status
    name: Enrollment Status
    model: experimentation
    explore: enrollment_status
    type: single_value
    fields: [enrollment_status.message, enrollment_status.experiment]
    sorts: [enrollment_status.message]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [enrollment_status.experiment]
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
    y_axes: []
    listen:
      Experiment: enrollment_status.experiment
    row: 0
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: experimentation
    explore: sample_ratio_mismatch
    type: single_value
    fields: [sample_ratio_mismatch.message, sample_ratio_mismatch.p_value]
    filters:
      sample_ratio_mismatch.metric: enrollments
    sorts: [sample_ratio_mismatch.message]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Enrollments
    comparison_label: "(P-Value)"
    conditional_formatting: [{type: greater than, value: 0.01, background_color: "#7de08a",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      Experiment: sample_ratio_mismatch.experiment
    row: 2
    col: 0
    width: 8
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: experimentation
    explore: sample_ratio_mismatch
    type: single_value
    fields: [sample_ratio_mismatch.message, sample_ratio_mismatch.p_value]
    filters:
      sample_ratio_mismatch.metric: unenrollments
    sorts: [sample_ratio_mismatch.message]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Unenrollments
    comparison_label: "(P-Value)"
    conditional_formatting: [{type: greater than, value: 0.01, background_color: "#7de08a",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      Experiment: sample_ratio_mismatch.experiment
    row: 2
    col: 8
    width: 8
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: experimentation
    explore: sample_ratio_mismatch
    type: single_value
    fields: [sample_ratio_mismatch.message, sample_ratio_mismatch.p_value]
    filters:
      sample_ratio_mismatch.metric: daily^_active^_clients
    sorts: [sample_ratio_mismatch.message]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Daily Active Clients
    comparison_label: "(P-Value)"
    conditional_formatting: [{type: greater than, value: 0.01, background_color: "#7de08a",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    defaults_version: 1
    y_axes: []
    listen:
      Experiment: sample_ratio_mismatch.experiment
    row: 2
    col: 16
    width: 8
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: More information about errors encountered during the analysis is available
      on the [Experiment Analysis Error dashboard](https://mozilla.cloud.looker.com/dashboards-next/246)
    row: 6
    col: 8
    width: 16
    height: 2
  - name: Population
    type: text
    title_text: Population
    subtitle_text: ''
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - name: Analysis Errors
    type: text
    title_text: Analysis Errors
    subtitle_text: ''
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 2
  - title: Analysis Errors (last 3 days)
    name: Analysis Errors (last 3 days)
    model: experimentation
    explore: logs
    type: single_value
    fields: [error_count]
    filters:
      logs.timestamp_date: 3 days
      logs.exception_type: "-EndedException,-NoEnrollmentPeriodException,-HighPopulationException,-EnrollmentLongerThanAnalysisException,-ExplicitSkipException,-NoStartDateException,-EnrollmentNotCompleteException"
      logs.log_level: ERROR
      logs.message: "-%Error while computing statistic%"
    limit: 500
    dynamic_fields:
    - category: measure
      expression: ''
      label: Error Count
      based_on: logs.timestamp_time
      _kind_hint: measure
      measure: error_count
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
    y_axes: []
    listen:
      Experiment: logs.experiment
    row: 6
    col: 0
    width: 8
    height: 2
  - title: Daily Enrollments by Branch
    name: Daily Enrollments by Branch
    model: experimentation
    explore: experiment_enrollment_overall
    type: looker_line
    fields: [experiment_enrollment_overall.Total, experiment_enrollment_overall.branch,
      experiment_enrollment_overall.time_date]
    pivots: [experiment_enrollment_overall.branch]
    fill_fields: [experiment_enrollment_overall.time_date]
    filters: {}
    sorts: [experiment_enrollment_overall.branch, experiment_enrollment_overall.time_date
        desc]
    limit: 5000
    column_limit: 50
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
    show_null_points: false
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_overall.Total,
            id: experiment_enrollment_overall.Total, name: Total}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time [UTC]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [fission-disabled - experiment_enrollment_overall.Total]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Updated daily
    listen:
      Time Range [UTC]: experiment_enrollment_overall.timeframe
      Experiment: experiment_enrollment_overall.experiment
    row: 25
    col: 12
    width: 12
    height: 7
  - title: Daily Enrollments
    name: Daily Enrollments
    model: experimentation
    explore: experiment_enrollment_overall
    type: looker_column
    fields: [experiment_enrollment_overall.Total, experiment_enrollment_overall.time_date]
    fill_fields: [experiment_enrollment_overall.time_date]
    filters: {}
    sorts: [experiment_enrollment_overall.time_date desc]
    limit: 5000
    column_limit: 50
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
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_enrollment_overall.Total,
            id: experiment_enrollment_overall.Total, name: Total}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Updated daily
    listen:
      Time Range [UTC]: experiment_enrollment_overall.timeframe
      Experiment: experiment_enrollment_overall.experiment
    row: 25
    col: 0
    width: 12
    height: 7
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Crash Counts"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 82
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Search Metrics"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 59
    col: 0
    width: 24
    height: 2
  - title: Search Count by Branch
    name: Search Count by Branch
    model: experimentation
    explore: experiment_search_aggregates_live
    type: looker_line
    fields: [experiment_search_aggregates_live.timestamp, experiment_search_aggregates_live.total_search_count,
      experiment_search_aggregates_live.branch]
    pivots: [experiment_search_aggregates_live.branch]
    filters: {}
    sorts: [experiment_search_aggregates_live.timestamp desc, experiment_search_aggregates_live.branch]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_search_aggregates_live.total_search_count,
            id: experiment_search_aggregates_live.total_search_count, name: Total
              Search Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_search_aggregates_live.timeframe
      Experiment: experiment_search_aggregates_live.experiment
    row: 61
    col: 0
    width: 12
    height: 7
  - title: Ad Clicks by Branch
    name: Ad Clicks by Branch
    model: experimentation
    explore: experiment_search_aggregates_live
    type: looker_line
    fields: [experiment_search_aggregates_live.timestamp, experiment_search_aggregates_live.branch,
      experiment_search_aggregates_live.total_ad_clicks]
    pivots: [experiment_search_aggregates_live.branch]
    filters: {}
    sorts: [experiment_search_aggregates_live.timestamp desc, experiment_search_aggregates_live.branch]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_search_aggregates_live.total_search_count,
            id: experiment_search_aggregates_live.total_search_count, name: Total
              Search Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_search_aggregates_live.timeframe
      Experiment: experiment_search_aggregates_live.experiment
    row: 68
    col: 0
    width: 12
    height: 7
  - title: Search Count with Ads by Branch
    name: Search Count with Ads by Branch
    model: experimentation
    explore: experiment_search_aggregates_live
    type: looker_line
    fields: [experiment_search_aggregates_live.timestamp, experiment_search_aggregates_live.branch,
      experiment_search_aggregates_live.total_searches_with_ads]
    pivots: [experiment_search_aggregates_live.branch]
    filters: {}
    sorts: [experiment_search_aggregates_live.branch, experiment_search_aggregates_live.timestamp
        desc]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: step
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_search_aggregates_live.total_search_count,
            id: experiment_search_aggregates_live.total_search_count, name: Total
              Search Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_search_aggregates_live.timeframe
      Experiment: experiment_search_aggregates_live.experiment
    row: 75
    col: 0
    width: 12
    height: 7
  - title: Cumulative Search Count by Branch
    name: Cumulative Search Count by Branch
    model: experimentation
    explore: experiment_cumulative_search_count
    type: looker_line
    fields: [experiment_cumulative_search_count.Total, experiment_cumulative_search_count.branch,
      experiment_cumulative_search_count.time_time]
    pivots: [experiment_cumulative_search_count.branch]
    filters: {}
    sorts: [experiment_cumulative_search_count.time_time desc, experiment_cumulative_search_count.branch]
    limit: 500
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_cumulative_search_count.Total,
            id: debugging-disabled - experiment_cumulative_search_count.Total, name: debugging-disabled},
          {axisId: experiment_cumulative_search_count.Total, id: debugging-enabled
              - experiment_cumulative_search_count.Total, name: debugging-enabled}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_cumulative_search_count.timeframe
      Experiment: experiment_cumulative_search_count.experiment
    row: 61
    col: 12
    width: 12
    height: 7
  - title: Cumulative Ad Clicks by Branch
    name: Cumulative Ad Clicks by Branch
    model: experimentation
    explore: experiment_cumulative_ad_clicks
    type: looker_line
    fields: [experiment_cumulative_ad_clicks.Total, experiment_cumulative_ad_clicks.time_time,
      experiment_cumulative_ad_clicks.branch]
    pivots: [experiment_cumulative_ad_clicks.branch]
    filters: {}
    sorts: [experiment_cumulative_ad_clicks.time_time desc, experiment_cumulative_ad_clicks.branch]
    limit: 500
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_cumulative_ad_clicks.Total,
            id: variant - experiment_cumulative_ad_clicks.Total, name: variant}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_cumulative_ad_clicks.timeframe
      Experiment: experiment_cumulative_ad_clicks.experiment
    row: 68
    col: 12
    width: 12
    height: 7
  - title: Cumulative Seach Count with Ads by Branch
    name: Cumulative Seach Count with Ads by Branch
    model: experimentation
    explore: experiment_cumulative_search_with_ads_count
    type: looker_line
    fields: [experiment_cumulative_search_with_ads_count.Total, experiment_cumulative_search_with_ads_count.branch,
      experiment_cumulative_search_with_ads_count.time_time]
    pivots: [experiment_cumulative_search_with_ads_count.branch]
    filters: {}
    sorts: [experiment_cumulative_search_with_ads_count.time_time desc, experiment_cumulative_search_with_ads_count.branch]
    limit: 500
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: experiment_cumulative_search_with_ads_count.Total,
            id: only-branch - experiment_cumulative_search_with_ads_count.Total, name: only-branch}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    defaults_version: 1
    listen:
      Time Range [UTC]: experiment_cumulative_search_with_ads_count.timeframe
      Experiment: experiment_cumulative_search_with_ads_count.experiment
    row: 75
    col: 12
    width: 12
    height: 7
  - title: Cumulative Crash Counts
    name: Cumulative Crash Counts
    model: experimentation
    explore: experiment_crash_rates
    type: looker_line
    fields: [sum_of_crash_count, experiment_crash_rates.window_start_time]
    filters: {}
    sorts: [experiment_crash_rates.window_start_time]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: experiment_crash_rates.crash_count
      expression: ''
      label: Sum of Crash Count
      measure: sum_of_crash_count
      type: sum
    - category: table_calculation
      expression: running_total(${sum_of_crash_count})
      label: Cumulative Crash Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: cumulative_crash_count
      _type_hint: number
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total, orientation: left, series: [{axisId: sum_of_crash_count,
            id: sum_of_crash_count, name: Sum of Crash Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Time [UTC]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sum_of_crash_count]
    listen:
      Experiment: experiment_crash_rates.experiment
      Time Range [UTC]: experiment_crash_rates.window_start_date
    row: 84
    col: 0
    width: 12
    height: 7
  - title: Cumulative Crash Counts by Branch
    name: Cumulative Crash Counts by Branch
    model: experimentation
    explore: experiment_crash_rates
    type: looker_line
    fields: [sum_of_crash_count, experiment_crash_rates.branch, experiment_crash_rates.window_start_time]
    pivots: [experiment_crash_rates.branch]
    filters: {}
    sorts: [experiment_crash_rates.branch, experiment_crash_rates.window_start_time]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: experiment_crash_rates.crash_count
      expression: ''
      label: Sum of Crash Count
      measure: sum_of_crash_count
      type: sum
    - category: table_calculation
      expression: running_total(${sum_of_crash_count})
      label: Cumulative Crash Counts
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: cumulative_crash_counts
      _type_hint: number
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
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total, orientation: left, series: [{axisId: sum_of_crash_count,
            id: change-non-user - sum_of_crash_count, name: change-non-user}, {axisId: sum_of_crash_count,
            id: no-change-non-user - sum_of_crash_count, name: no-change-non-user}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [sum_of_crash_count]
    listen:
      Experiment: experiment_crash_rates.experiment
      Time Range [UTC]: experiment_crash_rates.window_start_date
    row: 84
    col: 12
    width: 12
    height: 7
  - title: Cumulative Crash Counts by Process
    name: Cumulative Crash Counts by Process
    model: experimentation
    explore: experiment_crash_rates
    type: looker_line
    fields: [sum_of_crash_count, experiment_crash_rates.crash_process_type, experiment_crash_rates.window_start_time]
    pivots: [experiment_crash_rates.crash_process_type]
    filters: {}
    sorts: [experiment_crash_rates.crash_process_type, experiment_crash_rates.window_start_time]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: experiment_crash_rates.crash_count
      expression: ''
      label: Sum of Crash Count
      measure: sum_of_crash_count
      type: sum
    - category: table_calculation
      expression: running_total(${sum_of_crash_count})
      label: Cumulative Crash Counts
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: cumulative_crash_counts
      _type_hint: number
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total, orientation: left, series: [{axisId: sum_of_crash_count,
            id: content - sum_of_crash_count, name: content}, {axisId: sum_of_crash_count,
            id: gpu - sum_of_crash_count, name: gpu}, {axisId: sum_of_crash_count,
            id: main - sum_of_crash_count, name: main}, {axisId: sum_of_crash_count,
            id: rdd - sum_of_crash_count, name: rdd}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time [UTC]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [sum_of_crash_count]
    listen:
      Experiment: experiment_crash_rates.experiment
      Time Range [UTC]: experiment_crash_rates.window_start_date
    row: 91
    col: 0
    width: 12
    height: 7
  filters:
  - name: Experiment
    title: Experiment
    type: field_filter
    default_value: bug-1727596-pref-search-experiment-measuring-the-impacts-of-diffe-release-79-96
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: experimentation
    explore: experiment_enrollment_daily_active_population
    listens_to_filters: []
    field: experiment_enrollment_daily_active_population.experiment
  - name: Time Range [UTC]
    title: Time Range [UTC]
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: experimentation
    explore: experiment_enrollment_daily_active_population
    listens_to_filters: []
    field: experiment_enrollment_daily_active_population.time_date
