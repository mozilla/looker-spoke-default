---
- dashboard: desktop_moz_org_funnel_mac
  title: Desktop Moz.org Funnel (Mac)
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: cSbF2kH9JVJMa9PnKY5If6
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #090808; height: 55px; color: red;">
      <nav style="font-size: 15px;">
        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://www.mozilla.org/media/protocol/img/logos/mozilla/logo-word-hor.e20791bb4dd4.svg"/>
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_moz_org_funnel_windows">
      Moz.org Funnel (Windows)</a>
        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_moz_org_funnel_mac">
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
    explore: desktop_funnels_dates
    type: single_value
    fields: [desktop_funnels_dates.max_date, desktop_funnels_dates.min_date]
    filters:
      desktop_funnels_dates.submission_date: after 2024/03/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "concat(\nto_string(${desktop_funnels_dates.min_date}), \n \"  to\
        \  \" ,\nto_string(${desktop_funnels_dates.max_date})\n)"
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
    hidden_fields: [desktop_funnels_dates.max_date, desktop_funnels_dates.min_date]
    note_state: collapsed
    note_display: hover
    note_text: MacOS funnel data only available starting March 1st 2024
    listen:
      Analysis Period: desktop_funnels_dates.analysis_period
    row: 2
    col: 0
    width: 15
    height: 2
  - title: Days Reporting
    name: Days Reporting
    model: duet
    explore: desktop_funnels_dates
    type: single_value
    fields: [desktop_funnels_dates.days]
    filters:
      desktop_funnels_dates.submission_date: after 2024/03/01
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
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: MacOS funnel data only available starting March 1st 2024
    listen:
      Analysis Period: desktop_funnels_dates.analysis_period
    row: 2
    col: 15
    width: 9
    height: 2
  - title: Non Fx Sessions
    name: Non Fx Sessions
    model: duet
    explore: desktop_funnels_web
    type: single_value
    fields: [desktop_funnels_web.non_fx_sessions]
    filters:
      desktop_funnels_web.funnel_derived: mozorg mac funnel
      desktop_funnels_web.submission_date: after 2024/03/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${desktop_funnels_web.non_fx_sessions} - ${desktop_funnels_web.non_fx_sessions_prev_year})/${desktop_funnels_web.non_fx_sessions_prev_year}"
      label: YOY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: yoy
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
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
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Countries: desktop_funnels_web.normalized_country_code_subset
      Analysis Period: desktop_funnels_web.analysis_period
    row: 14
    col: 0
    width: 5
    height: 4
  - title: Non Fx Downloads
    name: Non Fx Downloads
    model: duet
    explore: desktop_funnels_web
    type: single_value
    fields: [desktop_funnels_web.non_fx_downloads]
    filters:
      desktop_funnels_web.funnel_derived: mozorg mac funnel
      desktop_funnels_web.submission_date: after 2024/03/01
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
    defaults_version: 1
    listen:
      Countries: desktop_funnels_web.normalized_country_code_subset
      Analysis Period: desktop_funnels_web.analysis_period
    row: 14
    col: 5
    width: 5
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: Installs not measured on MacOS
    row: 14
    col: 10
    width: 5
    height: 4
  - title: Repeat Users
    name: Repeat Users
    model: duet
    explore: desktop_funnels_telemetry
    type: single_value
    fields: [desktop_funnels_telemetry.returned_second_day]
    filters:
      desktop_funnels_telemetry.funnel_derived: mozorg mac funnel
      desktop_funnels_telemetry.submission_date: after 2024/03/01
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
    defaults_version: 1
    listen:
      Countries: desktop_funnels_telemetry.normalized_country_code_subset
      Analysis Period: desktop_funnels_telemetry.analysis_period
    row: 19
    col: 5
    width: 5
    height: 4
  - title: New Profiles
    name: New Profiles
    model: duet
    explore: desktop_funnels_telemetry
    type: single_value
    fields: [desktop_funnels_telemetry.new_profiles]
    filters:
      desktop_funnels_telemetry.funnel_derived: mozorg mac funnel
      desktop_funnels_telemetry.submission_date: after 2024/03/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${desktop_funnels_telemetry.new_profiles} - ${desktop_funnels_telemetry.new_profiles_prev_year})\
        \ / \n    ${desktop_funnels_telemetry.new_profiles_prev_year}"
      label: YOY
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: yoy
      _type_hint: number
      is_disabled: true
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
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Countries: desktop_funnels_telemetry.normalized_country_code_subset
      Analysis Period: desktop_funnels_telemetry.analysis_period
    row: 19
    col: 0
    width: 5
    height: 4
  - title: Week 4 Retained
    name: Week 4 Retained
    model: duet
    explore: desktop_funnels_telemetry
    type: single_value
    fields: [desktop_funnels_telemetry.retained_week4]
    filters:
      desktop_funnels_telemetry.funnel_derived: mozorg mac funnel
      desktop_funnels_telemetry.submission_date: after 2024/03/01
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
    defaults_version: 1
    listen:
      Countries: desktop_funnels_telemetry.normalized_country_code_subset
      Analysis Period: desktop_funnels_telemetry.analysis_period
    row: 19
    col: 10
    width: 5
    height: 4
  - name: Funnel Overview
    title: Funnel Overview
    merged_queries:
    - model: duet
      explore: desktop_funnels_web
      type: table
      fields: [desktop_funnels_web.non_fx_sessions, desktop_funnels_web.non_fx_downloads,
        desktop_funnels_web.join_field]
      filters:
        desktop_funnels_web.funnel_derived: mozorg mac funnel
        desktop_funnels_web.submission_date: after 2024/03/01
        desktop_funnels_web.join_field: 'Yes'
      sorts: [desktop_funnels_web.non_fx_sessions desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: desktop_funnels_telemetry
      type: table
      fields: [desktop_funnels_telemetry.new_profiles, desktop_funnels_telemetry.returned_second_day,
        desktop_funnels_telemetry.retained_week4, desktop_funnels_telemetry.join_field]
      filters:
        desktop_funnels_telemetry.funnel_derived: mozorg mac funnel
        desktop_funnels_telemetry.submission_date: after 2024/03/01
        desktop_funnels_telemetry.join_field: 'Yes'
      sorts: [desktop_funnels_telemetry.new_profiles desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: desktop_funnels_telemetry.join_field
        source_field_name: desktop_funnels_web.join_field
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      desktop_funnels_web.non_fx_downloads: "#005E5D"
      desktop_funnels_telemetry.new_profiles: "#FF2A8A"
      desktop_funnels_telemetry.returned_second_day: "#FFA537"
      desktop_funnels_telemetry.retained_week4: "#A7341F"
    series_labels:
      desktop_funnels_telemetry.returned_second_day: Repeat Users
      desktop_funnels_telemetry.retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_column
    listen:
    - Countries: desktop_funnels_web.normalized_country_code_subset
      Analysis Period: desktop_funnels_web.analysis_period
    - Countries: desktop_funnels_telemetry.normalized_country_code_subset
      Analysis Period: desktop_funnels_telemetry.analysis_period
    row: 4
    col: 0
    width: 24
    height: 9
  - name: Funnel Counts
    title: Funnel Counts
    merged_queries:
    - model: duet
      explore: desktop_funnels_web
      type: table
      fields: [desktop_funnels_web.submission_date, desktop_funnels_web.non_fx_sessions_smoothed,
        desktop_funnels_web.non_fx_downloads_smoothed]
      fill_fields: [desktop_funnels_web.submission_date]
      filters:
        desktop_funnels_web.funnel_derived: mozorg mac funnel
      sorts: [desktop_funnels_web.submission_date desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: desktop_funnels_telemetry
      type: table
      fields: [desktop_funnels_telemetry.submission_date, desktop_funnels_telemetry.new_profiles_smoothed,
        desktop_funnels_telemetry.returned_second_day_smoothed, desktop_funnels_telemetry.retained_week4_smoothed]
      fill_fields: [desktop_funnels_telemetry.submission_date]
      filters:
        desktop_funnels_telemetry.funnel_derived: mozorg mac funnel
      sorts: [desktop_funnels_telemetry.submission_date desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: desktop_funnels_telemetry.submission_date
        source_field_name: desktop_funnels_web.submission_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: desktop_funnels_web.non_fx_sessions_smoothed,
            id: desktop_funnels_web.non_fx_sessions_smoothed, name: Non Fx Sessions},
          {axisId: desktop_funnels_web.non_fx_downloads_smoothed, id: desktop_funnels_web.non_fx_downloads_smoothed,
            name: Non Fx Downloads}, {axisId: desktop_funnels_telemetry.new_profiles_smoothed,
            id: desktop_funnels_telemetry.new_profiles_smoothed, name: New Profiles},
          {axisId: desktop_funnels_telemetry.returned_second_day_smoothed, id: desktop_funnels_telemetry.returned_second_day_smoothed,
            name: Repeat Users}, {axisId: desktop_funnels_telemetry.retained_week4_smoothed,
            id: desktop_funnels_telemetry.retained_week4_smoothed, name: Week 4 Retained}],
        showLabels: true, showValues: true, minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    label_value_format: "#,###"
    point_style: none
    series_colors:
      desktop_funnels_web.non_fx_downloads_smoothed: "#005E5D"
      desktop_funnels_telemetry.new_profiles_smoothed: "#FF2A8A"
      desktop_funnels_telemetry.returned_second_day_smoothed: "#FFA537"
      desktop_funnels_telemetry.retained_week4_smoothed: "#A7341F"
      non_fx_downloads: "#005E5D"
      new_profiles: "#FF2A8A"
      returned_second_day: "#FFA537"
      retained_week4: "#A7341F"
    series_labels:
      desktop_funnels_web.non_fx_sessions_smoothed: Non Fx Sessions
      desktop_funnels_web.non_fx_downloads_smoothed: Non Fx Downloads
      desktop_funnels_telemetry.new_profiles_smoothed: New Profiles
      desktop_funnels_telemetry.returned_second_day_smoothed: Repeat Users
      desktop_funnels_telemetry.retained_week4_smoothed: Week 4 Retained
      non_fx_sessions: Non Fx Sessions
      non_fx_downloads: Non Fx Downloads
      new_profiles: New Profiles
      returned_second_day: Repeat Users
      retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_line
    hidden_fields: [cutoff, desktop_funnels_web.non_fx_sessions_smoothed, desktop_funnels_web.non_fx_downloads_smoothed,
      desktop_funnels_telemetry.new_profiles_smoothed, desktop_funnels_telemetry.returned_second_day_smoothed,
      desktop_funnels_telemetry.retained_week4_smoothed]
    hidden_points_if_no: [cutoff]
    sorts: [desktop_funnels_web.submission_date]
    dynamic_fields:
    - category: table_calculation
      expression: ${desktop_funnels_web.submission_date} >= to_date("2024-03-01")
      label: cutoff
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: cutoff
      _type_hint: yesno
    - category: table_calculation
      expression: if(${cutoff}, ${desktop_funnels_web.non_fx_sessions_smoothed}, null)
      label: non_fx_sessions
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: non_fx_sessions
      _type_hint: number
    - category: table_calculation
      expression: if(${cutoff}, ${desktop_funnels_web.non_fx_downloads_smoothed},
        null)
      label: non_fx_downloads
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: non_fx_downloads
      _type_hint: number
    - category: table_calculation
      expression: if(${cutoff}, ${desktop_funnels_telemetry.new_profiles_smoothed},
        null)
      label: new_profiles
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: if(${cutoff}, ${desktop_funnels_telemetry.returned_second_day_smoothed},
        null)
      label: returned_second_day
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: returned_second_day
      _type_hint: number
    - category: table_calculation
      expression: if(${cutoff}, ${desktop_funnels_telemetry.retained_week4_smoothed},
        null)
      label: retained_week4
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: retained_week4
      _type_hint: number
    listen:
    - Countries: desktop_funnels_web.normalized_country_code_subset
      Analysis Period: desktop_funnels_web.analysis_period
    - Countries: desktop_funnels_telemetry.normalized_country_code_subset
      Analysis Period: desktop_funnels_telemetry.analysis_period
    row: 13
    col: 15
    width: 9
    height: 10
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"The Desktop Moz.org Mac Funnel consists
      of MacOS users who acquired Firefox via our website ("},{"type":"a","url":"https://www.mozilla.org/","children":[{"text":"https://www.mozilla.org/"}],"id":"r30m4"},{"text":").
      Documentation is available in the "},{"type":"a","url":"https://docs.google.com/document/d/1W0FwfsaI8mO3ONuSKmoSqvwjEqiyEYTf2MIls-q9zJU/edit#heading=h.tq5vvx6c592z","children":[{"text":"Dashboard
      Manual: Desktop Moz.org Funnel (Mac)"}],"id":"3fa71"},{"text":". For questions,
      contact @shong. "}],"id":"053qw"},{"type":"p","children":[{"bold":true,"text":"Metrics"},{"text":"
      listed blow: "}],"id":"p2oj9"},{"type":"p","children":[{"text":"","bold":true}],"id":"8bmap"},{"type":"p","children":[{"bold":true,"text":"Non
      Fx Sessions:"},{"text":" Number of visits to our website (counted via GA Sessions)              "},{"text":"Non
      Fx Downloads: ","bold":true},{"text":"Number of those visits that resulted in
      a download (counted via GA)"}],"id":"ktk2z"},{"type":"p","children":[{"text":"New
      Installs","bold":true,"strikethrough":true},{"bold":true,"text":":"},{"text":"
      "},{"text":"Not available for MacOS","color":"hsl(0, 100%, 50%)"},{"text":"        "},{"text":"                                                                          New
      Profiles: ","bold":true},{"text":"Number of new profiles created as a result
      of a Firefox firstrun"}],"id":"6ldvn"},{"type":"p","children":[{"text":"Repeat
      Users:","bold":true},{"text":" Number of new profiles that returned for a second
      session within their first 28 days"}],"id":"6e7uu"},{"type":"p","children":[{"text":"Week
      4 Retained: ","bold":true},{"text":"Number of new profiles that were still active
      21 to 28 days after they first appeared. "}],"id":"agmup"},{"type":"p","id":"uhjyq","children":[{"text":""}]},{"type":"h3","id":"rgh0y","children":[{"text":"Important
      Cavets for this Dashboard: "}]},{"type":"p","children":[{"text":""}],"id":"dwgl2"},{"type":"ol","children":[{"type":"li","children":[{"type":"lic","id":"6tnsb","children":[{"text":"MacOS
      attribution only landed in Q1 of 2024. Therefore, all data in this dashboard
      is restricted to "},{"text":"after","italic":true},{"text":" March 1st 2024.
      "}]}],"id":"chmrk"},{"type":"li","children":[{"type":"lic","children":[{"text":"YOY
      numbers will not be available until Q2 of 2025. "}],"id":"r622e"}],"id":"p42bl"},{"type":"li","children":[{"type":"lic","children":[{"text":"We
      expect Download "},{"text":"→ New Profile conversion to be worse then Windows,
      and New Profile → Repeat User conversion to be better, because, unlike Windows,
      where Firefox automatically runs for the first time upon installation, Mac users
      need to personally open the newly installed browser in order to become a New
      Profile. ","fontSize":"10pt","backgroundColor":"transparent","color":"rgb(0,
      0, 0)"}],"id":"4nsde"}],"id":"tpgxi"}],"id":"nlwoa"}]'
    rich_content_json: '{"format":"slate"}'
    row: 23
    col: 0
    width: 24
    height: 9
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="background-color: #3FE1B0; height: 16px; width: 545px; display: flex; align-items: center; padding-left: 200px;">
        <span style="color: white;">mozilla.org / Google Analytics</span>
      </div>
    row: 13
    col: 0
    width: 10
    height: 1
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="background-color: #FF2A8A; height: 16px; width: 820px; display: flex; align-items: center; padding-left: 400px;">
        <span style="color: white;">Telemetry</span>
      </div>
    row: 18
    col: 0
    width: 15
    height: 1
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="background-color: black; height: 16px; width: 250px; display: flex; align-items: center; padding-left: 100px;">
        <span style="color: white;">No Measurements</span>
      </div>
    row: 13
    col: 10
    width: 5
    height: 1
  filters:
  - name: Analysis Period
    title: Analysis Period
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: desktop_funnels_dates
    listens_to_filters: []
    field: desktop_funnels_dates.analysis_period
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
    explore: desktop_funnels_web
    listens_to_filters: []
    field: desktop_funnels_web.normalized_country_code_subset
