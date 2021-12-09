- dashboard: vpn_acquisition_funnel_view__new_funnel
  title: VPN Acquisition Funnel View - New Funnel
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Total conversion
    name: Total conversion
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.VPN_site_hits, new_funnel_from_08252021.total_payment_setup_engage,
      new_funnel_from_08252021.total_payment_setup_complete, new_funnel_from_08252021.start_date]
    fill_fields: [new_funnel_from_08252021.start_date]
    sorts: [new_funnel_from_08252021.start_date desc]
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
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Existing FxA users
    name: Existing FxA users
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.Existing_FxA_payment_setup_view,
      new_funnel_from_08252021.Existing_FxA_payment_setup_engage, new_funnel_from_08252021.Existing_FxA_pay_setup_complete]
    fill_fields: [new_funnel_from_08252021.start_date]
    sorts: [new_funnel_from_08252021.start_date desc]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 12
    col: 0
    width: 8
    height: 6
  - title: New FxA users
    name: New FxA users
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.New_FxA_user_input_emails,
      new_funnel_from_08252021.New_FxA_payment_setup_engage, new_funnel_from_08252021.New_FxA_payment_setup_complete]
    fill_fields: [new_funnel_from_08252021.start_date]
    sorts: [new_funnel_from_08252021.start_date desc]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 6
    col: 0
    width: 8
    height: 6
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: []
    field: new_funnel_from_08252021.start_date
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: []
    field: new_funnel_from_08252021.country
  - name: UTM Medium
    title: UTM Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: []
    field: new_funnel_from_08252021.UTM_medium
