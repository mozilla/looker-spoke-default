- dashboard: mobile_kpis
  title: Mobile KPIs
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 12 hours
  elements:
  - title: Firefox for Android (Fennec + Fenix) Daily Active Users (DAU)
    name: Firefox for Android (Fennec + Fenix) Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
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
            name: Forecast Upper Bound}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_prediction.dau_forecast_lower_7day_ma: "#80868B"
      mobile_prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      mobile_prediction.dau_forecast_upper_7day_ma: Forecast Upper Bound
      mobile_prediction.dau_forecast_lower_7day_ma: Forecast Lower Bound
      mobile_prediction.dau_forecast_7day_ma: DAU Forecast (7 Day MA)
      mobile_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 17
    col: 12
    width: 12
    height: 10
  - title: Focus Android Daily Active Users (DAU)
    name: Focus Android Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
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
            name: Forecast Upper Bound}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_prediction.dau_forecast_lower_7day_ma: "#80868B"
      mobile_prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      mobile_prediction.dau_forecast_upper_7day_ma: Forecast Upper Bound
      mobile_prediction.dau_forecast_lower_7day_ma: Forecast Lower Bound
      mobile_prediction.dau_forecast_7day_ma: DAU Forecast (7 Day MA)
      mobile_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 72
    col: 11
    width: 13
    height: 9
  - title: Firefox for iOS Daily Active Users (DAU)
    name: Firefox for iOS Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
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
            name: Forecast Upper Bound}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_prediction.dau_forecast_lower_7day_ma: "#80868B"
      mobile_prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      mobile_prediction.dau_forecast_upper_7day_ma: Forecast Upper Bound
      mobile_prediction.dau_forecast_lower_7day_ma: Forecast Lower Bound
      mobile_prediction.dau_forecast_7day_ma: DAU Forecast (7 Day MA)
      mobile_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 45
    col: 12
    width: 12
    height: 9
  - title: Focus iOS Daily Active Users (DAU)
    name: Focus iOS Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
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
            name: Forecast Upper Bound}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_prediction.dau_forecast_lower_7day_ma: "#80868B"
      mobile_prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      mobile_prediction.dau_forecast_upper_7day_ma: Forecast Upper Bound
      mobile_prediction.dau_forecast_lower_7day_ma: Forecast Lower Bound
      mobile_prediction.dau_forecast_7day_ma: DAU Forecast (7 Day MA)
      mobile_usage_2021.dau_7day_ma: DAU (7 Day Moving Average)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 98
    col: 11
    width: 13
    height: 8
  - title: Firefox for Android (Fennec + Fenix)
    name: Firefox for Android (Fennec + Fenix)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_format]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 0
    col: 0
    width: 24
    height: 8
  - title: Focus for Android
    name: Focus for Android
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_format]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 54
    col: 0
    width: 24
    height: 9
  - title: Firefox for iOS
    name: Firefox for iOS
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_format]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 27
    col: 0
    width: 24
    height: 9
  - title: Focus for iOS
    name: Focus for iOS
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_format]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 81
    col: 0
    width: 24
    height: 8
  - title: Firefox for Android CDOU Burn-Up
    name: Firefox for Android CDOU Burn-Up
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
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
    series_types: {}
    series_labels:
      mobile_usage_2021.cdou: Cumulative Days of Use (CDOU)
      mobile_prediction.cdou_forecast: CDOU Forecast
      mobile_prediction.cdou_target: CDOU Target Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 8
    col: 12
    width: 12
    height: 9
  - title: Firefox for iOS CDOU Burn-Up
    name: Firefox for iOS CDOU Burn-Up
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
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
    series_types: {}
    series_labels:
      mobile_usage_2021.cdou: Cumulative Days of Use (CDOU)
      mobile_prediction.cdou_forecast: CDOU Forecast
      mobile_prediction.cdou_target: CDOU Target Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 36
    col: 12
    width: 12
    height: 9
  - title: Focus for iOS CDOU Burn-Up
    name: Focus for iOS CDOU Burn-Up
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
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
    series_types: {}
    series_labels:
      mobile_usage_2021.cdou: Cumulative Days of Use (CDOU)
      mobile_prediction.cdou_forecast: CDOU Forecast
      mobile_prediction.cdou_target: CDOU Target Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 89
    col: 11
    width: 13
    height: 9
  - title: Focus for Android CDOU Burn-Up
    name: Focus for Android CDOU Burn-Up
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
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
    series_types: {}
    series_labels:
      mobile_usage_2021.cdou: Cumulative Days of Use (CDOU)
      mobile_prediction.cdou_forecast: CDOU Forecast
      mobile_prediction.cdou_target: CDOU Target Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 63
    col: 11
    width: 13
    height: 9
  - title: Cumulative Difference vs Target / Forecast
    name: Cumulative Difference vs Target / Forecast
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_target_count,
            id: mobile_usage_2021.delta_from_target_count, name: Delta From Target
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Delta From Forecast Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Difference From Target
      mobile_usage_2021.delta_from_forecast_count: Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Target (Left) / Forecast (Right)}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 8
    col: 0
    width: 12
    height: 9
  - title: Cumulative Difference vs Target / Forecast
    name: Cumulative Difference vs Target / Forecast (2)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_target_count,
            id: mobile_usage_2021.delta_from_target_count, name: Delta From Target
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Delta From Forecast Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Difference From Target
      mobile_usage_2021.delta_from_forecast_count: Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Target (Left) / Forecast (Right)}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 89
    col: 0
    width: 11
    height: 9
  - title: Cumulative Difference vs Target / Forecast
    name: Cumulative Difference vs Target / Forecast (3)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_target_count,
            id: mobile_usage_2021.delta_from_target_count, name: Delta From Target
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Delta From Forecast Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Difference From Target
      mobile_usage_2021.delta_from_forecast_count: Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Target (Left) / Forecast (Right)}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 63
    col: 0
    width: 11
    height: 9
  - title: Cumulative Difference vs Target / Forecast
    name: Cumulative Difference vs Target / Forecast (4)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_target_count,
            id: mobile_usage_2021.delta_from_target_count, name: Delta From Target
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Delta From Forecast Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Difference From Target
      mobile_usage_2021.delta_from_forecast_count: Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Target (Left) / Forecast (Right)}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
    row: 36
    col: 0
    width: 12
    height: 9
  - title: Firefox for Android New Profiles Per Day
    name: Firefox for Android New Profiles Per Day
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.new_profiles_7day_ma,
            id: mobile_usage_2021.new_profiles_7day_ma, name: New Profiles 7day Ma}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 19
    col: 0
    width: 12
    height: 8
  - title: Firefox for iOS New Profiles Per Day
    name: Firefox for iOS New Profiles Per Day
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.new_profiles_7day_ma,
            id: mobile_usage_2021.new_profiles_7day_ma, name: New Profiles 7day Ma}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 47
    col: 0
    width: 12
    height: 7
  - title: Focus for iOS New Profiles Per Day
    name: Focus for iOS New Profiles Per Day
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.new_profiles_7day_ma,
            id: mobile_usage_2021.new_profiles_7day_ma, name: New Profiles 7day Ma}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 100
    col: 0
    width: 11
    height: 6
  - title: Focus for Android New Profiles Per Day
    name: Focus for Android New Profiles Per Day
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.new_profiles_7day_ma,
            id: mobile_usage_2021.new_profiles_7day_ma, name: New Profiles 7day Ma}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 74
    col: 0
    width: 11
    height: 7
  - title: 2021 Cumulative New Profiles (Copy)
    name: 2021 Cumulative New Profiles (Copy)
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_cumulative, mobile_usage_2021.year_over_year_new_profiles_cumulative,
      mobile_usage_2021.year_over_year_new_profiles_delta]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
      mobile_usage_2021.date: after 2021/01/01
    sorts: [mobile_usage_2021.date]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '15'
    rows_font_size: '30'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      mobile_usage_2021.new_profiles_cumulative: 2021  New Profiles
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 2020 New Profiles
      mobile_usage_2021.year_over_year_new_profiles_delta: YoY % Change
    series_column_widths:
      mobile_usage_2021.date: 197
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 183
      mobile_usage_2021.new_profiles_cumulative: 201
    series_cell_visualizations:
      mobile_usage_2021.new_profiles_cumulative:
        is_active: false
    series_text_format:
      mobile_usage_2021.new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_delta:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '1'
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    title_hidden: true
    listen: {}
    row: 17
    col: 0
    width: 12
    height: 2
  - title: 2021 Cumulative New Profiles (Copy 0)
    name: 2021 Cumulative New Profiles (Copy 0)
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_cumulative, mobile_usage_2021.year_over_year_new_profiles_cumulative,
      mobile_usage_2021.year_over_year_new_profiles_delta]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
      mobile_usage_2021.date: after 2021/01/01
    sorts: [mobile_usage_2021.date]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '15'
    rows_font_size: '30'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      mobile_usage_2021.new_profiles_cumulative: 2021  New Profiles
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 2020 New Profiles
      mobile_usage_2021.year_over_year_new_profiles_delta: YoY % Change
    series_column_widths:
      mobile_usage_2021.date: 197
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 183
      mobile_usage_2021.new_profiles_cumulative: 185
    series_cell_visualizations:
      mobile_usage_2021.new_profiles_cumulative:
        is_active: false
    series_text_format:
      mobile_usage_2021.new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_delta:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '1'
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    title_hidden: true
    row: 45
    col: 0
    width: 12
    height: 2
  - title: 2021 Cumulative New Profiles (Copy 3)
    name: 2021 Cumulative New Profiles (Copy 3)
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_cumulative, mobile_usage_2021.year_over_year_new_profiles_cumulative,
      mobile_usage_2021.year_over_year_new_profiles_delta]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
      mobile_usage_2021.date: after 2021/01/01
    sorts: [mobile_usage_2021.date]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '15'
    rows_font_size: '30'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      mobile_usage_2021.new_profiles_cumulative: 2021  New Profiles
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 2020 New Profiles
      mobile_usage_2021.year_over_year_new_profiles_delta: YoY % Change
    series_column_widths:
      mobile_usage_2021.date: 197
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 183
      mobile_usage_2021.new_profiles_cumulative: 185
    series_cell_visualizations:
      mobile_usage_2021.new_profiles_cumulative:
        is_active: false
    series_text_format:
      mobile_usage_2021.new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_delta:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '1'
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    title_hidden: true
    row: 72
    col: 0
    width: 11
    height: 2
  - title: 2021 Cumulative New Profiles (Copy 2)
    name: 2021 Cumulative New Profiles (Copy 2)
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_cumulative, mobile_usage_2021.year_over_year_new_profiles_cumulative,
      mobile_usage_2021.year_over_year_new_profiles_delta]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
      mobile_usage_2021.date: after 2021/01/01
    sorts: [mobile_usage_2021.date]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '15'
    rows_font_size: '30'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      mobile_usage_2021.new_profiles_cumulative: 2021  New Profiles
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 2020 New Profiles
      mobile_usage_2021.year_over_year_new_profiles_delta: YoY % Change
    series_column_widths:
      mobile_usage_2021.date: 197
      mobile_usage_2021.year_over_year_new_profiles_cumulative: 183
      mobile_usage_2021.new_profiles_cumulative: 185
    series_cell_visualizations:
      mobile_usage_2021.new_profiles_cumulative:
        is_active: false
    series_text_format:
      mobile_usage_2021.new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_cumulative:
        align: left
      mobile_usage_2021.year_over_year_new_profiles_delta:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '1'
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    title_hidden: true
    row: 98
    col: 0
    width: 11
    height: 2
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
    explore: mobile_usage_2021
    listens_to_filters: []
    field: mobile_usage_2021.date
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: kpi
    explore: mobile_usage_fields
    listens_to_filters: []
    field: mobile_usage_fields.country
