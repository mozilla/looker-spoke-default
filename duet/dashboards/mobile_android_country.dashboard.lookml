- dashboard: android_numbers_that_matter
  title: Android Numbers that Matter
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Mobile Acquisition Funnel for Android
    type: text
    title_text: Mobile Acquisition Funnel for Android
    subtitle_text: ''
    body_text: |
      The purpose of this dashboard is to provide insight into the mobile acquisition funnel for some of our Android products, namely Fenix and Focus. It does not behave like a normal funnel due to the fact that the aggregated data originates from multiple sources, and it's important to understand each source before taking these numbers at face value.

      Google Play Store data informs the first 2 steps of the funnel. The reason that step 2 (event installs) is greater than step 1 (first time visitor counts) comes down to how they’re defined.

      * Step 1 is the count of unique users who visited the app listing in the Play Store but haven’t ever previously installed the app. Google’s definition of a user is not the same as our own, and this definition also restricts the count to essentially brand new visitors. There are no additional Play Store page view metrics available.
      * Step 2 is the count of times the app was installed. A user can download an app multiple times, over multiple devices, repeatedly. This is the best measure of each time that install event happens. Assuming each install generates a client ID, we may expect these counts to behave closest to our internal new profile measures.

      Note that there may appear to be delays in the data (“Last Play Store Update” or “Most Recent Submission Date for Analysis”) due to the fact that Google does not make Play Store data available for export every day. It’s usually exported every 7-14 days.

      Our internal telemetry is responsible for the final 2 steps, which provide acquisition (first seen) and activation counts. A new profile is activated if seen 5 out of 7 days in the first week. Both of these steps may be lower than step 2 primarily due to the fact that metrics are aggregated and counted differently between Google Play Store and Mozilla's internal telemetry.
    row: 0
    col: 0
    width: 24
    height: 4
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
    row: 12
    col: 12
    width: 12
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
    row: 4
    col: 0
    width: 12
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
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      History Days: mobile_android_country.history_days
      App ID: mobile_android_country.app_id
      Bucket: country_buckets.bucket
    row: 12
    col: 0
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
    row: 6
    col: 0
    width: 12
    height: 3
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
      fields: [mobile_android_country.join_field, mobile_android_country.event_installs]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '0'
      sorts: [mobile_android_country.event_installs desc]
      limit: 500
      join_fields: []
    - model: duet
      explore: mobile_android_country
      type: table
      fields: [mobile_android_country.join_field, mobile_android_country.event_installs]
      fill_fields: [mobile_android_country.join_field]
      filters:
        mobile_android_country.period_offset: '1'
      sorts: [mobile_android_country.event_installs desc]
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
    row: 6
    col: 12
    width: 12
    height: 3
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
    row: 9
    col: 0
    width: 12
    height: 3
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
    row: 9
    col: 12
    width: 12
    height: 3
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
    row: 4
    col: 12
    width: 12
    height: 2
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
