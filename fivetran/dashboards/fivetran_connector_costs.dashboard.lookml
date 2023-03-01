- dashboard: fivetran_connector_costs
  title: Fivetran Connector Costs
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: wMc2jUrfMsnEMbXoTEzQDF
  elements:
  - title: Total Costs
    name: Total Costs
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.cost_in_USD, connector_costs.time_frame]
    sorts: [connector_costs.cost_in_USD desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 11
    col: 0
    width: 5
    height: 5
  - title: Costs and Paid Active Rows
    name: Costs and Paid Active Rows
    model: fivetran
    explore: connector_costs
    type: looker_column
    fields: [connector_costs.measured_month, connector_costs.paid_active_rows, connector_costs.cost_in_USD,
      connector_costs.spent_rate]
    fill_fields: [connector_costs.measured_month]
    sorts: [connector_costs.measured_month]
    limit: 500
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
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: connector_costs.paid_active_rows,
            id: connector_costs.paid_active_rows, name: Paid Active Rows}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: connector_costs.cost_in_USD, id: connector_costs.cost_in_USD,
            name: Cost In USD}, {axisId: connector_costs.spent_rate, id: connector_costs.spent_rate,
            name: Cost per Mio Active Rows}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      connector_costs.spent_rate: line
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Paid Active Rows
    name: Paid Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.paid_active_rows, connector_costs.time_frame]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 11
    col: 10
    width: 5
    height: 5
  - title: Cost per Million Active Rows
    name: Cost per Million Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.spent_rate, connector_costs.time_frame]
    sorts: [connector_costs.time_frame desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 11
    col: 5
    width: 5
    height: 5
  - title: Active Rows
    name: Active Rows
    model: fivetran
    explore: connector_costs
    type: looker_column
    fields: [connector_costs.measured_date, connector_costs.total_active_rows, connector_costs.billing_type]
    pivots: [connector_costs.billing_type]
    fill_fields: [connector_costs.measured_date]
    sorts: [connector_costs.measured_date desc, connector_costs.billing_type desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 16
    col: 0
    width: 24
    height: 9
  - title: Connectors
    name: Connectors
    model: fivetran
    explore: connector_costs
    type: looker_grid
    fields: [connector_costs.destination, connector_costs.connector_group, connector_costs.connector,
      connector_costs.paid_active_rows, connector_costs.percentage_of_paid_active_rows,
      connector_costs.total_active_rows, connector_costs.cost_in_USD]
    sorts: [connector_costs.paid_active_rows desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    series_column_widths:
      connector_costs.destination: 126
      connector_costs.connector_group: 118
      connector_costs.paid_active_rows: 339
      connector_costs.total_active_rows: 124
      connector_costs.percentage_of_paid_active_rows: 198
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 25
    col: 0
    width: 24
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677007226682},{"type":"h1","children":[{"text":"Overview"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677007228625},{"type":"h1","children":[{"text":"Details
      for selected Filters"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 24
    height: 2
  - title: Total Active Rows
    name: Total Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.total_active_rows, connector_costs.time_frame]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    series_types: {}
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 11
    col: 15
    width: 5
    height: 5
  - title: Project's Cost Share
    name: Project's Cost Share
    model: fivetran
    explore: connector_costs
    type: looker_pie
    fields: [connector_costs.destination, connector_costs.cost_in_USD]
    sorts: [connector_costs.cost_in_USD desc]
    limit: 500
    column_limit: 50
    value_labels: none
    label_type: labPer
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
    defaults_version: 1
    series_types: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Measured Month: connector_costs.measured_month
      Billing Type: connector_costs.billing_type
    row: 11
    col: 20
    width: 4
    height: 5
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.destination
  - name: Measured Month
    title: Measured Month
    type: field_filter
    default_value: 1 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.measured_month
  - name: Connector
    title: Connector
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: [Project, Measured Month]
    field: connector_costs.connector
  - name: Billing Type
    title: Billing Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.billing_type
