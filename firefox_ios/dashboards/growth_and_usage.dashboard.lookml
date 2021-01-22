- dashboard: firefox_ios_gud
  title: Firefox iOS Growth and Usage
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Weekly Active Users
    name: Weekly Active Users
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.submission_date, growth.user_count_active_7_days]
    fill_fields: [growth.submission_date]
    filters: {}
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Monthly Active Users
    name: Monthly Active Users
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.submission_date, growth.user_count_active_28_days]
    fill_fields: [growth.submission_date]
    filters: {}
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 0
    col: 16
    width: 8
    height: 6
  - title: 1-Week New Profile Retention
    name: 1-Week New Profile Retention
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.submission_date, growth.wow_retention]
    filters:
      growth.days_since_created_profile: "[7, 13]"
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 6
    col: 8
    width: 8
    height: 6
  - title: 1-Week Retention
    name: 1-Week Retention
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.submission_date, growth.wow_retention]
    filters: {}
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Daily Active Users
    name: Daily Active Users
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.user_count_active_this_day, growth.submission_date]
    fill_fields: [growth.submission_date]
    filters: {}
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Intensity
    name: Intensity
    model: firefox_ios
    explore: growth
    type: looker_line
    fields: [growth.submission_date, growth.average_intensity]
    fill_fields: [growth.submission_date]
    filters: {}
    sorts: [growth.submission_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Language: growth.locale
      Country: growth.country
      Channel: growth.normalized_channel
      Time Period: growth.submission_date
    row: 6
    col: 0
    width: 8
    height: 6
  filters:
  - name: Language
    title: Language
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: firefox_ios
    explore: growth
    listens_to_filters: []
    field: growth.locale
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: firefox_ios
    explore: growth
    listens_to_filters: []
    field: growth.country
  - name: Channel
    title: Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: firefox_ios
    explore: growth
    listens_to_filters: []
    field: growth.normalized_channel
  - name: Time Period
    title: Time Period
    type: date_filter
    default_value: 1 years
    allow_multiple_values: true
    required: true
