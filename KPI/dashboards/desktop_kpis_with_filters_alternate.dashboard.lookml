- dashboard: desktop_kr_dashboard
  title: Desktop KR Dashboard
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
        valueFormat: '0.0,, "M"', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      firefox_desktop_usage_2021.year_over_year_dau_7day_ma: 2020 DAU MA
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
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 18
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
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.cdou,
            id: firefox_desktop_usage_2021.cdou, name: Cumulative Days of Use}, {
            axisId: prediction.cdou_forecast, id: prediction.cdou_forecast, name: Forecast},
          {axisId: prediction.cdou_target, id: prediction.cdou_target, name: Target
              Pace}], showLabels: true, showValues: true, valueFormat: '0.0,,, "B"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_labels:
      firefox_desktop_usage_2021.cdou: Cumulative Days of Use
      prediction.cdou_forecast: Forecast
      prediction.cdou_target: Stretch Goal Pace
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in CDOU since Jan 1, in comparison to forecast
      and the +5% Target Pace.
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 9
    col: 12
    width: 12
    height: 9
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '<h1 style="margin-top:20px; padding: 5px; border-bottom: solid 1px
      #412399; height: 50px; color: #412399; text-align: center;" id="dou">Desktop
      Days of Use and DAU</h1>'
    row: 0
    col: 0
    width: 24
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<h1 style=\"margin-top:20px; padding: 5px; border-bottom: solid 1px\
      \ #412399; height: 60px; color: #412399; text-align: center;\" id=\"new_profiles\"\
      >Desktop New Profiles</h1>\n\n"
    row: 27
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
    y_axes: [{label: Difference From Forecast / Stretch Goal, orientation: left, series: [
          {axisId: firefox_desktop_usage_2021.delta_from_forecast_count, id: firefox_desktop_usage_2021.delta_from_forecast_count,
            name: Cumulative Difference vs Forecast}, {axisId: firefox_desktop_usage_2021.delta_from_target_count,
            id: firefox_desktop_usage_2021.delta_from_target_count, name: Cumulative
              Difference vs Stretch Goal}], showLabels: true, showValues: true, valueFormat: '0.0,,
          "M"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_count: Cumulative Difference
        vs Forecast
      firefox_desktop_usage_2021.delta_from_target_count: Cumulative Difference vs
        Stretch Goal
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast / Stretch Goal}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between CDOU and (1) the forecast (Dark Blue)
      and (2) the Target (Light Blue). Positive numbers indicate that we are above
      forecast/target, negative numbers indicate we are below. Positive numbers indicate
      that we are above forecast/target, negative numbers indicate we are below.
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 9
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
    y_axes: [{label: '', orientation: left, series: [{axisId: firefox_desktop_usage_2021.new_profiles_cumulative,
            id: firefox_desktop_usage_2021.new_profiles_cumulative, name: Actual Number
              of New Profiles}, {axisId: prediction.cum_new_profiles_forecast, id: prediction.cum_new_profiles_forecast,
            name: Forecast}, {axisId: prediction.cum_new_profiles_target, id: prediction.cum_new_profiles_target,
            name: Target Pace}], showLabels: true, showValues: true, valueFormat: '0.0,,
          "M"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      prediction.cum_new_profiles_forecast: Forecast
      prediction.cum_new_profiles_target: Stretch Goal Pace
      firefox_desktop_usage_2021.new_profiles_cumulative: Actual Number of New Profiles
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the growth in cumulative new profiles since Jan 1, in comparison
      to forecast and the +5% Target Pace.
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 34
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
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 43
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
    y_axes: [{label: Difference From Forecast / Stretch Goal, orientation: left, series: [
          {axisId: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count,
            name: 'New Profiles: Cumulative Difference vs Forecast'}, {axisId: firefox_desktop_usage_2021.delta_from_target_new_profiles_count,
            id: firefox_desktop_usage_2021.delta_from_target_new_profiles_count, name: 'New
              Profiles: Cumulative Difference vs Stretch Goal'}], showLabels: true,
        showValues: true, valueFormat: '0.0,, "M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      firefox_desktop_usage_2021.delta_from_forecast_new_profiles_count: 'New Profiles:
        Cumulative Difference vs Forecast'
      firefox_desktop_usage_2021.delta_from_target_new_profiles_count: 'New Profiles:
        Cumulative Difference vs Stretch Goal'
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast / Stretch Goal}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This shows the difference between the cumulative number of new profiles
      and (1) the forecast (Dark Blue) and (2) the Target (Light Blue). Positive numbers
      indicate that we are above forecast/target, negative numbers indicate we are
      below.
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 34
    col: 0
    width: 12
    height: 9
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
    row: 53
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
    refresh: '10000'
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 7
    col: 0
    width: 24
    height: 2
  - title: Desktop Cumulative Days of Use (CDOU)
    name: Desktop Cumulative Days of Use (CDOU)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.recent_cdou, firefox_desktop_usage_2021.recent_cdou_2020]
    sorts: [firefox_desktop_usage_2021.recent_cdou_2020 desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    value_format: ''
    comparison_label: At this time in 2020
    series_types: {}
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 3
    col: 0
    width: 8
    height: 4
  - title: Untitled
    name: Untitled
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_forecast, prediction.recent_cdou_forecast]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From CDOU Forecast
    comparison_label: Forecasted CDOU as of today
    conditional_formatting: []
    defaults_version: 1
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 3
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_target, prediction.recent_cdou_target,
      firefox_desktop_usage_2021.date]
    fill_fields: [firefox_desktop_usage_2021.date]
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From CDOU Stretch Goal
    comparison_label: CDOU needed to hit stretch goal
    conditional_formatting: []
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 3
    col: 16
    width: 8
    height: 4
  - title: Desktop Cumulative New Profiles
    name: Desktop Cumulative New Profiles
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.recent_new_profiles_cumulative, firefox_desktop_usage_2021.recent_new_profiles_2020]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    value_format: ''
    comparison_label: At this time in 2020
    series_types: {}
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 30
    col: 0
    width: 8
    height: 4
  - title: Untitled (Copy 2)
    name: Untitled (Copy 2)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_forecast_new_profiles, prediction.recent_cum_new_profiles_forecast]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From New Profiles Forecast
    comparison_label: Forecasted New Profiles as of today
    conditional_formatting: []
    defaults_version: 1
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 30
    col: 8
    width: 8
    height: 4
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.delta_from_target_new_profiles, prediction.recent_cum_new_profiles_target]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Difference From New Profiles Stretch Goal
    comparison_label: New Profiles needed to hit stretch goal
    conditional_formatting: []
    defaults_version: 1
    listen:
      Date: firefox_desktop_usage_2021.date
      OS: firefox_desktop_usage_2021.os
      Channel: firefox_desktop_usage_2021.channel
      Activity Segment: firefox_desktop_usage_2021.activity_segment
      Attributed (Yes / No): firefox_desktop_usage_2021.attributed
      Country Name: firefox_desktop_usage_2021.country_name
    row: 30
    col: 16
    width: 8
    height: 4
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
