---
- dashboard: website_sessions
  title: Website Sessions
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: m5X74lUFBW3irBLM8vVtXC
  elements:
  - title: Top Page Paths
    name: Top Page Paths
    model: websites
    explore: web_sessions
    type: looker_grid
    fields: [web_sessions.page_path, web_sessions.session_count, web_sessions.client_count]
    sorts: [web_sessions.session_count desc]
    limit: 50
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 28
    col: 12
    width: 12
    height: 8
  - title: Client Countries
    name: Client Countries
    model: websites
    explore: web_sessions
    type: looker_geo_choropleth
    fields: [web_sessions.client_count, web_sessions.normalized_country_code]
    sorts: [web_sessions.client_count desc]
    limit: 500
    column_limit: 50
    map: auto
    map_projection: ''
    show_view_names: false
    quantize_colors: false
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
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 6
    col: 8
    width: 8
    height: 8
  - title: Unique Clients and Sessions Daily
    name: Unique Clients and Sessions Daily
    model: websites
    explore: web_sessions
    type: looker_line
    fields: [web_sessions.submission_date, web_sessions.client_count, web_sessions.session_count]
    fill_fields: [web_sessions.submission_date]
    sorts: [web_sessions.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: "${web_sessions.new_session}"
      label: New Session Count
      value_format:
      value_format_name:
      based_on: web_sessions.session_count
      filter_expression: "${web_sessions.new_session}"
      _kind_hint: measure
      measure: new_session_count
      type: count_distinct
      _type_hint: number
      filters: {}
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
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 0
    col: 0
    width: 16
    height: 6
  - title: Browsers
    name: Browsers
    model: websites
    explore: web_sessions
    type: looker_pie
    fields: [web_sessions.client_count, web_sessions.metadata__user_agent__browser]
    sorts: [web_sessions.client_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - args:
      - web_sessions.client_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: web_sessions.client_count
      label: Percent of Events Stream Table Client Count
      source_field: web_sessions.client_count
      table_calculation: percent_of_events_stream_table_client_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
      percent_of_events_stream_table_client_count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_pivots: {}
    show_value_labels: true
    font_size: 12
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 6
    col: 16
    width: 4
    height: 8
  - title: External Referrers
    name: External Referrers
    model: websites
    explore: web_sessions
    type: looker_bar
    fields: [web_sessions.session_count, web_sessions.client_count, web_sessions.external_referrer]
    sorts: [web_sessions.session_count desc]
    filters:
      web_sessions.external_referrer: "-EMPTY"
    limit: 50
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Country Name: countries.name
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 42
    col: 0
    width: 12
    height: 8
  - title: Top Visited Pages
    name: Top Visited Pages
    model: websites
    explore: web_sessions
    type: looker_bar
    fields: [web_sessions.session_count, web_sessions.client_count, web_sessions.page_title]
    sorts: [web_sessions.session_count desc]
    limit: 15
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 28
    col: 0
    width: 12
    height: 8
  - title: Operating Systems
    name: Operating Systems
    model: websites
    explore: web_sessions
    type: looker_pie
    fields: [web_sessions.client_count, web_sessions.metadata__user_agent__os]
    sorts: [web_sessions.client_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - args:
      - web_sessions.client_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: web_sessions.client_count
      label: Percent of Events Stream Table Client Count
      source_field: web_sessions.client_count
      table_calculation: percent_of_events_stream_table_client_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
      percent_of_events_stream_table_client_count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    hidden_pivots: {}
    show_value_labels: true
    font_size: 12
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 6
    col: 20
    width: 4
    height: 8
  - title: Total Unique Clients
    name: Total Unique Clients
    model: websites
    explore: web_sessions
    type: single_value
    fields: [web_sessions.client_count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 0
    col: 16
    width: 4
    height: 3
  - title: Total Unique Sessions
    name: Total Unique Sessions
    model: websites
    explore: web_sessions
    type: single_value
    fields: [web_sessions.session_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 3
    col: 16
    width: 4
    height: 3
  - title: Client Countries (detail)
    name: Client Countries (detail)
    model: websites
    explore: web_sessions
    type: looker_grid
    fields: [web_sessions.client_count, countries.name]
    sorts: [web_sessions.client_count desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    map: auto
    map_projection: ''
    quantize_colors: false
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 6
    col: 0
    width: 8
    height: 8
  - title: Sessions Per Client (avg)
    name: Sessions Per Client (avg)
    model: websites
    explore: web_sessions
    type: single_value
    fields: [web_sessions.client_count, web_sessions.session_count]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${web_sessions.session_count}/${web_sessions.client_count}"
      label: Average Sessions per Client
      value_format:
      value_format_name: decimal_3
      _kind_hint: measure
      table_calculation: average_sessions_per_client
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
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [web_sessions.client_count, web_sessions.session_count]
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 0
    col: 20
    width: 4
    height: 3
  - title: Total New Sessions
    name: Total New Sessions
    model: websites
    explore: web_sessions
    type: single_value
    fields: [web_sessions.session_count]
    filters:
      web_sessions.new_session: 'Yes'
    sorts: [web_sessions.session_count desc]
    limit: 500
    column_limit: 50
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 3
    col: 20
    width: 4
    height: 3
  - title: Bounce Rate
    name: Bounce Rate
    model: websites
    explore: web_sessions
    type: looker_pie
    fields: [web_sessions.is_bounce, web_sessions.session_count]
    fill_fields: [web_sessions.is_bounce]
    sorts: [web_sessions.session_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 14
    col: 20
    width: 4
    height: 6
  - title: New and Returning Sessions Daily
    name: New and Returning Sessions Daily
    model: websites
    explore: web_sessions
    type: looker_area
    fields: [web_sessions.submission_date, web_sessions.session_count, new_sessions]
    fill_fields: [web_sessions.submission_date]
    sorts: [web_sessions.submission_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${web_sessions.session_count} - ${new_sessions}"
      label: Returning Sessions
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: returning_sessions
      _type_hint: number
    - category: measure
      expression: "${web_sessions.new_session}"
      label: New Sessions
      value_format:
      value_format_name:
      based_on: web_sessions.session_count
      filter_expression: "${web_sessions.new_session}"
      _kind_hint: measure
      measure: new_sessions
      type: count_distinct
      _type_hint: number
      filters: {}
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: new_session_count, id: new_session_count,
            name: New Session Count}, {axisId: returning_sessions, id: returning_sessions,
            name: Returning Sessions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: web_sessions.bounced_count, id: web_sessions.bounced_count,
            name: Bounced Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [web_sessions.session_count]
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 14
    col: 0
    width: 12
    height: 6
  - title: Top Exit Pages
    name: Top Exit Pages
    model: websites
    explore: web_sessions
    type: looker_bar
    fields: [web_sessions.session_count, web_sessions.client_count, web_sessions.exit_title]
    sorts: [web_sessions.session_count desc]
    limit: 15
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 20
    col: 12
    width: 12
    height: 8
  - title: 'Top Landing Pages '
    name: 'Top Landing Pages '
    model: websites
    explore: web_sessions
    type: looker_bar
    fields: [web_sessions.session_count, web_sessions.client_count, web_sessions.landing_title]
    sorts: [web_sessions.session_count desc]
    limit: 15
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 20
    col: 0
    width: 12
    height: 8
  - title: New and Returning Sessions
    name: New and Returning Sessions
    model: websites
    explore: web_sessions
    type: looker_pie
    fields: [web_sessions.session_count, new_and_returning_sessions]
    sorts: [web_sessions.session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: if(${web_sessions.new_session}, "New", "Returning")
      label: New and Returning Sessions
      value_format:
      value_format_name:
      dimension: new_and_returning_sessions
      _kind_hint: dimension
      _type_hint: string
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 14
    col: 12
    width: 4
    height: 6
  - title: Engaged Sessions
    name: Engaged Sessions
    model: websites
    explore: web_sessions
    type: looker_pie
    fields: [web_sessions.session_count, engaged_sessions]
    sorts: [web_sessions.session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: "${web_sessions.session_page_load_count} >= 2 AND ${web_sessions.session_duration}\
        \ > 60"
      label: Engaged Sessions
      value_format:
      value_format_name:
      dimension: engaged_sessions
      _kind_hint: dimension
      _type_hint: yesno
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 14
    col: 16
    width: 4
    height: 6
  - title: Traffic Sources Daily
    name: Traffic Sources Daily
    model: websites
    explore: web_sessions
    type: looker_line
    fields: [web_sessions.submission_date, web_sessions.traffic_source, web_sessions.session_count]
    pivots: [web_sessions.traffic_source]
    fill_fields: [web_sessions.submission_date]
    sorts: [web_sessions.submission_date desc, web_sessions.traffic_source]
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
    interpolation: monotone
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 36
    col: 0
    width: 24
    height: 6
  - title: Traffic Source Breakdown
    name: Traffic Source Breakdown
    model: websites
    explore: web_sessions
    type: looker_bar
    fields: [web_sessions.session_count, web_sessions.traffic_source]
    sorts: [web_sessions.session_count desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      web_sessions.client_count:
        is_active: true
      web_sessions.session_count:
        is_active: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country Name: countries.name
      External Referrer: web_sessions.external_referrer
      App Channel: web_sessions.app_channel
      UA - Browser: web_sessions.metadata__user_agent__browser
      Submission Date: web_sessions.submission_date_filter
      Traffic Source: web_sessions.traffic_source
      App ID: web_sessions.app_id
    row: 42
    col: 12
    width: 12
    height: 8
  filters:
  - name: App ID
    title: App ID
    type: field_filter
    default_value: debug^_ping^_view
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.app_id
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.submission_date_filter
  - name: Country Name
    title: Country Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: countries.name
  - name: External Referrer
    title: External Referrer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.external_referrer
  - name: App Channel
    title: App Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.app_channel
  - name: UA - Browser
    title: UA - Browser
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.metadata__user_agent__browser
  - name: Traffic Source
    title: Traffic Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: websites
    explore: web_sessions
    listens_to_filters: []
    field: web_sessions.traffic_source
