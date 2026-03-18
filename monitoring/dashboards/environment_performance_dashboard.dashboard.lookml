- dashboard: environment_performance_dashboard
  title: Environment Performance Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: qo4RsUk7JZW040IYxsMRAq
  elements:
  - title: Runtime Run Count and Query Count by Dashboard L30D
    name: Runtime Run Count and Query Count by Dashboard L30D
    model: system__activity
    explore: history
    type: looker_column
    fields: [dashboard.title, history.average_runtime, history.dashboard_run_count,
      history.query_run_count]
    filters:
      history.completed_date: 30 days
    sorts: [history.average_runtime desc]
    limit: 100
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
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: false,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: Dashboard Run Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.query_run_count,
            id: history.query_run_count, name: Query Run Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      history.query_run_count: scatter
      history.dashboard_run_count: scatter
    series_colors:
      history.average_runtime: "#2C72AC"
      history.dashboard_run_count: "#222"
      query.count: "#2C72AC"
      history.query_run_count: "#F88017"
    series_labels: {}
    reference_lines: [{reference_type: line, line_value: '30', range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#B32F37", label: 30 Seconds}]
    trend_lines: []
    swap_axes: false
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: []
    hidden_points_if_no: []
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
    listen: {}
    row: 89
    col: 0
    width: 24
    height: 11
  - title: Runs by Looker Node L30D
    name: Runs by Looker Node L30D
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.average_runtime, history.dashboard_run_count, node.id, node.hostname,
      node.is_master, node.port, node.version]
    filters:
      history.completed_date: 30 days
    sorts: [history.dashboard_run_count desc]
    limit: 100
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
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: history.dashboard_run_count,
            id: history.dashboard_run_count, name: Dashboard Run Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      history.average_runtime: scatter
    series_colors:
      history.average_runtime: "#222"
      history.dashboard_run_count: "#2C72AC"
    series_labels: {}
    reference_lines: [{reference_type: line, line_value: '30', range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#B32F37", label: 30 Seconds}]
    trend_lines: []
    swap_axes: false
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: [node.hostname, node.is_master, node.port]
    hidden_points_if_no: []
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
    listen: {}
    row: 132
    col: 0
    width: 24
    height: 7
  - title: Cache vs Database Drill L30D
    name: Cache vs Database Drill L30D
    model: system__activity
    explore: history
    type: looker_grid
    fields: [dashboard.title, history.average_runtime, history.dashboard_run_count,
      query.count, history.result_source]
    pivots: [history.result_source]
    filters:
      history.completed_date: 30 days
      history.result_source: -"stale_cache",-EMPTY
    sorts: [history.result_source desc, avg_runtime_seconds desc 0]
    limit: 100
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${history.average_runtime}",
        label: AVG Runtime Seconds, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: avg_runtime_seconds, _type_hint: number}]
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
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", dashboard.title, query_avg_runtime_seconds,
      query_history.dashboard_run_count, query_query.count, cache_avg_runtime_seconds,
      cache_history.dashboard_run_count, cache_query.count]
    show_totals: true
    show_row_totals: true
    series_labels:
      query.count: Query Count
    series_column_widths:
      avg_runtime_seconds: 112
    series_cell_visualizations:
      history.average_runtime:
        is_active: false
    series_text_format:
      query.count:
        align: left
      history.dashboard_run_count:
        align: left
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
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: query.count,
            id: query.count, name: Query}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    series_colors:
      history.average_runtime: "#222"
      history.dashboard_run_count: "#2C72AC"
      query.count: "#2C72AC"
    reference_lines: [{reference_type: line, line_value: '30', range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#B32F37", label: 30 Seconds}]
    trend_lines: []
    swap_axes: false
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: [history.average_runtime]
    hidden_points_if_no: []
    pinned_columns:
      "$$$_row_numbers_$$$": left
      dashboard.title: left
    listen: {}
    row: 109
    col: 0
    width: 24
    height: 9
  - title: Scheduled Plan Count (Dashboards)
    name: Scheduled Plan Count (Dashboards)
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [dashboard.title, count_of_id_2, count_of_user_id, count_of_address, dashboard.id]
    filters:
      dashboard.title: "-NULL"
    sorts: [count_of_id_2 desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${count_of_id_2}",
        label: Schedule Count, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: schedule_count, _type_hint: number},
      {category: table_calculation, expression: "${count_of_user_id}", label: Count
          of Users (Scheduler), value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: count_of_users_scheduler, _type_hint: number},
      {category: table_calculation, expression: "${count_of_address}", label: Recipient
          Count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: recipient_count, _type_hint: number}, {measure: count_of_id,
        based_on: scheduled_job.id, expression: '', label: Count of ID, type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {category: measure, expression: '',
        label: Count of User ID, based_on: scheduled_plan.user_id, _kind_hint: measure,
        measure: count_of_user_id, type: count_distinct, _type_hint: number}, {measure: count_of_address,
        based_on: scheduled_plan_destination.address, expression: '', label: Count
          of Address, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {measure: count_of_id_2, based_on: scheduled_plan.id, expression: '', label: Count
          of ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
    column_order: ["$$$_row_numbers_$$$", dashboard.title, dashboard.id, schedule_count,
      count_of_users_scheduler, recipient_count, scheduled_job_stage.avg_runtime]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      count_of_id:
        is_active: false
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_text_format:
      recipient_count:
        align: left
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
    hidden_fields: [count_of_user_id, count_of_address, count_of_id_2, dashboard.id]
    y_axes: []
    listen: {}
    row: 118
    col: 0
    width: 24
    height: 6
  - title: Cache vs Database L30D
    name: Cache vs Database L30D
    model: system__activity
    explore: history
    type: looker_column
    fields: [dashboard.title, history.cache_result_query_count, history.database_result_query_count,
      history.query_run_count]
    filters:
      history.completed_date: 30 days
      dashboard.title: "-EMPTY"
    sorts: [sort desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${history.cache_result_query_count}\n\
          \n/\n\n(${history.database_result_query_count}\n+ \n${history.cache_result_query_count})",
        label: sort, value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        table_calculation: sort, _type_hint: number}]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: query.count,
            id: query.count, name: Query}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hidden_series: [history.dashboard_run_count, query.count]
    series_types:
      history.average_runtime: scatter
    series_colors:
      history.average_runtime: "#222"
      history.dashboard_run_count: "#2C72AC"
      query.count: "#2C72AC"
      history.database_result_query_count: "#2C72AC"
      history.cache_result_query_count: "#222"
    series_labels: {}
    reference_lines: [{reference_type: line, line_value: '30', range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#B32F37", label: 30 Seconds}]
    trend_lines: []
    swap_axes: false
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: [history.query_run_count, sort]
    hidden_points_if_no: []
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
    listen: {}
    row: 100
    col: 0
    width: 24
    height: 9
  - name: Performance and Users
    type: text
    title_text: Performance and Users
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Dashboards and Schedules
    type: text
    title_text: Dashboards and Schedules
    body_text: ''
    row: 87
    col: 0
    width: 24
    height: 2
  - title: Query Times by Source L30D
    name: Query Times by Source L30D
    model: system__activity
    explore: history
    type: looker_bar
    fields: [history.issuer_source, history.query_run_count, history.runtime_tiers]
    pivots: [history.runtime_tiers]
    filters:
      history.completed_date: 30 days
      history.runtime_tiers: "-Below 0, -Undefined"
      history.issuer_source: "-API,-Action Hub,-Other"
    sorts: [history.runtime_tiers, history.issuer_source desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 57bef7ef-25c4-448e-83df-9c4de399305d
      options:
        steps: 5
        reverse: true
    y_axes: []
    font_size: '12'
    series_types: {}
    series_colors: {}
    charts_across: 4
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    listen: {}
    row: 40
    col: 0
    width: 12
    height: 8
  - title: New Tile
    name: New Tile
    model: system__activity
    explore: user
    type: single_value
    fields: [user.count]
    filters:
      user.is_disabled: 'No'
      user_facts.is_looker_employee: 'No'
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'running_total(${user.count})',
        label: Total Users, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: total_users, _type_hint: number, is_disabled: true}]
    query_timezone: America/Denver
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    single_value_title: Total Users
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
    series_colors:
      user.count: "#2C72AC"
      session.count: "#222"
    defaults_version: 1
    hidden_fields: []
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
    y_axes: []
    listen: {}
    row: 2
    col: 0
    width: 5
    height: 4
  - title: Top Users L30D
    name: Top Users L30D
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.dashboard_run_count, user.name, query.count]
    filters:
      history.completed_month: 30 days
    sorts: [query.count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Denver
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
    series_cell_visualizations:
      history.dashboard_run_count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      query.count:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    hidden_fields: [history.dashboard_run_count]
    series_types: {}
    y_axes: []
    listen: {}
    row: 32
    col: 12
    width: 12
    height: 8
  - title: Dashboard Runs L30D
    name: Dashboard Runs L30D
    model: system__activity
    explore: history
    type: single_value
    fields: [history.dashboard_run_count]
    filters:
      history.completed_month: 30 days
    sorts: [history.dashboard_run_count desc]
    limit: 500
    query_timezone: America/Denver
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      history.dashboard_run_count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    hidden_fields: []
    series_types: {}
    y_axes: []
    listen: {}
    row: 2
    col: 10
    width: 5
    height: 4
  - title: Query Runs L30D
    name: Query Runs L30D
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count]
    filters:
      history.completed_month: 30 days
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${history.query_run_count}",
        label: 'Query Runs ', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: query_runs, _type_hint: number}]
    query_timezone: America/Denver
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: bergfreunde_bw
      palette_id: bergfreunde_bw-categorical-0
      options:
        steps: 5
    custom_color: "#000000"
    conditional_formatting: []
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
    series_types: {}
    point_style: circle
    series_colors:
      history.query_run_count: "#222"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
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
    series_cell_visualizations:
      history.dashboard_run_count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    interpolation: linear
    defaults_version: 1
    hidden_fields: [history.query_run_count]
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    listen: {}
    row: 2
    col: 15
    width: 5
    height: 4
  - title: Runtime
    name: Runtime
    model: system__activity
    explore: history
    type: single_value
    fields: [history.average_runtime]
    filters:
      history.completed_date: 30 days
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${history.average_runtime}",
        label: avg, value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        table_calculation: avg, _type_hint: number}]
    query_timezone: America/Denver
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: bergfreunde_2
      palette_id: bergfreunde_2-categorical-0
      options:
        steps: 5
    single_value_title: Average Runtime Seconds L30D
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    series_types: {}
    series_colors: {}
    charts_across: 4
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [history.average_runtime]
    y_axes: []
    listen: {}
    row: 2
    col: 20
    width: 4
    height: 4
  - title: 'Query Runs: Cache vs Database L3M'
    name: 'Query Runs: Cache vs Database L3M'
    model: system__activity
    explore: history
    type: looker_column
    fields: [history.average_runtime, history.dashboard_run_count, query.count, history.result_source,
      history.completed_week]
    pivots: [history.result_source]
    fill_fields: [history.completed_week]
    filters:
      history.result_source: -"stale_cache",-EMPTY
      history.completed_month: 3 months
    sorts: [history.result_source desc, history.completed_week desc]
    limit: 100
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${history.average_runtime}",
        label: AVG Runtime Seconds, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: avg_runtime_seconds, _type_hint: number}]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: history.average_runtime,
            id: history.average_runtime, name: Average Runtime in Seconds}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: query.count,
            id: query.count, name: Query}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    series_colors:
      history.average_runtime: "#222"
      history.dashboard_run_count: "#2C72AC"
      query.count: "#2C72AC"
      query - query.count: "#222"
      cache - query.count: "#2C72AC"
    series_labels:
      query.count: Query Count
      query - query.count: Results from Database
      cache - query.count: Results from Cache
    reference_lines: []
    trend_lines: []
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
    column_order: ["$$$_row_numbers_$$$", dashboard.title, query_avg_runtime_seconds,
      query_history.dashboard_run_count, query_query.count, cache_avg_runtime_seconds,
      cache_history.dashboard_run_count, cache_query.count]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      avg_runtime_seconds: 112
    series_cell_visualizations:
      history.average_runtime:
        is_active: false
    series_text_format:
      query.count:
        align: left
      history.dashboard_run_count:
        align: left
    swap_axes: false
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: [history.average_runtime, avg_runtime_seconds, history.dashboard_run_count]
    hidden_points_if_no: []
    pinned_columns:
      "$$$_row_numbers_$$$": left
      dashboard.title: left
    listen: {}
    row: 14
    col: 0
    width: 24
    height: 9
  - name: Query Runs vs Runtime L3M
    title: Query Runs vs Runtime L3M
    merged_queries:
    - model: system__activity
      explore: user
      type: table
      fields: [user.count, user.created_week]
      fill_fields: [user.created_week]
      filters:
        user.is_disabled: 'No'
        user.created_month: 3 months
      limit: 500
      dynamic_fields: [{category: table_calculation, expression: 'running_total(${user.count})',
          label: Total Users, value_format: !!null '', value_format_name: decimal_0,
          _kind_hint: measure, table_calculation: total_users, _type_hint: number,
          is_disabled: true}]
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.dashboard_run_count, history.average_runtime, history.completed_week]
      fill_fields: [history.completed_week]
      filters:
        history.completed_month: 3 months
      limit: 500
      join_fields:
      - field_name: history.completed_week
        source_field_name: user.created_week
    color_application:
      collection_id: bergfreunde
      palette_id: bergfreunde-categorical-0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: user.count, id: user.count,
            name: Users Added}, {axisId: history.dashboard_run_count, id: history.dashboard_run_count,
            name: Dashboard Run Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: average_runtime_seconds, id: average_runtime_seconds, name: 'Average
              Runtime Seconds '}, {axisId: history.average_runtime, id: history.average_runtime,
            name: Average Runtime in Seconds}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
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
    series_types:
      user.count: scatter
    point_style: none
    series_colors:
      total_users: "#222"
      history.dashboard_run_count: "#2C72AC"
    series_labels:
      user.count: Users Added
    series_point_styles:
      user.count: triangle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_line
    hidden_fields: [history.average_runtime]
    sorts: [user.created_week desc]
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${history.average_runtime}",
        label: 'Average Runtime Seconds ', value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: average_runtime_seconds, _type_hint: number}]
    row: 6
    col: 0
    width: 24
    height: 8
  - title: DashBoard Count
    name: DashBoard Count
    model: system__activity
    explore: dashboard
    type: single_value
    fields: [dashboard.count, dashboard.count_last_30_days]
    filters:
      dashboard.moved_to_trash: 'No'
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total_dashboards, label: Total Dashboards,
        expression: 'sum(${dashboard.count})', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {table_calculation: last_30_days,
        label: Last 30 days, expression: "sum(\n  if(diff_days(${dashboard.created_date},\
          \ now()) <= 30, ${dashboard.count},0))", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {measure: in_last_30_days,
        based_on: dashboard.id, type: count_distinct, label: In Last 30 Days, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: 'diff_days(${dashboard.created_date},
          now()) <= 30'}]
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    single_value_title: Dashboard Count
    comparison_label: Last 30 Days
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Total Non-Deleted Dashboards
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 2
    col: 5
    width: 5
    height: 4
  - title: Unengaged Users
    name: Unengaged Users
    model: system__activity
    explore: user
    type: looker_grid
    fields: [user.id, user.name, user.created_date, user_facts.last_ui_login_date,
      history.most_recent_query_date, scheduled_plan.count, user_facts.last_ui_login_credential_type]
    filters:
      user_facts.last_ui_login_date: before 90 days ago
      user.is_disabled: 'No'
      user_facts.is_looker_employee: 'No'
    sorts: [user_facts.last_ui_login_date]
    limit: 100
    column_limit: 50
    dynamic_fields: [{table_calculation: no_query_login, label: 'No-Query Login?',
        expression: "${history.most_recent_query_date} < ${user_facts.last_ui_login_date}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: yesno}, {table_calculation: days_since_last_login, label: Days
          Since Last Login, expression: 'diff_days(${user_facts.last_ui_login_date},
          trunc_days(now()))', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      user_facts.last_ui_login_date: Last Login
      user_facts.last_api_login_date: Last API Login Date
      user.name: Name
      user.created_date: Created Date
      history.most_recent_query_date: Last Query
      scheduled_plan.count: Count of Scheduled Plans
    series_cell_visualizations:
      days_since_last_login:
        is_active: true
        palette:
          palette_id: 2da48dd9-f8f5-45cc-81a6-74037767d59b
          collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#81BE56",
        font_color: !!null '', color_application: {collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d,
          palette_id: e26878fa-802e-47d9-9478-62fb4307f763, options: {steps: 32, constraints: {
              min: {type: number, value: 10}, mid: {type: middle}, max: {type: number,
                value: 200}}, reverse: true, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [days_since_last_login]}]
    truncate_column_names: false
    hidden_fields: [user.id, no_query_login, user_facts.last_ui_login_date, user_facts.last_ui_login_credential_type,
      user.created_date, scheduled_plan.count, history.most_recent_query_date]
    note_state: collapsed
    note_display: hover
    note_text: Users who have not authenticated into Looker in the last 90 days.
    defaults_version: 1
    series_types: {}
    y_axes: []
    listen: {}
    row: 40
    col: 12
    width: 12
    height: 8
  - title: Queue Time for Execution
    name: Queue Time for Execution
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job_stage.avg_runtime, scheduled_job.count, dashboard.title]
    filters:
      scheduled_job_stage.stage: '"enqueue_for_execute"'
      scheduled_job.created_date: 30 days ago for 30 days
    sorts: [scheduled_job_stage.avg_runtime desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: transparent
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: true
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      scheduled_job_stage.avg_runtime: Average Time in Queue
      scheduled_job.count: Run Count
    series_cell_visualizations:
      scheduled_job_stage.avg_runtime:
        is_active: false
        palette:
          palette_id: e26878fa-802e-47d9-9478-62fb4307f763
          collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#81BE56",
        font_color: !!null '', color_application: {collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d,
          palette_id: e26878fa-802e-47d9-9478-62fb4307f763, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: maximum}}, mirror: true,
            reverse: true, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [scheduled_job_stage.avg_runtime]}, {type: along a scale..., value: !!null '',
        background_color: "#81BE56", font_color: !!null '', color_application: {collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d,
          custom: {id: 3824bfef-80a2-2fb2-cb03-c0e767fc1658, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#fa461f", offset: 100}]},
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [scheduled_job.count]}]
    truncate_column_names: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 32
    col: 0
    width: 12
    height: 8
  - title: Query Over 300 Seconds L30D
    name: Query Over 300 Seconds L30D
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.issuer_source, history.real_dash_id, history.connection_name,
      history.cache, dashboard.title, history.completed_date, history.runtime, history.id]
    filters:
      history.completed_date: 30 days
      history.runtime_tiers: 300 or Above
      history.issuer_source: "-API,-Action Hub,-Other"
    sorts: [history.completed_date desc]
    limit: 500
    query_timezone: America/Denver
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
    stacking: normal
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: bergfreunde_2
      palette_id: bergfreunde_2-categorical-0
      options:
        steps: 5
    font_size: '12'
    series_types: {}
    series_colors: {}
    charts_across: 4
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_series: []
    column_order: ["$$$_row_numbers_$$$", history.id, dashboard.title, history.real_dash_id,
      history.completed_date, history.issuer_source, history.connection_name, history.cache,
      history.runtime]
    series_column_widths:
      dashboard.title: 195
      history.real_dash_id: 167
      history.completed_date: 122
      history.issuer_source: 110
      history.connection_name: 217
      history.cache: 187
      history.runtime: 143
      history.id: 107
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 48
    col: 0
    width: 24
    height: 6
  - title: PDT Builds L30D
    name: PDT Builds L30D
    model: system__activity
    explore: pdt_builds
    type: looker_grid
    fields: [pdt_builds.build_reason, pdt_builds.average_build_time_seconds, pdt_builds.average_build_time_minutes]
    fill_fields: [pdt_builds.build_reason]
    filters:
      pdt_builds.end_date: 30 days
    sorts: [pdt_builds.average_build_time_seconds desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${pdt_builds.average_build_time_seconds}",
        label: AVG Build Time Seconds, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: avg_build_time_seconds, _type_hint: number}]
    query_timezone: America/Denver
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
    series_cell_visualizations:
      pdt_builds.average_build_time_seconds:
        is_active: true
      avg_build_time_seconds:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    hidden_fields: [pdt_builds.average_build_time_seconds, pdt_builds.average_build_time_minutes]
    y_axes: []
    listen: {}
    row: 64
    col: 0
    width: 12
    height: 5
  - title: PDT Builds by Result L30D
    name: PDT Builds by Result L30D
    model: system__activity
    explore: pdt_builds
    type: looker_grid
    fields: [pdt_builds.build_result, count_of_end_time, build_result, sum_of_elapsed_seconds]
    filters:
      pdt_builds.end_date: 30 days
      count_of_end_time: NOT NULL
    sorts: [run_count desc]
    limit: 500
    dynamic_fields: [{measure: count_of_end_time, based_on: pdt_builds.end_time, expression: '',
        label: Count of End Time, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: table_calculation, expression: "${count_of_end_time}", label: Run
          Count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: run_count, _type_hint: number}, {category: dimension, expression: 'if(${pdt_builds.build_result}
          = "Successful Build", "Success","Failure")', label: Build Result, value_format: !!null '',
        value_format_name: !!null '', dimension: build_result, _kind_hint: dimension,
        _type_hint: string}, {measure: count_of_elapsed_seconds, based_on: pdt_builds.elapsed_seconds,
        expression: '', label: Count of Elapsed Seconds, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_elapsed_seconds, based_on: pdt_builds.elapsed_seconds,
        expression: '', label: Sum of Elapsed Seconds, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_elapsed_minutes, based_on: pdt_builds.elapsed_minutes,
        expression: '', label: Sum of Elapsed Minutes, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Denver
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", pdt_builds.view_name, pdt_builds.build_result,
      pdt_builds.start_date]
    show_totals: true
    show_row_totals: true
    series_labels:
      count_of_elapsed_seconds: Run Seconds
      sum_of_elapsed_seconds: Run Seconds
      sum_of_elapsed_minutes: Run Minutes
    series_column_widths:
      pdt_builds.view_name: 311
    series_cell_visualizations:
      count_of_end_time:
        is_active: false
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      run_count:
        is_active: false
        palette:
          palette_id: 9bba0279-71a4-410a-bd57-3afc0dfabaad
          collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
    series_text_format:
      run_count: {}
      count_of_elapsed_seconds:
        align: left
      sum_of_elapsed_seconds:
        align: left
    conditional_formatting: []
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
    stacking: normal
    legend_position: center
    series_types: {}
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
    hidden_fields: [count_of_end_time, build_result]
    y_axes: []
    listen: {}
    row: 64
    col: 12
    width: 12
    height: 5
  - title: PDT Build Success vs Failure 30D
    name: PDT Build Success vs Failure 30D
    model: system__activity
    explore: pdt_builds
    type: looker_area
    fields: [count_of_end_time, build_results, pdt_builds.end_date]
    pivots: [build_results]
    fill_fields: [pdt_builds.end_date]
    filters:
      pdt_builds.end_month: 30 days
    sorts: [build_results, pdt_builds.end_date desc]
    limit: 500
    dynamic_fields: [{measure: count_of_end_time, based_on: pdt_builds.end_time, expression: '',
        label: Count of End Time, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: table_calculation, expression: "${count_of_end_time}", label: Run
          Count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: run_count, _type_hint: number}, {category: dimension, expression: 'if(${pdt_builds.build_result}
          = "Successful Build", "Success","Failure")', label: Build Results, value_format: !!null '',
        value_format_name: !!null '', dimension: build_results, _kind_hint: measure,
        _type_hint: string}]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      Success - run_count: "#068993"
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", pdt_builds.view_name, pdt_builds.build_result,
      pdt_builds.start_date]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_column_widths:
      pdt_builds.view_name: 311
    series_cell_visualizations:
      count_of_end_time:
        is_active: false
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#F15922",
        font_color: !!null '', color_application: {collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09,
          palette_id: 5b289dc9-1446-49e6-ab05-ba239a94b7a9, options: {steps: 5, reverse: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    hidden_fields: [count_of_end_time]
    listen: {}
    row: 56
    col: 0
    width: 24
    height: 8
  - name: PDT Build Monitoring
    type: text
    title_text: PDT Build Monitoring
    body_text: ''
    row: 54
    col: 0
    width: 24
    height: 2
  - title: PDT Runs by View L30D
    name: PDT Runs by View L30D
    model: system__activity
    explore: pdt_builds
    type: looker_column
    fields: [pdt_builds.view_name, count_of_end_time, build_results]
    pivots: [build_results]
    filters:
      pdt_builds.end_date: 30 days ago for 30 days
    sorts: [build_results, failure desc]
    limit: 500
    dynamic_fields: [{measure: count_of_end_time, based_on: pdt_builds.end_time, expression: '',
        label: Count of End Time, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: dimension, expression: 'if(${pdt_builds.build_result} = "Successful
          Build", "Success","Failure")', label: Build Results, value_format: !!null '',
        value_format_name: !!null '', dimension: build_results, _kind_hint: measure,
        _type_hint: string}, {category: table_calculation, expression: "coalesce(pivot_where(${build_results}!=\"\
          Success\", ${count_of_end_time}),0)\n/\ncoalesce(pivot_where(${build_results}=\"\
          Success\", ${count_of_end_time}),0)", label: "%", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: supermeasure, table_calculation: calculation,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: 'coalesce(${count_of_end_time},0)',
        label: Run Count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: run_count, _type_hint: number}, {category: table_calculation,
        expression: "(pivot_index(${run_count},1))\n/\n(pivot_index(${run_count},1)\n\
          +\npivot_index(${run_count},2)\n)", label: "% Failure", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: supermeasure, table_calculation: failure,
        _type_hint: number}]
    query_timezone: America/Denver
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
    stacking: percent
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
    series_colors:
      Failure - count_of_end_time: "#B32F37"
      Success - count_of_end_time: "#72D16D"
      Failure - run_count: "#B32F37"
      Success - run_count: "#72D16D"
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
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", pdt_builds.view_name, pdt_builds.build_result,
      pdt_builds.start_date]
    series_column_widths:
      pdt_builds.view_name: 311
    hidden_fields: [count_of_end_time, new_calculation, failure]
    y_axes: []
    listen: {}
    row: 77
    col: 0
    width: 24
    height: 10
  - title: Current Failing Views L30D
    name: Current Failing Views L30D
    model: system__activity
    explore: pdt_event_log
    type: looker_grid
    fields: [pdt_builds.view_name, count_of_end_time, build_results, sum_of_elapsed_seconds_2]
    pivots: [build_results]
    filters:
      pdt_builds.end_date: 30 days
      build_results: Failure
    sorts: [build_results, sum_of_elapsed_seconds_2 desc 0]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields: [{measure: sum_of_elapsed_seconds, based_on: pdt_builds.elapsed_seconds,
        expression: '', label: Sum of Elapsed Seconds, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_action_data, based_on: pdt_event_log.action_data,
        expression: '', label: Count of Action Data, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_end_time, based_on: pdt_builds.end_time,
        expression: '', label: Count of End Time, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: dimension, expression: 'if(${pdt_builds.build_result}
          = "Successful Build", "Success","Failure")', label: Build Results, value_format: !!null '',
        value_format_name: !!null '', dimension: build_results, _kind_hint: measure,
        _type_hint: string}, {category: table_calculation, expression: 'pivot_index(${build_results},1)',
        label: Successful Builds, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: successful_builds, _type_hint: string,
        is_disabled: true}, {category: table_calculation, expression: 'pivot_index(${build_results},
          1)', label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: new_calculation, _type_hint: string,
        is_disabled: true}, {measure: sum_of_elapsed_seconds_2, based_on: pdt_builds.elapsed_seconds,
        expression: '', label: Sum of Elapsed Seconds, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_elapsed_minutes, based_on: pdt_builds.elapsed_minutes,
        expression: '', label: Sum of Elapsed Minutes, type: sum, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Denver
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
    pinned_columns:
      "$$$_row_numbers_$$$": left
    column_order: ["$$$_row_numbers_$$$", pdt_builds.view_name, pdt_event_log.action_data]
    show_totals: true
    show_row_totals: true
    series_labels:
      count_of_end_time: Run Count
      sum_of_elapsed_seconds_2: Seconds Wasted
    series_column_widths:
      pdt_event_log.action_data: 2873
      pdt_builds.build_result: 133
      pdt_builds.elapsed_seconds: 128
      pdt_builds.end_time: 148
      pdt_event_log.view_name: 188
      pdt_event_log.action: 154
      pdt_event_log.created_time: 147
      pdt_builds.build_reason: 187
      pdt_builds.view_name: 406
      sum_of_elapsed_seconds: 169
    series_cell_visualizations:
      count_of_end_time:
        is_active: false
        palette:
          palette_id: 2d9abb49-d953-c441-86f3-46e444d69836
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#3be617"
          - "#6afa55"
          - "#f6ff7c"
          - "#f27748"
          - "#ff8352"
      sum_of_elapsed_seconds_2:
        is_active: true
        palette:
          palette_id: '09bb30be-bc4f-18bf-133c-bf4d6f756d80'
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#f7fa59"
          - "#feb647"
          - "#f5924c"
          - "#ff6d45"
          - "#f24b2e"
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
    series_text_format:
      count_of_end_time:
        align: left
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 69
    col: 0
    width: 24
    height: 8
  - name: Other
    type: text
    title_text: Other
    body_text: ''
    row: 130
    col: 0
    width: 24
    height: 2
  - name: Completed Queries by Explore L30D
    title: Completed Queries by Explore L30D
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [query.view]
      limit: 500
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [query.view, history.query_run_count]
      filters:
        history.completed_month: 30 days ago for 30 days
      sorts: [history.query_run_count desc]
      limit: 500
      join_fields:
      - field_name: query.view
        source_field_name: query.view
    type: looker_column
    sorts: [history.query_run_count desc]
    column_limit: 50
    row: 23
    col: 0
    width: 24
    height: 9
  - title: Scheduled Plan Count (Looks)
    name: Scheduled Plan Count (Looks)
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [count_of_id_2, count_of_user_id, count_of_address, look.title]
    filters:
      look.title: "-NULL"
    sorts: [count_of_id_2 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${count_of_id_2}",
        label: Schedule Count, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: schedule_count, _type_hint: number},
      {category: table_calculation, expression: "${count_of_user_id}", label: Count
          of Users (Scheduler), value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: count_of_users_scheduler, _type_hint: number},
      {category: table_calculation, expression: "${count_of_address}", label: Recipient
          Count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: recipient_count, _type_hint: number}, {measure: count_of_id,
        based_on: scheduled_job.id, expression: '', label: Count of ID, type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {category: measure, expression: '',
        label: Count of User ID, based_on: scheduled_plan.user_id, _kind_hint: measure,
        measure: count_of_user_id, type: count_distinct, _type_hint: number}, {measure: count_of_address,
        based_on: scheduled_plan_destination.address, expression: '', label: Count
          of Address, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {measure: count_of_id_2, based_on: scheduled_plan.id, expression: '', label: Count
          of ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
    column_order: ["$$$_row_numbers_$$$", look.title, schedule_count, count_of_users_scheduler,
      recipient_count]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      count_of_id:
        is_active: false
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_text_format:
      recipient_count:
        align: left
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
    hidden_fields: [count_of_user_id, count_of_address, count_of_id_2]
    y_axes: []
    listen: {}
    row: 124
    col: 0
    width: 24
    height: 6
  - title: Dashboard Recommendations
    name: Dashboard Recommendations
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard_element.high_merge_query_count, dashboard_element.high_query_count,
      dashboard_element.low_auto_refresh_interval, dashboard_element.sorted_warnings,
      user.name, dashboard_element.combo_warning, dashboard.title, dashboard_element.combo_recommendation]
    filters:
      dashboard.moved_to_trash: 'No'
      dashboard_element.sorted_warnings: ">0"
    sorts: [dashboard_element.sorted_warnings desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      dashboard_element.sorted_warnings: Severity
      dashboard_element.combo_warning: Warnings
      dashboard_element.combo_recommendation: Recommendations
    series_column_widths:
      dashboard.id: 166
      dashboard.title: 225
      dashboard_element.sorted_warnings: 65
    series_cell_visualizations:
      dashboard_element.sorted_warnings:
        is_active: false
    series_text_format:
      dashboard_element.sorted_warnings: {}
      dashboard_element.combo_warning:
        align: left
      dashboard_element.combo_recommendation:
        align: left
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3D52B9",
        font_color: !!null '', color_application: {collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7,
          palette_id: 5378478f-6725-4b04-89cc-75fc42da804e, options: {steps: 5, constraints: {
              max: {type: number, value: 15}}}}, bold: false, italic: false, strikethrough: false,
        fields: [dashboard_element.sorted_warnings]}]
    hidden_fields: [user.name, dashboard_element.high_merge_query_count, dashboard_element.high_query_count,
      dashboard_element.low_auto_refresh_interval]
    defaults_version: 1
    listen: {}
    row: 139
    col: 0
    width: 24
    height: 8
  - title: Explore Recommendations
    name: Explore Recommendations
    model: system__activity
    explore: query_metrics
    type: looker_grid
    fields: [query.view, query.model, history.connection_name, query_metrics.async_processing_average,
      query_metrics.prepare_average, query_metrics.explore_init_average, query_metrics.marshalled_cache_load_average,
      query_metrics.model_init_computed_average, query_metrics.acquire_connection_average,
      query_metrics.execute_main_query_average, query_metrics.postprocessing_average,
      query_metrics.stream_to_cache_average, query_metrics.sorted_warnings, query_metrics.combo_warning,
      query_metrics.combo_recommendations]
    filters:
      query.view: "-EMPTY"
      query.model: "-EMPTY"
      query_metrics.minimum_query_events: '30'
      query_metrics.sorted_warnings: ">0"
      query_metrics.combo_recommendations: "-EMPTY"
      query_metrics.combo_warning: "%time%"
    sorts: [query_metrics.sorted_warnings desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      query_metrics.sorted_warnings: Severity
      query_metrics.combo_warning: Warnings
      query_metrics.combo_recommendations: Recommendations
    series_column_widths:
      query_metrics.stream_to_cache_average: 75
      query.view: 55
      query.model: 55
      history.connection_name: 55
      query_metrics.sorted_warnings: 55
    series_cell_visualizations:
      query_metrics.async_processing_average:
        is_active: true
    series_text_format:
      query_metrics.combo_warning:
        align: left
      query_metrics.combo_recommendations:
        align: left
    conditional_formatting: [{type: along a scale..., value: 0, background_color: "#FC2E31",
        font_color: !!null '', color_application: {collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7,
          palette_id: 5378478f-6725-4b04-89cc-75fc42da804e, options: {steps: 4, constraints: {
              min: {type: number, value: 0}, mid: {type: number, value: 1}, max: {
                type: number, value: 6}}, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: [query_metrics.async_processing_average, query_metrics.prepare_average,
      query_metrics.explore_init_average, query_metrics.marshalled_cache_load_average,
      query_metrics.model_init_computed_average, query_metrics.acquire_connection_average,
      query_metrics.execute_main_query_average, query_metrics.postprocessing_average,
      query_metrics.stream_to_cache_average]
    listen: {}
    row: 147
    col: 0
    width: 24
    height: 9
