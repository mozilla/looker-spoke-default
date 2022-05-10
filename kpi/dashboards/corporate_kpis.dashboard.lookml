- dashboard: firefox_corporate_kpis
  title: Firefox Corporate KPIs
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 2147484 seconds
  elements:
  - title: Desktop Daily Active Users (DAU)
    name: Desktop Daily Active Users (DAU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.dau_7day_ma,
      prediction.dau_forecast_7day_ma, prediction.dau_forecast_lower_7day_ma, prediction.dau_forecast_upper_7day_ma,
      firefox_desktop_usage_2021.year_over_year_dau_7day_ma]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.dau_7day_ma,
            id: firefox_desktop_usage_2021.dau_7day_ma, name: DAU (7 Day MA)}, {axisId: prediction.dau_forecast_7day_ma,
            id: prediction.dau_forecast_7day_ma, name: DAU Forecast (7 Day MA)}, {
            axisId: prediction.dau_forecast_lower_7day_ma, id: prediction.dau_forecast_lower_7day_ma,
            name: DAU Forecast Lower Bound}, {axisId: prediction.dau_forecast_upper_7day_ma,
            id: prediction.dau_forecast_upper_7day_ma, name: DAU Forecast Upper Bound},
          {axisId: firefox_desktop_usage_2021.year_over_year_dau_7day_ma, id: firefox_desktop_usage_2021.year_over_year_dau_7day_ma,
            name: 2020 Dau MA}], showLabels: true, showValues: true, minValue: !!null '',
        valueFormat: '0.0,, "M"', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      prediction.dau_forecast_lower: scatter
      prediction.dau_forecast_upper: scatter
      prediction.dau_forecast: scatter
    series_colors:
      prediction.dau_forecast_upper: "#b7b5c2"
      prediction.dau_forecast_lower: "#b7b5c2"
      prediction.dau_forecast_lower_7day_ma: "#80868B"
      prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      firefox_desktop_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
      prediction.dau_forecast_7day_ma: DAU Forecast (7 Day Moving Average)
      prediction.dau_forecast_lower_7day_ma: DAU Forecast Lower Bound
      prediction.dau_forecast_upper_7day_ma: DAU Forecast Upper Bound
      firefox_desktop_usage_2021.year_over_year_dau_7day_ma: 2020 DAU Moving Average
    series_point_styles:
      prediction.dau_forecast_lower: triangle
      prediction.dau_forecast_upper: triangle-down
    trend_lines: []
    defaults_version: 1
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: 'An Fx profile counts to DAU on days that we receive a main ping from
      them. The upper and lower bounds of the forecast (triangles) show the 10th and
      90th percentiles of forecasted DAU values for that day. Note that we should
      expect some days to fall outside of this range due to chance - generally we
      should be looking for multiple *consecutive* days outside of the range when
      determining if the actuals are truly starting to differ from the forecast. '
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 7
    col: 12
    width: 12
    height: 9
  - title: Destkop Cumulative Days of Use (CDOU)
    name: Destkop Cumulative Days of Use (CDOU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_forecast,
      prediction.cdou_target]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.cdou,
            id: firefox_desktop_usage_2021.cdou, name: Cumulative Days of Use}, {
            axisId: prediction.cdou_forecast, id: prediction.cdou_forecast, name: Forecast},
          {axisId: prediction.cdou_target, id: prediction.cdou_target, name: Target
              Pace}], showLabels: true, showValues: true, valueFormat: '0.0,,, "B"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_labels:
      firefox_desktop_usage_2021.cdou: Cumulative Days of Use
      prediction.cdou_forecast: Forecast
      prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in CDOU since Jan 1, in comparison to forecast
      and the +5% Target Pace.
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 46
    col: 0
    width: 12
    height: 9
  - name: ''
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
  - title: Desktop Difference from CDOU Forecast
    name: Desktop Difference from CDOU Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count,
      firefox_desktop_usage_2021.delta_from_target_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date]
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
    y_axes: [{label: Difference From Forecast / Stretch Goal, orientation: left, series: [
          {axisId: firefox_desktop_usage_2021.delta_from_forecast_count, id: firefox_desktop_usage_2021.delta_from_forecast_count,
            name: Cumulative Difference vs Forecast}, {axisId: firefox_desktop_usage_2021.delta_from_target_count,
            id: firefox_desktop_usage_2021.delta_from_target_count, name: Cumulative
              Difference vs Stretch Goal}], showLabels: true, showValues: true, valueFormat: '0.0,,
          "M"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_count: Cumulative Difference
        vs Forecast
      firefox_desktop_usage_2021.delta_from_target_count: Cumulative Difference vs
        Stretch Goal
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast / Stretch Goal}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between CDOU and (1) the forecast (Dark Blue)
      and (2) the Target (Light Blue). Positive numbers indicate that we are above
      forecast/target, negative numbers indicate we are below. Positive numbers indicate
      that we are above forecast/target, negative numbers indicate we are below.
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 7
    col: 0
    width: 12
    height: 9
  - title: Desktop Cumulative Days of Use (CDOU)
    name: Desktop Cumulative Days of Use (CDOU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.year_over_year_cdou_delta_percent, firefox_desktop_usage_2021.recent_cdou]
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
    single_value_title: Year Over Year Change in CDOU
    value_format: ''
    comparison_label: Cumulative Days of Use in 2021
    series_types: {}
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 3
    col: 0
    width: 8
    height: 4
  - title: Untitled
    name: Untitled
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_forecast, prediction.recent_cdou_forecast]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
    conditional_formatting: []
    defaults_version: 1
    series_types: {}
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
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 3
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_target, prediction.recent_cdou_target,
      firefox_desktop_usage_2021.date]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
    conditional_formatting: []
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
    row: 3
    col: 16
    width: 8
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <h1 style="margin-top:0px; padding: 5px; border-bottom: solid 1px #412399; height: 50px; color: #412399; text-align: left;" id="mobile_dou">Mobile Days of Use and DAU</h1>
      <div><a style="font-weight: bold;" href="https://mozilla.cloud.looker.com/dashboards-next/kpi::mobile_kr_dashboard?Date=after+2021%2F01%2F01&Country=">☰

            Go Here for a Breakdown of Mobile Products</a></div>
    row: 19
    col: 0
    width: 24
    height: 4
  - title: Untitled
    name: Untitled (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.year_over_year_cdou_delta_percent, mobile_usage_2021.dau,
      mobile_usage_2021.year_over_year_cdou_delta_count, mobile_usage_2021.year_over_year_dau]
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
    single_value_title: Year Over Year Change in CDOU
    value_format: ''
    comparison_label: Mobile Cumulative Days of Use in 2021
    series_types: {}
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 23
    col: 0
    width: 8
    height: 4
  - title: Untitled
    name: Untitled (3)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_daily, mobile_prediction.dau_forecast_format]
    filters:
      mobile_prediction.date: after 2021/01/01
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
    single_value_title: Difference from CDOU Forecast
    comparison_label: Mobile CDOU Forecasted as of Today
    series_types: {}
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 23
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target_daily, mobile_prediction.dau_target_format]
    filters:
      mobile_prediction.date: after 2021/01/01
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
    single_value_title: Difference from CDOU Stretch Goal
    comparison_label: CDOU Needed to Hit Stretch Goal
    series_types: {}
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 23
    col: 16
    width: 8
    height: 4
  - title: Mobile Difference From CDOU Forecast
    name: Mobile Difference From CDOU Forecast
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.delta_from_forecast_count, mobile_usage_2021.delta_from_target_count,
      mobile_usage_2021.date]
    fill_fields: [mobile_usage_2021.date]
    sorts: [mobile_usage_2021.date desc]
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
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference vs Forecast
      mobile_usage_2021.delta_from_target_count: Cumulative Difference vs Stretch
        Goal
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast / Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 27
    col: 0
    width: 12
    height: 9
  - title: Mobile Cumulative Days of Use (CDOU)
    name: Mobile Cumulative Days of Use (CDOU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    sorts: [mobile_usage_2021.date desc]
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
      mobile_usage_2021.cdou: Cumulative Days of Use (CDOU)
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 46
    col: 12
    width: 12
    height: 9
  - title: Mobile Daily Active Users (DAU)
    name: Mobile Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma,
      mobile_usage_2021.year_over_year_dau_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    sorts: [mobile_usage_2021.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.dau_7day_ma,
            id: mobile_usage_2021.dau_7day_ma, name: DAU (7 Day Moving Average)},
          {axisId: mobile_prediction.dau_forecast_7day_ma, id: mobile_prediction.dau_forecast_7day_ma,
            name: DAU Forecast (7 Day MA)}, {axisId: mobile_prediction.dau_forecast_lower_7day_ma,
            id: mobile_prediction.dau_forecast_lower_7day_ma, name: Forecast Lower
              Bound}, {axisId: mobile_prediction.dau_forecast_upper_7day_ma, id: mobile_prediction.dau_forecast_upper_7day_ma,
            name: Forecast Upper Bound}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_prediction.dau_forecast_lower_7day_ma: "#80868B"
      mobile_prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      mobile_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
      mobile_prediction.dau_forecast_7day_ma: DAU Forecast (7 Day Moving Average)
      mobile_prediction.dau_forecast_lower_7day_ma: Forecast Lower Bound
      mobile_prediction.dau_forecast_upper_7day_ma: Forecast Upper Bound
      mobile_usage_2021.year_over_year_dau_7day_ma: 2020 DAU Moving Average
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 27
    col: 12
    width: 12
    height: 9
  - name: " (3)"
    type: text
    title_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: left;" id="dou">Quarterly
      Numbers</h1>'
    row: 39
    col: 0
    width: 24
    height: 3
  - title: Desktop CDOU
    name: Desktop CDOU
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_grid
    fields: [quarter, firefox_desktop_usage_2021.dau, prediction.dau_forecast, prediction.dau_target]
    filters:
      firefox_desktop_usage_2021.date: after 2021/01/01
    sorts: [quarter]
    limit: 500
    dynamic_fields: [{dimension: quarter, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(extract_months(${firefox_desktop_usage_2021.date})
          >= 1 AND extract_months(${firefox_desktop_usage_2021.date}) <= 3, "Q1",
          if(extract_months(${firefox_desktop_usage_2021.date}) >= 4 AND extract_months(${firefox_desktop_usage_2021.date})
          <= 6, "Q2", if(extract_months(${firefox_desktop_usage_2021.date}) >= 7 AND
          extract_months(${firefox_desktop_usage_2021.date}) <= 9, "Q3", "Q4")))',
        label: Quarter, value_format: !!null '', value_format_name: !!null ''}]
    show_view_names: false
    show_row_numbers: false
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '20'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      firefox_desktop_usage_2021.recent_cdou: CDOU
      prediction.recent_cdou_forecast: Target
      prediction.recent_cdou_target: Stretch
      firefox_desktop_usage_2021.dau: DAU
      prediction.dau_forecast: Target
      prediction.dau_target: Stretch
    series_cell_visualizations:
      firefox_desktop_usage_2021.recent_cdou:
        is_active: false
    series_text_format:
      firefox_desktop_usage_2021.dau:
        align: center
      prediction.dau_forecast:
        align: center
      prediction.dau_target:
        align: center
    series_value_format:
      firefox_desktop_usage_2021.dau: 0.000,,, "Billion"
      prediction.dau_forecast: 0.000,,, "Billion"
      prediction.dau_target: 0.000,,, "Billion"
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
    listen: {}
    row: 42
    col: 0
    width: 12
    height: 4
  - title: Mobile CDOU
    name: Mobile CDOU
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [quarter, mobile_usage_2021.dau, mobile_prediction.dau_forecast, mobile_prediction.dau_target]
    filters:
      mobile_usage_2021.date: after 2021/01/01
    sorts: [quarter]
    limit: 500
    dynamic_fields: [{dimension: quarter, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(extract_months(${mobile_usage_2021.date})
          >= 1 AND extract_months(${mobile_usage_2021.date}) <= 3, "Q1", if(extract_months(${mobile_usage_2021.date})
          >= 4 AND extract_months(${mobile_usage_2021.date}) <= 6, "Q2", if(extract_months(${mobile_usage_2021.date})
          >= 7 AND extract_months(${mobile_usage_2021.date}) <= 9, "Q3", "Q4")))',
        label: Quarter, value_format: !!null '', value_format_name: !!null ''}]
    show_view_names: false
    show_row_numbers: false
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '20'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      mobile_usage_2021.dau: DAU
      mobile_prediction.dau_forecast: Target
      mobile_prediction.dau_target: Stretch
    series_column_widths:
      measure: 170
    series_cell_visualizations:
      mobile_usage_2021.dau:
        is_active: false
    series_text_format:
      mobile_usage_2021.dau:
        align: center
      mobile_prediction.dau_forecast:
        align: center
      mobile_prediction.dau_target:
        align: center
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    series_value_format:
      mobile_usage_2021.dau: 0.000,,, "Billion"
      mobile_prediction.dau_forecast: 0.000,,, "Billion"
      mobile_prediction.dau_target: 0.000,,, "Billion"
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
    column_order: {}
    listen: {}
    row: 42
    col: 12
    width: 12
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    body_text: A daily active user is a profile (client_id) that sends a ping on a
      given day. This means that they are NOT required to browse at least 1 URI to
      count towards the total.  The two gray lines are the 80% confidence intervals
      for the forecast.
    row: 16
    col: 12
    width: 12
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    body_text: A daily active user is a profile (client_id) that sends a ping on a
      given day. This means that they are NOT required to browse at least 1 URI to
      count towards the total.  The two gray lines are the 80% confidence intervals
      for the forecast.
    row: 36
    col: 12
    width: 12
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "\"Cumulative Difference vs Forecast\" reflects the difference in current\
      \ CDOU versus expectation from our beginning-of-year forecast. When we are above\
      \ the 0 line, we are tracking above forecast. \n\n\"Cumulative Difference vs\
      \ Target\" reflects the difference in current CDOU versus our +1.24% stretch\
      \ goal. When we are above the 0 line, we are on track to the stretch goal.\n"
    row: 36
    col: 0
    width: 12
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "\"Cumulative Difference vs Forecast\" reflects the difference in current\
      \ CDOU versus expectation from our beginning-of-year forecast. When we are above\
      \ the 0 line, we are tracking above forecast. \n\n\"Cumulative Difference vs\
      \ Target\" reflects the difference in current CDOU versus our +5% stretch goal.\
      \ When we are above the 0 line, we are on track to the stretch goal.\n"
    row: 16
    col: 0
    width: 12
    height: 3
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: after 2021/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_2021
    listens_to_filters: []
    field: firefox_desktop_usage_2021.date
