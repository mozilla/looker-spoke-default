- dashboard: desktop_numbers_that_matter
  title: Desktop Number That Matter
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Numbers
    title: Numbers
    merged_queries:
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.submission_date, desktop_install.new_installs, country_buckets.bucket]
      sorts: [desktop_install.submission_date desc]
      limit: 500
    - model: duet
      explore: desktop_new_profile
      type: table
      fields: [desktop_new_profile.new_profiles, desktop_new_profile.submission_date, country_buckets.bucket]
      sorts: [desktop_new_profile.submission_date desc]
      limit: 500
      join_fields:
      - field_name: desktop_new_profile.submission_date
        source_field_name: desktop_install.submission_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: desktop_session
      type: table
      fields: [desktop_session.date_date, desktop_session.total_non_fx_downloads, desktop_session.total_non_fx_sessions,
        country_buckets.bucket]
      sorts: [desktop_session.date_date desc]
      limit: 500
      join_fields:
      - field_name: desktop_session.date_date
        source_field_name: desktop_install.submission_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: desktop_activation
      type: table
      fields: [desktop_activation.activations, desktop_activation.submission_timestamp_date, country_buckets.bucket]
      sorts: [desktop_activation.submission_timestamp_date desc]
      limit: 500
      join_fields:
      - field_name: desktop_activation.submission_timestamp_date
        source_field_name: desktop_install.submission_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: releases
      type: table
      fields: [releases.version, releases.date_date]
      filters:
        releases.category: major
      sorts: [releases.version]
      limit: 500
      join_fields:
      - field_name: releases.date_date
        source_field_name: desktop_install.submission_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: desktop_install.new_installs,
            id: desktop_install.new_installs, name: New Installs}, {axisId: desktop_new_profile.new_profiles,
            id: desktop_new_profile.new_profiles, name: New Profiles}, {axisId: desktop_session.total_non_fx_downloads,
            id: desktop_session.total_non_fx_downloads, name: Total Non Fx Downloads}, {axisId: desktop_session.total_non_fx_sessions,
            id: desktop_session.total_non_fx_sessions, name: Total Non Fx Sessions}, {axisId: desktop_activation.activations,
            id: desktop_activation.activations, name: Activations}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: release, id: release,
            name: Release}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      desktop_install.new_installs: line
      desktop_new_profile.new_profiles: line
      desktop_session.total_non_fx_downloads: line
      desktop_session.total_non_fx_sessions: line
      desktop_activation.activations: line
    point_style: none
    series_colors:
      release: "#909494"
      desktop_install.new_installs: "#E52592"
      desktop_new_profile.new_profiles: "#E8710A"
      desktop_session.total_non_fx_downloads: "#12B5CB"
      desktop_session.total_non_fx_sessions: "#1A73E8"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    type: looker_column
    hidden_fields: [releases.version, country_buckets.bucket]
    dynamic_fields: [{table_calculation: release, label: Release, expression: 'if(is_null(${releases.version}),
          null, ${desktop_session.total_non_fx_sessions} / ${desktop_session.total_non_fx_sessions})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    - Date Range: desktop_new_profile.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_new_profile.ignore_most_recent_week
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    - Date Range: desktop_activation.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_activation.ignore_most_recent_week
    -
    row: 8
    col: 8
    width: 13
    height: 7
  - name: Rates
    title: Rates
    merged_queries:
    - model: duet
      explore: desktop_session
      type: looker_line
      fields: [desktop_session.date_date, desktop_session.total_non_fx_downloads, desktop_session.total_non_fx_sessions,
        country_buckets.bucket]
      sorts: [desktop_session.date_date desc]
      limit: 500
      dynamic_fields: [{table_calculation: download_rate, label: Download Rate, expression: "${desktop_session.total_non_fx_downloads}\
            \ / ${desktop_session.total_non_fx_sessions} ", value_format: !!null '', value_format_name: !!null '',
          is_disabled: false, _kind_hint: measure, _type_hint: number}]
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
      y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
              name: Download Rate}], showLabels: true, showValues: true, valueFormat: "#%",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
      series_types: {}
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      hidden_fields: [desktop_session.total_non_fx_downloads, desktop_session.total_non_fx_sessions]
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.new_installs, desktop_install.submission_date, country_buckets.bucket]
      sorts: [desktop_install.submission_date desc]
      limit: 500
      join_fields:
      - field_name: desktop_install.submission_date
        source_field_name: desktop_session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: desktop_new_profile
      type: table
      fields: [desktop_new_profile.new_profiles, desktop_new_profile.submission_date, country_buckets.bucket]
      limit: 500
      join_fields:
      - field_name: desktop_new_profile.submission_date
        source_field_name: desktop_session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: desktop_activation
      type: table
      fields: [desktop_activation.submission_timestamp_date, desktop_activation.activations, country_buckets.bucket]
      limit: 500
      join_fields:
      - field_name: desktop_activation.submission_timestamp_date
        source_field_name: desktop_session.date_date
      - field_name: country_buckets.bucket
        source_field_name: country_buckets.bucket
    - model: duet
      explore: releases
      type: table
      fields: [releases.version, releases.date_date]
      filters:
        releases.category: major
      sorts: [releases.version]
      limit: 500
      join_fields:
      - field_name: releases.date_date
        source_field_name: desktop_session.date_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: download_rate, id: download_rate,
            name: Download Rate}, {axisId: installation_rate, id: installation_rate,
            name: Installation Rate}, {axisId: first_run_rate, id: first_run_rate,
            name: First Run Rate}, {axisId: activation_rate, id: activation_rate,
            name: Activation Rate}], showLabels: true, showValues: true, valueFormat: "#%",
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: release, id: release, name: Release}],
        showLabels: false, showValues: false, valueFormat: "#%", unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      download_rate: line
      installation_rate: line
      first_run_rate: line
      activation_rate: line
    point_style: none
    series_colors:
      release: "#80868B"
      download_rate: "#12B5CB"
      installation_rate: "#E52592"
      first_run_rate: "#E8710A"
      activation_rate: "#F9AB00"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: [desktop_install.new_installs, desktop_session.total_non_fx_sessions, desktop_session.total_non_fx_downloads,
      desktop_new_profile.new_profiles, desktop_activation.activations, releases.version, country_buckets.bucket]
    type: looker_column
    sorts: [country_buckets.bucket desc]
    dynamic_fields: [{table_calculation: installation_rate, label: Installation Rate,
        expression: "${desktop_install.new_installs} / ${desktop_session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: first_run_rate, label: First Run
          Rate, expression: "${desktop_new_profile.new_profiles} / ${desktop_session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: activation_rate, label: Activation
          Rate, expression: "${desktop_activation.activations} / ${desktop_session.total_non_fx_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: release, label: Release, expression: 'if(is_null(${releases.version}),
          null, ${desktop_session.total_non_fx_sessions} / ${desktop_session.total_non_fx_sessions})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    - Date Range: desktop_new_profile.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_new_profile.ignore_most_recent_week
    - Date Range: desktop_activation.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_activation.ignore_most_recent_week
    -
    row: 15
    col: 8
    width: 13
    height: 7
  - name: Funnel Overview
    title: Funnel Overview
    merged_queries:
    - model: duet
      explore: desktop_session
      type: looker_funnel
      fields: [desktop_session.total_non_fx_sessions, desktop_session.total_non_fx_downloads, desktop_session.join_field]
      sorts: [desktop_session.total_non_fx_sessions desc]
      limit: 500
      leftAxisLabelVisible: false
      leftAxisLabel: ''
      rightAxisLabelVisible: false
      rightAxisLabel: ''
      smoothedBars: true
      orientation: rows
      labelPosition: left
      percentType: total
      percentPosition: inline
      valuePosition: Hidden
      labelColorEnabled: false
      labelColor: "#FFF"
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
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
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.join_field, desktop_install.new_installs]
      limit: 500
      join_fields:
      - field_name: desktop_install.join_field
        source_field_name: desktop_session.join_field
    - model: duet
      explore: desktop_new_profile
      type: table
      fields: [desktop_new_profile.new_profiles, desktop_new_profile.join_field]
      limit: 500
      join_fields:
      - field_name: desktop_new_profile.join_field
        source_field_name: desktop_session.join_field
    - model: duet
      explore: desktop_activation
      type: table
      fields: [desktop_activation.activations, desktop_activation.join_field]
      limit: 500
      join_fields:
      - field_name: desktop_activation.join_field
        source_field_name: desktop_session.join_field
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: [join_field]
    type: looker_funnel
    series_types: {}
    listen:
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    - Date Range: desktop_new_profile.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_new_profile.ignore_most_recent_week
    - Date Range: desktop_activation.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_activation.ignore_most_recent_week
    row: 8
    col: 0
    width: 8
    height: 14
  - name: New Installs
    title: New Installs
    merged_queries:
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.new_installs, desktop_install.join_field]
      sorts: [desktop_install.new_installs desc]
      limit: 500
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.new_installs, desktop_install.join_field]
      filters:
        desktop_install.previous_time_period: 'Yes'
      sorts: [desktop_install.new_installs desc]
      limit: 500
      join_fields:
      - field_name: desktop_install.join_field
        source_field_name: desktop_install.join_field
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: New Installs
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_desktop_install.new_installs, q1_desktop_install.join_field]
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_desktop_install.new_installs} / ${desktop_install.new_installs}) * 100, 1)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    row: 0
    col: 14
    width: 7
    height: 4
  - name: Re-Installs
    title: Re-Installs
    merged_queries:
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.paveovers, desktop_install.join_field]
      limit: 500
    - model: duet
      explore: desktop_install
      type: table
      fields: [desktop_install.paveovers, desktop_install.join_field]
      filters:
        desktop_install.previous_time_period: 'Yes'
      limit: 500
      join_fields:
      - field_name: desktop_install.join_field
        source_field_name: desktop_install.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_desktop_install.paveovers]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1-${q1_desktop_install.paveovers}/${desktop_install.paveovers})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    - Date Range: desktop_install.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_install.ignore_most_recent_week
    row: 4
    col: 0
    width: 7
    height: 4
  - name: First Runs
    title: First Runs
    merged_queries:
    - model: duet
      explore: desktop_new_profile
      type: table
      fields: [desktop_new_profile.new_profiles, desktop_new_profile.join_field]
      sorts: [desktop_new_profile.new_profiles desc]
      limit: 500
    - model: duet
      explore: desktop_new_profile
      type: table
      fields: [desktop_new_profile.new_profiles, desktop_new_profile.join_field]
      filters:
        desktop_new_profile.previous_time_period: 'Yes'
      limit: 500
      join_fields:
      - field_name: desktop_new_profile.join_field
        source_field_name: desktop_new_profile.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_desktop_new_profile.join_field, q1_desktop_new_profile.new_profiles]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_desktop_new_profile.new_profiles} / ${desktop_new_profile.new_profiles}) * 100, 1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_new_profile.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_new_profile.ignore_most_recent_week
    - Date Range: desktop_new_profile.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_new_profile.ignore_most_recent_week
    row: 4
    col: 7
    width: 7
    height: 4
  - name: Downloads
    title: Downloads
    merged_queries:
    - model: duet
      explore: desktop_session
      type: table
      fields: [desktop_session.join_field, desktop_session.total_non_fx_downloads]
      limit: 500
    - model: duet
      explore: desktop_session
      type: table
      fields: [desktop_session.total_non_fx_downloads, desktop_session.join_field]
      filters:
        desktop_session.previous_time_period: 'Yes'
      limit: 500
      join_fields:
      - field_name: desktop_session.join_field
        source_field_name: desktop_session.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_desktop_session.total_non_fx_downloads, q1_desktop_session.join_field]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_desktop_session.total_non_fx_downloads} / ${desktop_session.total_non_fx_downloads})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    row: 0
    col: 7
    width: 7
    height: 4
  - name: Visits
    title: Visits
    merged_queries:
    - model: duet
      explore: desktop_session
      type: table
      fields: [desktop_session.total_non_fx_sessions, desktop_session.join_field]
      limit: 500
    - model: duet
      explore: desktop_session
      type: table
      fields: [desktop_session.total_non_fx_sessions, desktop_session.join_field]
      filters:
        desktop_session.previous_time_period: 'Yes'
      limit: 500
      join_fields:
      - field_name: desktop_session.join_field
        source_field_name: desktop_session.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_desktop_session.join_field, q1_desktop_session.total_non_fx_sessions]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_desktop_session.total_non_fx_sessions} / ${desktop_session.total_non_fx_sessions})
          * 100, 1)', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    - Date Range: desktop_session.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_session.ignore_most_recent_week
    row: 0
    col: 0
    width: 7
    height: 4
  - name: 7 Day Activated
    title: 7 Day Activated
    merged_queries:
    - model: duet
      explore: desktop_activation
      type: table
      fields: [desktop_activation.activations, desktop_activation.join_field]
      limit: 500
    - model: duet
      explore: desktop_activation
      type: table
      fields: [desktop_activation.join_field, desktop_activation.activations]
      filters:
        desktop_activation.previous_time_period: 'Yes'
      limit: 500
      join_fields:
      - field_name: desktop_activation.join_field
        source_field_name: desktop_activation.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: "% From Previous Time Period"
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_desktop_activation.join_field, q1_desktop_activation.activations]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: from_previous, label: From Previous, expression: 'round((1
          - ${q1_desktop_activation.activations} / ${desktop_activation.activations}) * 100, 1)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Date Range: desktop_activation.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_activation.ignore_most_recent_week
    - Date Range: desktop_activation.date
      Countries: country_buckets.bucket
      Ignore Most Recent Week: desktop_activation.ignore_most_recent_week
    row: 4
    col: 14
    width: 7
    height: 4
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: duet
    explore: desktop_new_profile
    listens_to_filters: []
    field: desktop_new_profile.date
  - name: Countries
    title: Countries
    type: string_filter
    default_value: Overall
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Overall
      - non-tier-1
      - tier-1
      - US
      - CA
      - DE
      - MX
      - FR
      - CN
      - UK
      - BR
  - name: Ignore Most Recent Week
    title: Ignore Most Recent Week
    type: field_filter
    default_value: 'yes'
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: duet
    explore: desktop_install
    listens_to_filters: []
    field: desktop_install.ignore_most_recent_week
