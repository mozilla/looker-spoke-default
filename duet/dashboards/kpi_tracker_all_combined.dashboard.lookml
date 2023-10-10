- dashboard: kpi_tracker_all_combined
  title: Marketing KPI Tracker
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: bYsXF5eYjbH1qmKUkUVlv3
  elements:
  - name: " (8)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #000000; height: 60px; color: red;">

      <nav style="font-size: 18px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://www.mozilla.org/media/protocol/img/logos/mozilla/logo-word-hor.e20791bb4dd4.svg"/>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_tracker_all_combined">

       DAU KPIs</a>

        <a style="color: #efefef; padding: 5px 80px; float: left; line-height: 40px; font-weight: bold" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_downloads_tracker">

      Desktop Downloads KPIs </a>

        <a style="color: #efefef; padding: 5px 80px; float: left; line-height: 40px;font-weight: bold" href="https://mozilla.cloud.looker.com/dashboards/duet::kpi_installs_tracker">

       Mobile Installs KPIs </a>
      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Current 28-Day DAU
    title: Current 28-Day DAU
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.day_month, kpi_dau.current_period_dau, kpi_dau.previous_period_dau]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.day_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: 'Average DAU '
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.daily_active_users}/${kpi_dau.unique_days}"
      label: Average DAU YTD
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_ytd
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: YoY change
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: yoy_change
      args:
      - average_dau_ytd
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.current_period_dau}, 0, 28))
      label: 28-day MA Current period DAU
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_current_period_dau
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.previous_period_dau}, 0, 28))
      label: 28-day MA Previous period DAU
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_previous_period_dau
      _type_hint: number
    - category: table_calculation
      expression: "(${28_day_ma_current_period_dau}/${28_day_ma_previous_period_dau})\
        \ - 1"
      label: percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Current 28-day MA
    comparison_label: YoY % change
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, 28_day_ma_previous_period_dau]
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 5
    col: 4
    width: 4
    height: 4
  - name: Current Day DAU
    title: Current Day DAU
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.day_month, kpi_dau.current_period_dau, kpi_dau.previous_period_dau]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.day_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: 'Average DAU '
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.daily_active_users}/${kpi_dau.unique_days}"
      label: Average DAU YTD
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_ytd
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: YoY change
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: yoy_change
      args:
      - average_dau_ytd
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.current_period_dau}, 0, 28))
      label: 28-day MA Current period DAU
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_current_period_dau
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.previous_period_dau}, 0, 28))
      label: 28-day MA Previous period DAU
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_previous_period_dau
      _type_hint: number
    - category: table_calculation
      expression: "(${28_day_ma_current_period_dau}/${28_day_ma_previous_period_dau})\
        \ - 1"
      label: percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
    - category: table_calculation
      expression: "(${kpi_dau.current_period_dau}/${kpi_dau.previous_period_dau})-\
        \ 1"
      label: current day DAU
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: current_day_dau
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Current Day DAU
    comparison_label: YoY % change
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [kpi_dau.previous_period_dau, 28_day_ma_previous_period_dau, 28_day_ma_current_period_dau,
      percentage_change]
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 5
    col: 0
    width: 4
    height: 4
  - name: DAU YTD point estimate
    title: DAU YTD point estimate
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.submission_year, kpi_dau.unique_days, kpi_dau.daily_active_users]
    fill_fields: [kpi_dau.submission_year]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.submission_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: 'Average DAU '
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.daily_active_users}/${kpi_dau.unique_days}"
      label: Average DAU YTD
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_ytd
      _type_hint: number
    - category: table_calculation
      label: YoY change
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: yoy_change
      args:
      - average_dau_ytd
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average DAU YTD
    comparison_label: YoY % change
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [kpi_dau.unique_days, kpi_dau.daily_active_users]
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 5
    col: 8
    width: 4
    height: 4
  - name: DAU daily trend
    title: DAU daily trend
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.day_month,
      kpi_dau.dau_goal]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.day_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: Avg QTR DAU current period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: avg_qtr_dau_current_period
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.previous_period_dau}/${kpi_dau.unique_days}"
      label: Avg QTR DAU previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: avg_qtr_dau_previous_period
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.dau_goal}, 0, 28))
      label: DAU goal
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: dau_goal
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.current_period_dau}, 0, 28))
      label: 28-Day MA current period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_current_period
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${kpi_dau.previous_period_dau}, 0, 28))
      label: 28-Day MA previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: 28_day_ma_previous_period
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
    x_axis_reversed: true
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
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.dau_goal]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 12
    col: 0
    width: 10
    height: 7
  - name: stacked bar chat DAU - OS
    title: stacked bar chat DAU - OS
    model: duet
    explore: kpi_dau
    type: looker_column
    fields: [kpi_dau.month, kpi_dau.current_period_dau, kpi_dau.unique_days, kpi_dau.os_filter]
    pivots: [kpi_dau.os_filter]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.month, kpi_dau.os_filter]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: 'Average DAU '
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.unique_days]
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      Current_Date: kpi_dau.current_date
    row: 35
    col: 13
    width: 10
    height: 9
  - name: stacked bar chat DAU - user segment
    title: stacked bar chat DAU - user segment
    model: duet
    explore: kpi_dau
    type: looker_column
    fields: [kpi_dau.month, kpi_dau.current_period_dau, kpi_dau.unique_days, kpi_dau.segment]
    pivots: [kpi_dau.segment]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.segment, kpi_dau.month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days}"
      label: 'Average DAU '
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.unique_days]
    hidden_pivots: {}
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 35
    col: 0
    width: 10
    height: 9
  - name: New Profiles daily trend
    title: New Profiles daily trend
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.day_month, kpi_dau.current_period_new_profiles, kpi_dau.previous_period_new_profiles]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.day_month]
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 12
    col: 12
    width: 10
    height: 7
  - name: MTD average DAU
    title: MTD average DAU
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.unique_days_prefiltered]
    filters:
      kpi_dau.compare_to: Month
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${kpi_dau.current_period_dau}/${kpi_dau.previous_period_dau})\
        \ - 1"
      label: MoM change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: mom_change
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average for current  period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_for_current_period
      _type_hint: number
    - category: table_calculation
      expression: "${kpi_dau.previous_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average for previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_for_previous_period
      _type_hint: number
    - category: table_calculation
      expression: "(${average_for_current_period}/${average_for_previous_period})\
        \ - 1"
      label: percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average DAU for current MTD
    comparison_label: MoM % change
    hidden_pivots: {}
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.unique_days_prefiltered,
      average_for_previous_period]
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
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 5
    col: 12
    width: 4
    height: 4
  - name: Month DAU
    title: Month DAU
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.month, kpi_dau.current_period_dau, kpi_dau.previous_period_dau,
      kpi_dau.dau_goal, kpi_dau.unique_days_prefiltered, kpi_dau.unique_days_prev_prefiltered]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average DAU current period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_current_period
      _type_hint: number
    - category: table_calculation
      expression: "${kpi_dau.previous_period_dau}/${kpi_dau.unique_days_prev_prefiltered}"
      label: Average DAU previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_previous_period
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.dau_goal,
      kpi_dau.unique_days_prefiltered, kpi_dau.unique_days_prev_prefiltered]
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 21
    col: 0
    width: 8
    height: 6
  - name: Quarterly DAU
    title: Quarterly DAU
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.dau_goal,
      kpi_dau.unique_days_prefiltered, kpi_dau.unique_days_prev_prefiltered, kpi_dau.quarter_abr]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.current_period_dau desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average DAU current period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_current_period
      _type_hint: number
    - category: table_calculation
      expression: "${kpi_dau.previous_period_dau}/${kpi_dau.unique_days_prev_prefiltered}"
      label: Average DAU previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_dau_previous_period
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
    y_axes: [{label: '', orientation: left, series: [{axisId: average_dau_current_period,
            id: average_dau_current_period, name: Average DAU current period}, {axisId: average_dau_previous_period,
            id: average_dau_previous_period, name: Average DAU previous period}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.dau_goal,
      kpi_dau.unique_days_prefiltered, kpi_dau.unique_days_prev_prefiltered]
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 29
    col: 0
    width: 10
    height: 6
  - title: Quarterly new profiles
    name: Quarterly new profiles
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.current_period_new_profiles, kpi_dau.previous_period_new_profiles,
      kpi_dau.quarter_abr]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.current_period_new_profiles desc]
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
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 29
    col: 13
    width: 10
    height: 6
  - name: Monthly new profiles
    title: Monthly new profiles
    model: duet
    explore: kpi_dau
    type: looker_line
    fields: [kpi_dau.month, kpi_dau.current_period_new_profiles, kpi_dau.previous_period_new_profiles]
    filters:
      kpi_dau.compare_to: Year
    sorts: [kpi_dau.month]
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
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 21
    col: 13
    width: 9
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Quarterly Trend"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 27
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Daily Trend"}],"align":"center"},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"For
      DAU, we show 28-day moving averages for current and previous year"}],"id":1683052275348}],"id":1683052275348},{"type":"li","children":[{"type":"lic","children":[{"text":"The
      goal line shown on the DAU daily trend graph is achieved by depreciating the
      previous year DAU by the goal we set to cut the percentage  decline by"}],"id":1683052275349}],"id":1683052275348}],"id":1683052275348}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Monthly Trend"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 19
    col: 0
    width: 23
    height: 2
  - name: WTD DAU
    title: WTD DAU
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.unique_days_prefiltered]
    filters:
      kpi_dau.compare_to: Week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${kpi_dau.current_period_dau}/${kpi_dau.previous_period_dau})\
        \ - 1"
      label: MoM change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: mom_change
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${kpi_dau.current_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average for current  period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_for_current_period
      _type_hint: number
    - category: table_calculation
      expression: "${kpi_dau.previous_period_dau}/${kpi_dau.unique_days_prefiltered}"
      label: Average for previous period
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      table_calculation: average_for_previous_period
      _type_hint: number
    - category: table_calculation
      expression: "(${average_for_current_period}/${average_for_previous_period})\
        \ - 1"
      label: percentage change
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: percentage_change
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average DAU for current WTD
    comparison_label: WoW % change
    hidden_pivots: {}
    hidden_fields: [kpi_dau.current_period_dau, kpi_dau.previous_period_dau, kpi_dau.unique_days_prefiltered,
      average_for_previous_period]
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
    y_axes: []
    listen:
      Platform: kpi_dau.Platform
      Country_Filter: kpi_dau.country_filter
      OS_Filter: kpi_dau.os_filter
      Current_Date: kpi_dau.current_date
    row: 5
    col: 16
    width: 4
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Filter values","bold":true}],"align":"center"},{"type":"p","children":[{"text":"DATE:
      ","bold":true},{"text":"The most recent date will be between 1 to 2 days "}],"id":1683134751986},{"type":"p","id":1683134848579,"children":[{"text":"COUNTRY:
      ","bold":true},{"text":"Abreviated country names, possible values includes "},{"text":"US,
      UK, DE, IT, PL, CA, ES, FR","bold":true},{"text":" and "},{"text":"Other","bold":true}]},{"type":"p","id":1683134947444,"children":[{"text":"OS:","bold":true},{"text":"
      Operating system, possible values include "},{"text":"Android, iOS, Linux, Mac
      OS, Other and Windows","bold":true}]},{"type":"p","id":1683135012916,"children":[{"text":"Platform","bold":true},{"text":":
      Possible values include "},{"text":"Desktop, Mobile","bold":true},{"text":"
      and "},{"text":"Other","bold":true},{"text":". "},{"text":"Note","bold":true},{"text":"
      that Other includes other browser products like focus and the browser stacks"}]},{"type":"p","id":1683135286729,"children":[{"text":""}]},{"type":"p","id":1683135318000,"children":[{"text":"Reach
      out to"},{"text":" rbaffourawuah@","bold":true},{"text":" with any questions"}]},{"type":"p","children":[{"text":""}],"id":1683134774820}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 17
    height: 5
  - name: most recent available date DAU
    title: most recent available date DAU
    model: duet
    explore: kpi_dau
    type: single_value
    fields: [kpi_dau.submission_date]
    fill_fields: [kpi_dau.submission_date]
    filters:
      kpi_dau.current_date: before 2023/12/31
    sorts: [kpi_dau.submission_date desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most recent available date
    comparison_label: YoY % change
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
    stacking: normal
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [28_day_ma_previous_period_dau, 28_day_ma_current_period_dau, percentage_change]
    hidden_pivots: {}
    y_axes: []
    listen:
      OS_Filter: kpi_dau.os_filter
      Country_Filter: kpi_dau.country_filter
      Platform: kpi_dau.Platform
    row: 0
    col: 17
    width: 6
    height: 4
  filters:
  - name: Current_Date
    title: Current_Date
    type: field_filter
    default_value: before 2023/05/17
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: duet
    explore: kpi_dau
    listens_to_filters: []
    field: kpi_dau.current_date
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
    explore: kpi_dau
    listens_to_filters: []
    field: kpi_dau.country_filter
  - name: OS_Filter
    title: OS_Filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - Mac OS
      - Windows
      - Linux
      - Android
      - iOS
      - Other
    model: duet
    explore: kpi_dau
    listens_to_filters: []
    field: kpi_dau.os_filter
  - name: Platform
    title: Platform
    type: field_filter
    default_value: Desktop,Mobile
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - Desktop
      - Mobile
      - Other
    model: duet
    explore: kpi_dau
    listens_to_filters: []
    field: kpi_dau.Platform
