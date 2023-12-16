---
- dashboard: desktop_moz_org_funnel_windows
  title: Desktop Moz.org Funnel (Windows)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: mRRE70n4cTC7DcGi9zK1cv
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"paragraph","children":[{"text":"description of moz.org funnel"}],"id":1702647937689},{"type":"paragraph","id":1702648804647,"children":[{"text":""}]},{"type":"paragraph","id":1702648805649,"children":[{"text":"metric
      explanations"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 0
    width: 15
    height: 5
  - name: Funnel Overview
    title: Funnel Overview
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: looker_column
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_sessions,
        dev_desktop_session.non_fx_downloads]
      filters:
        dev_desktop_session.year_over_year: 'No'
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_session.non_fx_sessions desc]
      limit: 5000
      column_limit: 50
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
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.join_field, dev_desktop_install.new_installs]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_install.new_installs desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_install.join_field
        source_field_name: dev_desktop_session.join_field
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.join_field, dev_desktop_new_profiles.new_profiles]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_new_profiles.new_profiles desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_new_profiles.join_field
        source_field_name: dev_desktop_session.join_field
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.returned_second_day,
        dev_desktop_usage.retained_week4]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
      limit: 500
      join_fields:
      - field_name: dev_desktop_usage.join_field
        source_field_name: dev_desktop_session.join_field
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: dev_desktop_session.non_fx_sessions,
            id: dev_desktop_session.non_fx_sessions, name: Non Fx Sessions}, {axisId: dev_desktop_session.non_fx_downloads,
            id: dev_desktop_session.non_fx_downloads, name: Non Fx Downloads}, {axisId: dev_desktop_install.new_installs,
            id: dev_desktop_install.new_installs, name: New Installs}, {axisId: dev_desktop_new_profiles.new_profiles,
            id: dev_desktop_new_profiles.new_profiles, name: New Profiles}, {axisId: dev_desktop_usage.returned_second_day,
            id: dev_desktop_usage.returned_second_day, name: Returned Second Day},
          {axisId: dev_desktop_usage.retained_week4, id: dev_desktop_usage.retained_week4,
            name: Retained Week4}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: ''
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_column
    hidden_fields: [dev_desktop_session.join_field]
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_session.week4_reported_date
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_install.week4_reported_date
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_new_profiles.week4_reported_date
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_usage.week4_reported_date
    row: 4
    col: 0
    width: 24
    height: 9
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #090808; height: 55px; color: red;">
      <nav style="font-size: 15px;">
        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://www.mozilla.org/media/protocol/img/logos/mozilla/logo-word-hor.e20791bb4dd4.svg"/>
        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px;" href="insertlinkwhenfinished">
      Moz.org Funnel (Windows)</a>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="...tobelinkedlater">
      Moz.org Funnel (Mac)[COMING]</a>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="...tobelinkedlater">
      Partnership Funnel[COMING]</a>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="...tobelinkedlater">
      Unknown Funnel[COMING]</a>
      </nav>
      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Report Period
    name: Report Period
    model: duet
    explore: dev_desktop_dates
    type: single_value
    fields: [dev_desktop_dates.max_date, dev_desktop_dates.min_date]
    filters:
      dev_desktop_dates.join_field: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "concat(\nto_string(${dev_desktop_dates.min_date}), \n \"  to  \"\
        \ ,\nto_string(${dev_desktop_dates.max_date})\n)"
      label: Report Period
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: report_period
      _type_hint: string
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
    hidden_fields: [dev_desktop_dates.max_date, dev_desktop_dates.min_date]
    listen:
      Analysis Period: dev_desktop_dates.analysis_period
      Exclude Days Awaiting Wk4 Results: dev_desktop_dates.week4_reported_date
    row: 2
    col: 0
    width: 14
    height: 2
  - title: Days Reporting
    name: Days Reporting
    model: duet
    explore: dev_desktop_dates
    type: single_value
    fields: [dev_desktop_dates.days]
    filters:
      dev_desktop_dates.join_field: 'yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Waiting Wk4 Results
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
    listen:
      Analysis Period: dev_desktop_dates.analysis_period
      Exclude Days Awaiting Wk4 Results: dev_desktop_dates.week4_reported_date
    row: 2
    col: 14
    width: 5
    height: 2
  - name: Non Fx Sessions
    title: Non Fx Sessions
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_sessions]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
        dev_desktop_session.week4_reported_date: ''
      sorts: [dev_desktop_session.non_fx_sessions desc]
      limit: 500
      column_limit: 50
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_sessions]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
        dev_desktop_session.week4_reported_date: ''
        dev_desktop_session.year_over_year: 'Yes'
      sorts: [dev_desktop_session.non_fx_sessions desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_session.join_field
        source_field_name: dev_desktop_session.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: YOY
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_dev_desktop_session.non_fx_sessions]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_session.non_fx_sessions} - ${q1_dev_desktop_session.non_fx_sessions})\
        \ / \n    ${q1_dev_desktop_session.non_fx_sessions}"
      label: change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_session.week4_reported_date
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_session.week4_reported_date
    row: 19
    col: 0
    width: 5
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="background-color: #8BC34A; height: 20px; width: 700px; display: flex; align-items: center; padding-left: 200px;">
        <span style="color: black;">moz.org : GA</span>
      </div>
    row: 18
    col: 0
    width: 10
    height: 1
  - name: Non Fx Downloads
    title: Non Fx Downloads
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_downloads]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
        dev_desktop_session.week4_reported_date: ''
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_downloads]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
        dev_desktop_session.week4_reported_date: ''
        dev_desktop_session.year_over_year: 'Yes'
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_session.join_field
        source_field_name: dev_desktop_session.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: YOY
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_dev_desktop_session.non_fx_sessions, q1_dev_desktop_session.non_fx_downloads]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_session.non_fx_downloads} - ${q1_dev_desktop_session.non_fx_downloads})\
        \ / \n    ${q1_dev_desktop_session.non_fx_downloads}"
      label: change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_session.week4_reported_date
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_session.week4_reported_date
    row: 19
    col: 5
    width: 5
    height: 4
  - name: New Installs
    title: New Installs
    merged_queries:
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.join_field, dev_desktop_install.new_installs]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_install.new_installs desc]
      limit: 500
      column_limit: 50
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.join_field, dev_desktop_install.new_installs]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
        dev_desktop_install.year_over_year: 'Yes'
      sorts: [dev_desktop_install.new_installs desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_install.join_field
        source_field_name: dev_desktop_install.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: YOY
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    type: single_value
    hidden_fields: [q1_dev_desktop_install.new_installs]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_install.new_installs} - ${q1_dev_desktop_install.new_installs})\
        \ / \n    ${q1_dev_desktop_install.new_installs}"
      label: Change
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: change
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_install.week4_reported_date
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_install.week4_reported_date
    row: 19
    col: 10
    width: 5
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: asdfadsf
    row: 18
    col: 10
    width: 5
    height: 1
  - name: New Profiles
    title: New Profiles
    merged_queries:
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.join_field, dev_desktop_new_profiles.new_profiles]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_new_profiles.new_profiles desc]
      limit: 500
      column_limit: 50
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.join_field, dev_desktop_new_profiles.new_profiles]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
        dev_desktop_new_profiles.year_over_year: 'Yes'
      limit: 500
      join_fields:
      - field_name: dev_desktop_new_profiles.join_field
        source_field_name: dev_desktop_new_profiles.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    type: single_value
    hidden_fields: [q1_dev_desktop_new_profiles.new_profiles]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_new_profiles.new_profiles} - ${q1_dev_desktop_new_profiles.new_profiles})\
        \ / \n    ${q1_dev_desktop_new_profiles.new_profiles}"
      label: YOY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: yoy
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_new_profiles.week4_reported_date
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_new_profiles.week4_reported_date
    row: 24
    col: 0
    width: 5
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: asdfasd
    row: 23
    col: 0
    width: 15
    height: 1
  - name: Returned Second Day
    title: Returned Second Day
    merged_queries:
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.returned_second_day]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_usage.returned_second_day desc]
      limit: 500
      column_limit: 50
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.returned_second_day]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.year_over_year: 'Yes'
      limit: 500
      join_fields:
      - field_name: dev_desktop_usage.join_field
        source_field_name: dev_desktop_usage.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_dev_desktop_usage.returned_second_day]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_usage.returned_second_day} - ${q1_dev_desktop_usage.returned_second_day})\
        \ / \n    ${q1_dev_desktop_usage.returned_second_day}"
      label: YOY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: yoy
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_usage.week4_reported_date
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_usage.week4_reported_date
    row: 24
    col: 5
    width: 5
    height: 4
  - name: Week 4 Retained
    title: Week 4 Retained
    merged_queries:
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.retained_week4]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.retained_week4]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_usage.join_field
        source_field_name: dev_desktop_usage.join_field
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [q1_dev_desktop_usage.returned_second_day, q1_dev_desktop_usage.retained_week4]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_usage.retained_week4} - ${q1_dev_desktop_usage.retained_week4})\
        \ / \n    ${q1_dev_desktop_usage.retained_week4}"
      label: YOY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: yoy
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_usage.week4_reported_date
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
      Exclude Days Awaiting Wk4 Results: dev_desktop_usage.week4_reported_date
    row: 24
    col: 10
    width: 5
    height: 4
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Metric Definitions"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 15
    width: 9
    height: 15
  - title: Days Waiting Wk4 Results
    name: Days Waiting Wk4 Results
    model: duet
    explore: dev_desktop_dates
    type: single_value
    fields: [dev_desktop_dates.days_waiting_results]
    filters:
      dev_desktop_dates.join_field: 'yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Waiting Wk4 Results
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
    listen:
      Analysis Period: dev_desktop_dates.analysis_period
      Exclude Days Awaiting Wk4 Results: dev_desktop_dates.week4_reported_date
    row: 2
    col: 19
    width: 5
    height: 2
  filters:
  - name: Analysis Period
    title: Analysis Period
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: duet
    explore: dev_desktop_session
    listens_to_filters: []
    field: dev_desktop_session.analysis_period
  - name: Countries
    title: Countries
    type: field_filter
    default_value: US,GB,DE,FR,CA,BR,MX,CN,IN,AU,NL,ES,RU,ROW
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - US
      - GB
      - DE
      - FR
      - CA
      - BR
      - MX
      - CN
      - IN
      - AU
      - NL
      - ES
      - RU
      - ROW
    model: duet
    explore: dev_desktop_install
    listens_to_filters: []
    field: dev_desktop_install.normalized_country_code_subset
  - name: Exclude Days Awaiting Wk4 Results
    title: Exclude Days Awaiting Wk4 Results
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
      options:
      - 'Yes'
    model: duet
    explore: dev_desktop_session
    listens_to_filters: []
    field: dev_desktop_session.week4_reported_date
