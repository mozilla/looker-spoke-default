- dashboard: mobile_kr_dashboard
  title: Mobile KR Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 2147484 seconds
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
      Country: mobile_usage_2021.country
    row: 48
    col: 0
    width: 24
    height: 7
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
      Country: mobile_usage_2021.country
    row: 111
    col: 0
    width: 24
    height: 7
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
      Country: mobile_usage_2021.country
    row: 80
    col: 0
    width: 24
    height: 7
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
      Country: mobile_usage_2021.country
    row: 142
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
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 39
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
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 71
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
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 133
    col: 12
    width: 12
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
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 102
    col: 12
    width: 12
    height: 9
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast
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
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      mobile_usage_2021.delta_from_target_count: "#3FE1B0"
      mobile_usage_2021.delta_from_forecast_count: "#0060E0"
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference vs Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference vs Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 39
    col: 0
    width: 12
    height: 9
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast (2)
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
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference From Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 133
    col: 0
    width: 12
    height: 9
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast (3)
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
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference from Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 102
    col: 0
    width: 12
    height: 9
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast (4)
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
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      mobile_usage_2021.delta_from_target_count: "#0060E0"
      mobile_usage_2021.delta_from_forecast_count: "#3FE1B0"
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference vs Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference From Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 71
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
    row: 55
    col: 12
    width: 12
    height: 9
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
    row: 87
    col: 12
    width: 12
    height: 8
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
    row: 150
    col: 12
    width: 12
    height: 7
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
    row: 118
    col: 12
    width: 12
    height: 8
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
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 55
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
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 87
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
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 118
    col: 0
    width: 12
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
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 150
    col: 0
    width: 12
    height: 2
  - title: Untitled
    name: Untitled
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast, mobile_prediction.recent_cdou_forecast]
    filters:
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.app_name: '"fennec_fenix"'
    sorts: [mobile_usage_2021.delta_from_forecast desc]
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
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
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
    listen:
      Country: mobile_usage_2021.country
    row: 35
    col: 8
    width: 8
    height: 4
  - title: Untitled
    name: Untitled (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.recent_cdou]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
      mobile_usage_2021.date: after 2021/01/01
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
      Country: mobile_usage_2021.country
    row: 35
    col: 0
    width: 8
    height: 4
  - title: Untitled
    name: Untitled (3)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target, mobile_prediction.recent_cdou_target]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
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
    listen:
      Country: mobile_usage_2021.country
    row: 35
    col: 16
    width: 8
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Firefox
      iOS Days of Use and DAU</h1>'
    row: 64
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Firefox
      Focus for iOS Days of Use and DAU</h1>'
    row: 126
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Firefox
      Android (Fennec + Fenix) Days of Use and DAU</h1>'
    row: 32
    col: 0
    width: 24
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Firefox
      Focus for Android Days of Use and DAU</h1>'
    row: 95
    col: 0
    width: 24
    height: 3
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.recent_cdou]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
      mobile_usage_2021.date: after 2021/01/01
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
      Country: mobile_usage_2021.country
    row: 67
    col: 0
    width: 8
    height: 4
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast, mobile_prediction.recent_cdou_forecast]
    filters:
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.app_name: '"firefox_ios"'
    sorts: [mobile_usage_2021.delta_from_forecast desc]
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
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
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
    listen:
      Country: mobile_usage_2021.country
    row: 67
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 4)
    name: Untitled (Copy 4)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.recent_cdou]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
      mobile_usage_2021.date: after 2021/01/01
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
      Country: mobile_usage_2021.country
    row: 98
    col: 0
    width: 8
    height: 4
  - title: Untitled (Copy 6)
    name: Untitled (Copy 6)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target, mobile_prediction.recent_cdou_target]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
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
    listen:
      Country: mobile_usage_2021.country
    row: 98
    col: 16
    width: 8
    height: 4
  - title: Untitled (Copy 8)
    name: Untitled (Copy 8)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast, mobile_prediction.recent_cdou_forecast]
    filters:
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.app_name: '"focus_ios"'
    sorts: [mobile_usage_2021.delta_from_forecast desc]
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
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
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
    listen:
      Country: mobile_usage_2021.country
    row: 129
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target, mobile_prediction.recent_cdou_target]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
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
    listen:
      Country: mobile_usage_2021.country
    row: 67
    col: 16
    width: 8
    height: 4
  - title: Untitled (Copy 5)
    name: Untitled (Copy 5)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast, mobile_prediction.recent_cdou_forecast]
    filters:
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.app_name: '"focus_android"'
    sorts: [mobile_usage_2021.delta_from_forecast desc]
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
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
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
    listen:
      Country: mobile_usage_2021.country
    row: 98
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 7)
    name: Untitled (Copy 7)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.recent_cdou]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
      mobile_usage_2021.date: after 2021/01/01
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
      Country: mobile_usage_2021.country
    row: 129
    col: 0
    width: 8
    height: 4
  - title: Untitled (Copy 9)
    name: Untitled (Copy 9)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target, mobile_prediction.recent_cdou_target]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
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
    listen:
      Country: mobile_usage_2021.country
    row: 129
    col: 16
    width: 8
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Overall
      Mobile Days of Use and DAU</h1>'
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Overall Mobile Differene From CDOU Forecast
    name: Overall Mobile Differene From CDOU Forecast
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_forecast_daily, mobile_prediction.dau_forecast_format]
    filters:
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Forecast
    value_format: ''
    comparison_label: Forecasted CDOU as of today
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
    hidden_fields: []
    listen:
      Country: mobile_usage_2021.country
    row: 3
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 12)
    name: Untitled (Copy 12)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.delta_from_target_daily, mobile_prediction.dau_target_format]
    filters:
      mobile_usage_2021.date: after 2021/01/01
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
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
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
    listen:
      Country: mobile_usage_2021.country
    row: 3
    col: 16
    width: 8
    height: 4
  - title: Overall Mobile CDOU Burn-Up
    name: Overall Mobile CDOU Burn-Up
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou, mobile_prediction.cdou_forecast,
      mobile_prediction.cdou_target]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: ''
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
      mobile_prediction.cdou_forecast: Forecast
      mobile_prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 7
    col: 12
    width: 12
    height: 9
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast (5)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: ''
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
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      mobile_usage_2021.delta_from_target_count: "#3FE1B0"
      mobile_usage_2021.delta_from_forecast_count: "#0060E0"
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference vs Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference vs Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 7
    col: 0
    width: 12
    height: 9
  - title: Untitled (Copy 10)
    name: Untitled (Copy 10)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.dau]
    filters:
      mobile_usage_2021.date: after 2021/01/01
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
    value_format: 0.000,,, "Billion"
    defaults_version: 1
    hidden_fields: []
    listen:
      Country: mobile_usage_2021.country
    row: 3
    col: 0
    width: 8
    height: 4
  - title: Overall Mobile Daily Active Users (DAU)
    name: Overall Mobile Daily Active Users (DAU)
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.dau_7day_ma, mobile_prediction.dau_forecast_7day_ma,
      mobile_prediction.dau_forecast_lower_7day_ma, mobile_prediction.dau_forecast_upper_7day_ma]
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
      Country: mobile_usage_2021.country
    row: 16
    col: 12
    width: 12
    height: 9
  - title: Total Mobile New Profiles Per Day
    name: Total Mobile New Profiles Per Day
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters: {}
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_bottom: deviation, label_position: center, color: "#66b2e0", line_value: '0.05',
        margin_value: '0.05', label: 2021 New Profiles YoY Target}]
    trend_lines: []
    defaults_version: 1
    hidden_fields: [yoy_7_day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 18
    col: 0
    width: 12
    height: 7
  - title: 2021 Cumulative New Profiles (Copy 4)
    name: 2021 Cumulative New Profiles (Copy 4)
    model: kpi
    explore: mobile_usage_2021
    type: looker_grid
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_cumulative, mobile_usage_2021.year_over_year_new_profiles_cumulative,
      mobile_usage_2021.year_over_year_new_profiles_delta]
    fill_fields: [mobile_usage_2021.date]
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
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 16
    col: 0
    width: 12
    height: 2
  - title: Total Mobile New Profiles 7 Day Moving Average YoY
    name: Total Mobile New Profiles 7 Day Moving Average YoY
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters: {}
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: yoy_7_day_ma, id: yoy_7_day_ma,
            name: YoY Variance}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: false
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_bottom: deviation, label_position: center, color: "#66b2e0", line_value: '0.05',
        margin_value: '0.05', label: 2021 New Profiles YoY Target}]
    trend_lines: []
    defaults_version: 1
    hidden_fields: [mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 25
    col: 0
    width: 12
    height: 7
  - title: Firefox for iOS New Profiles 7 Day Moving Average YoY
    name: Firefox for iOS New Profiles 7 Day Moving Average YoY
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: yoy_7_day_ma, id: yoy_7_day_ma,
            name: YoY Variance}], showLabels: true, showValues: true, maxValue: 0.5,
        minValue: -0.5, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    hidden_fields: [mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 89
    col: 0
    width: 12
    height: 6
  - title: Focus Android New Profiles 7 Day Moving Average YoY
    name: Focus Android New Profiles 7 Day Moving Average YoY
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_android"'
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: yoy_7_day_ma, id: yoy_7_day_ma,
            name: YoY Variance}], showLabels: true, showValues: true, maxValue: 1,
        minValue: -1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    hidden_fields: [mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 120
    col: 0
    width: 12
    height: 6
  - title: Firefox Android New Profiles 7 Day Moving Average YoY
    name: Firefox Android New Profiles 7 Day Moving Average YoY
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: yoy_7_day_ma, id: yoy_7_day_ma,
            name: YoY Variance}], showLabels: true, showValues: true, maxValue: 0.5,
        minValue: -0.5, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    hidden_fields: [mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 57
    col: 0
    width: 12
    height: 7
  - title: Focus for iOS New Profiles 7 Day Moving Average YoY
    name: Focus for iOS New Profiles 7 Day Moving Average YoY
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"focus_ios"'
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: yoy_7_day_ma, _type_hint: number,
        category: table_calculation, expression: "${mobile_usage_2021.new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}\
          \ - ${mobile_usage_2021.year_over_year_new_profiles_7day_ma}/${mobile_usage_2021.year_over_year_new_profiles_7day_ma}",
        label: YoY 7 Day MA, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: yoy_7_day_ma, id: yoy_7_day_ma,
            name: YoY Variance}], showLabels: true, showValues: true, maxValue: 0.5,
        minValue: -0.5, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hide_legend: false
    series_colors:
      yoy_7_day_ma: "#0060E0"
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
      yoy_7_day_ma: YoY Variance
    reference_lines: []
    trend_lines: []
    defaults_version: 1
    hidden_fields: [mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    listen:
      Date: mobile_usage_2021.date
      Country: mobile_usage_2021.country
    row: 152
    col: 0
    width: 12
    height: 6
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
