- dashboard: kpi_installs_tracker
  title: KPI Installs tracker
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SCPGStZbzshqtFlXrpwbps
  elements:
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #000000; height: 60px; color: red;">

      <nav style="font-size: 18px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://www.mozilla.org/media/protocol/img/logos/mozilla/logo-word-hor.e20791bb4dd4.svg"/>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_tracker_all_combined">

       DAU KPIs</a>

        <a style="color: #efefef;padding: 5px 80px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_downloads_tracker">

      Desktop Downloads KPIs </a>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 80px; float: left; line-height: 40px;font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_installs_tracker">

       Mobile Installs KPIs </a>
      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Daily Mobile installs
    title: Daily Mobile installs
    model: duet
    explore: kpi_installs
    type: looker_line
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs,
      kpi_installs.day_month, kpi_installs.installs_goal]
    filters:
      kpi_installs.compare_to: Year
      kpi_installs.network: ''
    sorts: [kpi_installs.day_month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${kpi_installs.installs_goal}",
        label: Installs Goal, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: installs_goal, _type_hint: number}]
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [kpi_installs.installs_goal]
    series_types: {}
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 8
    col: 0
    width: 8
    height: 6
  - name: Monthly Mobile Installs
    title: Monthly Mobile Installs
    model: duet
    explore: kpi_installs
    type: looker_line
    fields: [kpi_installs.month, kpi_installs.current_period_installs, kpi_installs.previous_period_installs,
      kpi_installs.installs_goal]
    filters:
      kpi_installs.compare_to: Year
      kpi_installs.network: ''
    sorts: [kpi_installs.month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${kpi_installs.installs_goal}",
        label: Installs Goal, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: installs_goal, _type_hint: number}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [kpi_installs.installs_goal]
    series_types: {}
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 8
    col: 8
    width: 8
    height: 6
  - name: Quarterly Mobile Installs
    title: Quarterly Mobile Installs
    model: duet
    explore: kpi_installs
    type: looker_line
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs,
      kpi_installs.installs_goal, kpi_installs.quarter_abr]
    filters:
      kpi_installs.compare_to: Year
      kpi_installs.network: ''
    sorts: [kpi_installs.current_period_installs desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${kpi_installs.installs_goal}",
        label: Installs Goal, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: installs_goal, _type_hint: number}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [kpi_installs.installs_goal]
    series_types: {}
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 8
    col: 16
    width: 8
    height: 6
  - name: Current day install
    title: Current day install
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.day_month, kpi_installs.current_period_installs, kpi_installs.previous_period_installs]
    filters:
      kpi_installs.compare_to: Year
    sorts: [kpi_installs.day_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Current Day Installs
    comparison_label: vs PY %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [kpi_installs.previous_period_installs]
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 4
    col: 0
    width: 4
    height: 4
  - name: WTD installs Adjust
    title: WTD installs Adjust
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs]
    filters:
      kpi_installs.compare_to: Week
    sorts: [kpi_installs.current_period_installs desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: WTD Installs
    comparison_label: vs PW %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [kpi_installs.previous_period_installs]
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 4
    col: 4
    width: 5
    height: 4
  - name: MTD installs Adjust
    title: MTD installs Adjust
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs]
    filters:
      kpi_installs.compare_to: Month
    sorts: [kpi_installs.current_period_installs desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: MTD Installs
    comparison_label: vs PM %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [kpi_installs.previous_period_installs]
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 4
    col: 9
    width: 5
    height: 4
  - name: QTD installs Adjust
    title: QTD installs Adjust
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs]
    filters:
      kpi_installs.compare_to: Quarter
    sorts: [kpi_installs.current_period_installs desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: QTD Installs
    comparison_label: vs PQ %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [kpi_installs.previous_period_installs]
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 4
    col: 14
    width: 5
    height: 4
  - name: YTD installs Adjust
    title: YTD installs Adjust
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.current_period_installs, kpi_installs.previous_period_installs]
    filters:
      kpi_installs.compare_to: Year
    sorts: [kpi_installs.current_period_installs desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: YTD Installs
    comparison_label: vs PY %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [kpi_installs.previous_period_installs]
    listen:
      Adgroup: kpi_installs.adgroup
      Campaign: kpi_installs.campaign
      OS: kpi_installs.os
      Creative: kpi_installs.creative
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 4
    col: 19
    width: 5
    height: 4
  - title: Current date
    name: Current date
    model: duet
    explore: kpi_installs
    type: single_value
    fields: [kpi_installs.date_date]
    fill_fields: [kpi_installs.date_date]
    filters:
      kpi_installs.compare_to: Quarter
    sorts: [kpi_installs.date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${kpi_installs.current_period_installs}\
          \ - ${kpi_installs.previous_period_installs})/ ${kpi_installs.previous_period_installs}",
        label: Percentage Change, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage_change, _type_hint: number,
        is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most recent avaliable date
    comparison_label: vs PQ %change
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Campaign: kpi_installs.campaign
      Adgroup: kpi_installs.adgroup
      Creative: kpi_installs.creative
      OS: kpi_installs.os
      Current_Date: kpi_installs.current_date
      Country_Filter: kpi_installs.country_filter
    row: 0
    col: 18
    width: 6
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Filter usage"}],"align":"center","id":1683561057008},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"For
      the date filter, always select the end date of the current current period. This
      dashboard compares current year with 2022 and so we only need to select a point
      in 2023 to see YTD trends"}],"id":1683554377620}],"id":1683554380534},{"type":"li","children":[{"type":"lic","children":[{"text":"Country
      and OS filters has a check box and so we can filter to single  or multiple entries"}],"id":1683554596707}],"id":1683554596707},{"type":"li","children":[{"type":"lic","children":[{"text":"For
      the rest of the filters, you can either filter to one or filter to all"}],"id":1683554645284}],"id":1683554645284}],"id":1683561057009},{"type":"p","children":[{"text":"Reach
      out to rbaffourawuah@ with any questions"}],"id":1683561057010}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 16
    height: 4
  filters:
  - name: Current_Date
    title: Current_Date
    type: field_filter
    default_value: before 2023/05/08
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.current_date
  - name: Country_Filter
    title: Country_Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - US
      - GB
      - DE
      - PL
      - FR
      - ES
      - IT
      - CA
      - Other
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.country_filter
  - name: Campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.campaign
  - name: Creative
    title: Creative
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.creative
  - name: Adgroup
    title: Adgroup
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.adgroup
  - name: OS
    title: OS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - bada
      - unknown
      - android-tv
      - windows
      - webos
      - symbian
      - ios
      - macos
      - android
      - windows-phone
      - linux
    model: duet
    explore: kpi_installs
    listens_to_filters: []
    field: kpi_installs.os
