- dashboard: desktop_kpi_dashboard__editable2
  title: Desktop KPI Dashboard - Editable2
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  refresh: 2147484 seconds
  elements:
  - title: Desktop DAU
    name: Desktop DAU
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.dau, desktop_kpis.date, loines_desktop_dau_forecast_20210119.dau_forecast,
      loines_desktop_dau_forecast_20210119.dau_forecast_lower, loines_desktop_dau_forecast_20210119.dau_forecast_upper]
    fill_fields: [desktop_kpis.date]
    sorts: [desktop_kpis.date desc]
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
    series_types:
      loines_desktop_dau_forecast_20210119.dau_forecast_lower: scatter
      loines_desktop_dau_forecast_20210119.dau_forecast_upper: scatter
      loines_desktop_dau_forecast_20210119.dau_forecast: scatter
    series_colors:
      loines_desktop_dau_forecast_20210119.dau_forecast_upper: "#b7b5c2"
      loines_desktop_dau_forecast_20210119.dau_forecast_lower: "#b7b5c2"
    series_point_styles:
      loines_desktop_dau_forecast_20210119.dau_forecast_lower: triangle
      loines_desktop_dau_forecast_20210119.dau_forecast_upper: triangle-down
    trend_lines: [{color: "#000000", label_position: center, period: 7, regression_type: average,
        series_index: 1, show_label: true}]
    defaults_version: 1
    hidden_fields:
    listen:
      Date: desktop_kpis.date
    row: 23
    col: 0
    width: 24
    height: 9
  - title: Cumulative Days of Use
    name: Cumulative Days of Use
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.date, desktop_kpis.cdou, loines_desktop_dau_forecast_20210119.yhat_cumulative,
      loines_desktop_dau_forecast_20210119.cumulative_forecast_plus5]
    fill_fields: [desktop_kpis.date]
    sorts: [desktop_kpis.date]
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
    hidden_series: []
    series_labels:
      desktop_kpis.cdou: Cumulative Days of Use
      loines_desktop_dau_forecast_20210119.yhat_cumulative: Forecast
      loines_desktop_dau_forecast_20210119.cumulative_forecast_plus5: CDOU Target
        Pace
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: desktop_kpis.date
    row: 14
    col: 12
    width: 12
    height: 9
  - title: Cumulative Desktop Days of Use (CDOU) in 2021
    name: Cumulative Desktop Days of Use (CDOU) in 2021
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.recent_cdou, loines_desktop_dau_forecast_20210119.recent_yhat_cumulative]
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
    value_format: ''
    comparison_label: Forecasted CDOU as of today
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 5
    height: 5
  - title: CDOU Difference From Forecast
    name: CDOU Difference From Forecast
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.delta_from_forecast, loines_desktop_dau_forecast_20210119.recent_yhat_cumulative]
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
    value_format: ''
    comparison_label: Expected CDOU Today From Jan Forecast
    conditional_formatting: [{type: less than, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 2
    col: 5
    width: 5
    height: 5
  - title: Current Delta From CDOU Target Pace
    name: Current Delta From CDOU Target Pace
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.delta_from_target, loines_desktop_dau_forecast_20210119.recent_cumulative_forecast_plus5]
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
    comparison_label: Expected CDOU Today if We Were On Track
    conditional_formatting: [{type: less than, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 2
    col: 10
    width: 5
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Top Line Numbers"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Number of Desktop New Profiles in 2021
    name: Number of Desktop New Profiles in 2021
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.recent_new_profiles_cumulative, loines_desktop_new_profiles_forecast_20210119.recent_yhat_cumulative]
    limit: 500
    filter_expression: "${desktop_kpis.date} >= date(2021,1,1)"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: New Profiles Expected Today From Forecast
    defaults_version: 1
    listen: {}
    row: 7
    col: 0
    width: 5
    height: 5
  - title: Difference in New Profiles From Forecast
    name: Difference in New Profiles From Forecast
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.delta_from_forecast_new_profiles, loines_desktop_new_profiles_forecast_20210119.recent_yhat_cumulative]
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
    comparison_label: Expected New Profiles To Date From Jan Forecast
    conditional_formatting: [{type: less than, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 7
    col: 5
    width: 5
    height: 5
  - title: Delta From New Profile Target Pace
    name: Delta From New Profile Target Pace
    model: firefox-desktop
    explore: desktop_kpis
    type: single_value
    fields: [desktop_kpis.delta_from_target_new_profiles, loines_desktop_new_profiles_forecast_20210119.recent_cumulative_forecast_plus5]
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
    comparison_label: Expected New Profiles Today if We Were on Track
    conditional_formatting: [{type: less than, value: 0, background_color: "#B32F37",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    listen: {}
    row: 7
    col: 10
    width: 5
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Desktop Days of Use and DAU"
    row: 12
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Desktop New Profiles"
    row: 32
    col: 0
    width: 24
    height: 2
  - title: Cumulative Difference from CDOU Forecast
    name: Cumulative Difference from CDOU Forecast
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.date, desktop_kpis.delta_from_forecast_count]
    fill_fields: [desktop_kpis.date]
    sorts: [desktop_kpis.date]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: desktop_kpis.delta_from_forecast_count_running,
            id: desktop_kpis.delta_from_forecast_count_running, name: Delta From Forecast
              Count Running}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    listen:
      Date: desktop_kpis.date
    row: 14
    col: 0
    width: 12
    height: 9
  - title: Cumulative Desktop New Profiles
    name: Cumulative Desktop New Profiles
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.date, desktop_kpis.new_profiles_cumulative, loines_desktop_new_profiles_forecast_20210119.yhat_cumulative,
      loines_desktop_new_profiles_forecast_20210119.cumulative_new_profiles_forecast_plus5]
    fill_fields: [desktop_kpis.date]
    sorts: [desktop_kpis.date]
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
      loines_desktop_new_profiles_forecast_20210119.yhat_cumulative: Forecast
      loines_desktop_new_profiles_forecast_20210119.cumulative_new_profiles_forecast_plus5: Target
        Pace
      desktop_kpis.new_profiles_cumulative: Cumulative New Profiles
    defaults_version: 1
    listen:
      Date: desktop_kpis.date
    row: 34
    col: 12
    width: 12
    height: 9
  - title: Daily Desktop New Profiles
    name: Daily Desktop New Profiles
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.new_profiles, desktop_kpis.date, loines_desktop_new_profiles_forecast_20210119.yhat,
      loines_desktop_new_profiles_forecast_20210119.yhat_lower, loines_desktop_new_profiles_forecast_20210119.yhat_upper]
    fill_fields: [desktop_kpis.date]
    sorts: [desktop_kpis.date desc]
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
    series_types:
      loines_desktop_new_profiles_forecast_20210119.yhat_lower: scatter
      loines_desktop_new_profiles_forecast_20210119.yhat_upper: scatter
      loines_desktop_new_profiles_forecast_20210119.yhat: scatter
    series_colors:
      loines_desktop_new_profiles_forecast_20210119.yhat_lower: "#b7b5c2"
      loines_desktop_new_profiles_forecast_20210119.yhat_upper: "#b7b5c2"
      loines_desktop_new_profiles_forecast_20210119.yhat: "#E52592"
    series_labels:
      loines_desktop_new_profiles_forecast_20210119.yhat_lower: Forecast Lower
      loines_desktop_new_profiles_forecast_20210119.yhat_upper: Forecast Upper
      loines_desktop_new_profiles_forecast_20210119.yhat: Forecast
    series_point_styles:
      loines_desktop_new_profiles_forecast_20210119.yhat_lower: triangle
      loines_desktop_new_profiles_forecast_20210119.yhat_upper: triangle-down
    defaults_version: 1
    listen:
      Date: desktop_kpis.date
    row: 43
    col: 0
    width: 24
    height: 10
  - title: Cumulative Difference from New Profile Forecast
    name: Cumulative Difference from New Profile Forecast
    model: firefox-desktop
    explore: desktop_kpis
    type: looker_line
    fields: [desktop_kpis.date, desktop_kpis.delta_from_forecast_new_profiles_count]
    fill_fields: [desktop_kpis.date]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: desktop_kpis.delta_from_forecast_new_profiles_count_running,
            id: desktop_kpis.delta_from_forecast_new_profiles_count_running, name: Delta
              From Forecast New Profiles Count Running}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      Date: desktop_kpis.date
    row: 34
    col: 0
    width: 12
    height: 9
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: after 2021/01/01
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: firefox-desktop
    explore: desktop_kpis
    listens_to_filters: []
    field: desktop_kpis.date
