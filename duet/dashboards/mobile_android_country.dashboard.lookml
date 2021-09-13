- dashboard: android_mobile_acquisition_funnel
  title: Android Mobile Acquisition Funnel
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Mobile Acquisition Funnel for Android
    type: text
    title_text: Mobile Acquisition Funnel for Android
    subtitle_text: ''
    body_text: |-
      The purpose of this dashboard is to provide insight into the mobile acquisition funnel for some of our Android products, namely Fenix and Focus. It does not behave like a normal funnel due to the fact that the aggregated data originates from multiple sources, and it's important to understand each source and the caveats that may come with the data.

      Google Play Store data informs the first 2 steps of the funnel. These first two steps provide insight primarily into the new user visitor group in the Play Store app. A new user is one that does not have Firefox installed on any of their Google devices.

      Our internal telemetry is responsible for the final 2 steps, which provide acquisition (first seen) and activation counts. A new profile is activated if seen 5 out of 7 days in the first week. Both of these steps may be lower than step 2 primarily due to the fact that metrics are aggregated and counted differently between Google Play Store and Mozilla's internal telemetry.
    row: 0
    col: 0
    width: 12
    height: 7
  - title: Android Funnel Per Day
    name: Android Funnel Per Day
    model: duet
    explore: mobile_android_country
    type: looker_line
    fields: [mobile_android_country.submission_date, mobile_android_country.first_time_visitor_count,
      mobile_android_country.event_installs, mobile_android_country.first_seen, mobile_android_country.activated]
    fill_fields: [mobile_android_country.submission_date]
    sorts: [mobile_android_country.first_seen desc]
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
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 50
    col: 0
    width: 24
    height: 8
  - title: Last Play Store Update
    name: Last Play Store Update
    model: duet
    explore: mobile_android_country
    type: single_value
    fields: [mobile_android_country.play_store_updated]
    fill_fields: [mobile_android_country.play_store_updated]
    sorts: [mobile_android_country.play_store_updated desc]
    limit: 500
    dynamic_fields: [{measure: count_of_latest_date, based_on: mobile_android_country.latest_date,
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
    note_display: hover
    note_text: This date may be delayed because Google does not make Play Store data
      available every day (usually every 7-14 days).
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 8
    col: 12
    width: 6
    height: 2
  - title: Funnel Overview
    name: Funnel Overview
    model: duet
    explore: mobile_android_country
    type: looker_column
    fields: [mobile_android_country.first_time_visitor_count, mobile_android_country.event_installs,
      mobile_android_country.first_seen, mobile_android_country.activated]
    sorts: [mobile_android_country.event_installs desc]
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
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 0
    col: 12
    width: 12
    height: 8
  - name: First Time Visitor Count
    title: First Time Visitor Count
    note_state: collapsed
    note_display: hover
    note_text: The number of first time visitor counts to the app's Play Store page.
      See notes above for context on how this number is calculated and reported on
      by Google.
    merged_queries:
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_time_visitor_count]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '0'
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_time_visitor_count]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '1'
      sorts: [mobile_android_country.first_time_visitor_count desc]
      limit: 500
      join_fields:
      - field_name: mobile_android_country.join_field
        source_field_name: mobile_android_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: First Time Visitor Count
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_mobile_android_country.first_time_visitor_count]
    series_types: {}
    type: single_value
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_android_country.first_time_visitor_count}-${q1_mobile_android_country.first_time_visitor_count})/${q1_mobile_android_country.first_time_visitor_count}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 10
    col: 12
    width: 12
    height: 4
  - name: Event Installs
    title: Event Installs
    note_state: collapsed
    note_display: above
    note_text: The count of install events as reported in the Play Store. It includes
      re-installs but not pre-installs on Google devices.
    merged_queries:
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_time_installs]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '0'
        country_buckets.bucket: ''
      sorts: [mobile_android_country.first_time_installs desc]
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_time_installs]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '1'
        country_buckets.bucket: ''
      sorts: [mobile_android_country.first_time_installs desc]
      limit: 500
      join_fields:
      - field_name: mobile_android_country.join_field
        source_field_name: mobile_android_country.join_field
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Event Installs
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [q1_mobile_android_country.event_installs]
    type: single_value
    series_types: {}
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_android_country.event_installs}-${q1_mobile_android_country.event_installs})/${q1_mobile_android_country.event_installs}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 20
    col: 12
    width: 12
    height: 4
  - name: First Seen
    title: First Seen
    note_state: collapsed
    note_display: hover
    note_text: The number of client IDs seen for the first time in the given time
      period.
    merged_queries:
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_seen]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '0'
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.first_seen]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '1'
      limit: 500
      join_fields:
      - field_name: mobile_android_country.join_field
        source_field_name: mobile_android_country.join_field
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
    hidden_fields: [q1_mobile_android_country.first_seen]
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_android_country.first_seen}-${q1_mobile_android_country.first_seen})/${q1_mobile_android_country.first_seen}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 30
    col: 12
    width: 12
    height: 4
  - name: Activated
    title: Activated
    note_state: collapsed
    note_display: above
    note_text: A new profile is activated if seen in 5 out of their first 7 days.
    merged_queries:
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.activated]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '0'
      sorts: [mobile_android_country.activated desc]
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.activated]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '1'
      limit: 500
      join_fields:
      - field_name: mobile_android_country.join_field
        source_field_name: mobile_android_country.join_field
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
    hidden_fields: [q1_mobile_android_country.activated]
    type: single_value
    series_types: {}
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: from_previous_time_period,
        _type_hint: number, category: table_calculation, expression: "(${mobile_android_country.activated}-${q1_mobile_android_country.activated})/${q1_mobile_android_country.activated}",
        label: From Previous Time Period, value_format: !!null '', value_format_name: percent_1}]
    listen:
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 40
    col: 12
    width: 12
    height: 4
  - title: Last Valid Submission Date
    name: Last Valid Submission Date
    model: duet
    explore: mobile_android_country
    type: single_value
    fields: [mobile_android_country.latest_date]
    fill_fields: [mobile_android_country.latest_date]
    sorts: [mobile_android_country.latest_date desc]
    limit: 500
    dynamic_fields: [{measure: count_of_latest_date, based_on: mobile_android_country.latest_date,
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
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 8
    col: 18
    width: 6
    height: 2
  - name: 'Step 2: Google Play Store First Time Installs'
    type: text
    title_text: 'Step 2: Google Play Store First Time Installs'
    subtitle_text: How many first time installs did we get from the Google Play Store?
    body_text: This metric is a follow-on from Step 1 - out of the first time page
      visits in the Google Play Store, how many first time installations did we get?
      This measurement helps us determine, in conjunction with Step 1, how well we
      are converting new visitors.
    row: 20
    col: 0
    width: 12
    height: 4
  - title: Page Visits from Google Play Store
    name: Page Visits from Google Play Store
    model: duet
    explore: mobile_android_country
    type: looker_line
    fields: [mobile_android_country.submission_date, mobile_android_country.first_time_visitor_count]
    fill_fields: [mobile_android_country.submission_date]
    sorts: [mobile_android_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_android_country.first_time_visitor_count,
            id: mobile_android_country.first_time_visitor_count, name: First Time
              Visitor Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 14
    col: 0
    width: 24
    height: 6
  - name: 'Step 3: First Seen in Internal Telemetry'
    type: text
    title_text: 'Step 3: First Seen in Internal Telemetry'
    body_text: The count of new client IDs measured in our internal telemetry. This
      is our internal indication of how many acquisitions we have gotten during the
      time period of interest. The jump from Step 2 to Step 3 is the installation
      from Google Play Store to opening the app for the first time - these events
      may happen on the same day, or a user could have installed from the Play Store
      during a previous time period and opening the app for the first time during
      this time period. Events like this could cause counts in Step 3 to be greater
      than Step 2.
    row: 30
    col: 0
    width: 12
    height: 4
  - name: 'Step 1: Google Play Store Page Views'
    type: text
    title_text: 'Step 1: Google Play Store Page Views'
    subtitle_text: How many visitors did we get to our Play Store App page?
    body_text: Google provides the count of unique users who visited the app listing
      in the Play Store but haven’t ever previously installed the app. This definition
      restricts the count to essentially brand new visitors. There are no additional
      Play Store page view metrics available.
    row: 10
    col: 0
    width: 12
    height: 4
  - title: Install Events from Google Play Store
    name: Install Events from Google Play Store
    model: duet
    explore: mobile_android_country
    type: looker_line
    fields: [mobile_android_country.submission_date, mobile_android_country.first_time_installs]
    fill_fields: [mobile_android_country.submission_date]
    filters: {}
    sorts: [mobile_android_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_android_country.event_installs,
            id: mobile_android_country.event_installs, name: Event Installs}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 24
    col: 0
    width: 24
    height: 6
  - title: Client First Seen Counts
    name: Client First Seen Counts
    model: duet
    explore: mobile_android_country
    type: looker_line
    fields: [mobile_android_country.submission_date, mobile_android_country.first_seen]
    fill_fields: [mobile_android_country.submission_date]
    sorts: [mobile_android_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_android_country.first_seen,
            id: mobile_android_country.first_seen, name: First Seen}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 34
    col: 0
    width: 24
    height: 6
  - name: 'Step 4: New Acquisition Activations'
    type: text
    title_text: 'Step 4: New Acquisition Activations'
    subtitle_text: What proportion of our acquisitions were activated?
    body_text: A new client ID is considered activated if they were active during
      at least 5 of their first 7 days. This definition is the same as in the desktop
      acquisition funnel. The time frame for reporting in the dashboard ensures that
      we have observed at least a 7 day window after their acquisition date.
    row: 40
    col: 0
    width: 12
    height: 4
  - title: Activated Client Count
    name: Activated Client Count
    model: duet
    explore: mobile_android_country
    type: looker_line
    fields: [mobile_android_country.submission_date, mobile_android_country.activated]
    fill_fields: [mobile_android_country.submission_date]
    sorts: [mobile_android_country.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_android_country.activated,
            id: mobile_android_country.activated, name: Activated}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 44
    col: 0
    width: 24
    height: 6
  - name: Important Dates
    type: text
    title_text: Important Dates
    body_text: The dates for which we receive the latest data for Google and internally
      usually do not match up. This is due to the fact that Google does not make Play
      Store data available for export every day, instead it's usually exported every
      7-14 days. Because of this there may appear to be lags between the two datasets.
      Generally the reported data will be from the most recent submission date.
    row: 7
    col: 0
    width: 12
    height: 3
  filters:
  - name: App ID
    title: App ID
    type: field_filter
    default_value: firefox
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
      options: []
    model: duet
    explore: mobile_android_country
    listens_to_filters: []
    field: mobile_android_country.app_id
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
    explore: mobile_android_country
    listens_to_filters: []
    field: mobile_android_country.history_days
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
