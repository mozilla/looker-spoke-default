- dashboard: ios_mobile_acquisition_funnel
  title: iOS Mobile Acquisition Funnel
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Mobile Acquisition Funnel for iOS
    type: text
    title_text: Mobile Acquisition Funnel for iOS
    subtitle_text: ''
    body_text: |
      The purpose of this dashboard is to provide insight into the mobile acquisition funnel for some of our iOS products, namely Firefox for iOS and Focus. It does not behave like a normal funnel due to the fact that the aggregated data originates from multiple sources. It’s important to understand each source and the caveats.

      Apple App Store data is the source for the first 2 steps of the funnel. Our internal telemetry is responsible for the final 2 steps, which provide acquisition (first seen) and activation counts. A new profile is activated if seen 5 out of 7 days in the first week. Both of these steps may be lower than step 3 primarily due to the fact that metrics are aggregated and counted differently between Apple and Mozilla's internal telemetry.
    row: 0
    col: 0
    width: 12
    height: 7
  - title: iOS Funnel Per Day
    name: iOS Funnel Per Day
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.product_page_views,
      mobile_ios_country.first_time_installs, mobile_ios_country.installations_opt_in,
      mobile_ios_country.first_seen, mobile_ios_country.activated]
    fill_fields: [mobile_ios_country.submission_date]
    sorts: [mobile_ios_country.first_seen desc]
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
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 45
    col: 0
    width: 24
    height: 8
  - title: Last Play Store Update
    name: Last Play Store Update
    model: duet
    explore: mobile_ios_country
    type: single_value
    fields: [mobile_ios_country.ios_store_updated]
    fill_fields: [mobile_ios_country.ios_store_updated]
    sorts: [mobile_ios_country.ios_store_updated desc]
    limit: 500
    dynamic_fields: [{measure: count_of_latest_date, based_on: mobile_ios_country.latest_date,
        expression: '', label: Count of Latest Date, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Last Play Store Update
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
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: The latest date for which we have Apple App Store data.
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 7
    col: 12
    width: 6
    height: 2
  - title: Funnel Overview
    name: Funnel Overview
    model: duet
    explore: mobile_ios_country
    type: looker_column
    fields: [mobile_ios_country.product_page_views, mobile_ios_country.first_time_installs,
      mobile_ios_country.installations_opt_in, mobile_ios_country.first_seen, mobile_ios_country.activated]
    sorts: [mobile_ios_country.first_time_installs desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    series_types: {}
    series_labels: {}
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 0
    col: 12
    width: 12
    height: 7
  - name: Product Page Views
    title: Product Page Views
    note_state: collapsed
    note_display: above
    note_text: The count of page views for the app on the Apple App Store.
    merged_queries:
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.product_page_views]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '0'
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.product_page_views]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '1'
      sorts: [mobile_ios_country.product_page_views desc]
      limit: 500
      join_fields:
      - field_name: mobile_ios_country.join_field
        source_field_name: mobile_ios_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Product Page Views
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_mobile_ios_country.product_page_views]
    series_types: {}
    type: single_value
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_ios_country.product_page_views}-${q1_mobile_ios_country.product_page_views})/${q1_mobile_ios_country.product_page_views}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 9
    col: 12
    width: 12
    height: 4
  - name: First Time Installs
    title: First Time Installs
    note_state: collapsed
    note_display: above
    note_text: A count of the number of times users press the 'Get' button in the
      Apple App Store for the first time.
    merged_queries:
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.first_time_installs]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '0'
      sorts: [mobile_ios_country.first_time_installs desc]
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.first_time_installs]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '1'
      sorts: [mobile_ios_country.first_time_installs desc]
      limit: 500
      join_fields:
      - field_name: mobile_ios_country.join_field
        source_field_name: mobile_ios_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: First Time Installs
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_mobile_ios_country.first_time_installs]
    type: single_value
    series_types: {}
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_ios_country.first_time_installs}-${q1_mobile_ios_country.first_time_installs})/${q1_mobile_ios_country.first_time_installs}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 18
    col: 12
    width: 12
    height: 4
  - name: First Seen
    title: First Seen
    note_state: collapsed
    note_display: above
    note_text: The count of client IDs seen for the first time in the given time period.
    merged_queries:
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.first_seen]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '0'
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.first_seen]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '1'
      limit: 500
      join_fields:
      - field_name: mobile_ios_country.join_field
        source_field_name: mobile_ios_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: First Seen
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: From Previous Time Period
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    type: single_value
    hidden_fields: [q1_mobile_ios_country.first_seen]
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_ios_country.first_seen}-${q1_mobile_ios_country.first_seen})/${q1_mobile_ios_country.first_seen}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 27
    col: 12
    width: 12
    height: 4
  - name: Activated
    title: Activated
    note_state: collapsed
    note_display: hover
    note_text: A new profile is considered activated if seen 5 out of their first
      7 days.
    merged_queries:
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.activated]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '0'
      sorts: [mobile_ios_country.activated desc]
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_ios_country
      type: table
      fields: [mobile_ios_country.join_field, mobile_ios_country.activated]
      fill_fields: [mobile_ios_country.join_field]
      filters:
        mobile_ios_country.period_offset: '1'
      limit: 500
      join_fields:
      - field_name: mobile_ios_country.join_field
        source_field_name: mobile_ios_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: 7 Day Activated
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_mobile_ios_country.activated]
    type: single_value
    series_types: {}
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_ios_country.activated}-${q1_mobile_ios_country.activated})/${q1_mobile_ios_country.activated}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 36
    col: 12
    width: 12
    height: 4
  - title: Last Valid Submission Date
    name: Last Valid Submission Date
    model: duet
    explore: mobile_ios_country
    type: single_value
    fields: [mobile_ios_country.latest_date]
    fill_fields: [mobile_ios_country.latest_date]
    sorts: [mobile_ios_country.latest_date desc]
    limit: 500
    dynamic_fields: [{measure: count_of_latest_date, based_on: mobile_ios_country.latest_date,
        expression: '', label: Count of Latest Date, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most Recent Submission Date for Analysis
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
    series_types: {}
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 7
    col: 18
    width: 6
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: ''
    row: 53
    col: 12
    width: 12
    height: 3
  - name: 'Step 1: Apple App Store Page Views'
    type: text
    title_text: 'Step 1: Apple App Store Page Views'
    subtitle_text: How many views did we get on our Apple App Store page?
    body_text: ''
    row: 9
    col: 0
    width: 12
    height: 4
  - name: Important Dates
    type: text
    title_text: Important Dates
    body_text: Two dates that indicate the most recent days for which we have data.
      The graphs here will be reported up until the most recent submission date for
      analysis.
    row: 7
    col: 0
    width: 12
    height: 2
  - name: 'Step 2: Apple App Store First Time Installs'
    type: text
    title_text: 'Step 2: Apple App Store First Time Installs'
    subtitle_text: How many first time installations did we get from the Apple App
      Store?
    body_text: This is measured by the number of first tap taps on the 'Get' button
      in the app store. It's our closest measure to first time installations.
    row: 18
    col: 0
    width: 12
    height: 4
  - title: First Time Installs from Apple App Store
    name: First Time Installs from Apple App Store
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.first_time_installs]
    fill_fields: [mobile_ios_country.submission_date]
    sorts: [mobile_ios_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_ios_country.product_page_views,
            id: mobile_ios_country.product_page_views, name: Product Page Views}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 22
    col: 0
    width: 24
    height: 5
  - title: Page Visits from Apple App Store
    name: Page Visits from Apple App Store
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.product_page_views]
    fill_fields: [mobile_ios_country.submission_date]
    sorts: [mobile_ios_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_ios_country.product_page_views,
            id: mobile_ios_country.product_page_views, name: Product Page Views}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 13
    col: 0
    width: 24
    height: 5
  - name: 'Step 4: First Seen in Internal Telemetry'
    type: text
    title_text: 'Step 4: First Seen in Internal Telemetry'
    subtitle_text: How many acquisitions did we count internally on iOS devices?
    body_text: The count of new client IDs as measured internally, our measure of
      how many acquisitions we've received from the iOS platforms. Steps 2 and 3 may
      not agree due to the fact that Step 2 is only reported on an opt-in basis, meaning
      we're not able to measure the full counts. If many users download the app and
      never open it, we could see step 2 > step 3. If they do open the app but have
      opted out of data sharing, we could see a similar effect.
    row: 27
    col: 0
    width: 12
    height: 4
  - name: 'Step 5: iOS Activated Client Count'
    type: text
    title_text: 'Step 5: iOS Activated Client Count'
    subtitle_text: From our acquisitions, how many users were activated?
    body_text: A new client ID is considered activated if they were active during
      at least 5 of their first 7 days. This definition is the same as in the desktop
      acquisition funnel. The time frame for reporting in the dashboard ensures that
      we have observed at least a 7 day window after their acquisition date.
    row: 36
    col: 0
    width: 12
    height: 4
  - title: iOS First Seen Counts
    name: iOS First Seen Counts
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.first_seen]
    fill_fields: [mobile_ios_country.submission_date]
    sorts: [mobile_ios_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_ios_country.product_page_views,
            id: mobile_ios_country.product_page_views, name: Product Page Views}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 31
    col: 0
    width: 24
    height: 5
  - title: iOS Activated Client Count
    name: iOS Activated Client Count
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.activated]
    fill_fields: [mobile_ios_country.submission_date]
    sorts: [mobile_ios_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_ios_country.product_page_views,
            id: mobile_ios_country.product_page_views, name: Product Page Views}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_ios_country.history_days
      App Name: mobile_ios_country.app_name
      Bucket: country_buckets.bucket
    row: 40
    col: 0
    width: 24
    height: 5
  filters:
  - name: App Name
    title: App Name
    type: field_filter
    default_value: firefox
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
      options: []
    model: duet
    explore: mobile_ios_country
    listens_to_filters: []
    field: mobile_ios_country.app_name
  - name: History Days
    title: History Days
    type: field_filter
    default_value: '7'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options: []
    model: duet
    explore: mobile_ios_country
    listens_to_filters: []
    field: mobile_ios_country.history_days
  - name: Bucket
    title: Bucket
    type: field_filter
    default_value: tier-1
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: popover
      options: []
    model: duet
    explore: country_buckets
    listens_to_filters: []
    field: country_buckets.bucket
