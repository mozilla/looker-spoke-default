- dashboard: mobile_kr_refactor
  title: Mobile H2 KRs MVP
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Mobile YoY Comparison (To-Date)
    name: Total Mobile YoY Comparison (To-Date)
    model: kpi
    explore: recent_mobile_forecast
    type: looker_grid
    fields: [mobile_dau_actuals.date_parts_quarter_of_year, mobile_dau_actuals.date_parts_year,
      mobile_dau_actuals.dau]
    pivots: [mobile_dau_actuals.date_parts_year]
    filters:
      mobile_dau_actuals.date: after 2019/01/01
      recent_mobile_forecast.forecast_recency: '1'
    sorts: [mobile_dau_actuals.date_parts_year, mobile_dau_actuals.date_parts_quarter_of_year
        0]
    limit: 500
    total: true
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${mobile_dau_actuals.dau},
          3) / pivot_index(${mobile_dau_actuals.dau}, 1) -1', label: 2021 Relative
          to 2019, value_format: 0.000%, value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: 2021_relative_to_2019, _type_hint: number}, {category: table_calculation,
        expression: 'pivot_index(${mobile_dau_actuals.dau}, 3) / pivot_index(${mobile_dau_actuals.dau},
          2) -1', label: 2021 Relative to 2020, value_format: 0.000%, value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: 2021_relative_to_2020, _type_hint: number}]
    filter_expression: "${mobile_dau_actuals.date_parts_day_of_year} < diff_days(date(2021,1,1),\
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
      mobile_dau_actuals.dau: CDOU
      mobile_dau_actuals.date_parts_quarter_of_year: Quarter
      mobile_dau_actuals.date_parts_year: Year
    series_cell_visualizations:
      mobile_dau_actuals.dau:
        is_active: false
    series_value_format:
      mobile_dau_actuals.dau: 0.000,,, "Billion"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Total Mobile DAU YoY
    name: Total Mobile DAU YoY
    model: kpi
    explore: recent_mobile_forecast
    type: looker_line
    fields: [mobile_dau_actuals.date_parts_year, mobile_dau_actuals.date_parts_day_of_year,
      mobile_dau_actuals.dau_7day_ma]
    pivots: [mobile_dau_actuals.date_parts_year]
    filters:
      mobile_dau_actuals.date: after 2017/03/01
      recent_mobile_forecast.forecast_recency: '1'
    sorts: [mobile_dau_actuals.date_parts_year, mobile_dau_actuals.date_parts_day_of_year]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_dau_actuals.dau_7day_ma,
            id: 2017 - mobile_dau_actuals.dau_7day_ma, name: '2017'}, {axisId: mobile_dau_actuals.dau_7day_ma,
            id: 2018 - mobile_dau_actuals.dau_7day_ma, name: '2018'}, {axisId: mobile_dau_actuals.dau_7day_ma,
            id: 2019 - mobile_dau_actuals.dau_7day_ma, name: '2019'}, {axisId: mobile_dau_actuals.dau_7day_ma,
            id: 2020 - mobile_dau_actuals.dau_7day_ma, name: '2020'}, {axisId: mobile_dau_actuals.dau_7day_ma,
            id: 2021 - mobile_dau_actuals.dau_7day_ma, name: '2021'}], showLabels: true,
        showValues: true, minValue: 3000000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [2017 - mobile_dau_actuals.dau_7day_ma, 2018 - mobile_dau_actuals.dau_7day_ma,
      2017 - mobile_dau_actuals.dau, 2019 - mobile_dau_actuals.dau, 2019 - mobile_dau_actuals.dau_7day_ma]
    series_types: {}
    series_colors:
      5_relative_to_2020: "#85282e"
    series_labels:
      2017 - mobile_dau_actuals.dau_7day_ma: '2017'
      2018 - mobile_dau_actuals.dau_7day_ma: '2018'
      2019 - mobile_dau_actuals.dau_7day_ma: '2019'
      2020 - mobile_dau_actuals.dau_7day_ma: '2020'
      2021 - mobile_dau_actuals.dau_7day_ma: '2021'
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 24
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "*Please ignore how the actuals drop to 0 on the most recent date*\n"
    row: 22
    col: 0
    width: 17
    height: 2
  - title: Updated Forecast
    name: Updated Forecast
    model: kpi
    explore: recent_mobile_forecast
    type: looker_line
    fields: [recent_mobile_forecast.date, mobile_dau_actuals.dau_7day_ma, recent_mobile_forecast.dau_forecast_7day_ma,
      recent_mobile_forecast.dau_forecast_lower_7day_ma, recent_mobile_forecast.dau_forecast_upper_7day_ma]
    filters:
      recent_mobile_forecast.date: after 2021/01/01
      recent_mobile_forecast.forecast_recency: '1'
    sorts: [mobile_dau_actuals.dau_7day_ma desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: recent_mobile_forecast.dau_forecast_7day_ma,
            id: recent_mobile_forecast.dau_forecast_7day_ma, name: Recent DAU Forecast
              (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_lower_7day_ma,
            id: recent_mobile_forecast.dau_forecast_lower_7day_ma, name: Recent DAU
              Forecast Lower Bound (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_upper_7day_ma,
            id: recent_mobile_forecast.dau_forecast_upper_7day_ma, name: Recent DAU
              Forecast Upper Bound (Moving Average)}, {axisId: mobile_dau_actuals.dau_7day_ma,
            id: mobile_dau_actuals.dau_7day_ma, name: DAU (Moving Average)}], showLabels: true,
        showValues: true, minValue: 10000000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      recent_mobile_forecast.dau_forecast_lower_7day_ma: "#80868B"
      recent_mobile_forecast.dau_forecast_upper_7day_ma: "#80868B"
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 7
  - title: Date of Most Recent Forecast
    name: Date of Most Recent Forecast
    model: kpi
    explore: recent_mobile_forecast
    type: single_value
    fields: [recent_mobile_forecast.date_forecast_created]
    filters:
      recent_mobile_forecast.forecast_recency: '1'
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
    row: 17
    col: 17
    width: 7
    height: 3
  - title: Projected CDOU By Quarter According to Recent Forecast
    name: Projected CDOU By Quarter According to Recent Forecast
    model: kpi
    explore: recent_mobile_forecast
    type: looker_grid
    fields: [recent_mobile_forecast.date_parts_quarter_of_year, recent_mobile_forecast.recent_dau_forecast,
      recent_mobile_forecast.yhat_lower, recent_mobile_forecast.yhat_upper]
    filters:
      recent_mobile_forecast.date: after 2021/01/01
      recent_mobile_forecast.forecast_recency: '1'
    sorts: [recent_mobile_forecast.date_parts_quarter_of_year]
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
      recent_mobile_forecast.date_parts_quarter_of_year: Quarter
      recent_mobile_forecast.recent_dau_forecast: Forecast Median
      recent_mobile_forecast.yhat_lower: Forecast 10th Percentile
      recent_mobile_forecast.yhat_upper: Forecast 90th Percentile
    series_cell_visualizations:
      recent_mobile_forecast.recent_dau_forecast:
        is_active: false
    series_value_format:
      recent_mobile_forecast.recent_dau_forecast: 0.000,,, "Billion"
      recent_mobile_forecast.yhat_lower: 0.000,,, "Billion"
      recent_mobile_forecast.yhat_upper: 0.000,,, "Billion"
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
    note_text: 'This is equivalent to a quarterly sum of the blue line above. '
    row: 17
    col: 0
    width: 17
    height: 5
