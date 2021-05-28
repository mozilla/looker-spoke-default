- dashboard: firefox_mr1_launch
  title: Firefox MR1 Launch
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  refresh: 1 day
  elements:
  - title: Uplift Desktop
    name: Uplift Desktop
    model: DUET
    explore: version_uplift
    type: looker_column
    fields: [version_uplift.submission_date, version_uplift.Updated, version_uplift.Non_updated]
    fill_fields: [version_uplift.submission_date]
    sorts: [version_uplift.submission_date desc]
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
    stacking: percent
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
    y_axes: [{label: '', orientation: left, series: [{axisId: version_uplift.uplift,
            id: version_uplift.uplift, name: Uplift}], showLabels: true, showValues: true,
        maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: ''
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 8
    height: 8
  - title: Desktop
    name: Desktop
    model: DUET
    explore: version_uplift
    type: single_value
    fields: [version_uplift.submission_date, version_uplift.uplift]
    fill_fields: [version_uplift.submission_date]
    sorts: [version_uplift.submission_date desc]
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
    value_format: "#.##"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [version_uplift.submission_date]
    listen: {}
    row: 4
    col: 0
    width: 8
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      -------------------------
      # Upgrade Adoption

      Release Date: 2021-06-01
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Surveys Engaged
    name: Surveys Engaged
    model: DUET
    explore: surveys
    type: single_value
    fields: [surveys.engaged]
    sorts: [surveys.engaged]
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 48
    col: 9
    width: 8
    height: 5
  - title: Surveys Offered
    name: Surveys Offered
    model: DUET
    explore: surveys
    type: single_value
    fields: [surveys.offered]
    sorts: [surveys.offered]
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
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 48
    col: 0
    width: 9
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |+
      ---------------------------------------------------------------------------------
      # Happiness Survey

    row: 45
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "#### Baseline Happiness Survey Report\n* [Early baseline happiness\
      \ metrics for Proton](https://docs.google.com/presentation/d/1H_Ml_E6-v8P00FMJ5xux7kmvzSx7Z-9NKEPKhnHGGP8/edit#slide=id.gbd50516360_0_140)\n\
      \n#### Proton Happiness Survey: \n* data collection for FX 89 June 4- June 10\n\
      \n#### Proton Happiness Survey \n* data collection for FX 90 July 2- July 8"
    row: 48
    col: 17
    width: 7
    height: 5
  - title: cDOU (Desktop) Difference from Target
    name: cDOU (Desktop) Difference from Target
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_count, name: 'Cdou:
              Absolute Delta from Forecast'}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    listen: {}
    row: 23
    col: 0
    width: 24
    height: 7
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      -----------------------------
      # KPI - Desktop cDOU

      Cumulative Days of Use
    row: 14
    col: 0
    width: 24
    height: 5
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |+
      ---------------------------------
      # Desktop Comparisons

    row: 53
    col: 0
    width: 24
    height: 4
  - title: Default Rate (Overall)
    name: Default Rate (Overall)
    model: DUET
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_default, feature_usage.browser_not_default]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
    sorts: [feature_usage.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: default_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_default}\
          \ / ${feature_usage.cc})", label: Default Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_default,
            id: feature_usage.browser_default, name: Browser Default}, {axisId: feature_usage.browser_not_default,
            id: feature_usage.browser_not_default, name: Browser Not Default}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: "#.##", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 152
    col: 9
    width: 8
    height: 7
  - title: Pinned Rate (Overall)
    name: Pinned Rate (Overall)
    model: DUET
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_pinned, feature_usage.browser_not_pinned]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
    sorts: [feature_usage.browser_pinned]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pinned_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_pinned}\
          \ / ${feature_usage.cc})", label: Pinned Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_pinned,
            id: feature_usage.browser_pinned, name: Browser Pinned}, {axisId: feature_usage.browser_not_pinned,
            id: feature_usage.browser_not_pinned, name: Browser Not Pinned}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: "#.##", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 152
    col: 0
    width: 9
    height: 7
  - title: mozillaorg Desktop Traffic
    name: mozillaorg Desktop Traffic
    model: DUET
    explore: mozorg_ga
    type: looker_grid
    fields: [mozorg_ga.non_fx_sessions, mozorg_ga.non_fx_downloads, mozorg_ga.traffic_type]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.non_fx_sessions desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0}]
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
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
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
    row: 97
    col: 0
    width: 12
    height: 6
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---------------------------------

      # Marketing
    row: 81
    col: 0
    width: 24
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# COMING SOON: Themes (New Profile)"
    row: 159
    col: 17
    width: 7
    height: 7
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |+
      # Earned media

      #### What They're Saying!

      Laptop Mag  (2021-05-01): [Mozilla Firefox update is making me abandon Chrome — Here's why](https://www.laptopmag.com/news/mozilla-firefox-update-is-making-me-abandon-chrome-heres-why)

    row: 84
    col: 0
    width: 8
    height: 6
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# COMING SOON: Themes (Overall)"
    row: 152
    col: 17
    width: 7
    height: 7
  - title: blogmozilla Visits (By Blog)
    name: blogmozilla Visits (By Blog)
    model: DUET
    explore: mozblogs_ga
    type: looker_grid
    fields: [mozblogs_ga.sessions, mozblogs_ga.blog, mozblogs_ga.mobile_sessions,
      mozblogs_ga.desktop_sessions]
    filters:
      mozblogs_ga.date: after 2021/05/18
    sorts: [mozblogs_ga.sessions desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
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
      mozblogs_ga.sessions:
        is_active: true
      mozblogs_ga.mobile_sessions:
        is_active: true
      mozblogs_ga.desktop_sessions:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
    row: 84
    col: 8
    width: 16
    height: 7
  - title: DAU vs Recent Trend
    name: DAU vs Recent Trend
    model: DUET
    explore: forecast_desktopDAU
    type: looker_line
    fields: [forecast_desktopDAU.submission_date, forecast_desktopDAU.upper_bound,
      forecast_desktopDAU.dau, forecast_desktopDAU.lower_bound]
    fill_fields: [forecast_desktopDAU.submission_date]
    filters:
      forecast_desktopDAU.submission_date: after 2021/05/18
    sorts: [forecast_desktopDAU.upper_bound desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_desktopDAU.yhat_lower,
            id: forecast_desktopDAU.yhat_lower, name: Yhat Lower}, {axisId: forecast_desktopDAU.dau,
            id: forecast_desktopDAU.dau, name: Dau}, {axisId: forecast_desktopDAU.yhat_upper,
            id: forecast_desktopDAU.yhat_upper, name: Yhat Upper}], showLabels: true,
        showValues: true, minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      forecast_desktopDAU.yhat_lower: "#e2e8e5"
      forecast_desktopDAU.yhat_upper: "#e2e8e5"
      forecast_desktopDAU.upper_bound: "#cdcfe6"
      forecast_desktopDAU.lower_bound: "#cdcfe6"
      forecast_desktopDAU.dau: "#1A73E8"
    series_point_styles:
      forecast_desktopDAU.upper_bound: diamond
      forecast_desktopDAU.lower_bound: diamond
    reference_lines: []
    defaults_version: 1
    listen: {}
    row: 57
    col: 12
    width: 12
    height: 6
  - title: Status
    name: Status
    model: DUET
    explore: forecast_desktopDAU
    type: single_value
    fields: [forecast_desktopDAU.submission_date, forecast_desktopDAU.lower_diff_pct,
      forecast_desktopDAU.upper_diff_pct, forecast_desktopDAU.status]
    filters:
      forecast_desktopDAU.submission_date: after 2021/05/18
    sorts: [forecast_desktopDAU.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: deltarange, _type_hint: string,
        category: table_calculation, expression: 'concat(to_string(round(${forecast_desktopDAU.upper_diff_pct},
          2)), "% to ", to_string(round(${forecast_desktopDAU.lower_diff_pct}, 2)),
          "%")

          ', label: deltarange, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles: {}
    reference_lines: []
    defaults_version: 1
    hidden_fields: [forecast_desktopDAU.lower_diff_pct, forecast_desktopDAU.upper_diff_pct,
      forecast_desktopDAU.submission_date, deltarange]
    listen: {}
    row: 63
    col: 12
    width: 12
    height: 2
  - title: New Profiles vs Recent Trend
    name: New Profiles vs Recent Trend
    model: DUET
    explore: forecast_desktopNP
    type: looker_line
    fields: [forecast_desktopNP.submission_date, forecast_desktopNP.upper_bound, forecast_desktopNP.new_profiles,
      forecast_desktopNP.lower_bound]
    fill_fields: [forecast_desktopNP.submission_date]
    filters:
      forecast_desktopNP.submission_date: after 2021/05/18
    sorts: [forecast_desktopNP.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_colors:
      forecast_desktopNP.upper_bound: "#cdcfe6"
      forecast_desktopNP.lower_bound: "#cdcfe6"
      forecast_desktopNP.new_profiles: "#9334E6"
    series_point_styles:
      forecast_desktopNP.upper_bound: diamond
      forecast_desktopNP.lower_bound: diamond
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen: {}
    row: 65
    col: 12
    width: 12
    height: 6
  - title: Uplift iOS
    name: Uplift iOS
    model: DUET
    explore: version_uplift_mobile
    type: looker_column
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.Updated,
      version_uplift_mobile.Non_updated]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for iOS
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date]
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
    defaults_version: 1
    listen: {}
    row: 6
    col: 16
    width: 8
    height: 8
  - title: iOS
    name: iOS
    model: DUET
    explore: version_uplift_mobile
    type: single_value
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.uplift]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for iOS
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
    value_format: "#.##"
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
    listen: {}
    row: 4
    col: 16
    width: 8
    height: 2
  - title: Android
    name: Android
    model: DUET
    explore: version_uplift_mobile
    type: single_value
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.uplift]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for Android (Fenix),Firefox for
        Android (Fennec)
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
    value_format: "#.##"
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
    listen: {}
    row: 4
    col: 8
    width: 8
    height: 2
  - title: Uplift Android
    name: Uplift Android
    model: DUET
    explore: version_uplift_mobile
    type: looker_column
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.Updated,
      version_uplift_mobile.Non_updated]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for Android (Fenix),Firefox for
        Android (Fennec)
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
      version_uplift_mobile.Non_updated: "#12B5CB"
      version_uplift_mobile.Updated: "#1A73E8"
    defaults_version: 1
    listen: {}
    row: 6
    col: 8
    width: 8
    height: 8
  - title: cDOU (Mobile) Difference from Target
    name: cDOU (Mobile) Difference from Target
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#1A73E8"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    listen: {}
    row: 38
    col: 0
    width: 24
    height: 7
  - title: cDOU (Actual)
    name: cDOU (Actual)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
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
    show_view_names: false
    show_row_numbers: false
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
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    row: 19
    col: 0
    width: 8
    height: 4
  - title: cDOU (Target)
    name: cDOU (Target)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cdou_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
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
    show_view_names: false
    show_row_numbers: false
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
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    row: 19
    col: 8
    width: 8
    height: 4
  - title: Delta upon Release
    name: Delta upon Release
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: false
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
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    note_state: collapsed
    note_display: above
    listen: {}
    row: 21
    col: 16
    width: 8
    height: 2
  - title: Delta Today
    name: Delta Today
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: false
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
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    row: 19
    col: 16
    width: 8
    height: 2
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      -----------------------------
      # KPI - Mobile cDOU

      Cumulative Days of Use
    row: 30
    col: 0
    width: 24
    height: 4
  - title: Delta Today
    name: Delta Today (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 34
    col: 16
    width: 8
    height: 2
  - title: Delta Upon Release
    name: Delta Upon Release
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: 2021/05/18
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 36
    col: 16
    width: 8
    height: 2
  - title: cDOU (Actual)
    name: cDOU (Actual) (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 34
    col: 0
    width: 8
    height: 4
  - title: cDOU (Target)
    name: cDOU (Target) (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_prediction.cdou_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 34
    col: 8
    width: 8
    height: 4
  - title: Status
    name: Status (2)
    model: DUET
    explore: forecast_desktopNP
    type: single_value
    fields: [forecast_desktopNP.submission_date, forecast_desktopNP.status]
    filters:
      forecast_desktopNP.submission_date: after 2021/05/18
    sorts: [forecast_desktopNP.submission_date desc]
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
    hidden_fields: [forecast_desktopNP.submission_date]
    listen: {}
    row: 71
    col: 12
    width: 12
    height: 2
  - title: New Profiles vs 2020
    name: New Profiles vs 2020
    model: DUET
    explore: dau_desktop
    type: looker_line
    fields: [dau_desktop.submission_date, dau_desktop.new_profiles_2021, dau_desktop.new_profiles_2020]
    fill_fields: [dau_desktop.submission_date]
    filters:
      dau_desktop.submission_date: after 2021/05/18
    sorts: [dau_desktop.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      dau_desktop.new_profiles_2021: "#9334E6"
      dau_desktop.new_profiles_2020: "#12B5CB"
    series_point_styles:
      dau_desktop.new_profiles_2020: diamond
    defaults_version: 1
    listen: {}
    row: 65
    col: 0
    width: 12
    height: 8
  - title: DAU vs 2020
    name: DAU vs 2020
    model: DUET
    explore: dau_desktop
    type: looker_line
    fields: [dau_desktop.submission_date, dau_desktop.DAU_2021, dau_desktop.DAU_2020]
    fill_fields: [dau_desktop.submission_date]
    filters:
      dau_desktop.submission_date: after 2021/05/18
    sorts: [dau_desktop.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      dau_desktop.DAU_2020: "#12B5CB"
      dau_desktop.DAU_2021: "#1A73E8"
    series_point_styles:
      dau_desktop.DAU_2020: diamond
    defaults_version: 1
    listen: {}
    row: 57
    col: 0
    width: 12
    height: 8
  - title: mozillaorg Downloads vs 2020
    name: mozillaorg Downloads vs 2020
    model: DUET
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.non_fx_downloads_2021, mozorg_ga.non_fx_downloads_2020, mozorg_ga.date]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      mozorg_ga.non_fx_downloads_2020: "#12B5CB"
      mozorg_ga.non_fx_downloads_2021: "#F9AB00"
    series_point_styles:
      mozorg_ga.non_fx_downloads_2020: diamond
    defaults_version: 1
    listen: {}
    row: 73
    col: 0
    width: 12
    height: 8
  - title: mozillaorg Downloads vs Recent Trend
    name: mozillaorg Downloads vs Recent Trend
    model: DUET
    explore: forecast_dls
    type: looker_line
    fields: [forecast_dls.upper_bound, forecast_dls.non_fx_downloads, forecast_dls.lower_bound,
      forecast_dls.submission_date]
    fill_fields: [forecast_dls.submission_date]
    filters:
      forecast_dls.submission_date: after 2021/05/18
    sorts: [forecast_dls.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_dls.non_fx_downloads: "#F9AB00"
      forecast_dls.upper_bound: "#cdcfe6"
      forecast_dls.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_dls.upper_bound: diamond
      forecast_dls.lower_bound: diamond
    defaults_version: 1
    listen: {}
    row: 73
    col: 12
    width: 12
    height: 6
  - title: Status
    name: Status (3)
    model: DUET
    explore: forecast_dls
    type: single_value
    fields: [forecast_dls.submission_date, forecast_dls.status]
    filters:
      forecast_dls.submission_date: after 2021/05/18
    sorts: [forecast_dls.submission_date desc]
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
    point_style: circle_outline
    series_colors:
      forecast_dls.non_fx_downloads: "#F9AB00"
      forecast_dls.upper_bound: "#cdcfe6"
      forecast_dls.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_dls.upper_bound: diamond
      forecast_dls.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_dls.submission_date]
    listen: {}
    row: 79
    col: 12
    width: 12
    height: 2
  - title: blogmozilla Visits (By Traffic Type)
    name: blogmozilla Visits (By Traffic Type)
    model: DUET
    explore: mozblogs_ga
    type: looker_grid
    fields: [mozblogs_ga.sessions, mozblogs_ga.mobile_sessions, mozblogs_ga.desktop_sessions,
      mozblogs_ga.traffic_type]
    filters:
      mozblogs_ga.date: after 2021/05/18
    sorts: [mozblogs_ga.sessions desc]
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
    series_cell_visualizations:
      mozblogs_ga.sessions:
        is_active: true
      mozblogs_ga.mobile_sessions:
        is_active: true
      mozblogs_ga.desktop_sessions:
        is_active: true
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
    row: 91
    col: 8
    width: 16
    height: 6
  - title: mozillaorg Mobile Traffic
    name: mozillaorg Mobile Traffic
    model: DUET
    explore: mozorg_ga
    type: looker_grid
    fields: [mozorg_ga.non_fx_sessions, mozorg_ga.non_fx_downloads, mozorg_ga.traffic_type]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: mobile,tablet
    sorts: [mozorg_ga.non_fx_sessions desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0}]
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
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
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
    row: 97
    col: 12
    width: 12
    height: 6
  - title: mozillaorg Mobile Visits (By Traffic Type)
    name: mozillaorg Mobile Visits (By Traffic Type)
    model: DUET
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.date, mozorg_ga.traffic_type, mozorg_ga.non_fx_sessions]
    pivots: [mozorg_ga.traffic_type]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: mobile,tablet
    sorts: [mozorg_ga.date desc, mozorg_ga.traffic_type]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0,
        is_disabled: true}]
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
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 103
    col: 12
    width: 12
    height: 6
  - title: mozillaorg Desktop Visits (By Traffic Type)
    name: mozillaorg Desktop Visits (By Traffic Type)
    model: DUET
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.date, mozorg_ga.traffic_type, mozorg_ga.non_fx_sessions]
    pivots: [mozorg_ga.traffic_type]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.date desc, mozorg_ga.traffic_type]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0,
        is_disabled: true}]
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
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 103
    col: 0
    width: 12
    height: 6
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---------------------------------

      # Mobile Comparisons
    row: 109
    col: 0
    width: 24
    height: 2
  - title: Android DAU vs 2020
    name: Android DAU vs 2020
    model: DUET
    explore: dau_mobile
    type: looker_line
    fields: [dau_mobile.submission_date, dau_mobile.DAU_2021, dau_mobile.DAU_2020]
    fill_fields: [dau_mobile.submission_date]
    filters:
      dau_mobile.canonical_app_name: Firefox for Android (Fennec),Firefox for Android
        (Fenix)
      dau_mobile.submission_date: after 2021/05/18
    sorts: [dau_mobile.DAU_2021 desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles:
      dau_mobile.DAU_2020: diamond
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 111
    col: 0
    width: 12
    height: 9
  - title: iOS DAU vs 2020
    name: iOS DAU vs 2020
    model: DUET
    explore: dau_mobile
    type: looker_line
    fields: [dau_mobile.submission_date, dau_mobile.DAU_2021, dau_mobile.DAU_2020]
    fill_fields: [dau_mobile.submission_date]
    filters:
      dau_mobile.canonical_app_name: Firefox for iOS
      dau_mobile.submission_date: after 2021/05/18
    sorts: [dau_mobile.DAU_2021 desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles:
      dau_mobile.DAU_2020: diamond
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 111
    col: 12
    width: 12
    height: 9
  - title: Android DAU vs Recent Trend
    name: Android DAU vs Recent Trend
    model: DUET
    explore: forecast_mobile_dau
    type: looker_line
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.upper_bound,
      forecast_mobile_dau.dau, forecast_mobile_dau.lower_bound]
    fill_fields: [forecast_mobile_dau.submission_date]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for Android (Fennec + Fenix)
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_mobile_dau.upper_bound,
            id: forecast_mobile_dau.upper_bound, name: Upper Bound}, {axisId: forecast_mobile_dau.dau,
            id: forecast_mobile_dau.dau, name: Dau}, {axisId: forecast_mobile_dau.lower_bound,
            id: forecast_mobile_dau.lower_bound, name: Lower Bound}], showLabels: true,
        showValues: true, minValue: 6000000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    defaults_version: 1
    listen: {}
    row: 120
    col: 0
    width: 12
    height: 8
  - title: Status
    name: Status (4)
    model: DUET
    explore: forecast_mobile_dau
    type: single_value
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.status]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for Android (Fennec + Fenix)
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_mobile_dau.submission_date]
    listen: {}
    row: 128
    col: 0
    width: 12
    height: 2
  - title: iOS DAU vs Recent Trend
    name: iOS DAU vs Recent Trend
    model: DUET
    explore: forecast_mobile_dau
    type: looker_line
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.upper_bound,
      forecast_mobile_dau.dau, forecast_mobile_dau.lower_bound]
    fill_fields: [forecast_mobile_dau.submission_date]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for iOS
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_mobile_dau.upper_bound,
            id: forecast_mobile_dau.upper_bound, name: Upper Bound}, {axisId: forecast_mobile_dau.dau,
            id: forecast_mobile_dau.dau, name: Dau}, {axisId: forecast_mobile_dau.lower_bound,
            id: forecast_mobile_dau.lower_bound, name: Lower Bound}], showLabels: true,
        showValues: true, minValue: 1500000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    defaults_version: 1
    listen: {}
    row: 120
    col: 12
    width: 12
    height: 8
  - title: Status
    name: Status (5)
    model: DUET
    explore: forecast_mobile_dau
    type: single_value
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.status]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for iOS
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_mobile_dau.submission_date]
    listen: {}
    row: 128
    col: 12
    width: 12
    height: 2
  - title: Android Installs vs 2020
    name: Android Installs vs 2020
    model: DUET
    explore: install_android
    type: looker_line
    fields: [install_android.submission_date, install_android.device_installs_2021,
      install_android.device_installs_2020]
    fill_fields: [install_android.submission_date]
    filters:
      install_android.submission_date: after 2021/05/18
    sorts: [install_android.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      install_android.device_installs_2021: "#12B5CB"
      install_android.device_installs_2020: "#F9AB00"
    series_point_styles:
      install_android.device_installs_2020: diamond
    defaults_version: 1
    listen: {}
    row: 130
    col: 0
    width: 12
    height: 8
  - title: Android Installs vs Recent Trend
    name: Android Installs vs Recent Trend
    model: DUET
    explore: forecast_android_installs
    type: looker_line
    fields: [forecast_android_installs.submission_date, forecast_android_installs.upper_bound,
      forecast_android_installs.device_installs, forecast_android_installs.lower_bound]
    fill_fields: [forecast_android_installs.submission_date]
    filters:
      forecast_android_installs.submission_date: after 2021/05/18
    sorts: [forecast_android_installs.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_android_installs.upper_bound: "#cdcfe6"
      forecast_android_installs.device_installs: "#F9AB00"
      forecast_android_installs.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_android_installs.upper_bound: diamond
      forecast_android_installs.lower_bound: diamond
    defaults_version: 1
    listen: {}
    row: 138
    col: 0
    width: 12
    height: 9
  - title: Status
    name: Status (6)
    model: DUET
    explore: forecast_android_installs
    type: single_value
    fields: [forecast_android_installs.submission_date, forecast_android_installs.status]
    filters:
      forecast_android_installs.submission_date: after 2021/05/18
    sorts: [forecast_android_installs.submission_date desc]
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
    point_style: circle_outline
    series_colors:
      forecast_android_installs.upper_bound: "#cdcfe6"
      forecast_android_installs.device_installs: "#F9AB00"
      forecast_android_installs.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_android_installs.upper_bound: diamond
      forecast_android_installs.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_android_installs.submission_date]
    listen: {}
    row: 147
    col: 0
    width: 12
    height: 2
  - title: iOS Installs vs 2020
    name: iOS Installs vs 2020
    model: DUET
    explore: install_ios
    type: looker_line
    fields: [install_ios.submission_date, install_ios.installations_opt_in_2021, install_ios.installations_opt_in_2020]
    fill_fields: [install_ios.submission_date]
    filters:
      install_ios.submission_date: after 2021/05/18
    sorts: [install_ios.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      install_ios.installations_opt_in_2021: "#F9AB00"
    defaults_version: 1
    listen: {}
    row: 130
    col: 12
    width: 12
    height: 8
  - title: iOS Installs vs Recent Trend
    name: iOS Installs vs Recent Trend
    model: DUET
    explore: forecast_ios_installs
    type: looker_line
    fields: [forecast_ios_installs.submission_date, forecast_ios_installs.upper_bound,
      forecast_ios_installs.installations_opt_in, forecast_ios_installs.lower_bound]
    fill_fields: [forecast_ios_installs.submission_date]
    filters:
      forecast_ios_installs.submission_date: after 2021/05/18
    sorts: [forecast_ios_installs.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_ios_installs.upper_bound: "#cdcfe6"
      forecast_ios_installs.lower_bound: "#cdcfe6"
      forecast_ios_installs.installations_opt_in: "#F9AB00"
    series_point_styles:
      forecast_ios_installs.upper_bound: diamond
      forecast_ios_installs.lower_bound: diamond
    defaults_version: 1
    listen: {}
    row: 138
    col: 12
    width: 12
    height: 9
  - title: Status
    name: Status (7)
    model: DUET
    explore: forecast_ios_installs
    type: single_value
    fields: [forecast_ios_installs.submission_date, forecast_ios_installs.status]
    filters:
      forecast_ios_installs.submission_date: after 2021/05/18
    sorts: [forecast_ios_installs.submission_date desc]
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
    point_style: circle_outline
    series_colors:
      forecast_ios_installs.upper_bound: "#cdcfe6"
      forecast_ios_installs.lower_bound: "#cdcfe6"
      forecast_ios_installs.installations_opt_in: "#F9AB00"
    series_point_styles:
      forecast_ios_installs.upper_bound: diamond
      forecast_ios_installs.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_ios_installs.submission_date]
    listen: {}
    row: 147
    col: 12
    width: 12
    height: 2
  - title: Pinned Rate (New Profile)
    name: Pinned Rate (New Profile)
    model: DUET
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_pinned, feature_usage.browser_not_pinned]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
      feature_usage.is_new: new
    sorts: [feature_usage.browser_pinned]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pinned_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_pinned}\
          \ / ${feature_usage.cc})", label: Pinned Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_pinned,
            id: feature_usage.browser_pinned, name: Browser Pinned}, {axisId: feature_usage.browser_not_pinned,
            id: feature_usage.browser_not_pinned, name: Browser Not Pinned}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: "#.##", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 159
    col: 0
    width: 9
    height: 7
  - title: Default Rate (New Profile)
    name: Default Rate (New Profile)
    model: DUET
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_default, feature_usage.browser_not_default]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
      feature_usage.is_new: new
    sorts: [feature_usage.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: default_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_default}\
          \ / ${feature_usage.cc})", label: Default Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_default,
            id: feature_usage.browser_default, name: Browser Default}, {axisId: feature_usage.browser_not_default,
            id: feature_usage.browser_not_default, name: Browser Not Default}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: "#.##", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 159
    col: 9
    width: 8
    height: 7
  - name: " (12)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---------------------------------------------------------------------------------------------
      # COMING SOON: Feature Usage (Mobile)
    row: 166
    col: 0
    width: 24
    height: 4
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ---------------------------------------------------------------------------------------------
      # Feature Usage (Desktop)
    row: 149
    col: 0
    width: 24
    height: 3
  - name: " (14)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# COMING SOON: Mobile Metric 1"
    row: 170
    col: 0
    width: 8
    height: 6
