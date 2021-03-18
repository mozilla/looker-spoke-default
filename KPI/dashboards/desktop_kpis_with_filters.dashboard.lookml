- dashboard: desktop_kpi_dashboard_with_filters
  title: Desktop KPI Dashboard with Filters
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 day
  elements:
  - title: Desktop Daily Active Users (DAU)
    name: Desktop Daily Active Users (DAU)
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
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 25
    col: 0
    width: 24
    height: 9
  - title: Cumulative Days of Use (CDOU)
    name: Cumulative Days of Use (CDOU)
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
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in CDOU since Jan 1, in comparison to forecast
      and the +5% Target Pace.
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 16
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
    note_state: collapsed
    note_display: hover
    note_text: CDOU is the sum of DAU (Daily Active Users) for the year to-date. The
      target for CDOU is +5% over forecast. An Fx profile counts to DAU on days that
      we receive a main ping from them.
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 4
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
    note_state: collapsed
    note_display: hover
    note_text: 'Forecasts are derived using the prophet method. Official forecasts
      are fixed as of Jan 19th and are NOT updated. '
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 4
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
    note_state: collapsed
    note_display: hover
    note_text: 'The target pace is set by adding 5% to the forecast. '
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 4
    col: 10
    width: 5
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Top Line Numbers\nHover on the info icons for more…. info on each\
      \ chart.\n\nAbout the filters:\n\nSee [this documentation](https://docs.telemetry.mozilla.org/concepts/segments.html#activity-segments-informal)\
      \ for information about how the activity segments are defined.\n\n\"Attributed\"\
      \ profiles are those tagged as having originated via a download from mozilla.org.\
      \ (Previously known as the \"light funnel\"). "
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Cumulative Desktop New Profiles in 2021
    name: Cumulative Desktop New Profiles in 2021
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
    note_state: collapsed
    note_display: hover
    note_text: 'For the KPI we count a profile as new on the date we receive their
      first main ping. Note not all new clients send us a main ping - some churn before
      this point. They are not counted. '
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 9
    col: 0
    width: 5
    height: 5
  - title: Cumulative Desktop New Profiles in 2021
    name: Cumulative Desktop New Profiles in 2021 (2)
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
    note_state: collapsed
    note_display: hover
    note_text: 'Forecasts are derived using the prophet method. Official forecasts
      are fixed as of Jan 19th and are NOT updated. '
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 9
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
    comparison_label: Expected New Profiles to Date if We Were on Track
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
    row: 9
    col: 10
    width: 5
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Desktop Days of Use and DAU"
    row: 14
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Desktop New Profiles"
    row: 34
    col: 0
    width: 24
    height: 2
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_count, name: Delta
              From Forecast Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: firefox_desktop_usage_2021.delta_from_target_count,
            id: firefox_desktop_usage_2021.delta_from_target_count, name: Delta From
              Target Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#1A73E8",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between CDOU and (1) the forecast (Dark Blue)
      and (2) the Target (Light Blue). Positive numbers indicate that we are above
      forecast/target, negative numbers indicate we are below. Positive numbers indicate
      that we are above forecast/target, negative numbers indicate we are below.
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 16
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
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in cumulative new profiles since Jan 1, in comparison
      to forecast and the +5% Target Pace.
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 36
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
    note_state: collapsed
    note_display: hover
    note_text: 'An Fx profile counts as new on the day that we receive their first
      main ping. The upper and lower bounds of the forecast (triangles) show the 10th
      and 90th percentiles of forecasted new profiles for that day. '
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 45
    col: 0
    width: 24
    height: 10
  - title: Difference from Cumulative New Profile Forecast
    name: Difference from Cumulative New Profile Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
      firefox_desktop_usage_2021.delta_from_target_new_profiles_count]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            name: Delta From Forecast New Profiles Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: Difference From Target, orientation: right, series: [{axisId: firefox_desktop_usage_2021.delta_from_target_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_target_new_profiles_count, name: Delta
              From Target New Profiles Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#1A73E8",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between the cumulative number of new profiles
      and (1) the forecast (Dark Blue) and (2) the Target (Light Blue). Positive numbers
      indicate that we are above forecast/target, negative numbers indicate we are
      below.
    listen:
      Date: firefox_desktop_usage_2021.date
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Country: firefox_desktop_usage_2021.country
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
    row: 36
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
