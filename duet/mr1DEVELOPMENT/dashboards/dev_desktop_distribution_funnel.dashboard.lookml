---
- dashboard: desktop_distribution_builds_funnel
  title: Desktop Distribution Builds Funnel
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DINuPl7s3U1Ge47YErd0K7
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
        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_moz_org_funnel_mac">
      Moz.org Funnel (Mac)</a>
        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::desktop_distribution_builds_funnel">
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
    explore: dev_desktop_dates_partners
    type: single_value
    fields: [dev_desktop_dates_partners.max_date, dev_desktop_dates_partners.min_date]
    filters:
      dev_desktop_dates_partners.join_field: 'yes'
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "concat(\nto_string(${dev_desktop_dates_partners.min_date}), \n\
        \ \"  to  \" ,\nto_string(${dev_desktop_dates_partners.max_date})\n)"
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
    hidden_fields: [dev_desktop_dates_partners.max_date, dev_desktop_dates_partners.min_date]
    listen:
      Analysis Period: dev_desktop_dates_partners.analysis_period
    row: 2
    col: 0
    width: 16
    height: 2
  - title: Days Reporting
    name: Days Reporting
    model: duet
    explore: dev_desktop_dates_partners
    type: single_value
    fields: [dev_desktop_dates_partners.days]
    filters:
      dev_desktop_dates_partners.join_field: 'yes'
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
    listen:
      Analysis Period: dev_desktop_dates_partners.analysis_period
    row: 2
    col: 16
    width: 8
    height: 2
  - title: New Profile Counts
    name: New Profile Counts
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_line
    fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      dev_desktop_usage_partners.tmp_piechart_breakdown]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
    sorts: [dev_desktop_usage_partners.submission_date desc]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OS pre-installed", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: Linux (OS pre-installed)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: linux_os_pre_installed
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Mozilla - China", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: MozillaOnline (partner website)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: mozillaonline_partner_website
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Microsoft (store)", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: MSFT Store (secondary store)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: msft_store_secondary_store
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Uncategorized", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: Uncategorized
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: uncategorized
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Mozilla - EME free", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: Mozilla - EME free
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: mozilla_eme_free
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "secondary store", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: other secondary stores
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: other_secondary_stores
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OEM pre-installed", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: OEM pre-installed
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: oem_pre_installed
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "partner website", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: other partner websites
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: other_partner_websites
      _type_hint: number
    - category: table_calculation
      expression: |2

        if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OEM onboarding", ${dev_desktop_usage_partners.new_profiles_smoothed}, null)
      label: OEM onboarding
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: oem_onboarding
      _type_hint: number
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
    show_null_points: false
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      dev_desktop_usage_partners.new_profiles_smoothed: "#FF2A8A"
      dev_desktop_usage_partners.returned_second_day_smoothed: "#FFA537"
      dev_desktop_usage_partners.retained_week4_smoothed: "#A7341F"
    series_labels:
      dev_desktop_usage_partners.new_profiles_smoothed: New Profiles
      dev_desktop_usage_partners.returned_second_day_smoothed: Repeat Users
      dev_desktop_usage_partners.retained_week4_smoothed: Week 4 Retained
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [dev_desktop_usage_partners.tmp_piechart_breakdown, dev_desktop_usage_partners.new_profiles_smoothed]
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 14
    col: 0
    width: 12
    height: 8
  - name: YOY Change
    title: YOY Change
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.tmp_piechart_breakdown]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.tmp_piechart_breakdown]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.year_over_year: 'Yes'
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 1000
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
      join_fields:
      - field_name: dt
        source_field_name: dt
      - field_name: dev_desktop_usage_partners.tmp_piechart_breakdown
        source_field_name: dev_desktop_usage_partners.tmp_piechart_breakdown
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      new_profiles: "#FF2A8A"
      returned_second_day: "#FFA537"
      retained_week4: "#A7341F"
    series_labels:
      new_profiles: New Profiles
      returned_second_day: Repeat Users
      retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change}]
    show_null_points: false
    interpolation: linear
    hidden_fields: [q1_dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      q1_dev_desktop_usage_partners.new_profiles_smoothed, q1_dev_desktop_usage_partners.returned_second_day_smoothed,
      q1_dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.tmp_piechart_breakdown,
      dt, new_profiles]
    type: looker_line
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.new_profiles_smoothed} - ${q1_dev_desktop_usage_partners.new_profiles_smoothed})/${q1_dev_desktop_usage_partners.new_profiles_smoothed}"
      label: new_profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OS pre-installed",
        ${new_profiles}, null)

        '
      label: Linux (OS pre-installed)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: linux_os_pre_installed
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Mozilla
        - China", ${new_profiles}, null)

        '
      label: MozillaOnline (partner website)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: mozillaonline_partner_website
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Microsoft
        (store)", ${new_profiles}, null)

        '
      label: MSFT Store (secondary store)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: msft_store_secondary_store
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Uncategorized",
        ${new_profiles}, null)

        '
      label: Uncategorized
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: uncategorized
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "Mozilla
        - EME free", ${new_profiles}, null)

        '
      label: Mozilla - EME free
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: mozilla_eme_free
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "secondary
        store", ${new_profiles}, null)

        '
      label: other secondary stores
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: other_secondary_stores
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OEM
        pre-installed", ${new_profiles}, null)

        '
      label: OEM pre-installed
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: oem_pre_installed
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "partner
        website", ${new_profiles}, null)

        '
      label: other partner websites
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: other_partner_websites
      _type_hint: number
    - category: table_calculation
      expression: 'if(${dev_desktop_usage_partners.tmp_piechart_breakdown} = "OEM
        onboarding", ${new_profiles}, null)

        '
      label: OEM onboarding
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: oem_onboarding
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 14
    col: 12
    width: 12
    height: 8
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"The Desktop Distribution Builds
      Funnel consists of new users on specialized builds of Firefox. "}]},{"type":"p","id":"iw4uk","children":[{"text":"Typically,
      these are users acquired via one of our distribution partners, and are characterized
      by an identifier in the profiles "},{"text":"distribution_id","code":true},{"text":"
      field. "}]},{"type":"p","id":"4uvdo","children":[{"text":"There is a number
      of different distribution channels that these users come from, each with their
      own funnel steps, but they''re roughly organized into the following categories:
      "}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"uwhc0","children":[{"text":"OS
      Preinstalled","bold":true},{"text":" (aka Linux) "}]}],"id":"0wcr6"},{"type":"li","children":[{"type":"lic","children":[{"text":"Partner
      Website ","bold":true},{"text":"(MozillaOnline the most prominent - "},{"text":"NOTE:
      Mozilla Online isn''t monetized and doesn''t count towards DAU","color":"hsl(0,
      100%, 50%)"},{"text":")"}],"id":"dnpyw"}],"id":"7lkg0"},{"type":"li","children":[{"type":"lic","children":[{"text":"Secondary
      Stores","bold":true},{"text":" (MSFT Store being the most prominent) "}],"id":"yy534"}],"id":"t2jpa"},{"type":"li","children":[{"type":"lic","children":[{"text":"Mozilla
      - EME free","bold":true}],"id":"88wbu"}],"id":"bvggt"},{"type":"li","children":[{"type":"lic","children":[{"text":"OEM
      pre-installed","bold":true}],"id":"dg4k1"}],"id":"suky6"},{"type":"li","children":[{"type":"lic","children":[{"text":"OEM
      onboarding","bold":true}],"id":"wfin3"}],"id":"vsgle"},{"type":"li","children":[{"type":"lic","children":[{"text":"Uncategorized","bold":true}],"id":"60rwk"}],"id":"c8bnq"}],"id":"z072e"},{"type":"p","children":[{"text":"","bold":true}],"id":"2q8ze"},{"type":"p","id":"xlddq","children":[{"text":"For
      a description of how what the funnel flow looks like for each of these categories,
      consult the "},{"type":"a","url":"https://docs.google.com/document/d/1pppJC6q_1_QF0EaNyf_3dTHFnf_LHmaIwxVd29Jh-l8/edit#heading=h.u1xs0b3pxv3z","children":[{"text":"Desktop
      Distribution Builds - Taxonomy"}],"id":"38gd3"},{"text":" document. "}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 4
    col: 16
    width: 8
    height: 10
  - title: 'Overview: New Profiles'
    name: 'Overview: New Profiles'
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_pie
    fields: [dev_desktop_usage_partners.new_profiles, dev_desktop_usage_partners.tmp_piechart_breakdown]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.os_group: ''
      dev_desktop_usage_partners.partner_org: ''
    sorts: [dev_desktop_usage_partners.new_profiles desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_labels:
      OS pre-installed: Linux (OS pre-installed)
      Mozilla - China: MozillaOnline (partner website)
      Microsoft (store): MSFT Store (secondary store)
      secondary store: other secondary stores
      partner website: other partner websites
    defaults_version: 1
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 4
    col: 0
    width: 16
    height: 10
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #3FE1B0; height: 55px; color: black;">
        <nav style="font-size: 15px;">
          <span style="padding: 5px 25px; float: left; line-height: 40px;">Linux (OS Pre-Installed)</span>
        </nav>
      </div>
    row: 22
    col: 0
    width: 24
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #0060E0; height: 55px; color: white;">
        <nav style="font-size: 15px;">
          <span style="padding: 5px 25px; float: left; line-height: 40px;">MozillaOnline and Partner Websites</span>
        </nav>
      </div>
    row: 39
    col: 0
    width: 24
    height: 2
  - title: Funnel Overview (Linux Pre-Installed)
    name: Funnel Overview (Linux Pre-Installed)
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_column
    fields: [dev_desktop_usage_partners.new_profiles, dev_desktop_usage_partners.returned_second_day,
      dev_desktop_usage_partners.retained_week4]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: OS pre-installed
    limit: 500
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      dev_desktop_usage_partners.new_profiles: "#FF2A8A"
      dev_desktop_usage_partners.returned_second_day: "#FFA537"
      dev_desktop_usage_partners.retained_week4: "#A7341F"
    series_labels:
      dev_desktop_usage_partners.returned_second_day: Repeat Users
      dev_desktop_usage_partners.retained_week4: Week 4 Retained
      dev_desktop_usage_partners.tmp_installs_placeholder: New Installs (No Data)
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 24
    col: 0
    width: 12
    height: 10
  - title: Funnel Counts (Linux Pre-Installed)
    name: Funnel Counts (Linux Pre-Installed)
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_line
    fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
    fill_fields: [dev_desktop_usage_partners.submission_date]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: OS pre-installed
    sorts: [dev_desktop_usage_partners.submission_date desc]
    limit: 500
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
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      dev_desktop_usage_partners.new_profiles_smoothed: "#FF2A8A"
      dev_desktop_usage_partners.returned_second_day_smoothed: "#FFA537"
      dev_desktop_usage_partners.retained_week4_smoothed: "#A7341F"
    series_labels:
      dev_desktop_usage_partners.new_profiles_smoothed: New Profiles
      dev_desktop_usage_partners.returned_second_day_smoothed: Repeat Users
      dev_desktop_usage_partners.retained_week4_smoothed: Week 4 Retained
    defaults_version: 1
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 34
    col: 0
    width: 12
    height: 5
  - name: YOY (Linux Pre-Installed)
    title: YOY (Linux Pre-Installed)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: OS pre-installed
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.year_over_year: 'Yes'
        dev_desktop_usage_partners.distribution_model: OS pre-installed
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      new_profiles: "#FF2A8A"
      returned_second_day: "#FFA537"
      retained_week4: "#A7341F"
    series_labels:
      new_profiles: New Profiles
      returned_second_day: Repeat Users
      retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change}]
    show_null_points: false
    interpolation: linear
    hidden_fields: [dt, q1_dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      q1_dev_desktop_usage_partners.new_profiles_smoothed, q1_dev_desktop_usage_partners.returned_second_day_smoothed,
      q1_dev_desktop_usage_partners.retained_week4_smoothed]
    type: looker_line
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.new_profiles_smoothed} - ${q1_dev_desktop_usage_partners.new_profiles_smoothed})/${q1_dev_desktop_usage_partners.new_profiles_smoothed}"
      label: new_profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.returned_second_day_smoothed} - ${q1_dev_desktop_usage_partners.returned_second_day_smoothed})/${q1_dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: returned_second_day
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: returned_second_day
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.retained_week4_smoothed} - ${q1_dev_desktop_usage_partners.retained_week4_smoothed})/${q1_dev_desktop_usage_partners.retained_week4_smoothed}"
      label: retained_week4
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retained_week4
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 34
    col: 12
    width: 12
    height: 5
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #B933E1; height: 55px; color: white;">
        <nav style="font-size: 15px;">
          <span style="padding: 5px 25px; float: left; line-height: 40px;">MSFT Store and Secondary Stores</span>
        </nav>
      </div>
    row: 61
    col: 0
    width: 24
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"Firefox is the pre-installed web
      browser for many builds of the Linux OS. Since it is pre-installed, new users
      don''t have to visit our website, download, or install Firefox. "}]},{"type":"p","id":"31uav","children":[{"text":"They
      simply enter our funnel by opening the browser for the first time (New Profiles).
      "}]},{"type":"p","id":"g991l","children":[{"text":"These users have low intentionality,
      since they''re not "},{"text":"choosing","italic":true},{"text":" Firefox. "}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 30
    col: 12
    width: 12
    height: 4
  - title: ID Breakdown
    name: ID Breakdown
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_grid
    fields: [dev_desktop_usage_partners.distribution_id, dev_desktop_usage_partners.new_profiles,
      dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.retained_week4]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: OS pre-installed
      dev_desktop_usage_partners.os_group: ''
      dev_desktop_usage_partners.partner_org: ''
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    limit: 500
    column_limit: 50
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      dev_desktop_usage_partners.returned_second_day: Repeat Users
      dev_desktop_usage_partners.retained_week4: Week 4 Retained
    series_cell_visualizations:
      dev_desktop_usage_partners.new_profiles:
        is_active: false
      dev_desktop_usage_partners.returned_second_day:
        is_active: false
      dev_desktop_usage_partners.retained_week4:
        is_active: false
    defaults_version: 1
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 24
    col: 12
    width: 12
    height: 6
  - name: Funnel Overview (MozillaOnline and Partner Websites)
    title: Funnel Overview (MozillaOnline and Partner Websites)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.join_field, dev_desktop_usage_partners.retained_week4,
        dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.new_profiles]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: partner website
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs, dev_desktop_install_partners.join_field,
        dev_desktop_install_partners.paveover_installs, dev_desktop_install_partners.total_installs]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: partner website
      sorts: [dev_desktop_install_partners.new_installs desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_install_partners.join_field
        source_field_name: dev_desktop_usage_partners.join_field
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
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
    hidden_fields: [dev_desktop_install_partners.total_installs, dev_desktop_install_partners.paveover_installs,
      dev_desktop_usage_partners.join_field, dev_desktop_usage_partners.retained_week4,
      dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.new_profiles,
      dev_desktop_install_partners.new_installs]
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs}"
      label: New Installs (new data)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles}"
      label: New Profiles
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day}"
      label: Repeat Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4}"
      label: Week 4 Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 41
    col: 0
    width: 12
    height: 10
  - name: ID Breakdown (2)
    title: ID Breakdown
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.retained_week4, dev_desktop_usage_partners.returned_second_day,
        dev_desktop_usage_partners.new_profiles, dev_desktop_usage_partners.distribution_id]
      filters:
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: partner website
        dev_desktop_usage_partners.join_field: 'yes'
      sorts: [dev_desktop_usage_partners.retained_week4 desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs, dev_desktop_install_partners.paveover_installs,
        dev_desktop_install_partners.total_installs, dev_desktop_install_partners.distribution_id]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: partner website
      sorts: [dev_desktop_install_partners.new_installs desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_install_partners.distribution_id
        source_field_name: dev_desktop_usage_partners.distribution_id
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
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
    type: looker_grid
    hidden_fields: [dev_desktop_install_partners.total_installs, dev_desktop_install_partners.paveover_installs,
      dev_desktop_usage_partners.retained_week4, dev_desktop_usage_partners.returned_second_day,
      dev_desktop_usage_partners.new_profiles, dev_desktop_install_partners.new_installs]
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs}"
      label: New Installs (new data)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles}"
      label: New Profiles
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day}"
      label: Repeat Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4}"
      label: Week 4 Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 41
    col: 12
    width: 12
    height: 10
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"A major source of Distribution Build
      acquisition comes from partner organizaions that distribute a version of Firefox
      through their website. The biggest contributor of this funnel is MozillaOnline
      ("},{"type":"a","url":"http://www.firefox.com.cn/","children":[{"text":"Firefox
      China"}],"id":"24vd1"},{"text":"). "}],"id":"6xqj1"},{"type":"p","id":"1kbdn","children":[{"text":"Note,
      MozillaOnline (Firefox China) users ","bold":true},{"bold":true,"text":"do not
      contribute to DAU","color":"hsl(0, 100%, 50%)"},{"bold":true,"text":", and are
      "},{"bold":true,"text":"not monetized","color":"hsl(0, 100%, 50%)"},{"bold":true,"text":".
      "}]},{"type":"p","id":"ab2rn","children":[{"text":"The user flow for this funnel
      is similar to our moz.org funnel: visit website → download the browser → install
      the browser → run the browser → continue using the browser. "}]},{"type":"p","id":"2tbyc","children":[{"text":"Visit
      and download data is not available to us (since it''s happening on partner websites).
      "}]},{"type":"p","id":"z7eox","children":[{"text":"We do have install data,
      however, it "},{"type":"a","url":"https://bugzilla.mozilla.org/show_bug.cgi?id=1665381","children":[{"text":"landed
      very recently"}],"id":"bot9j"},{"text":", so we expect there to be some lag
      before it “catches up” to the telemetry data. Furthermore: "}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"ayrql","children":[{"text":"install
      pings are only sent from Windows users (so not reported for Linux or Mac)"}]}],"id":"ms81o"},{"type":"li","children":[{"type":"lic","children":[{"text":"for
      older versions of the installer/Firefox, install data won''t be available"}],"id":"7knwa"}],"id":"ksngu"}],"id":"ysaq4"}]'
    rich_content_json: '{"format":"slate"}'
    row: 51
    col: 12
    width: 12
    height: 10
  - name: Funnel Counts (MozillaOnline and Partner Websites)
    title: Funnel Counts (MozillaOnline and Partner Websites)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: partner website
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.submission_date, dev_desktop_install_partners.new_installs_smoothed]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: partner website
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_install_partners.submission_date
        source_field_name: dev_desktop_usage_partners.submission_date
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_line
    hidden_fields: [dev_desktop_usage_partners.new_profiles_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_install_partners.new_installs_smoothed]
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs_smoothed}"
      label: New Installs (new data)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles_smoothed}"
      label: New Profiles
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: Repeat Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4_smoothed}"
      label: Week 4 Retained
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 51
    col: 0
    width: 12
    height: 5
  - name: YOY (MozillaOnline and Partner Websites)
    title: YOY (MozillaOnline and Partner Websites)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: partner website
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.submission_date, dev_desktop_install_partners.new_installs_smoothed]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: partner website
      sorts: [dev_desktop_install_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.year_over_year: 'Yes'
        dev_desktop_usage_partners.distribution_model: partner website
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
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
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs_smoothed, dev_desktop_install_partners.submission_date]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.year_over_year: 'Yes'
        dev_desktop_install_partners.distribution_model: partner website
      sorts: [dev_desktop_install_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install_partners.submission_date}),
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change}]
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_line
    hidden_fields: [dev_desktop_usage_partners.new_profiles_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_install_partners.new_installs_smoothed,
      dt, dev_desktop_install_partners.submission_date, q2_dev_desktop_usage_partners.submission_date,
      q3_dev_desktop_install_partners.submission_date, q2_dev_desktop_usage_partners.new_profiles_smoothed,
      q2_dev_desktop_usage_partners.retained_week4_smoothed, q2_dev_desktop_usage_partners.returned_second_day_smoothed,
      q3_dev_desktop_install_partners.new_installs_smoothed]
    hidden_pivots: {}
    sorts: [dev_desktop_usage_partners.submission_date desc]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_install_partners.new_installs_smoothed} - ${q3_dev_desktop_install_partners.new_installs_smoothed})/${q3_dev_desktop_install_partners.new_installs_smoothed}"
      label: New Installs (new data)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.new_profiles_smoothed} - ${q2_dev_desktop_usage_partners.new_profiles_smoothed})/${q2_dev_desktop_usage_partners.new_profiles_smoothed}"
      label: New Profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.returned_second_day_smoothed} - ${q2_dev_desktop_usage_partners.returned_second_day_smoothed})/${q2_dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: Repeat Users
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.retained_week4_smoothed} - ${q2_dev_desktop_usage_partners.retained_week4_smoothed})/${q2_dev_desktop_usage_partners.retained_week4_smoothed}"
      label: Week 4 Retained
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 56
    col: 0
    width: 12
    height: 5
  - title: Funnel Overview (MSFT Store and Seconday Stores)
    name: Funnel Overview (MSFT Store and Seconday Stores)
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_column
    fields: [dev_desktop_usage_partners.new_profiles, dev_desktop_usage_partners.returned_second_day,
      dev_desktop_usage_partners.retained_week4]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: secondary store
    limit: 500
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      dev_desktop_usage_partners.new_profiles: "#FF2A8A"
      dev_desktop_usage_partners.returned_second_day: "#FFA537"
      dev_desktop_usage_partners.retained_week4: "#A7341F"
    series_labels:
      dev_desktop_usage_partners.returned_second_day: Repeat Users
      dev_desktop_usage_partners.retained_week4: Week 4 Retained
      dev_desktop_usage_partners.tmp_installs_placeholder: New Installs (No Data)
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 63
    col: 0
    width: 12
    height: 10
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"We maintain storefronts in secondary
      stores like the Microsoft Store to distribute Firefox. "}]},{"type":"p","id":"j82ak","children":[{"text":"The
      user flow for a secondary store is like this: user our storefront in the secondary
      store → they click to install (at this point, the browser should automatically
      be downloaded and installed in the background without user action) → user runs
      the browser → user continues using the browser. "}]},{"type":"p","id":"g4cfi","children":[{"text":"Note,
      we don''t have data for visits to our storefront page and install clicks yet,
      but "},{"type":"a","url":"https://mozilla-hub.atlassian.net/browse/DENG-2631","children":[{"text":"it''s
      being acquired"}],"id":"ru37e"},{"text":" (for MSFT Store). "}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 69
    col: 12
    width: 12
    height: 4
  - title: Funnel Counts (MSFT Store and Secondary Stores)
    name: Funnel Counts (MSFT Store and Secondary Stores)
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_line
    fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
    fill_fields: [dev_desktop_usage_partners.submission_date]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: secondary store
    sorts: [dev_desktop_usage_partners.submission_date desc]
    limit: 500
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
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      dev_desktop_usage_partners.new_profiles_smoothed: "#FF2A8A"
      dev_desktop_usage_partners.returned_second_day_smoothed: "#FFA537"
      dev_desktop_usage_partners.retained_week4_smoothed: "#A7341F"
    series_labels:
      dev_desktop_usage_partners.new_profiles_smoothed: New Profiles
      dev_desktop_usage_partners.returned_second_day_smoothed: Repeat Users
      dev_desktop_usage_partners.retained_week4_smoothed: Week 4 Retained
    defaults_version: 1
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 73
    col: 0
    width: 12
    height: 5
  - title: ID Breakdown
    name: ID Breakdown (3)
    model: duet
    explore: dev_desktop_usage_partners
    type: looker_grid
    fields: [dev_desktop_usage_partners.distribution_id, dev_desktop_usage_partners.new_profiles,
      dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.retained_week4]
    filters:
      dev_desktop_usage_partners.join_field: 'yes'
      dev_desktop_usage_partners.funnel_derived: partner
      dev_desktop_usage_partners.distribution_model: secondary store
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    limit: 500
    column_limit: 50
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
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      dev_desktop_usage_partners.returned_second_day: Repeat Users
      dev_desktop_usage_partners.retained_week4: Week 4 Retained
    series_cell_visualizations:
      dev_desktop_usage_partners.new_profiles:
        is_active: false
      dev_desktop_usage_partners.returned_second_day:
        is_active: false
      dev_desktop_usage_partners.retained_week4:
        is_active: false
    defaults_version: 1
    listen:
      Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 63
    col: 12
    width: 12
    height: 6
  - name: YOY (MSFT Store and Secondary Stores)
    title: YOY (MSFT Store and Secondary Stores)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: secondary store
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.year_over_year: 'Yes'
        dev_desktop_usage_partners.distribution_model: secondary store
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
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
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      new_profiles: "#FF2A8A"
      returned_second_day: "#FFA537"
      retained_week4: "#A7341F"
    series_labels:
      new_profiles: New Profiles
      returned_second_day: Repeat Users
      retained_week4: Week 4 Retained
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change}]
    show_null_points: false
    interpolation: linear
    hidden_fields: [dt, q1_dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      q1_dev_desktop_usage_partners.new_profiles_smoothed, q1_dev_desktop_usage_partners.returned_second_day_smoothed,
      q1_dev_desktop_usage_partners.retained_week4_smoothed]
    type: looker_line
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.new_profiles_smoothed} - ${q1_dev_desktop_usage_partners.new_profiles_smoothed})/${q1_dev_desktop_usage_partners.new_profiles_smoothed}"
      label: new_profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.returned_second_day_smoothed} - ${q1_dev_desktop_usage_partners.returned_second_day_smoothed})/${q1_dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: returned_second_day
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: returned_second_day
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.retained_week4_smoothed} - ${q1_dev_desktop_usage_partners.retained_week4_smoothed})/${q1_dev_desktop_usage_partners.retained_week4_smoothed}"
      label: retained_week4
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retained_week4
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    row: 73
    col: 12
    width: 12
    height: 5
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: black; height: 55px; color: white;">
        <nav style="font-size: 15px;">
          <span style="padding: 5px 25px; float: left; line-height: 40px;">Remaining Distribution Models (Uncategorized, Mozilla - EME Free, OEM Pre-installed, OEM Onboarding)</span>
        </nav>
      </div>
    row: 78
    col: 0
    width: 24
    height: 2
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"This section is a catchall for the
      remaining distribution models we have: "}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":"r2tj9","children":[{"text":"Uncategorized
      (likely unauthorized builds)"}]}],"id":"4fhgo"},{"type":"li","children":[{"type":"lic","children":[{"text":"Mozilla
      -EME free"}],"id":"w2z1h"}],"id":"a36kp"},{"type":"li","children":[{"type":"lic","children":[{"text":"OEM
      pre-installed"}],"id":"uqw8w"}],"id":"fudq3"},{"type":"li","children":[{"type":"lic","children":[{"text":"OEM
      onboarding"}],"id":"dt4oq"}],"id":"ldv94"}],"id":"eneqc"},{"type":"p","children":[{"text":""}],"id":"hug1e"},{"type":"p","id":"243jg","children":[{"text":"Some
      of these distribution models include an installation step, some do not. For
      details, refer to the "},{"type":"a","url":"https://docs.google.com/document/d/1pppJC6q_1_QF0EaNyf_3dTHFnf_LHmaIwxVd29Jh-l8/edit","children":[{"text":"Desktop
      Distribution Builds - Taxonomy"}],"id":"0yknx"},{"text":" document. "}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 86
    col: 12
    width: 12
    height: 4
  - name: Funnel Overview (Remaining Distribution Models)
    title: Funnel Overview (Remaining Distribution Models)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.join_field, dev_desktop_usage_partners.retained_week4,
        dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.new_profiles]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_usage_partners.retained_week4 desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs, dev_desktop_install_partners.join_field,
        dev_desktop_install_partners.paveover_installs, dev_desktop_install_partners.total_installs]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_install_partners.new_installs desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_install_partners.join_field
        source_field_name: dev_desktop_usage_partners.join_field
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
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
    hidden_fields: [dev_desktop_install_partners.total_installs, dev_desktop_install_partners.paveover_installs,
      dev_desktop_usage_partners.join_field, dev_desktop_usage_partners.retained_week4,
      dev_desktop_usage_partners.returned_second_day, dev_desktop_usage_partners.new_profiles,
      dev_desktop_install_partners.new_installs]
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs}"
      label: New Installs (new data)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles}"
      label: New Profiles
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day}"
      label: Repeat Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4}"
      label: Week 4 Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 80
    col: 0
    width: 12
    height: 10
  - name: ID Breakdown (Remaining Distribution Models)
    title: ID Breakdown (Remaining Distribution Models)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.retained_week4, dev_desktop_usage_partners.returned_second_day,
        dev_desktop_usage_partners.new_profiles, dev_desktop_usage_partners.distribution_model,
        dev_desktop_usage_partners.distribution_id]
      filters:
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
        dev_desktop_usage_partners.join_field: 'yes'
      sorts: [dev_desktop_usage_partners.retained_week4 desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs, dev_desktop_install_partners.paveover_installs,
        dev_desktop_install_partners.total_installs, dev_desktop_install_partners.distribution_model,
        dev_desktop_install_partners.distribution_id]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_install_partners.new_installs desc]
      limit: 500
      column_limit: 50
      join_fields:
      - field_name: dev_desktop_install_partners.distribution_id
        source_field_name: dev_desktop_usage_partners.distribution_id
      - field_name: dev_desktop_install_partners.distribution_model
        source_field_name: dev_desktop_usage_partners.distribution_model
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
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
    type: looker_grid
    hidden_fields: [dev_desktop_install_partners.total_installs, dev_desktop_install_partners.paveover_installs,
      dev_desktop_usage_partners.retained_week4, dev_desktop_usage_partners.returned_second_day,
      dev_desktop_usage_partners.new_profiles, dev_desktop_install_partners.new_installs]
    sorts: [dev_desktop_usage_partners.retained_week4 desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs}"
      label: New Installs (new data)
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles}"
      label: New Profiles
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day}"
      label: Repeat Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4}"
      label: Week 4 Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 80
    col: 12
    width: 12
    height: 6
  - name: Funnel Counts (Remaining Distribution Models)
    title: Funnel Counts (Remaining Distribution Models)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      limit: 500
      column_limit: 50
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.submission_date, dev_desktop_install_partners.new_installs_smoothed]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_install_partners.submission_date desc]
      limit: 500
      column_limit: 50
      hidden_pivots: {}
      join_fields:
      - field_name: dev_desktop_install_partners.submission_date
        source_field_name: dev_desktop_usage_partners.submission_date
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_line
    hidden_fields: [dev_desktop_usage_partners.new_profiles_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_install_partners.new_installs_smoothed]
    hidden_pivots: {}
    dynamic_fields:
    - category: table_calculation
      expression: "${dev_desktop_install_partners.new_installs_smoothed}"
      label: New Installs (new data)
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.new_profiles_smoothed}"
      label: New Profiles
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: Repeat Users
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "${dev_desktop_usage_partners.retained_week4_smoothed}"
      label: Week 4 Retained
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 90
    col: 0
    width: 12
    height: 5
  - name: YOY (Remaining Distribution Models)
    title: YOY (Remaining Distribution Models)
    merged_queries:
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
    - model: duet
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.submission_date, dev_desktop_install_partners.new_installs_smoothed]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_install_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install_partners.submission_date}),
          6, 5) '
        label: dt
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: dt
        _type_hint: string
      hidden_pivots: {}
      join_fields:
      - field_name: dt
        source_field_name: dt
    - model: duet
      explore: dev_desktop_usage_partners
      type: table
      fields: [dev_desktop_usage_partners.submission_date, dev_desktop_usage_partners.new_profiles_smoothed,
        dev_desktop_usage_partners.retained_week4_smoothed, dev_desktop_usage_partners.returned_second_day_smoothed]
      fill_fields: [dev_desktop_usage_partners.submission_date]
      filters:
        dev_desktop_usage_partners.join_field: 'yes'
        dev_desktop_usage_partners.funnel_derived: partner
        dev_desktop_usage_partners.year_over_year: 'Yes'
        dev_desktop_usage_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_usage_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_usage_partners.submission_date}),
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
      explore: dev_desktop_install_partners
      type: table
      fields: [dev_desktop_install_partners.new_installs_smoothed, dev_desktop_install_partners.submission_date]
      fill_fields: [dev_desktop_install_partners.submission_date]
      filters:
        dev_desktop_install_partners.join_field: 'yes'
        dev_desktop_install_partners.funnel_derived: partner
        dev_desktop_install_partners.year_over_year: 'Yes'
        dev_desktop_install_partners.distribution_model: OEM pre-installed,OEM onboarding,Mozilla
          - EME free,Uncategorized
      sorts: [dev_desktop_install_partners.submission_date desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: 'substring(to_string(${dev_desktop_install_partners.submission_date}),
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
    series_types: {}
    point_style: none
    series_colors:
      new_installs_new_data: "#9059FF"
      new_profiles: "#FF2A8A"
      repeat_users: "#FFA537"
      week_4_retained: "#A7341F"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: No Change}]
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    type: looker_line
    hidden_fields: [dev_desktop_usage_partners.new_profiles_smoothed, dev_desktop_usage_partners.retained_week4_smoothed,
      dev_desktop_usage_partners.returned_second_day_smoothed, dev_desktop_install_partners.new_installs_smoothed,
      dt, dev_desktop_install_partners.submission_date, q2_dev_desktop_usage_partners.submission_date,
      q3_dev_desktop_install_partners.submission_date, q2_dev_desktop_usage_partners.new_profiles_smoothed,
      q2_dev_desktop_usage_partners.retained_week4_smoothed, q2_dev_desktop_usage_partners.returned_second_day_smoothed,
      q3_dev_desktop_install_partners.new_installs_smoothed]
    hidden_pivots: {}
    sorts: [dev_desktop_usage_partners.submission_date desc]
    dynamic_fields:
    - category: table_calculation
      expression: "(${dev_desktop_install_partners.new_installs_smoothed} - ${q3_dev_desktop_install_partners.new_installs_smoothed})/${q3_dev_desktop_install_partners.new_installs_smoothed}"
      label: New Installs (new data)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_installs_new_data
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.new_profiles_smoothed} - ${q2_dev_desktop_usage_partners.new_profiles_smoothed})/${q2_dev_desktop_usage_partners.new_profiles_smoothed}"
      label: New Profiles
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: new_profiles
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.returned_second_day_smoothed} - ${q2_dev_desktop_usage_partners.returned_second_day_smoothed})/${q2_dev_desktop_usage_partners.returned_second_day_smoothed}"
      label: Repeat Users
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: repeat_users
      _type_hint: number
    - category: table_calculation
      expression: "(${dev_desktop_usage_partners.retained_week4_smoothed} - ${q2_dev_desktop_usage_partners.retained_week4_smoothed})/${q2_dev_desktop_usage_partners.retained_week4_smoothed}"
      label: Week 4 Retained
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: week_4_retained
      _type_hint: number
    listen:
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_usage_partners.analysis_period
      Countries: dev_desktop_usage_partners.normalized_country_code_subset
    - Analysis Period: dev_desktop_install_partners.analysis_period
      Countries: dev_desktop_install_partners.normalized_country_code_subset
    row: 90
    col: 12
    width: 12
    height: 5
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
    explore: dev_desktop_usage_partners
    listens_to_filters: []
    field: dev_desktop_usage_partners.analysis_period
  - name: Countries
    title: Countries
    type: field_filter
    default_value: US,GB,DE,FR,ROW,RU,ES,NL,AU,IN,CN,MX,CA,BR
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
    explore: dev_desktop_usage_partners
    listens_to_filters: []
    field: dev_desktop_usage_partners.normalized_country_code_subset
