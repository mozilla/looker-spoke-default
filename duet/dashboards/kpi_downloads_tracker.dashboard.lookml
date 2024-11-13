- dashboard: kpi_downloads_tracker
  title: KPI downloads tracker
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: lyi6V2YMDxn1auwjHhMz4L
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

        <a style="color: #efefef; border: 1px solid white; padding: 5px 80px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_downloads_tracker">

      Desktop Downloads KPIs </a>

        <a style="color: #efefef; padding: 5px 80px; float: left; line-height: 40px;font-weight: bold" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_installs_tracker">

       Mobile Installs KPIs </a>
      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: QTD Downloads
    title: QTD Downloads
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.quarter_abr, kpi_downloads.previous_period_downloads]
    filters:
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.quarter_abr desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: QTD Total Downloads
    comparison_label: vs PQ % change
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
    hidden_fields: [kpi_downloads.previous_period_downloads]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 4
    col: 15
    width: 5
    height: 4
  - name: Quaterly Desktop Downloads
    title: Quaterly Desktop Downloads
    model: duet
    explore: kpi_downloads
    type: looker_line
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads,
      kpi_downloads.download_goal, kpi_downloads.quarter_abr]
    filters:
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.quarter_abr]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
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
    show_null_points: true
    interpolation: linear
    hidden_fields: [kpi_downloads.download_goal]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 8
    col: 16
    width: 8
    height: 6
  - name: Monthly Desktop Downloads
    title: Monthly Desktop Downloads
    model: duet
    explore: kpi_downloads
    type: looker_line
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads,
      kpi_downloads.download_goal, kpi_downloads.month]
    filters:
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
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
    show_null_points: true
    interpolation: linear
    hidden_fields: [kpi_downloads.download_goal]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 8
    col: 8
    width: 8
    height: 6
  - name: Daily Desktop Downloads
    title: Daily Desktop Downloads
    model: duet
    explore: kpi_downloads
    type: looker_line
    fields: [kpi_downloads.day_month, kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads,
      kpi_downloads.download_goal]
    filters:
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.day_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
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
    show_null_points: true
    interpolation: linear
    hidden_fields: [kpi_downloads.download_goal]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 8
    col: 0
    width: 8
    height: 6
  - name: YTD downloads total
    title: YTD downloads total
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads]
    filters:
      kpi_downloads.compare_to: Year
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: YTD Total Downloads
    comparison_label: vs PY % change
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
    hidden_fields: [kpi_downloads.previous_period_downloads]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 4
    col: 20
    width: 4
    height: 4
  - name: MTD downloads
    title: MTD downloads
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads]
    filters:
      kpi_downloads.compare_to: Month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: MTD Total Downloads
    comparison_label: vs PM % change
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
    hidden_fields: [kpi_downloads.previous_period_downloads]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 4
    col: 10
    width: 5
    height: 4
  - name: WTD downloads
    title: WTD downloads
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads]
    filters:
      kpi_downloads.compare_to: Week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: WTD Total Downloads
    comparison_label: vs PW % change
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
    hidden_fields: [kpi_downloads.previous_period_downloads]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 4
    col: 5
    width: 5
    height: 4
  - name: Current day downloads
    title: Current day downloads
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.current_period_downloads, kpi_downloads.previous_period_downloads,
      kpi_downloads.day_month]
    filters:
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.day_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Current Day Downloads
    comparison_label: vs PY % change
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
    hidden_fields: [kpi_downloads.previous_period_downloads]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Campaign: kpi_downloads.campaign
      Source: kpi_downloads.source
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
      Current_Date: kpi_downloads.current_date
    row: 4
    col: 0
    width: 5
    height: 4
  - name: date look
    title: date look
    model: duet
    explore: kpi_downloads
    type: single_value
    fields: [kpi_downloads.date_date]
    fill_fields: [kpi_downloads.date_date]
    filters:
      kpi_downloads.current_date: before 2023/12/31
      kpi_downloads.compare_to: Year
    sorts: [kpi_downloads.date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_downloads.download_goal}"
      label: Download Goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: download_goal
      _type_hint: number
      is_disabled: true
    - args:
      - kpi_downloads.current_period_downloads
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: kpi_downloads.current_period_downloads
      label: Percent change from previous - KPI filtered metrics Current Period Downloads
      source_field: kpi_downloads.current_period_downloads
      table_calculation: percent_change_from_previous_kpi_filtered_metrics_current_period_downloads
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "(${kpi_downloads.current_period_downloads}/${kpi_downloads.previous_period_downloads})\
        \ - 1"
      label: Percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most recent avaliable date
    comparison_label: Previous Year % change
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
    hidden_fields: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Source: kpi_downloads.source
      Campaign: kpi_downloads.campaign
      Medium: kpi_downloads.medium
      OS: kpi_downloads.operating_system
      Country_Filter: kpi_downloads.country_filter
      Ad_Content: kpi_downloads.ad_content
    row: 0
    col: 16
    width: 7
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Filter usage"}],"align":"center"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"For
      the date filter, always select the end date of the current current period. This
      dashboard compares current year with 2022 and so we only need to select a point
      in 2023 to see YTD trends"}],"id":1683554377620}],"id":1683554380534},{"type":"li","children":[{"type":"lic","children":[{"text":"Country
      filter has a check box and so we can filter to single  or multiple countries"}],"id":1683554596707}],"id":1683554596707},{"type":"li","children":[{"type":"lic","children":[{"text":"For
      source medium, campaign and ad-content, you have to copy and paste the entries
      you want"}],"id":1683554645284}],"id":1683554645284}],"id":1683554380531},{"type":"p","children":[{"text":"Reach
      out to rbaffourawuah@ with any questions"}],"id":1683554705672}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 15
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
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.current_date
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
      - DE
      - CA
      - GB
      - PL
      - IT
      - ES
      - FR
      - Other
    model: duet
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.country_filter
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.source
  - name: Medium
    title: Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.medium
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
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.campaign
  - name: Ad_Content
    title: Ad_Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.ad_content
  - name: OS
    title: OS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_downloads
    listens_to_filters: []
    field: kpi_downloads.operating_system
