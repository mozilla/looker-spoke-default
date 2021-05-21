- dashboard: ios_numbers_that_matter
  title: iOS Numbers that Matter
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Attribution Funnel for iOS
    type: text
    title_text: Attribution Funnel for iOS
    subtitle_text: ''
    body_text: |-
      This dashboard contains figures for new installations of Firefox products on iOS.

      Data is source from the Apple Store and the clients last seen tables for the respective applications. See [DS-1541](https://jira.mozilla.com/browse/DS-1541) for tracking.
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Android Funnel Per Day
    name: Android Funnel Per Day
    model: duet
    explore: mobile_ios_country
    type: looker_line
    fields: [mobile_ios_country.submission_date, mobile_ios_country.product_page_views,
      mobile_ios_country.first_time_installs, mobile_ios_country.first_seen, mobile_ios_country.activated]
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
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 12
    col: 12
    width: 12
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
    listen:
      History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 4
    col: 0
    width: 12
    height: 2
  - title: Funnel Overview
    name: Funnel Overview
    model: duet
    explore: mobile_ios_country
    type: looker_column
    fields: [mobile_ios_country.product_page_views, mobile_ios_country.first_time_installs,
      mobile_ios_country.first_seen, mobile_ios_country.activated]
    sorts: [mobile_ios_country.first_time_installs desc]
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
      History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 12
    col: 0
    width: 12
    height: 8
  - name: First Time Visitor Count
    title: First Time Visitor Count
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
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 6
    col: 0
    width: 12
    height: 3
  - name: First Time Installs
    title: First Time Installs
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
    single_value_title: stalls
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
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 6
    col: 12
    width: 12
    height: 3
  - name: First Seen
    title: First Seen
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
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 9
    col: 0
    width: 12
    height: 3
  - name: Activated
    title: Activated
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
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    - History Days: mobile_ios_country.history_days
      App ID: mobile_ios_country.app_id
      Bucket: country_buckets.bucket
    row: 9
    col: 12
    width: 12
    height: 3
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
      App ID: mobile_ios_country.app_id
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
    explore: mobile_ios_country
    listens_to_filters: []
    field: mobile_ios_country.app_id
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
