- dashboard: experiment_analysis_cost
  title: Experiment Analysis Cost
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Cost per day
    name: Cost per day
    model: experimentation
    explore: query_cost
    type: looker_column
    fields: [query_cost.submission_date, total_cost]
    fill_fields: [query_cost.submission_date]
    sorts: [query_cost.submission_date desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Cost, based_on: query_cost.cost_usd,
        _kind_hint: measure, measure: total_cost, type: sum, _type_hint: number}]
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
    show_null_points: true
    interpolation: linear
    swap_axes: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Monthly cost
    name: Monthly cost
    model: experimentation
    explore: query_cost
    type: looker_column
    fields: [total_cost, query_cost.submission_month]
    fill_fields: [query_cost.submission_month]
    sorts: [query_cost.submission_month desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Cost, based_on: query_cost.cost_usd,
        _kind_hint: measure, measure: total_cost, type: sum, _type_hint: number}]
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
    series_types: {}
    swap_axes: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 9
    col: 0
    width: 24
    height: 6
  - title: Cost per query
    name: Cost per query
    model: experimentation
    explore: query_cost
    type: looker_grid
    fields: [query_cost.submission_date, query_cost.destination_table, total_cost]
    filters:
      total_cost: ">0.2"
    sorts: [query_cost.submission_date desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Cost, based_on: query_cost.cost_usd,
        _kind_hint: measure, measure: total_cost, type: sum, _type_hint: number}]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      query_cost.destination_table: 284
    series_cell_visualizations:
      total_cost:
        is_active: true
    series_value_format:
      total_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 15
    col: 0
    width: 24
    height: 9
  - title: Last Run Cost
    name: Last Run Cost
    model: experimentation
    explore: query_cost
    type: single_value
    fields: [total_cost]
    filters:
      total_cost: ">1"
      query_cost.submission_date: 2 days
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Cost, based_on: query_cost.cost_usd,
        _kind_hint: measure, measure: total_cost, type: sum, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "$#.##"
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_column_widths:
      query_cost.destination_table: 284
    series_cell_visualizations:
      total_cost:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      total_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hide_totals: false
    hide_row_totals: false
    listen: {}
    row: 0
    col: 8
    width: 10
    height: 2
