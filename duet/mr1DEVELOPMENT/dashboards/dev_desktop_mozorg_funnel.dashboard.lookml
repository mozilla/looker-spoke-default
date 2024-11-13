---
- dashboard: desktop_moz_org_funnel_windows
  title: Desktop Moz.org Funnel (Windows)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: u0Rs8lm4XO8FbR5N3pgvnd
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"p","id":1702805888235,"children":[{"text":"The Desktop Moz.org
      Windows Funnel consists of Windows users who acquired Firefox via our website
      ("},{"type":"a","url":"https://www.mozilla.org/","children":[{"text":"https://www.mozilla.org/"}],"id":1705472569796},{"text":").
      Documentation is available in the "},{"type":"a","url":"https://docs.google.com/document/d/1W0FwfsaI8mO3ONuSKmoSqvwjEqiyEYTf2MIls-q9zJU/edit","children":[{"text":"Dashboard
      Manual: Desktop Moz.org Funnel (Windows)"}],"id":1705472602325},{"text":". For
      questions, contact @shong. "}]},{"type":"p","id":1705472953496,"children":[{"bold":true,"text":"Metrics"},{"text":"
      listed blow: "}]},{"type":"p","id":1702806075533,"children":[{"text":"","bold":true}]},{"type":"p","id":1705472957185,"children":[{"bold":true,"text":"Non
      Fx Sessions:"},{"text":" Number of visits to our website (counted via GA Sessions)              "},{"text":"Non
      Fx Downloads: ","bold":true},{"text":"Number of those visits that resulted in
      a download (counted via GA)"}]},{"type":"p","id":1702806207741,"children":[{"text":"New
      Installs:","bold":true},{"text":" Number of successful, new (no older Firefox
      install found) installs        "},{"text":" New Profiles: ","bold":true},{"text":"Number
      of new profiles created as a result of a Firefox firstrun"}]},{"type":"p","id":1702806318450,"children":[{"text":"Repeat
      Users:","bold":true},{"text":" Number of new profiles that returned for a second
      session within their first 28 days"}]},{"type":"p","id":1702806435330,"children":[{"text":"Week
      4 Retained: ","bold":true},{"text":"Number of new profiles that were still active
      21 to 28 days after they first appeared. "}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 0
    width: 15
    height: 6
  - name: Funnel Overview
    title: Funnel Overview
    note_state: collapsed
    note_display: hover
    note_text: Returned Second Day and Retained Week4 may be undercounted if "Days
      Waiting Wk4 Results" is not 0
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.join_field, dev_desktop_session.non_fx_sessions,
        dev_desktop_session.non_fx_downloads]
      filters:
        dev_desktop_session.year_over_year: 'No'
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_session.non_fx_sessions desc]
      limit: 5000
      column_limit: 50
      join_fields: []
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
        dev_desktop_usage.week4_reported_date: 'Yes'
      sorts: [dev_desktop_usage.returned_second_day desc]
      limit: 500
      column_limit: 50
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
    series_colors:
      dev_desktop_session.non_fx_downloads: "#005E5D"
      dev_desktop_new_profiles.new_profiles: "#FF2A8A"
      dev_desktop_usage.returned_second_day: "#FFA537"
      dev_desktop_usage.retained_week4: "#A7341F"
    series_labels:
      dev_desktop_usage.returned_second_day: Repeat Users
      dev_desktop_usage.retained_week4: Week 4 Retained
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
    column_limit: 50
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    row: 4
    col: 0
    width: 24
    height: 9
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #090808; height: 55px; color: red;">
      <nav style="font-size: 15px;">
        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://www.mozilla.org/media/protocol/img/logos/mozilla/logo-word-hor.e20791bb4dd4.svg"/>
        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_moz_org_funnel_windows">
      Moz.org Funnel (Windows)</a>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_moz_org_funnel_mac">
      Moz.org Funnel (Mac)</a>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_distribution_builds_funnel">
      Distribution Builds</a>
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
      Include Dates Where: dev_desktop_dates.week4_reported_date_described
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
    note_state: collapsed
    note_display: hover
    note_text: 'Total number of reported days in the reporting period. Note, this
      may not match with the range in the "Analysis Period" filter, because for the
      most recent dates, we may be waiting for data to arrive/process. '
    listen:
      Analysis Period: dev_desktop_dates.analysis_period
      Include Dates Where: dev_desktop_dates.week4_reported_date_described
    row: 2
    col: 14
    width: 5
    height: 2
  - name: Non Fx Sessions
    title: Non Fx Sessions
    note_state: collapsed
    note_display: hover
    note_text: 'Number of visits to our website (counted via GA Sessions)    '
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
      join_fields: []
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
    column_limit: 50
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
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    row: 20
    col: 0
    width: 5
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="background-color: #3FE1B0; height: 20px; width: 600px; display: flex; align-items: center; padding-left: 200px;">
        <span style="color: white;">mozilla.org / Google Analytics</span>
      </div>
    row: 19
    col: 0
    width: 10
    height: 1
  - name: Non Fx Downloads
    title: Non Fx Downloads
    note_state: collapsed
    note_display: hover
    note_text: Number of those visits that resulted in a download (counted via GA)
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
      join_fields: []
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
    column_limit: 50
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
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    row: 20
    col: 5
    width: 5
    height: 4
  - name: New Installs
    title: New Installs
    note_state: collapsed
    note_display: hover
    note_text: 'Number of successful, new (no older Firefox install found) installs  '
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
      join_fields: []
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
    column_limit: 50
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
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    row: 20
    col: 10
    width: 5
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="background-color: #9059FF; height: 20px; width: 250px; display: flex; align-items: center; padding-left: 100px;">
        <span style="color: white;">Installer Ping</span>
      </div>
    row: 19
    col: 10
    width: 5
    height: 1
  - name: New Profiles
    title: New Profiles
    note_state: collapsed
    note_display: hover
    note_text: Number of new profiles created as a result of a Firefox firstrun
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
      join_fields: []
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
    column_limit: 50
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
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    row: 25
    col: 0
    width: 5
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="background-color: #FF2A8A; height: 20px; width: 800px; display: flex; align-items: center; padding-left: 400px;">
        <span style="color: white;">Telemetry</span>
      </div>
    row: 24
    col: 0
    width: 15
    height: 1
  - name: Returned Second Day
    title: Returned Second Day
    note_state: collapsed
    note_display: hover
    note_text: Number of new profiles that returned for a second session within their
      first 28 days
    merged_queries:
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.returned_second_day]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'yes'
      sorts: [dev_desktop_usage.returned_second_day desc]
      limit: 500
      column_limit: 50
      join_fields: []
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.returned_second_day]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'yes'
        dev_desktop_usage.year_over_year: 'Yes'
      limit: 500
      join_fields:
      - field_name: dev_desktop_usage.join_field
        source_field_name: dev_desktop_usage.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Repeat Users
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
    column_limit: 50
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
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    row: 25
    col: 5
    width: 5
    height: 4
  - name: Week 4 Retained
    title: Week 4 Retained
    note_state: collapsed
    note_display: hover
    note_text: "Number of new profiles that were still active 21 to 28 days after\
      \ they first appeared. \n"
    merged_queries:
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.retained_week4]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'yes'
      limit: 500
      column_limit: 50
      join_fields: []
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.join_field, dev_desktop_usage.retained_week4]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'yes'
        dev_desktop_usage.year_over_year: 'Yes'
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_usage.join_field
        source_field_name: dev_desktop_usage.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Week 4 Retained
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
    column_limit: 50
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
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    row: 25
    col: 10
    width: 5
    height: 4
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
    note_state: collapsed
    note_display: hover
    note_text: Repeat Users and Week 4 Retained require 28 days of data from an acquisition
      date in order to calculate. So for more recent data, we may be missing data.
      To exclude dates where we're still waiting for data to arrive, click "Yes" on
      "Exclude Days Awaiting Wk4 Results"
    listen:
      Analysis Period: dev_desktop_dates.analysis_period
      Include Dates Where: dev_desktop_dates.week4_reported_date_described
    row: 2
    col: 19
    width: 5
    height: 2
  - name: Funnel Counts
    title: Funnel Counts
    note_state: collapsed
    note_display: hover
    note_text: 'Counts per day. 7 days smoothing applied. '
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.submission_date, dev_desktop_session.non_fx_sessions_smoothed,
        dev_desktop_session.non_fx_downloads_smoothed]
      fill_fields: [dev_desktop_session.submission_date]
      filters:
        dev_desktop_session.year_over_year: 'No'
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_session.submission_date desc]
      limit: 5000
      column_limit: 50
      hidden_pivots: {}
      join_fields: []
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.submission_date, dev_desktop_install.new_installs_smoothed]
      fill_fields: [dev_desktop_install.submission_date]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_install.submission_date
        source_field_name: dev_desktop_session.submission_date
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.submission_date, dev_desktop_new_profiles.new_profiles_smoothed]
      fill_fields: [dev_desktop_new_profiles.submission_date]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_new_profiles.submission_date
        source_field_name: dev_desktop_session.submission_date
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.submission_date, dev_desktop_usage.returned_second_day_smoothed,
        dev_desktop_usage.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage.submission_date]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'yes'
      sorts: [dev_desktop_usage.submission_date desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_usage.submission_date
        source_field_name: dev_desktop_session.submission_date
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
    show_x_axis_ticks: true
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
    series_colors:
      dev_desktop_session.non_fx_downloads: "#005E5D"
      dev_desktop_new_profiles.new_profiles: "#FF2A8A"
      dev_desktop_usage.returned_second_day: "#FFA537"
      dev_desktop_usage.retained_week4: "#A7341F"
      dev_desktop_session.non_fx_downloads_smoothed: "#005E5D"
      dev_desktop_new_profiles.new_profiles_smoothed: "#FF2A8A"
      dev_desktop_usage.returned_second_day_smoothed: "#FFA537"
      dev_desktop_usage.retained_week4_smoothed: "#A7341F"
    series_labels:
      dev_desktop_usage.returned_second_day_smoothed: Repeat Users
      dev_desktop_usage.retained_week4_smoothed: Week 4 Retained
      dev_desktop_session.non_fx_sessions_smoothed: Non Fx Sessions
      dev_desktop_session.non_fx_downloads_smoothed: Non Fx Downloads
      dev_desktop_install.new_installs_smoothed: New Installs
      dev_desktop_new_profiles.new_profiles_smoothed: New Profiles
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0
    column_group_spacing_ratio: 0
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_line
    hidden_fields: []
    column_limit: 50
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    row: 13
    col: 15
    width: 9
    height: 8
  - name: YOY Change
    title: YOY Change
    note_state: collapsed
    note_display: hover
    note_text: 'Year of year comparison per day. 7 days smoothing applied. '
    merged_queries:
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.non_fx_downloads_smoothed, dev_desktop_session.non_fx_sessions_smoothed,
        dev_desktop_session.submission_date]
      fill_fields: [dev_desktop_session.submission_date]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_session.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_session.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields: []
    - model: duet
      explore: dev_desktop_session
      type: table
      fields: [dev_desktop_session.non_fx_downloads_smoothed, dev_desktop_session.non_fx_sessions_smoothed,
        dev_desktop_session.submission_date]
      fill_fields: [dev_desktop_session.submission_date]
      filters:
        dev_desktop_session.join_field: 'yes'
        dev_desktop_session.funnel_derived: mozorg windows funnel
        dev_desktop_session.year_over_year: 'Yes'
      sorts: [dev_desktop_session.submission_date]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_session.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.new_installs_smoothed, dev_desktop_install.submission_date]
      fill_fields: [dev_desktop_install.submission_date]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_install.submission_date]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_install
      type: table
      fields: [dev_desktop_install.new_installs_smoothed, dev_desktop_install.submission_date]
      fill_fields: [dev_desktop_install.submission_date]
      filters:
        dev_desktop_install.join_field: 'yes'
        dev_desktop_install.funnel_derived: mozorg windows funnel
        dev_desktop_install.year_over_year: 'Yes'
      sorts: [dev_desktop_install.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.submission_date, dev_desktop_new_profiles.new_profiles_smoothed]
      fill_fields: [dev_desktop_new_profiles.submission_date]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
      sorts: [dev_desktop_new_profiles.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_new_profiles.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_new_profiles
      type: table
      fields: [dev_desktop_new_profiles.submission_date, dev_desktop_new_profiles.new_profiles_smoothed]
      fill_fields: [dev_desktop_new_profiles.submission_date]
      filters:
        dev_desktop_new_profiles.join_field: 'yes'
        dev_desktop_new_profiles.funnel_derived: mozorg windows funnel
        dev_desktop_new_profiles.year_over_year: 'Yes'
      sorts: [dev_desktop_new_profiles.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_new_profiles.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.submission_date, dev_desktop_usage.returned_second_day_smoothed,
        dev_desktop_usage.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage.submission_date]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'Yes'
      sorts: [dev_desktop_usage.submission_date]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage.submission_date}), 6,
          5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_usage
      type: table
      fields: [dev_desktop_usage.returned_second_day_smoothed, dev_desktop_usage.retained_week4_smoothed,
        dev_desktop_usage.submission_date]
      fill_fields: [dev_desktop_usage.submission_date]
      filters:
        dev_desktop_usage.join_field: 'yes'
        dev_desktop_usage.funnel_derived: mozorg windows funnel
        dev_desktop_usage.week4_reported_date: 'Yes'
        dev_desktop_usage.year_over_year: 'Yes'
      sorts: [dev_desktop_usage.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage.submission_date}), 6,
          5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      join_fields:
      - field_name: dt
        source_field_name: dt
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: non_fx_sessions, id: non_fx_sessions,
            name: non_fx_sessions}, {axisId: non_fx_downloads, id: non_fx_downloads,
            name: non_fx_downloads}, {axisId: new_installs, id: new_installs, name: new_installs},
          {axisId: new_profiles, id: new_profiles, name: new_profiles}, {axisId: returned_second_day,
            id: returned_second_day, name: returned_second_day}, {axisId: retained_week4,
            id: retained_week4, name: retained_week4}], showLabels: true, showValues: true,
        maxValue: !!null '', minValue: !!null '', unpinAxis: false, tickDensity: default,
        type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      non_fx_downloads: "#005E5D"
      new_profiles: "#FF2A8A"
      returned_second_day: "#FFA537"
      retained_week4: "#A7341F"
    series_labels:
      non_fx_sessions: Non Fx Sessions
      non_fx_downloads: Non Fx Downloads
      new_installs: New Installs
      new_profiles: New Profiles
      returned_second_day: Repeat Users
      retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change, value_format: 0.00%}]
    show_null_points: false
    interpolation: linear
    hidden_fields: [q1_dev_desktop_session.submission_date, dev_desktop_session.non_fx_downloads_smoothed,
      dev_desktop_session.non_fx_sessions_smoothed, q1_dev_desktop_session.non_fx_downloads_smoothed,
      q1_dev_desktop_session.non_fx_sessions_smoothed, dev_desktop_install.new_installs_smoothed,
      q3_dev_desktop_install.new_installs_smoothed, dev_desktop_install.submission_date,
      q3_dev_desktop_install.submission_date, dev_desktop_new_profiles.submission_date,
      q5_dev_desktop_new_profiles.submission_date, dev_desktop_new_profiles.new_profiles_smoothed,
      q5_dev_desktop_new_profiles.new_profiles_smoothed, dt, dev_desktop_usage.submission_date,
      q7_dev_desktop_usage.submission_date, dev_desktop_usage.returned_second_day_smoothed,
      dev_desktop_usage.retained_week4_smoothed, q7_dev_desktop_usage.returned_second_day_smoothed,
      q7_dev_desktop_usage.retained_week4_smoothed]
    hidden_pivots: {}
    type: looker_line
    sorts: [dev_desktop_session.submission_date]
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_session.non_fx_sessions_smoothed} - ${q1_dev_desktop_session.non_fx_sessions_smoothed})/${q1_dev_desktop_session.non_fx_sessions_smoothed}"
      label: non_fx_sessions
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: non_fx_sessions
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_session.non_fx_downloads_smoothed} - ${q1_dev_desktop_session.non_fx_downloads_smoothed})/${q1_dev_desktop_session.non_fx_downloads_smoothed}"
      label: non_fx_downloads
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: non_fx_downloads
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_install.new_installs_smoothed} - ${q3_dev_desktop_install.new_installs_smoothed})/${q3_dev_desktop_install.new_installs_smoothed} "
      label: new_installs
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_installs
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_new_profiles.new_profiles_smoothed} - ${q5_dev_desktop_new_profiles.new_profiles_smoothed})/${q5_dev_desktop_new_profiles.new_profiles_smoothed}"
      label: new_profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage.returned_second_day_smoothed} - ${q7_dev_desktop_usage.returned_second_day_smoothed})/${q7_dev_desktop_usage.returned_second_day_smoothed}"
      label: returned_second_day
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: returned_second_day
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage.retained_week4_smoothed} - ${q7_dev_desktop_usage.retained_week4_smoothed})/${q7_dev_desktop_usage.retained_week4_smoothed}"
      label: retained_week4
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retained_week4
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_session.analysis_period
      Countries: dev_desktop_session.normalized_country_code_subset
      Include Dates Where: dev_desktop_session.week4_reported_date_described
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    - Analysis Period: dev_desktop_install.analysis_period
      Countries: dev_desktop_install.normalized_country_code_subset
      Include Dates Where: dev_desktop_install.week4_reported_date_described
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    - Analysis Period: dev_desktop_new_profiles.analysis_period
      Countries: dev_desktop_new_profiles.normalized_country_code_subset
      Include Dates Where: dev_desktop_new_profiles.week4_reported_date_described
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage.analysis_period
      Countries: dev_desktop_usage.normalized_country_code_subset
    row: 21
    col: 15
    width: 9
    height: 8
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
  - name: Include Dates Where
    title: Include Dates Where
    type: field_filter
    default_value: data complete
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options:
      - data complete
      - awaiting wk4 results
    model: duet
    explore: dev_desktop_session
    listens_to_filters: []
    field: dev_desktop_session.week4_reported_date_described
