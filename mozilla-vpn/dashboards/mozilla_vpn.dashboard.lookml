- dashboard: mozilla_vpn
  title: Mozilla VPN
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 day
  elements:
  - title: Most Recent Active Subscriptions
    name: Most Recent Active Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields:
    - all_subscriptions__active.count
    - all_subscriptions__active.active_date
    fill_fields:
    - all_subscriptions__active.active_date
    sorts:
    - all_subscriptions__active.active_date desc
    limit: 1
    defaults_version: 1
    listen: &listen
      Provider: all_subscriptions.provider
    row: 0
    col: 0
    width: 12
    height: 3
  - title: Active Subscriptions
    name: Active Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__active.count
    - all_subscriptions__active.active_date
    fill_fields:
    - all_subscriptions__active.active_date
    sorts:
    - all_subscriptions__active.active_date desc
    limit: 500
    color_application: &color_application
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_colors:
      all_subscriptions__active.count: "#3D52B9"
    defaults_version: 1
    listen: *listen
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Active Subscriptions by Start Month
    name: Active Subscriptions by Start Month
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__active.count
    - all_subscriptions__active.active_date
    - all_subscriptions.start_month
    pivots:
    - all_subscriptions.start_month
    fill_fields:
    - all_subscriptions__active.active_date
    - all_subscriptions.start_month
    sorts:
    - all_subscriptions__active.active_date desc
    - all_subscriptions.start_month
    limit: 500
    color_application: *color_application
    defaults_version: 1
    listen: *listen
    row: 0
    col: 12
    width: 12
    height: 9
  - title: 7-day Sum of Subscription Events
    name: 7-day Sum of Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.type
    - all_subscriptions__events.delta
    pivots:
    - all_subscriptions__events.type
    fill_fields:
    - all_subscriptions__events.event_date
    filters:
      all_subscriptions.provider: ''
    sorts:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.type
    limit: 500
    row_total: right
    dynamic_fields:
    - table_calculation: 7_day_sum
      label: 7-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -6, 7))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: net_7_day_sum
      label: Net Paid Subscriptions - 7-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta:row_total}, -6,
        7))
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    color_application: *color_application
    series_colors:
      New - 7_day_sum: "#08B248"
      Cancelled - 7_day_sum: "#FC2E31"
      net_7_day_sum: "#3D52B9"
    defaults_version: 1
    hidden_fields:
    - all_subscriptions__events.delta
    listen: *listen
    row: 9
    col: 0
    width: 12
    height: 9
  - title: Subscription Events
    name: Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.delta
    - all_subscriptions__events.type
    pivots:
    - all_subscriptions__events.type
    fill_fields:
    - all_subscriptions__events.event_date
    sorts:
    - all_subscriptions__events.event_date desc
    - all_subscriptions__events.type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - all_subscriptions__events.delta: "#08B248"
      Cancelled - all_subscriptions__events.delta: "#FC2E31"
      Row Total - all_subscriptions__events.delta: "#3D52B9"
    series_labels:
      Row Total - all_subscriptions__events.delta: Net Paid Subscriptions
    defaults_version: 1
    listen: *listen
    row: 9
    col: 12
    width: 12
    height: 9
  - title: Conversion Rates
    name: Conversion Rates
    model: mozilla_vpn
    explore: funnel
    type: looker_line
    fields:
    - funnel_start_fxa_login.start_date
    - funnel_start_fxa_login.count
    - funnel_start_fxa_login.frac_completed_login
    - funnel_start_fxa_login.frac_registered_user
    - funnel_start_fxa_login.frac_subscribed
    - funnel_start_fxa_login.frac_registered_device
    - funnel_start_fxa_login.frac_protected
    fill_fields:
    - funnel_start_fxa_login.start_date
    filters:
      funnel_start_fxa_login.start_date: after 2020/05/01
    sorts:
    - funnel_start_fxa_login.start_date desc
    limit: 500
    y_axes:
    - label: ''
      orientation: left
      series:
      - axisId: funnel_start_fxa_login.frac_completed_login
        id: funnel_start_fxa_login.frac_completed_login
        name: Frac Completed Login
      - axisId: funnel_start_fxa_login.frac_registered_user
        id: funnel_start_fxa_login.frac_registered_user
        name: Frac Registered User
      - axisId: funnel_start_fxa_login.frac_subscribed
        id: funnel_start_fxa_login.frac_subscribed
        name: Frac Subscribed
      - axisId: funnel_start_fxa_login.frac_protected
        id: funnel_start_fxa_login.frac_protected
        name: Frac Protected
      - axisId: funnel_start_fxa_login.frac_registered_device
        id: funnel_start_fxa_login.frac_registered_device
        name: Frac Registered Device
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - axisId: funnel_start_fxa_login.count
        id: funnel_start_fxa_login.count
        name: Login Attempts
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    defaults_version: 1
    row: 18
    col: 0
    width: 12
    height: 9
  - title: Granular Subscription Events
    name: Granular Subscription Events
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.delta
    - all_subscriptions__events.granular_type
    pivots:
    - all_subscriptions__events.granular_type
    fill_fields:
    - all_subscriptions__events.event_date
    sorts:
    - all_subscriptions__events.event_date desc
    - all_subscriptions__events.granular_type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - all_subscriptions__events.delta: "#08B248"
      Resurrected - all_subscriptions__events.delta: "#C9DC10"
      Cancelled by Customer - all_subscriptions__events.delta: "#FC2E31"
      Cancelled by IAP - all_subscriptions__events.delta: "#FA2F90"
      Payment Failed = all_subscriptions__events.delta: "#FA9200"
      Row Total - all_subscriptions__events.delta: "#3D52B9"
    series_labels:
      Row Total - all_subscriptions__events.delta: Net Paid Subscriptions
    defaults_version: 1
    listen: *listen
    row: 18
    col: 12
    width: 12
    height: 9
  - title: 28-day Sum of New Subscriptions by Attribution
    name: 28-day Sum of New Subscriptions by Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.delta
    - users.attribution_category
    pivots:
    - users.attribution_category
    fill_fields:
    - all_subscriptions__events.event_date
    filters:
      all_subscriptions__events.type: New
    sorts:
    - all_subscriptions__events.event_date
    - users.attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -27, 28))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    defaults_version: 1
    listen: *listen
    row: 27
    col: 0
    width: 12
    height: 9
  - title: 28-day Sum of New Subscriptions by Coarse Attribution
    name: 28-day Sum of New Subscriptions by Coarse Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__events.event_date
    - all_subscriptions__events.delta
    - users.coarse_attribution_category
    pivots:
    - users.coarse_attribution_category
    fill_fields:
    - all_subscriptions__events.event_date
    filters:
      all_subscriptions__events.type: New
    sorts:
    - all_subscriptions__events.event_date
    - users.coarse_attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${all_subscriptions__events.delta}, -27, 28))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    color_application: *color_application
    defaults_version: 1
    listen: *listen
    row: 27
    col: 12
    width: 12
    height: 9
  - title: Active Subscriptions by Attribution
    name: Active Subscriptions by Attribution
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__active.count
    - all_subscriptions__active.active_date
    - users.attribution_category
    pivots:
    - users.attribution_category
    fill_fields:
    - all_subscriptions__active.active_date
    sorts:
    - all_subscriptions__active.active_date desc
    - users.attribution_category
    limit: 500
    column_limit: 50
    color_application: *color_application
    defaults_version: 1
    listen: *listen
    row: 36
    col: 0
    width: 12
    height: 9
  - title: Average Devices per User
    name: Average Devices per User
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - all_subscriptions__active.active_date
    - all_subscriptions__active.count
    - users.count
    - devices.count
    fill_fields:
    - all_subscriptions__active.active_date
    sorts:
    - all_subscriptions__active.active_date desc
    dynamic_fields:
    - table_calculation: average_devices_per_user
      label: Average Devices per User
      expression: "${devices.count}/${users.count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    defaults_version: 1
    hidden_fields:
    - users.count
    - all_subscriptions__active.count
    - devices.count
    listen: *listen
    row: 36
    col: 12
    width: 12
    height: 9
  - title: Speedy Renewal Rates (1 Day Lag)
    name: Speedy Renewal Rates (1 Day Lag)
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields:
    - renewal_rates
    sorts:
    - renewal_rates
    dynamic_fields:
    - dimension: renewal_rates
      label: Renewal Rates
      expression: '"Renewal Rates"'
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    color_application: *color_application
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: <font color="red"><b>This graph is not available in Looker due to access
      restrictions on the underlying data
    listen: *listen
    row: 45
    col: 0
    width: 12
    height: 9
  - title: New Subscriptions by Month
    name: New Subscriptions by Month
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields:
    - all_subscriptions__events.delta
    - all_subscriptions__events.event_month
    fill_fields:
    - all_subscriptions__events.event_month
    filters:
      all_subscriptions__events.type: New
    sorts:
    - all_subscriptions__events.event_month desc
    limit: 500
    column_limit: 50
    color_application: *color_application
    defaults_version: 1
    listen: *listen
    row: 45
    col: 12
    width: 12
    height: 9
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    default_value: APPLE,FXA
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: all_subscriptions.provider
