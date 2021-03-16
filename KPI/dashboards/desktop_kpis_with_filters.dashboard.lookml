- dashboard: desktop_kpi_dashboard_with_filters__editable
  title: Desktop KPI Dashboard with Filters - editable
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  refresh: 2147484 seconds
  elements:
  - title: Desktop DAU
    name: Desktop DAU
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.dau, firefox_desktop_usage_2021.date, prediction.dau_forecast,
      prediction.dau_forecast_lower, prediction.dau_forecast_upper]
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
    series_types:
      prediction.dau_forecast_lower: scatter
      prediction.dau_forecast_upper: scatter
      prediction.dau_forecast: scatter
    series_colors:
      prediction.dau_forecast_upper: "#b7b5c2"
      prediction.dau_forecast_lower: "#b7b5c2"
    series_point_styles:
      prediction.dau_forecast_lower: triangle
      prediction.dau_forecast_upper: triangle-down
    trend_lines: [{color: "#000000", label_position: center, period: 7, regression_type: average,
        series_index: 1, show_label: true}]
    defaults_version: 1
    hidden_fields:
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 23
    col: 0
    width: 24
    height: 9
  - title: Cumulative Days of Use
    name: Cumulative Days of Use
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
    hidden_series: []
    series_labels:
      firefox_desktop_usage_2021.cdou: Cumulative Days of Use
      prediction.cdou_forecast: Forecast
      prediction.cdou_target: CDOU Target Pace
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 14
    col: 12
    width: 12
    height: 9
  - title: Cumulative Desktop Days of Use (CDOU) in 2021
    name: Cumulative Desktop Days of Use (CDOU) in 2021
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.recent_cdou, prediction.recent_cdou_forecast]
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 2
    col: 0
    width: 5
    height: 5
  - title: CDOU Difference From Forecast
    name: CDOU Difference From Forecast
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 2
    col: 5
    width: 5
    height: 5
  - title: Current Delta From CDOU Target Pace
    name: Current Delta From CDOU Target Pace
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_target, prediction.recent_cdou_target]
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
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
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.recent_new_profiles_cumulative, prediction.recent_cum_new_profiles_forecast]
    limit: 500
    filter_expression: "${firefox_desktop_usage_2021.date} >= date(2021,1,1)"
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 7
    col: 0
    width: 5
    height: 5
  - title: Difference in New Profiles From Forecast
    name: Difference in New Profiles From Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_forecast_new_profiles, prediction.recent_cum_new_profiles_forecast]
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 7
    col: 5
    width: 5
    height: 5
  - title: Delta From New Profile Target Pace
    name: Delta From New Profile Target Pace
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_target_new_profiles, prediction.recent_cum_new_profiles_target]
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
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
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
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count_running,
            id: firefox_desktop_usage_2021.delta_from_forecast_count_running, name: Delta
              From Forecast Count Running}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 14
    col: 0
    width: 12
    height: 9
  - title: Cumulative Desktop New Profiles
    name: Cumulative Desktop New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_cumulative,
      prediction.cum_new_profiles_forecast, prediction.cum_new_profiles_target]
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
    series_labels:
      prediction.cum_new_profiles_forecast: Forecast
      prediction.cum_new_profiles_target: Target Pace
      firefox_desktop_usage_2021.new_profiles_cumulative: Cumulative New Profiles
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 34
    col: 12
    width: 12
    height: 9
  - title: Daily Desktop New Profiles
    name: Daily Desktop New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.new_profiles, firefox_desktop_usage_2021.date,
      prediction.new_profiles_forecast, prediction.new_profiles_forecast_lower, prediction.new_profiles_forecast_upper]
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
    series_types:
      prediction.new_profiles_forecast_lower: scatter
      prediction.new_profiles_forecast_upper: scatter
      prediction.new_profiles_forecast: scatter
    series_colors:
      prediction.new_profiles_forecast_lower: "#b7b5c2"
      prediction.new_profiles_forecast_upper: "#b7b5c2"
      prediction.new_profiles_forecast: "#E52592"
    series_labels:
      prediction.new_profiles_forecast_lower: Forecast Lower
      prediction.new_profiles_forecast_upper: Forecast Upper
      prediction.new_profiles_forecast: Forecast
    series_point_styles:
      prediction.new_profiles_forecast_lower: triangle
      prediction.new_profiles_forecast_upper: triangle-down
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 43
    col: 0
    width: 24
    height: 10
  - title: Cumulative Difference from New Profile Forecast
    name: Cumulative Difference from New Profile Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count]
    fill_fields: [firefox_desktop_usage_2021.date]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count_running,
            id: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count_running,
            name: Delta From Forecast New Profiles Count Running}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
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
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_2021
    listens_to_filters: []
    field: firefox_desktop_usage_2021.date
  - name: Channel
    title: Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.channel
  - name: Activity Segment
    title: Activity Segment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.activity_segment
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
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.country
  - name: OS
    title: OS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.os
  - name: Attributed (Yes / No)
    title: Attributed (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.attributed
