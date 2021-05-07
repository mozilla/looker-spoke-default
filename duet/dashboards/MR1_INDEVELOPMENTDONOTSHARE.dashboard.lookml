- dashboard: mr1_indevelopmentdonotshare
  title: Mr1 Indevelopmentdonotshare
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  refresh: 1 day
  elements:
  - title: Version Uplift
    name: Version Uplift
    model: duet
    explore: version_uplift
    type: looker_column
    fields: [version_uplift.submission_date, version_uplift.cc_latest, version_uplift.cc_older]
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
    row: 9
    col: 0
    width: 17
    height: 8
  - title: Current Uptake
    name: Current Uptake
    model: duet
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
    listen: {}
    row: 4
    col: 12
    width: 5
    height: 5
  - title: Release Date
    name: Release Date
    model: duet
    explore: version_uplift
    type: single_value
    fields: [version_uplift.submission_date]
    fill_fields: [version_uplift.submission_date]
    sorts: [version_uplift.submission_date]
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
    interpolation: linear
    defaults_version: 1
    series_types: {}
    row: 4
    col: 0
    width: 6
    height: 5
  - title: Days Since Release
    name: Days Since Release
    model: duet
    explore: version_uplift
    type: single_value
    fields: [version_uplift.submission_date]
    fill_fields: [version_uplift.submission_date]
    sorts: [days_since desc]
    limit: 500
    dynamic_fields: [{table_calculation: days_since, label: days since, expression: 'diff_days(${version_uplift.submission_date},
          now())', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
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
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [version_uplift.submission_date]
    row: 4
    col: 6
    width: 6
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "----------------------------\n\n# Uptake\n\n<span style=\"color:red\"\
      > (TODO: update date range, update version criteria)</span>\n\n\n* Add country\
      \ and OS toggles (for chart and for current update number) \n* rename cc columns\n\
      * enforce 1 week windows even with less data (for release) "
    row: 0
    col: 0
    width: 17
    height: 4
  - title: Surveys Engaged
    name: Surveys Engaged
    model: duet
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
    row: 21
    col: 6
    width: 6
    height: 6
  - title: Surveys Offered
    name: Surveys Offered
    model: duet
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
    row: 21
    col: 0
    width: 6
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "------------------------------------------------------------------------------------\n\
      \n# Happiness Survey\n\n<span style=\"color:red\"> (TODO: update date range,\
      \ update survey slug)</span>\n\n* [NOTE] thinking no country or OS toggles since\
      \ responses will be sparse\n* Add link to any survey resources (or where it\
      \ will be) "
    row: 17
    col: 0
    width: 17
    height: 4
  - name: 'Surveys Completed: N/A'
    type: text
    title_text: 'Surveys Completed: N/A'
    subtitle_text: 'The final survey results will be available after <date> with the
      report. '
    body_text: ''
    row: 21
    col: 12
    width: 5
    height: 6
  - title: 'KPI: Days of Use'
    name: 'KPI: Days of Use'
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_count, name: 'Cdou:
              Absolute Delta from Forecast'}], showLabels: true, showValues: true,
        maxValue: 25000000, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    row: 40
    col: 0
    width: 17
    height: 8
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "--------------------------------\n\n# KPI - Days of Use\n\n<span style=\"\
      color:red\"> (TODO: update date range)</span>\n\n* add the country and OS breakdowns\n\
      \    * [ISSUE] these are different then what you're using for the other sections,\
      \ i.e. limited set, and using different values... talk to Leif on how to resolve...\
      \ might want to err on the side of using whatever is happening in KPI as the\
      \ standard, but you might not be able to (see next) \n* Conditional formatting\
      \ for the deltas\n* [CONSIDER] adding the traffic type / funnel type dimension...\n\
      \    * [ISSUE] this would entail having to extend whatever the .model is doing\
      \ in looker... might be a heavy lift, look into how that works. "
    row: 27
    col: 0
    width: 17
    height: 7
  - title: Forecasted
    name: Forecasted
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [prediction.cdou_forecast, firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: '2021'
      prediction.cdou_forecast: NOT NULL
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
    defaults_version: 1
    series_types: {}
    row: 34
    col: 6
    width: 5
    height: 3
  - title: Goal
    name: Goal
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [prediction.cdou_target, firefox_desktop_usage_2021.date]
    filters:
      prediction.cdou_target: NOT NULL
      firefox_desktop_usage_2021.date: '2021'
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
    defaults_version: 1
    series_types: {}
    row: 37
    col: 6
    width: 5
    height: 3
  - title: Cumulative DOU (2021 Actual)
    name: Cumulative DOU (2021 Actual)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou]
    fill_fields: [firefox_desktop_usage_2021.date]
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
    defaults_version: 1
    row: 34
    col: 0
    width: 6
    height: 6
  - title: Delta Today
    name: Delta Today
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff]
    limit: 500
    dynamic_fields: [{table_calculation: pct_diff, label: Pct Diff, expression: "(${firefox_desktop_usage_2021.cdou}\
          \ - ${prediction.cdou_forecast}) / ${prediction.cdou_forecast}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.cdou, prediction.cdou_forecast]
    row: 34
    col: 14
    width: 3
    height: 3
  - title: Delta Today
    name: Delta Today (2)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_target]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff]
    limit: 500
    dynamic_fields: [{table_calculation: pct_diff, label: Pct Diff, expression: "(${firefox_desktop_usage_2021.cdou}\
          \ - ${prediction.cdou_target}) / ${prediction.cdou_target}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.cdou, prediction.cdou_target]
    row: 37
    col: 14
    width: 3
    height: 3
  - title: Delta on Release
    name: Delta on Release
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff desc]
    limit: 500
    dynamic_fields: [{table_calculation: pct_diff, label: Pct Diff, expression: "(${firefox_desktop_usage_2021.cdou}\
          \ - ${prediction.cdou_forecast}) / ${prediction.cdou_forecast}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.cdou, prediction.cdou_forecast]
    row: 34
    col: 11
    width: 3
    height: 3
  - title: Delta on Release
    name: Delta on Release (2)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_target]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff desc]
    limit: 500
    dynamic_fields: [{table_calculation: pct_diff, label: Pct Diff, expression: "(${firefox_desktop_usage_2021.cdou}\
          \ - ${prediction.cdou_target}) / ${prediction.cdou_target}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.cdou, prediction.cdou_target]
    row: 37
    col: 11
    width: 3
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      -----------------------------
      # KPI - New Profiles

      <span style="color:red"> (TODO: update dates)</span>

      * See KPI Days of Use - same items
    row: 60
    col: 0
    width: 17
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<span style=\"color:red\"> (TODO: update date range)</span>\n\n* add\
      \ trend CIs \n    * we need to create the model (talk to Leif) - this needs\
      \ to be updated TO the release date, and then NOT updated afterwards\n* add\
      \ \"above/below trend\" section. \n* add delta range box\n    * these will need\
      \ conditional formatting for color\n* [UNCLEAR] if we can / should add the slicing\
      \ dimensions (see above) - would this require a bunch of different models? Implementation\
      \ might be difficult... \n\n\n## THIS SECTION IS INCOMPLETE / MISSING ELEMENTS\
      \ CURRENTLY"
    row: 48
    col: 0
    width: 17
    height: 5
  - title: 'KPI: New Profiles'
    name: 'KPI: New Profiles'
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            name: 'New Profiles: Absolute Delta from Forecast'}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: -2500000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    row: 70
    col: 0
    width: 17
    height: 8
  - title: DAU vs Recent Trend (missing trend ranges)
    name: DAU vs Recent Trend (missing trend ranges)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.dau]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 53
    col: 0
    width: 17
    height: 7
  - title: Forecasted
    name: Forecasted (2)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cum_new_profiles_forecast]
    filters:
      firefox_desktop_usage_2021.date: '2021'
      prediction.cum_new_profiles_forecast: NOT NULL
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
    defaults_version: 1
    series_types: {}
    row: 64
    col: 6
    width: 5
    height: 3
  - title: Cumulative New Profiles (2021 Actual)
    name: Cumulative New Profiles (2021 Actual)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_cumulative]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
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
    defaults_version: 1
    row: 64
    col: 0
    width: 6
    height: 6
  - title: Goal
    name: Goal (2)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cum_new_profiles_target]
    filters:
      firefox_desktop_usage_2021.date: '2021'
      prediction.cum_new_profiles_target: NOT NULL
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
    defaults_version: 1
    series_types: {}
    row: 67
    col: 6
    width: 5
    height: 3
  - title: Delta on Release
    name: Delta on Release (3)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_cumulative,
      prediction.cum_new_profiles_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pct_diff, _type_hint: number,
        category: table_calculation, expression: "(${firefox_desktop_usage_2021.new_profiles_cumulative}\
          \ - ${prediction.cum_new_profiles_forecast}) / ${prediction.cum_new_profiles_forecast}",
        label: Pct Diff, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.new_profiles_cumulative, prediction.cum_new_profiles_forecast]
    row: 64
    col: 11
    width: 3
    height: 3
  - title: Delta Today
    name: Delta Today (3)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_cumulative,
      prediction.cum_new_profiles_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pct_diff, _type_hint: number,
        category: table_calculation, expression: "(${firefox_desktop_usage_2021.new_profiles_cumulative}\
          \ - ${prediction.cum_new_profiles_forecast}) / ${prediction.cum_new_profiles_forecast}",
        label: Pct Diff, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [firefox_desktop_usage_2021.new_profiles_cumulative, prediction.cum_new_profiles_forecast]
    row: 64
    col: 14
    width: 3
    height: 3
  - title: Delta on Release
    name: Delta on Release (4)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cum_new_profiles_target,
      firefox_desktop_usage_2021.new_profiles_cumulative]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pct_diff, _type_hint: number,
        category: table_calculation, expression: "(${firefox_desktop_usage_2021.new_profiles_cumulative}\
          \ - ${prediction.cum_new_profiles_target}) / ${prediction.cum_new_profiles_target}",
        label: Pct Diff, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [prediction.cum_new_profiles_target, firefox_desktop_usage_2021.new_profiles_cumulative]
    row: 67
    col: 11
    width: 3
    height: 3
  - title: Delta Today
    name: Delta Today (4)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cum_new_profiles_target,
      firefox_desktop_usage_2021.new_profiles_cumulative]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
    sorts: [pct_diff desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pct_diff, _type_hint: number,
        category: table_calculation, expression: "(${firefox_desktop_usage_2021.new_profiles_cumulative}\
          \ - ${prediction.cum_new_profiles_target}) / ${prediction.cum_new_profiles_target}",
        label: Pct Diff, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.##%
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [prediction.cum_new_profiles_target, firefox_desktop_usage_2021.new_profiles_cumulative]
    row: 67
    col: 14
    width: 3
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <span style="color:red"> (update date range)</span>

      * see KPI days of use, same items

      ## THIS SECTION IS INCOMPLETE / MISSING ELEMENTS CURRENTLY
    row: 78
    col: 0
    width: 17
    height: 5
  - title: New Profiles vs Recent Trend (missing trend ranges)
    name: New Profiles vs Recent Trend (missing trend ranges)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/03/23
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 83
    col: 0
    width: 17
    height: 7
  - title: Default Rate
    name: Default Rate
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_default, feature_usage.browser_not_default]
    fill_fields: [feature_usage.submission_date]
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
        showValues: true, maxValue: 60, minValue: 40, valueFormat: "#.##", unpinAxis: false,
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
    row: 94
    col: 9
    width: 8
    height: 7
  - title: Pinned Rate
    name: Pinned Rate
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_pinned, feature_usage.browser_not_pinned]
    fill_fields: [feature_usage.submission_date]
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
        showValues: true, maxValue: 60, minValue: 40, valueFormat: "#.##", unpinAxis: false,
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
    row: 94
    col: 0
    width: 9
    height: 7
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "--------------------------------\n\n# Feature Metrics\n\n<span style=\"\
      color:red\"> (TODO: update dates)</span>\n\n\n* Add OS, country breakdowns\n\
      * [CONSIDER] including a breakdown for traffic type... "
    row: 90
    col: 0
    width: 17
    height: 4
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      -----------------------------
      # Acquisition: Downloads

      <span style="color:red"> (TODO: update dates)</span>

      * add trend CIs
          * we need to create the model (talk to Leif) - this needs to be updated TO the release date, and then NOT updated afterwards
      * add “above/below trend” section.
      * add delta range box
          * these will need conditional formatting for color
      * [UNCLEAR] if we can / should add the slicing dimensions (see above) - would this require a bunch of different models? Implementation might be difficult…

      ## THIS SECTION IS INCOMPLETE / MISSING ELEMENTS CURRENTLY
    row: 124
    col: 0
    width: 17
    height: 6
  - title: Mozorg Downloads
    name: Mozorg Downloads
    model: duet
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.date, mozorg_ga.non_fx_downloads]
    fill_fields: [mozorg_ga.date]
    filters:
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 130
    col: 0
    width: 17
    height: 7
  - title: mozillaorg Traffic
    name: mozillaorg Traffic
    model: duet
    explore: mozorg_ga
    type: looker_grid
    fields: [mozorg_ga.non_fx_sessions, mozorg_ga.non_fx_downloads, mozorg_ga.traffic_type]
    filters:
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
    row: 118
    col: 0
    width: 17
    height: 6
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "------------------------------------------------------------------------------------------------------------\n\
      \n# SECTION BREAK - Marketing\n\nI want to split below into a different \"section\"\
      , not sure how to implement with this dashboarding... \n\n\n\n------------------------------------------------------------------------------------------------------------"
    row: 101
    col: 0
    width: 17
    height: 6
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2-

      <span style="color:red"> (TODO: update dates)</span>

      * add OS and country filters AND (important) device filter!
    row: 115
    col: 0
    width: 17
    height: 3
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Earned media\n\n#### What They're Saying!\n\nLaptop Mag  (2021-05-01):\
      \ [Mozilla Firefox update is making me abandon Chrome — Here's why](https://www.laptopmag.com/news/mozilla-firefox-update-is-making-me-abandon-chrome-heres-why)\n\
      \nETC: [ETC](etc)\n\nETC: [ETC](etc)\n\nETC: [ETC](etc)\n\nPUBLICATION (DATE):\
      \ ARTICLE WITH LINK\n\n\n\n^ this is just an example. We can link articles of\
      \ earned media to this dashboard here. \n\n* We update manually\n* Marketing\
      \ team needs to provide us with the info and we'll update"
    row: 107
    col: 0
    width: 9
    height: 8
  - name: " (12)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "------------------------------------------------------------------------------------------------------------\n\
      \n# SECTION BREAK - MOBILE: ANDROID\n\nI want to split below into a different\
      \ \"section\", not sure how to implement with this dashboarding... \n\n\n\n\
      ------------------------------------------------------------------------------------------------------------"
    row: 137
    col: 0
    width: 17
    height: 6
  - name: " (13)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<span style=\"color:red\"> (TODO: update dates)</span>\n\n* add OS\
      \ and country filters AND (important) device filter!\n* [CONSIDER] adding a\
      \ browser filter...?\n* [CONSIDER] breakdown by specific blog or page or article?\n\
      * [CONSIDER] are there like... success criteria? i.e. they click on something\
      \ inside the blog? What's the design, how do we measure if anyone STAYED on\
      \ the page?  \n* [CONSIDER] how to add links to the relevant posts"
    row: 107
    col: 9
    width: 8
    height: 3
  - title: Blog Traffic
    name: Blog Traffic
    model: duet
    explore: mozblogs_ga
    type: looker_grid
    fields: [mozblogs_ga.traffic_type, mozblogs_ga.sessions]
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
    row: 110
    col: 9
    width: 8
    height: 5
