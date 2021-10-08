- dashboard: focus_relaunch_dashboard
  title: Focus Re-Launch Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: 'Focus Android: Daily New Profiles vs Forecast'
    title: 'Focus Android: Daily New Profiles vs Forecast'
    merged_queries:
    - model: focus_android
      explore: focus_launch_new_profile_forecasts
      type: looker_line
      fields: [focus_launch_new_profile_forecasts.date_date, focus_launch_new_profile_forecasts.yhat_lower,
        focus_launch_new_profile_forecasts.yhat, focus_launch_new_profile_forecasts.yhat_upper]
      fill_fields: [focus_launch_new_profile_forecasts.date_date]
      filters:
        focus_launch_new_profile_forecasts.date_date: after 2021/01/01
        focus_launch_new_profile_forecasts.product: Focus Android
      sorts: [focus_launch_new_profile_forecasts.date_date desc]
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
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
    - model: focus_android
      explore: usage
      type: table
      fields: [usage.submission_date, usage.user_count_active_this_day]
      fill_fields: [usage.submission_date]
      filters:
        usage.submission_date: after 2021/01/01
        usage.is_new_profile: 'Yes'
      sorts: [usage.submission_date desc]
      limit: 500
      join_fields:
      - field_name: usage.submission_date
        source_field_name: focus_launch_new_profile_forecasts.date_date
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
    series_colors:
      focus_launch_new_profile_forecasts.yhat_lower: "#80868B"
      focus_launch_new_profile_forecasts.yhat_upper: "#80868B"
    series_labels:
      usage.user_count_active_this_day: Actual New Profiles
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_line
    row: 8
    col: 0
    width: 11
    height: 9
  - name: 'Focus Android: Total New Profiles Since Sept 28 (Goal is +20% Difference
      From Forecast)'
    title: 'Focus Android: Total New Profiles Since Sept 28 (Goal is +20% Difference
      From Forecast)'
    merged_queries:
    - model: focus_android
      explore: focus_launch_new_profile_forecasts
      type: looker_line
      fields: [focus_launch_new_profile_forecasts.yhat]
      filters:
        focus_launch_new_profile_forecasts.product: Focus Android
      limit: 500
      filter_expression: "${focus_launch_new_profile_forecasts.date_date} >= date(2021,9,28)\
        \ AND ${focus_launch_new_profile_forecasts.date_date} <= add_days(-1, now())"
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
    - model: focus_android
      explore: usage
      type: table
      fields: [usage.user_count_active_this_day]
      filters:
        usage.submission_date: after 2021/01/01
        usage.is_new_profile: 'Yes'
      limit: 500
      filter_expression: "${usage.submission_date} >= date(2021,9,28) AND ${usage.submission_date}\
        \ <= add_days(-1, now())"
      join_fields: []
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      usage.user_count_active_this_day: Actual New Profiles Since Sept 28
      focus_launch_new_profile_forecasts.yhat: New Profiles Forecast (Starting Sept
        28)
    series_cell_visualizations:
      focus_launch_new_profile_forecasts.yhat:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: eb930169-7890-d445-c968-53eb7bf27f74, label: Custom, type: continuous,
            stops: [{color: "#c42b40", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#3de057", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [difference_from_forecast_to_date]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format:
      focus_launch_new_profile_forecasts.yhat:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
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
    series_types: {}
    point_style: none
    series_colors:
      focus_launch_new_profile_forecasts.yhat_lower: "#80868B"
      focus_launch_new_profile_forecasts.yhat_upper: "#80868B"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_grid
    dynamic_fields: [{category: table_calculation, expression: "${usage.user_count_active_this_day}/${focus_launch_new_profile_forecasts.yhat}-1",
        label: Difference from Forecast To-Date, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: difference_from_forecast_to_date,
        _type_hint: number}]
    row: 5
    col: 0
    width: 11
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## New Profiles"
    row: 2
    col: 0
    width: 11
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Focus Android"
    row: 0
    col: 0
    width: 21
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## Daily Active Users / Days of Use"
    row: 2
    col: 11
    width: 12
    height: 3
  - title: 'Focus Android: Daily Active Users'
    name: 'Focus Android: Daily Active Users'
    model: kpi
    explore: recent_mobile_forecast
    type: looker_line
    fields: [recent_mobile_forecast.date, mobile_dau_actuals.dau_7day_ma, recent_mobile_forecast.dau_forecast_7day_ma,
      recent_mobile_forecast.dau_forecast_lower_7day_ma, recent_mobile_forecast.dau_forecast_upper_7day_ma]
    filters:
      recent_mobile_forecast.date: after 2021/01/01
      recent_mobile_forecast.forecast_recency: '1'
      mobile_dau_actuals.canonical_app_name: Firefox Focus for Android
    sorts: [mobile_dau_actuals.dau_7day_ma desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_dau_actuals.dau_7day_ma,
            id: mobile_dau_actuals.dau_7day_ma, name: DAU (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_7day_ma,
            id: recent_mobile_forecast.dau_forecast_7day_ma, name: Recent DAU Forecast
              (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_lower_7day_ma,
            id: recent_mobile_forecast.dau_forecast_lower_7day_ma, name: Recent DAU
              Forecast Lower Bound (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_upper_7day_ma,
            id: recent_mobile_forecast.dau_forecast_upper_7day_ma, name: Recent DAU
              Forecast Upper Bound (Moving Average)}], showLabels: true, showValues: true,
        minValue: 300000, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      recent_mobile_forecast.dau_forecast_lower_7day_ma: "#80868B"
      recent_mobile_forecast.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      recent_mobile_forecast.dau_forecast_7day_ma: Aug 1st DAU Forecast (Median)
      recent_mobile_forecast.dau_forecast_lower_7day_ma: Aug 1st DAU Forecast (Lower
        Bound)
      recent_mobile_forecast.dau_forecast_upper_7day_ma: Aug 1st DAU Forecast (Upper
        Bound)
    defaults_version: 1
    listen: {}
    row: 5
    col: 11
    width: 11
    height: 12
  - title: 'Focus Android: New Profile Activation'
    name: 'Focus Android: New Profile Activation'
    model: focus_android
    explore: usage
    type: looker_line
    fields: [usage.submission_date, usage.new_profile_activated, usage.user_count_active_28_days]
    pivots: [usage.new_profile_activated]
    fill_fields: [usage.submission_date, usage.new_profile_activated]
    filters:
      usage.submission_date: after 2021/01/01
      usage.new_profile_7days_ago: 'Yes'
    sorts: [usage.submission_date desc, usage.new_profile_activated]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${usage.user_count_active_28_days},
          2)/(pivot_index(${usage.user_count_active_28_days}, 1) + pivot_index(${usage.user_count_active_28_days},
          2))', label: New Profile Activation Rate, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: supermeasure, table_calculation: new_profile_activation_rate,
        _type_hint: number}]
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
    y_axes: [{label: Number of Profiles, orientation: left, series: [{axisId: usage.user_count_active_28_days,
            id: No - usage.user_count_active_28_days, name: Number of UNActivated
              New Profiles}, {axisId: usage.user_count_active_28_days, id: Yes - usage.user_count_active_28_days,
            name: Number of Activated New Profiles}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: new_profile_activation_rate,
            id: new_profile_activation_rate, name: New Profile Activation Rate}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: 6 Days After Profile Creation
    hidden_series: [No - usage.user_count_active_28_days]
    series_labels:
      Yes - usage.user_count_active_28_days: Number of Activated New Profiles
      No - usage.user_count_active_28_days: Number of UNActivated New Profiles
    defaults_version: 1
    hidden_fields:
    note_state: collapsed
    note_display: above
    note_text: An activated new profile is active on at least 2 of their first 7 days.
      Note that the date shown here is the date of profile creation plus 6 days.
    listen: {}
    row: 17
    col: 0
    width: 11
    height: 9
  - title: 'Focus Android: Engagement Rate'
    name: 'Focus Android: Engagement Rate'
    model: focus_android
    explore: usage
    type: looker_line
    fields: [usage.user_count_active_28_days, usage.active_8_days_active_last_28,
      usage.submission_date]
    pivots: [usage.active_8_days_active_last_28]
    fill_fields: [usage.active_8_days_active_last_28, usage.submission_date]
    filters:
      usage.submission_date: after 2021/01/01
    sorts: [usage.submission_date desc, usage.active_8_days_active_last_28]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${usage.user_count_active_28_days},
          2)/(pivot_index(${usage.user_count_active_28_days}, 1) + pivot_index(${usage.user_count_active_28_days},
          2))', label: Engagment Rate, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: supermeasure, table_calculation: engagment_rate, _type_hint: number}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: usage.user_count_active_28_days,
            id: No - usage.user_count_active_28_days, name: NOT Active at Least 8
              Days}, {axisId: usage.user_count_active_28_days, id: Yes - usage.user_count_active_28_days,
            name: Active at Least 8 Days}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: engagment_rate, id: engagment_rate,
            name: Engagment Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [No - usage.user_count_active_28_days]
    series_labels:
      Yes - usage.user_count_active_28_days: Number of Clients Active at Least 8 Days
      No - usage.user_count_active_28_days: NOT Active at Least 8 Days
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: 'A user is "engaged" if they were active in at least 8 of the previous
      28 days. This means that a client doesn''t have to be active on the present
      day to count. '
    listen: {}
    row: 17
    col: 11
    width: 11
    height: 9
  - title: 'Focus iOS: Daily Active Users'
    name: 'Focus iOS: Daily Active Users'
    model: kpi
    explore: recent_mobile_forecast
    type: looker_line
    fields: [recent_mobile_forecast.date, mobile_dau_actuals.dau_7day_ma, recent_mobile_forecast.dau_forecast_7day_ma,
      recent_mobile_forecast.dau_forecast_lower_7day_ma, recent_mobile_forecast.dau_forecast_upper_7day_ma]
    filters:
      recent_mobile_forecast.date: after 2021/01/01
      recent_mobile_forecast.forecast_recency: '1'
      mobile_dau_actuals.canonical_app_name: Firefox Focus for iOS
    sorts: [mobile_dau_actuals.dau_7day_ma desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_dau_actuals.dau_7day_ma,
            id: mobile_dau_actuals.dau_7day_ma, name: DAU (Moving Average)}, {axisId: recent_mobile_forecast.dau_forecast_7day_ma,
            id: recent_mobile_forecast.dau_forecast_7day_ma, name: Aug 1st DAU Forecast
              (Median)}, {axisId: recent_mobile_forecast.dau_forecast_lower_7day_ma,
            id: recent_mobile_forecast.dau_forecast_lower_7day_ma, name: Aug 1st DAU
              Forecast (Lower Bound)}, {axisId: recent_mobile_forecast.dau_forecast_upper_7day_ma,
            id: recent_mobile_forecast.dau_forecast_upper_7day_ma, name: Aug 1st DAU
              Forecast (Upper Bound)}], showLabels: true, showValues: true, minValue: 100000,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      recent_mobile_forecast.dau_forecast_lower_7day_ma: "#80868B"
      recent_mobile_forecast.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      recent_mobile_forecast.dau_forecast_7day_ma: Aug 1st DAU Forecast (Median)
      recent_mobile_forecast.dau_forecast_lower_7day_ma: Aug 1st DAU Forecast (Lower
        Bound)
      recent_mobile_forecast.dau_forecast_upper_7day_ma: Aug 1st DAU Forecast (Upper
        Bound)
    defaults_version: 1
    listen: {}
    row: 32
    col: 11
    width: 11
    height: 12
  - name: 'Focus iOS: Total New Profiles Since Oct 4 (Goal is +10% Difference From
      Forecast)'
    title: 'Focus iOS: Total New Profiles Since Oct 4 (Goal is +10% Difference From
      Forecast)'
    merged_queries:
    - model: focus_android
      explore: focus_launch_new_profile_forecasts
      type: looker_line
      fields: [focus_launch_new_profile_forecasts.yhat]
      filters:
        focus_launch_new_profile_forecasts.product: Focus iOS
      limit: 500
      filter_expression: "${focus_launch_new_profile_forecasts.date_date} >= date(2021,10,4)\
        \ AND ${focus_launch_new_profile_forecasts.date_date} <= add_days(-1, now())"
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
    - model: focus_ios
      explore: usage
      type: table
      fields: [usage.user_count_active_this_day]
      filters:
        usage.submission_date: 26 weeks
        usage.is_new_profile: 'Yes'
      limit: 500
      filter_expression: "${usage.submission_date} >= date(2021,10,4) AND ${usage.submission_date}\
        \ <= add_days(-1, now())"
      join_fields: []
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      usage.user_count_active_this_day: Actual New Profiles (Starting Oct 4)
      focus_launch_new_profile_forecasts.yhat: New Profiles Forecast (Starting Oct
        4)
    series_cell_visualizations:
      focus_launch_new_profile_forecasts.yhat:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: eb930169-7890-d445-c968-53eb7bf27f74, label: Custom, type: continuous,
            stops: [{color: "#c42b40", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#3de057", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: [difference_from_forecast_to_date]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format:
      focus_launch_new_profile_forecasts.yhat:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
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
    series_types: {}
    point_style: none
    series_colors:
      focus_launch_new_profile_forecasts.yhat_lower: "#80868B"
      focus_launch_new_profile_forecasts.yhat_upper: "#80868B"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_grid
    dynamic_fields: [{category: table_calculation, expression: "${usage.user_count_active_this_day}/${focus_launch_new_profile_forecasts.yhat}-1",
        label: Difference from Forecast To-Date, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: difference_from_forecast_to_date,
        _type_hint: number}]
    row: 32
    col: 0
    width: 11
    height: 3
  - name: 'Focus iOS: Daily New Profiles vs Forecast'
    title: 'Focus iOS: Daily New Profiles vs Forecast'
    merged_queries:
    - model: focus_android
      explore: focus_launch_new_profile_forecasts
      type: looker_line
      fields: [focus_launch_new_profile_forecasts.date_date, focus_launch_new_profile_forecasts.yhat_lower,
        focus_launch_new_profile_forecasts.yhat, focus_launch_new_profile_forecasts.yhat_upper]
      fill_fields: [focus_launch_new_profile_forecasts.date_date]
      filters:
        focus_launch_new_profile_forecasts.date_date: after 2021/01/01
        focus_launch_new_profile_forecasts.product: Focus iOS
      sorts: [focus_launch_new_profile_forecasts.yhat desc]
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
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
    - model: focus_ios
      explore: usage
      type: looker_line
      fields: [usage.user_count_active_this_day, usage.submission_date]
      fill_fields: [usage.submission_date]
      filters:
        usage.submission_date: after 2021/01/01
        usage.is_new_profile: 'Yes'
      sorts: [usage.submission_date desc]
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
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      join_fields:
      - field_name: usage.submission_date
        source_field_name: focus_launch_new_profile_forecasts.date_date
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
    series_colors:
      focus_launch_new_profile_forecasts.yhat_lower: "#80868B"
      focus_launch_new_profile_forecasts.yhat_upper: "#80868B"
    series_labels:
      usage.user_count_active_this_day: Actual New Profiles
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    type: looker_line
    row: 35
    col: 0
    width: 11
    height: 9
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## Daily Active Users / Days of Use"
    row: 29
    col: 11
    width: 10
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Focus iOS"
    row: 26
    col: 0
    width: 12
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "## New Profiles"
    row: 29
    col: 0
    width: 11
    height: 3
  - title: 'Focus iOS: New Profile Activation'
    name: 'Focus iOS: New Profile Activation'
    model: focus_ios
    explore: usage
    type: looker_line
    fields: [usage.new_profile_activated, usage.submission_date, usage.user_count_active_28_days]
    pivots: [usage.new_profile_activated]
    fill_fields: [usage.new_profile_activated, usage.submission_date]
    filters:
      usage.submission_date: after 2021/01/01
      usage.new_profile_7days_ago: 'Yes'
    sorts: [usage.submission_date desc, usage.new_profile_activated]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${usage.user_count_active_28_days},
          2)/(pivot_index(${usage.user_count_active_28_days}, 1) + pivot_index(${usage.user_count_active_28_days},
          2))', label: New Profile Activation Rate, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: supermeasure, table_calculation: new_profile_activation_rate,
        _type_hint: number}]
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
    y_axes: [{label: Number of Profiles, orientation: left, series: [{axisId: usage.user_count_active_28_days,
            id: No - usage.user_count_active_28_days, name: UnActivated New Profiles},
          {axisId: usage.user_count_active_28_days, id: Yes - usage.user_count_active_28_days,
            name: Activated New Profiles}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: new_profile_activation_rate, id: new_profile_activation_rate,
            name: New Profile Activation Rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: 6 Days after Profile Creation
    hidden_series: [No - usage.user_count_active_28_days]
    series_labels:
      Yes - usage.user_count_active_28_days: Activated New Profiles
      No - usage.user_count_active_28_days: UnActivated New Profiles
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: An activated new profile is active on at least 2 of their first 7 days.
      Note that the date shown here is the date of profile creation plus 6 days.
    listen: {}
    row: 44
    col: 0
    width: 11
    height: 9
  - title: 'Focus iOS: Engagement Rate'
    name: 'Focus iOS: Engagement Rate'
    model: focus_ios
    explore: usage
    type: looker_line
    fields: [usage.user_count_active_28_days, usage.submission_date, usage.active_8_days_active_last_28]
    pivots: [usage.active_8_days_active_last_28]
    fill_fields: [usage.submission_date, usage.active_8_days_active_last_28]
    filters:
      usage.submission_date: after 2021/01/01
    sorts: [usage.submission_date desc, usage.active_8_days_active_last_28]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${usage.user_count_active_28_days},
          2)/(pivot_index(${usage.user_count_active_28_days}, 1) + pivot_index(${usage.user_count_active_28_days},
          2))', label: Engagement Rate, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: supermeasure, table_calculation: engagement_rate, _type_hint: number}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: usage.user_count_active_28_days,
            id: No - usage.user_count_active_28_days, name: NOT Active at Least 8
              Days}, {axisId: usage.user_count_active_28_days, id: Yes - usage.user_count_active_28_days,
            name: Number of Clients Active at Least 8 Days}], showLabels: true, showValues: true,
        minValue: 100000, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: engagement_rate,
            id: engagement_rate, name: Engagement Rate}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [No - usage.user_count_active_28_days]
    series_labels:
      No - usage.user_count_active_28_days: NOT Active at Least 8 Days
      Yes - usage.user_count_active_28_days: Number of Clients Active at Least 8 Days
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: 'A user is "engaged" if they were active in at least 8 of the previous
      28 days. This means that a client doesn''t have to be active on the present
      day to count. '
    listen: {}
    row: 44
    col: 11
    width: 11
    height: 9
