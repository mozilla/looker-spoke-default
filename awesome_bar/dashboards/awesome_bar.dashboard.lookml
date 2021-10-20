- dashboard: awesome_bar
  title: Awesome Bar
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Awesome Bar Picked By Type
    name: Awesome Bar Picked By Type
    model: awesome_bar
    explore: urlbar_clients_daily
    type: looker_column
    fields: [urlbar_clients_daily.submission_date, urlbar_clients_daily__count_picked_by_type.key,
      number_of_engagements]
    pivots: [urlbar_clients_daily__count_picked_by_type.key]
    fill_fields: [urlbar_clients_daily.submission_date]
    filters: {}
    sorts: [urlbar_clients_daily.submission_date desc, urlbar_clients_daily__count_picked_by_type.key]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Number of Engagements,
        based_on: urlbar_clients_daily__count_picked_by_type.value, _kind_hint: measure,
        measure: number_of_engagements, type: sum, _type_hint: number}]
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
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Date
    series_types: {}
    defaults_version: 1
    listen:
      Submission Date: urlbar_clients_daily.submission_date
    row: 0
    col: 0
    width: 13
    height: 7
  - title: Awesome Bar Picked By Position
    name: Awesome Bar Picked By Position
    model: awesome_bar
    explore: urlbar_clients_daily
    type: looker_column
    fields: [urlbar_clients_daily.submission_date, urlbar_clients_daily__count_picked_by_position.key,
      number_of_engagements]
    pivots: [urlbar_clients_daily__count_picked_by_position.key]
    fill_fields: [urlbar_clients_daily.submission_date]
    filters:
      urlbar_clients_daily__count_picked_by_position.key: "[1, 10]"
    sorts: [urlbar_clients_daily.submission_date desc, urlbar_clients_daily__count_picked_by_position.key]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Number of Engagements,
        based_on: urlbar_clients_daily__count_picked_by_position.value, _kind_hint: measure,
        measure: number_of_engagements, type: sum, _type_hint: number}]
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
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Date
    series_types: {}
    defaults_version: 1
    listen:
      Submission Date: urlbar_clients_daily.submission_date
    row: 0
    col: 13
    width: 11
    height: 7
  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: awesome_bar
    explore: urlbar_clients_daily
    listens_to_filters: []
    field: urlbar_clients_daily.submission_date
