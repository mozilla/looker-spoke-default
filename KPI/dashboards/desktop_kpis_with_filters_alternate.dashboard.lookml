- dashboard: desktop_kpi_dashboard
  title: Desktop KPI Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 2147484 seconds
  elements:
  - title: Desktop Daily Active Users (DAU)
    name: Desktop Daily Active Users (DAU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.dau_7day_ma,
      prediction.dau_forecast_7day_ma, prediction.dau_forecast_lower_7day_ma, prediction.dau_forecast_upper_7day_ma,
      firefox_desktop_usage_2021.year_over_year_dau_7day_ma]
    fill_fields: [firefox_desktop_usage_2021.date]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.dau_7day_ma,
            id: firefox_desktop_usage_2021.dau_7day_ma, name: DAU (7 Day MA)}, {axisId: prediction.dau_forecast_7day_ma,
            id: prediction.dau_forecast_7day_ma, name: DAU Forecast (7 Day MA)}, {
            axisId: prediction.dau_forecast_lower_7day_ma, id: prediction.dau_forecast_lower_7day_ma,
            name: DAU Forecast Lower Bound}, {axisId: prediction.dau_forecast_upper_7day_ma,
            id: prediction.dau_forecast_upper_7day_ma, name: DAU Forecast Upper Bound},
          {axisId: firefox_desktop_usage_2021.year_over_year_dau_7day_ma, id: firefox_desktop_usage_2021.year_over_year_dau_7day_ma,
            name: 2020 Dau MA}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      prediction.dau_forecast_lower: scatter
      prediction.dau_forecast_upper: scatter
      prediction.dau_forecast: scatter
    series_colors:
      prediction.dau_forecast_upper: "#b7b5c2"
      prediction.dau_forecast_lower: "#b7b5c2"
      prediction.dau_forecast_lower_7day_ma: "#80868B"
      prediction.dau_forecast_upper_7day_ma: "#80868B"
    series_labels:
      firefox_desktop_usage_2021.dau_7day_ma: DAU (7 Day MA)
      prediction.dau_forecast_7day_ma: DAU Forecast (7 Day MA)
      prediction.dau_forecast_lower_7day_ma: DAU Forecast Lower Bound
      prediction.dau_forecast_upper_7day_ma: DAU Forecast Upper Bound
    series_point_styles:
      prediction.dau_forecast_lower: triangle
      prediction.dau_forecast_upper: triangle-down
    trend_lines: []
    defaults_version: 1
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: 'An Fx profile counts to DAU on days that we receive a main ping from
      them. The upper and lower bounds of the forecast (triangles) show the 10th and
      90th percentiles of forecasted DAU values for that day. Note that we should
      expect some days to fall outside of this range due to chance - generally we
      should be looking for multiple *consecutive* days outside of the range when
      determining if the actuals are truly starting to differ from the forecast. '
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 25
    col: 0
    width: 24
    height: 9
  - title: Cumulative Days of Use (CDOU)
    name: Cumulative Days of Use (CDOU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou, prediction.cdou_forecast,
      prediction.cdou_target]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date]
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
    hidden_series: []
    series_labels: {}
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in CDOU since Jan 1, in comparison to forecast
      and the +5% Target Pace.
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 16
    col: 12
    width: 12
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 60px; color: #412399; text-align: center;" id="dou">Desktop
      Days of Use and DAU</h1>'
    row: 2
    col: 0
    width: 24
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<h1 style=\"margin-top:20px; padding: 5px; border-bottom: solid 1px\
      \ #412399; height: 60px; color: #412399; text-align: center;\" id=\"new_profiles\"\
      >Desktop New Profiles</h1>\n\n"
    row: 34
    col: 0
    width: 24
    height: 3
  - title: Difference from CDOU Forecast
    name: Difference from CDOU Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count,
      firefox_desktop_usage_2021.delta_from_target_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date]
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
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_count, name: Delta
              From Forecast Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: firefox_desktop_usage_2021.delta_from_target_count,
            id: firefox_desktop_usage_2021.delta_from_target_count, name: Delta From
              Target Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_count: 'CDOU: Absolute Delta
        from Forecast'
      firefox_desktop_usage_2021.delta_from_target_count: 'CDOU: Absolute Delta from
        Target'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between CDOU and (1) the forecast (Dark Blue)
      and (2) the Target (Light Blue). Positive numbers indicate that we are above
      forecast/target, negative numbers indicate we are below. Positive numbers indicate
      that we are above forecast/target, negative numbers indicate we are below.
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 16
    col: 0
    width: 12
    height: 9
  - title: Cumulative Desktop New Profiles
    name: Cumulative Desktop New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_cumulative,
      prediction.cum_new_profiles_forecast, prediction.cum_new_profiles_target]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date]
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
    series_labels:
      prediction.cum_new_profiles_forecast: Forecast
      prediction.cum_new_profiles_target: Target
      firefox_desktop_usage_2021.new_profiles_cumulative: Cumulative New Profiles
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in cumulative new profiles since Jan 1, in comparison
      to forecast and the +5% Target Pace.
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 48
    col: 12
    width: 12
    height: 9
  - title: Daily Desktop New Profiles
    name: Daily Desktop New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.new_profiles_7day_ma,
      prediction.new_profiles_forecast_7day_ma, prediction.new_profiles_forecast_lower_7day_ma,
      prediction.new_profiles_forecast_upper_7day_ma, firefox_desktop_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [firefox_desktop_usage_2021.date]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.new_profiles_7day_ma,
            id: firefox_desktop_usage_2021.new_profiles_7day_ma, name: New Profiles
              (7 Day MA)}, {axisId: prediction.new_profiles_forecast_7day_ma, id: prediction.new_profiles_forecast_7day_ma,
            name: New Profiles Forecast (7 Day MA)}, {axisId: prediction.new_profiles_forecast_lower_7day_ma,
            id: prediction.new_profiles_forecast_lower_7day_ma, name: New Profiles
              Forecast Lower Bound}, {axisId: prediction.new_profiles_forecast_upper_7day_ma,
            id: prediction.new_profiles_forecast_upper_7day_ma, name: New Profiles
              Forecast Upper Bound}, {axisId: firefox_desktop_usage_2021.year_over_year_new_profiles_7day_ma,
            id: firefox_desktop_usage_2021.year_over_year_new_profiles_7day_ma, name: 2020
              New Profiles MA}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      prediction.new_profiles_forecast_lower: scatter
      prediction.new_profiles_forecast_upper: scatter
      prediction.new_profiles_forecast: scatter
    series_colors:
      prediction.new_profiles_forecast_lower: "#b7b5c2"
      prediction.new_profiles_forecast_upper: "#b7b5c2"
      prediction.new_profiles_forecast: "#E52592"
      prediction.new_profiles_forecast_lower_7day_ma: "#80868B"
      prediction.new_profiles_forecast_upper_7day_ma: "#80868B"
    series_labels:
      prediction.new_profiles_forecast_lower: Forecast Lower
      prediction.new_profiles_forecast_upper: Forecast Upper
      prediction.new_profiles_forecast: Forecast
      firefox_desktop_usage_2021.new_profiles_7day_ma: New Profiles (7 Day MA)
      prediction.new_profiles_forecast_7day_ma: New Profiles Forecast (7 Day MA)
      prediction.new_profiles_forecast_lower_7day_ma: New Profiles Forecast Lower
        Bound
      prediction.new_profiles_forecast_upper_7day_ma: New Profiles Forecast Upper
        Bound
    series_point_styles:
      prediction.new_profiles_forecast_lower: triangle
      prediction.new_profiles_forecast_upper: triangle-down
    trend_lines: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'An Fx profile counts as new on the day that we receive their first
      main ping. The upper and lower bounds of the forecast (triangles) show the 10th
      and 90th percentiles of forecasted new profiles for that day. '
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 57
    col: 0
    width: 24
    height: 10
  - title: Difference from Cumulative New Profile Forecast
    name: Difference from Cumulative New Profile Forecast
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
      firefox_desktop_usage_2021.delta_from_target_new_profiles_count]
    fill_fields: [firefox_desktop_usage_2021.date]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            name: Delta From Forecast New Profiles Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: Difference From Target, orientation: right, series: [{axisId: firefox_desktop_usage_2021.delta_from_target_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_target_new_profiles_count, name: Delta
              From Target New Profiles Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between the cumulative number of new profiles
      and (1) the forecast (Dark Blue) and (2) the Target (Light Blue). Positive numbers
      indicate that we are above forecast/target, negative numbers indicate we are
      below.
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 48
    col: 0
    width: 12
    height: 9
  - title: Top Line Numbers for CDOU
    name: Top Line Numbers for CDOU
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_grid
    fields: [firefox_desktop_usage_2021.delta_from_forecast_format2]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '12'
    rows_font_size: '99'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: false
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_format2: "."
    series_column_widths:
      firefox_desktop_usage_2021.delta_from_forecast_format2: 1541
    series_cell_visualizations:
      firefox_desktop_usage_2021.delta_from_forecast_format:
        is_active: true
      firefox_desktop_usage_2021.delta_from_forecast_format2:
        is_active: false
    series_text_format:
      firefox_desktop_usage_2021.delta_from_forecast_format2:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 6
    col: 0
    width: 24
    height: 10
  - title: Top Line Numbers for New Profiles
    name: Top Line Numbers for New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_grid
    fields: [firefox_desktop_usage_2021.delta_from_forecast_format]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: ''
    header_font_size: '12'
    rows_font_size: '99'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: false
    show_row_totals: false
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_format2: Top Line CDOU
      firefox_desktop_usage_2021.delta_from_forecast_format: "."
    series_column_widths:
      firefox_desktop_usage_2021.delta_from_forecast_format2: 2445
      firefox_desktop_usage_2021.delta_from_forecast_format: 1537
    series_cell_visualizations:
      firefox_desktop_usage_2021.delta_from_forecast_format:
        is_active: false
      firefox_desktop_usage_2021.delta_from_forecast_format2:
        is_active: false
    series_text_format:
      firefox_desktop_usage_2021.delta_from_forecast_format2:
        align: left
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    title_hidden: true
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 37
    col: 0
    width: 24
    height: 11
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border: solid 1px #4285F4; border-radius: 3px; padding: 5px 10px; background: #eaf1fe; height: 340px">
              <a style="font-weight: bold;" href="https://datastudio.google.com/u/0/reporting/7a716807-bbff-48e1-9842-401bcecf27d3/page/I7AwB">☰

            Link to Old Data Studio Version</a>
      <h1 id="explainer"> About the Desktop KPIs </h1>



      <a href="#dou"><h2>Cumulative Days of Use (CDOU)</h2></a>

      <p>CDOU tracks the total number of Firefox Desktop usage days over the year.  It is equivalent to Daily Active Users (DAU) summed over the year. A Firefox profile counts to CDOU if we receive a main ping from them on a given day.</p>
      <p>The 2021 target for CDOU is +5% over forecast. </p>
      <a href="#new_profiles"><h2>Cumulative New Profiles</h2></a>
      <p>This is the count of new desktop client_ids (profiles) that are created over the course of the year. A new Firefox profile counts to  this metric on the day we receive its first main ping.</p>
      <p>The 2021 target for cumulative new profiles is +5% over forecast. </p>
      </div>
    row: 67
    col: 0
    width: 24
    height: 9
  - title: ''
    name: " (4)"
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [key_in_cache.is_cached]
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
    series_types: {}
    defaults_version: 1
    refresh: 10 seconds
    listen:
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      OS: firefox_desktop_usage_2021.os
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
      Date: firefox_desktop_usage_2021.date
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: after 2021/01/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_2021
    listens_to_filters: []
    field: firefox_desktop_usage_2021.date
  - name: Channel
    title: Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.channel
  - name: Activity Segment
    title: Activity Segment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.activity_segment
  - name: OS
    title: OS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.os
  - name: Attributed (Yes / No)
    title: Attributed (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.attributed
  - name: Country Name
    title: Country Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: kpi
    explore: firefox_desktop_usage_fields
    listens_to_filters: []
    field: firefox_desktop_usage_fields.country_name
