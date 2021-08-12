- dashboard: desktop_kr_refactor
  title: Desktop KR Refactor
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Performance Year Over Year
    name: Performance Year Over Year
    model: kpi
    explore: recent_desktop_forecast
    type: looker_grid
    fields: [desktop_dau_actuals.date_parts_quarter_of_year, desktop_dau_actuals.date_parts_year,
      desktop_dau_actuals.dau]
    pivots: [desktop_dau_actuals.date_parts_year]
    fill_fields: [desktop_dau_actuals.date_parts_quarter_of_year, desktop_dau_actuals.date_parts_year]
    filters:
      desktop_dau_actuals.date: after 2019/01/01
      desktop_dau_actuals.date_parts_quarter: before 2019/03/31,after 2019/07/01
      recent_desktop_forecast.forecast_recency: '1'
    sorts: [desktop_dau_actuals.date_parts_year 0, desktop_dau_actuals.date_parts_quarter_of_year]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${desktop_dau_actuals.dau},
          3) / pivot_index(${desktop_dau_actuals.dau}, 2) -1', label: Relative Difference
          from 2020, value_format: 0.000%, value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: relative_difference_from_2020, _type_hint: number}, {category: table_calculation,
        expression: 'pivot_index(${desktop_dau_actuals.dau}, 3) / pivot_index(${desktop_dau_actuals.dau},
          1) -1', label: Relative Difference from 2019, value_format: 0.000%, value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: relative_difference_from_2019,
        _type_hint: number}]
    filter_expression: "${desktop_dau_actuals.date_parts_day_of_year} < diff_days(date(2021,1,1),\
      \ now())"
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
    series_labels:
      desktop_dau_actuals.dau: CDOU
      desktop_dau_actuals.date_parts_quarter_of_year: Quarter
      desktop_dau_actuals.date_parts_year: Year
    series_cell_visualizations:
      desktop_dau_actuals.dau:
        is_active: false
    series_value_format:
      desktop_dau_actuals.dau: 0.00,,, "Billion"
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
    series_types: {}
    listen: {}
    row: 6
    col: 0
    width: 12
    height: 5
  - title: 2021 Performance Against Beginning of Year Forecast and Stretch Goal
    name: 2021 Performance Against Beginning of Year Forecast and Stretch Goal
    model: kpi
    explore: recent_desktop_forecast
    type: looker_grid
    fields: [desktop_dau_actuals.date_parts_quarter_of_year, desktop_dau_actuals.dau,
      original_desktop_forecast.dau_forecast, original_desktop_forecast.dau_target]
    fill_fields: [desktop_dau_actuals.date_parts_quarter_of_year]
    filters:
      desktop_dau_actuals.date: after 2021/01/01
      original_desktop_forecast.date: after 2021/01/01
      recent_desktop_forecast.date: after 2021/01/01
      recent_desktop_forecast.forecast_recency: '1'
    sorts: [relative_difference_from_stretch_goal_1 desc]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${desktop_dau_actuals.dau}/${original_desktop_forecast.dau_forecast}-1",
        label: Relative Difference From Forecast, value_format: 0.000%, value_format_name: !!null '',
        _kind_hint: measure, table_calculation: relative_difference_from_forecast,
        _type_hint: number}, {category: table_calculation, expression: "${desktop_dau_actuals.dau}/${original_desktop_forecast.dau_target}-1",
        label: Relative Difference From Stretch Goal, value_format: 0.000%, value_format_name: !!null '',
        _kind_hint: measure, table_calculation: relative_difference_from_stretch_goal_1,
        _type_hint: number}]
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
    series_labels:
      desktop_dau_actuals.dau: CDOU
      desktop_dau_actuals.date_parts_quarter_of_year: Quarter
      desktop_dau_actuals.date_parts_year: Year
      original_desktop_forecast.dau_forecast: KPI Target
      original_desktop_forecast.dau_target: Stretch Goal
      relative_difference_from_forecast: Relative Difference from KPI Target
    series_column_widths:
      desktop_dau_actuals.date_parts_quarter_of_year: 77
      original_desktop_forecast.dau_forecast: 181
      original_desktop_forecast.dau_target: 200
      desktop_dau_actuals.dau: 119
      relative_difference_from_forecast: 218
      relative_difference_from_stretch_goal_1: 237
    series_cell_visualizations:
      desktop_dau_actuals.dau:
        is_active: false
      relative_difference_from_forecast:
        is_active: false
        palette:
          palette_id: 8d5ca487-7a41-19eb-b0dc-d2b22308fe60
          collection_id: mozilla
          custom_colors:
          - "#FF7139"
          - "#FFFFFF"
      relative_difference_from_target:
        is_active: false
        palette:
          palette_id: 378fd842-80c0-ed9e-281e-0c89d916abd7
          collection_id: mozilla
          custom_colors:
          - "#FF7139"
          - "#FFFFFF"
    header_background_color: "#FFFFFF"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-diverging-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      original_desktop_forecast.dau_forecast: 0.00,,, "Billion"
      original_desktop_forecast.dau_target: 0.00,,, "Billion"
      desktop_dau_actuals.dau: 0.00,,, "Billion"
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
    series_types: {}
    listen: {}
    row: 6
    col: 12
    width: 12
    height: 5
  - title: Date of Most Recent Forecast (Pink Line)
    name: Date of Most Recent Forecast (Pink Line)
    model: kpi
    explore: recent_desktop_forecast
    type: single_value
    fields: [recent_desktop_forecast.date_forecast_created]
    filters:
      recent_desktop_forecast.forecast_recency: '1'
      desktop_dau_actuals.date: after 2021/01/01
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 32
    col: 20
    width: 4
    height: 2
  - title: Desktop Difference from CDOU Forecast
    name: Desktop Difference from CDOU Forecast
    model: kpi
    explore: recent_desktop_forecast
    type: looker_line
    fields: [desktop_dau_actuals.delta_from_forecast_count_year, desktop_dau_actuals.date,
      desktop_dau_actuals.delta_from_target_count_year]
    fill_fields: [desktop_dau_actuals.date]
    filters:
      recent_desktop_forecast.forecast_recency: '1'
      desktop_dau_actuals.date: after 2021/01/01
    sorts: [desktop_dau_actuals.date desc]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_labels:
      desktop_dau_actuals.delta_from_target_count_year: 'CDOU: Absolute Delta From
        Stretch Goal'
      desktop_dau_actuals.delta_from_forecast_count_year: 'CDOU: Absolute Delta From
        KPI Target'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: At Forecast / Stretch Goal}]
    defaults_version: 1
    listen: {}
    row: 11
    col: 12
    width: 12
    height: 7
  - title: Desktop Daily Active Users
    name: Desktop Daily Active Users
    model: kpi
    explore: recent_desktop_forecast
    type: looker_line
    fields: [recent_desktop_forecast.date, desktop_dau_actuals.dau_7day_ma, original_desktop_forecast.dau_forecast_7day_ma,
      original_desktop_forecast.dau_forecast_lower_7day_ma, original_desktop_forecast.dau_forecast_upper_7day_ma,
      recent_desktop_forecast.dau_forecast_7day_ma]
    fill_fields: [recent_desktop_forecast.date]
    filters:
      recent_desktop_forecast.date: after 2021/01/01
      recent_desktop_forecast.forecast_recency: '1'
    sorts: [recent_desktop_forecast.dau_forecast_7day_ma desc]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: desktop_dau_actuals.dau,
            id: desktop_dau_actuals.dau, name: DAU}, {axisId: original_desktop_forecast.dau_forecast_7day_ma,
            id: original_desktop_forecast.dau_forecast_7day_ma, name: Original DAU
              Forecast (Moving Average)}, {axisId: original_desktop_forecast.dau_forecast_lower_7day_ma,
            id: original_desktop_forecast.dau_forecast_lower_7day_ma, name: Original
              DAU Forecast Lower Bound (Moving Average)}, {axisId: original_desktop_forecast.dau_forecast_upper_7day_ma,
            id: original_desktop_forecast.dau_forecast_upper_7day_ma, name: Original
              DAU Forecast Upper Bound (Moving Average)}, {axisId: recent_desktop_forecast.dau_forecast_7day_ma,
            id: recent_desktop_forecast.dau_forecast_7day_ma, name: Recent DAU Forecast
              (Moving Average)}], showLabels: true, showValues: true, minValue: 50000000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [desktop_dau_actuals.dau]
    series_colors:
      original_desktop_forecast.dau_forecast_lower_7day_ma: "#80868B"
      original_desktop_forecast.dau_forecast_upper_7day_ma: "#80868B"
      desktop_dau_actuals.dau_7day_ma: "#000000"
    series_labels:
      original_desktop_forecast.dau_forecast_7day_ma: DAU KPI Target (Moving Average)
      original_desktop_forecast.dau_forecast_lower_7day_ma: DAU Target Lower Bound
        (Moving Average)
      original_desktop_forecast.dau_forecast_upper_7day_ma: DAU Target Upper Bound
        (Moving Average)
    trend_lines: []
    discontinuous_nulls: false
    defaults_version: 1
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 10
  - name: ''
    type: text
    title_text: ''
    body_text: "*Please ignore how the actuals drop to 0 on the most recent date*\n"
    row: 32
    col: 12
    width: 8
    height: 2
  - title: DAU YoY Comparison
    name: DAU YoY Comparison
    model: kpi
    explore: recent_desktop_forecast
    type: looker_line
    fields: [desktop_dau_actuals.dau_7day_ma, desktop_dau_actuals.date_parts_year,
      desktop_dau_actuals.date_parts_day_of_year]
    pivots: [desktop_dau_actuals.date_parts_year]
    fill_fields: [desktop_dau_actuals.date_parts_year, desktop_dau_actuals.date_parts_day_of_year]
    filters:
      desktop_dau_actuals.date: before 2019/05/04,after 2019/06/08
      recent_desktop_forecast.forecast_recency: '1'
    sorts: [desktop_dau_actuals.dau_7day_ma desc 0, desktop_dau_actuals.date_parts_year]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2017 - desktop_dau_actuals.dau_7day_ma, name: '2017'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2018 - desktop_dau_actuals.dau_7day_ma, name: '2018'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2019 - desktop_dau_actuals.dau_7day_ma, name: '2019'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2020 - desktop_dau_actuals.dau_7day_ma, name: '2020'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2021 - desktop_dau_actuals.dau_7day_ma, name: '2021'}], showLabels: true,
        showValues: true, minValue: 50000000, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Day of Year
    hidden_series: [desktop_dau_actuals.dau]
    series_colors:
      original_desktop_forecast.dau_forecast_lower_7day_ma: "#80868B"
      original_desktop_forecast.dau_forecast_upper_7day_ma: "#80868B"
      desktop_dau_actuals.dau_7day_ma: "#000000"
    trend_lines: []
    discontinuous_nulls: true
    defaults_version: 1
    listen: {}
    row: 11
    col: 0
    width: 12
    height: 7
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <h1 style="margin-top:0px; padding: 5px; border-bottom: solid 1px #412399; height: 50px; color: #412399; text-align: left;" id="desktop_dou">Desktop Days of Use and DAU</h1>
      <div><a style="font-weight: bold;" href="https://mozilla.cloud.looker.com/dashboards-next/kpi::desktop_kr_dashboard?Date=after+2021%2F01%2F01&Channel=&Activity+Segment=&OS=&Attributed+%28Yes+%2F+No%29=&Country+Name=">☰

            Go Here for a More Detail on Desktop KPIs</a></div>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Important Note For the YoY Comparisons In this Column
    type: text
    title_text: Important Note For the YoY Comparisons In this Column
    subtitle_text: ''
    body_text: "*Q2 2019 and dates affected by Armagaddon have been removed. This\
      \ means that the yearly comparison to 2019 will be wrong.*\n"
    row: 3
    col: 0
    width: 12
    height: 3
  - name: Explanations of Terms Used Below
    type: text
    title_text: Explanations of Terms Used Below
    subtitle_text: ''
    body_text: "* KPI Target = Original KPI target set by Jan 2021 Forecast. \n* Stretch\
      \ Goal = Set in January to be +5% Over the Target\n* Recent Forecast = Updated\
      \ Forecast based on recent trends, using data up to the date shown at the bottom\
      \ of the page\n"
    row: 3
    col: 12
    width: 12
    height: 3
  - title: Daily Core Actives YoY Comparison
    name: Daily Core Actives YoY Comparison
    model: kpi
    explore: recent_desktop_forecast
    type: looker_line
    fields: [desktop_dau_actuals.dau_7day_ma, desktop_dau_actuals.date_parts_year,
      desktop_dau_actuals.date_parts_day_of_year]
    pivots: [desktop_dau_actuals.date_parts_year]
    fill_fields: [desktop_dau_actuals.date_parts_year, desktop_dau_actuals.date_parts_day_of_year]
    filters:
      desktop_dau_actuals.date: before 2019/05/04,after 2019/06/08
      recent_desktop_forecast.forecast_recency: '1'
      desktop_dau_actuals.activity_segment: '"core_user"'
    sorts: [desktop_dau_actuals.dau_7day_ma desc 0, desktop_dau_actuals.date_parts_year]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2017 - desktop_dau_actuals.dau_7day_ma, name: '2017'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2018 - desktop_dau_actuals.dau_7day_ma, name: '2018'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2019 - desktop_dau_actuals.dau_7day_ma, name: '2019'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2020 - desktop_dau_actuals.dau_7day_ma, name: '2020'}, {axisId: desktop_dau_actuals.dau_7day_ma,
            id: 2021 - desktop_dau_actuals.dau_7day_ma, name: '2021'}], showLabels: true,
        showValues: true, minValue: !!null '', valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Day of Year
    hidden_series: [desktop_dau_actuals.dau]
    series_colors:
      original_desktop_forecast.dau_forecast_lower_7day_ma: "#80868B"
      original_desktop_forecast.dau_forecast_upper_7day_ma: "#80868B"
      desktop_dau_actuals.dau_7day_ma: "#000000"
    trend_lines: []
    discontinuous_nulls: true
    defaults_version: 1
    row: 18
    col: 0
    width: 12
    height: 10
  - title: Projected CDOU By Quarter According to Recent Forecast
    name: Projected CDOU By Quarter According to Recent Forecast
    model: kpi
    explore: recent_desktop_forecast
    type: looker_grid
    fields: [recent_desktop_forecast.date_parts_quarter_of_year, recent_desktop_forecast.recent_dau_forecast,
      recent_desktop_forecast.yhat_lower, recent_desktop_forecast.yhat_upper]
    fill_fields: [recent_desktop_forecast.date_parts_quarter_of_year]
    filters:
      recent_desktop_forecast.date: after 2021/01/01
      recent_desktop_forecast.forecast_recency: '1'
    sorts: [recent_desktop_forecast.recent_dau_forecast desc]
    limit: 500
    total: true
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
    series_labels:
      recent_desktop_forecast.date_parts_quarter_of_year: Quarter
      recent_desktop_forecast.recent_dau_forecast: Forecast Median
      recent_desktop_forecast.yhat_lower: Forecast 10th Percentile
      recent_desktop_forecast.yhat_upper: Forecast 90th Percentile
    series_cell_visualizations:
      recent_desktop_forecast.recent_dau_forecast:
        is_active: false
    series_value_format:
      recent_desktop_forecast.recent_dau_forecast: 0.00,,, "Billion"
      recent_desktop_forecast.yhat_upper: 0.00,,, "Billion"
      recent_desktop_forecast.yhat_lower: 0.00,,, "Billion"
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
    note_state: collapsed
    note_display: hover
    note_text: This is equivalent to a quarterly sum of the pink line above.
    listen: {}
    row: 28
    col: 12
    width: 12
    height: 4
  - title: Available Forecasts
    name: Available Forecasts
    model: kpi
    explore: recent_desktop_forecast
    type: looker_grid
    fields: [recent_desktop_forecast.date_forecast_created, recent_desktop_forecast.forecast_recency]
    filters:
      recent_desktop_forecast.date: after 2021/01/01
      recent_desktop_forecast.forecast_recency: "<=100"
    sorts: [recent_desktop_forecast.date_forecast_created desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recent_desktop_forecast.date_forecast_created: Cutoff Date (Forecast Training
        Data Ends on this Date)
    series_cell_visualizations: {}
    defaults_version: 1
    series_types: {}
    row: 34
    col: 12
    width: 12
    height: 4
