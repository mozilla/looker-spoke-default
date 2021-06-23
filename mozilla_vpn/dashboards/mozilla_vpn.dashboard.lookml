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
    - subscriptions.count
    - active_subscriptions.active_date
    fill_fields:
    - active_subscriptions.active_date
    sorts:
    - active_subscriptions.active_date desc
    limit: 1
    defaults_version: 1
    listen: &listen
      Provider: subscriptions.provider
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
    - subscriptions.count
    - active_subscriptions.active_date
    fill_fields:
    - active_subscriptions.active_date
    sorts:
    - active_subscriptions.active_date desc
    limit: 500
    color_application: &color_application
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_colors:
      subscriptions.count: "#3D52B9"
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
    - subscriptions.count
    - active_subscriptions.active_date
    - subscriptions.subscription_start_month
    pivots:
    - subscriptions.subscription_start_month
    fill_fields:
    - active_subscriptions.active_date
    - subscriptions.subscription_start_month
    sorts:
    - active_subscriptions.active_date desc
    - subscriptions.subscription_start_month
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
    - subscription_events.event_date
    - subscription_events.type
    - subscription_events.delta
    pivots:
    - subscription_events.type
    fill_fields:
    - subscription_events.event_date
    sorts:
    - subscription_events.event_date
    - subscription_events.type
    limit: 500
    row_total: right
    dynamic_fields:
    - table_calculation: 7_day_sum
      label: 7-day Sum
      expression: sum(offset_list(${subscription_events.delta}, -6, 7))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: net_7_day_sum
      label: Net Paid Subscriptions - 7-day Sum
      expression: sum(offset_list(${subscription_events.delta:row_total}, -6,
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
    - subscription_events.delta
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
    - subscription_events.event_date
    - subscription_events.delta
    - subscription_events.type
    pivots:
    - subscription_events.type
    fill_fields:
    - subscription_events.event_date
    sorts:
    - subscription_events.event_date desc
    - subscription_events.type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - subscription_events.delta: "#08B248"
      Cancelled - subscription_events.delta: "#FC2E31"
      Row Total - subscription_events.delta: "#3D52B9"
    series_labels:
      Row Total - subscription_events.delta: Net Paid Subscriptions
    defaults_version: 1
    listen: *listen
    row: 9
    col: 12
    width: 12
    height: 9
  - title: Conversion Rates
    name: Conversion Rates
    model: mozilla_vpn
    explore: funnel_fxa_login_to_protected
    type: looker_line
    fields:
    - funnel_fxa_login_to_protected.start_date
    - funnel_fxa_login_to_protected.count
    - funnel_fxa_login_to_protected.frac_completed_login
    - funnel_fxa_login_to_protected.frac_registered_user
    - funnel_fxa_login_to_protected.frac_paid_for_subscription
    - funnel_fxa_login_to_protected.frac_registered_device
    - funnel_fxa_login_to_protected.frac_protected
    fill_fields:
    - funnel_fxa_login_to_protected.start_date
    filters:
      funnel_fxa_login_to_protected.start_date: after 2020/05/01
    sorts:
    - funnel_fxa_login_to_protected.start_date desc
    limit: 500
    y_axes:
    - label: ''
      orientation: left
      series:
      - axisId: funnel_fxa_login_to_protected.frac_completed_login
        id: funnel_fxa_login_to_protected.frac_completed_login
        name: Frac Completed Login
      - axisId: funnel_fxa_login_to_protected.frac_registered_user
        id: funnel_fxa_login_to_protected.frac_registered_user
        name: Frac Registered User
      - axisId: funnel_fxa_login_to_protected.frac_paid_for_subscription
        id: funnel_fxa_login_to_protected.frac_paid_for_subscription
        name: Frac Subscribed
      - axisId: funnel_fxa_login_to_protected.frac_protected
        id: funnel_fxa_login_to_protected.frac_protected
        name: Frac Protected
      - axisId: funnel_fxa_login_to_protected.frac_registered_device
        id: funnel_fxa_login_to_protected.frac_registered_device
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
      - axisId: funnel_fxa_login_to_protected.count
        id: funnel_fxa_login_to_protected.count
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
    - subscription_events.event_date
    - subscription_events.delta
    - subscription_events.granular_type
    pivots:
    - subscription_events.granular_type
    fill_fields:
    - subscription_events.event_date
    sorts:
    - subscription_events.event_date desc
    - subscription_events.granular_type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - subscription_events.delta: "#08B248"
      Resurrected - subscription_events.delta: "#C9DC10"
      Cancelled by Customer - subscription_events.delta: "#FC2E31"
      Cancelled by IAP - subscription_events.delta: "#FA2F90"
      Payment Failed = subscription_events.delta: "#FA9200"
      Row Total - subscription_events.delta: "#3D52B9"
    series_labels:
      Row Total - subscription_events.delta: Net Paid Subscriptions
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
    - subscription_events.event_date
    - subscription_events.delta
    - subscriptions.attribution_category
    pivots:
    - subscriptions.attribution_category
    fill_fields:
    - subscription_events.event_date
    filters:
      subscription_events.type: New
    sorts:
    - subscription_events.event_date
    - subscriptions.attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${subscription_events.delta}, -27, 28))
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
    - subscription_events.event_date
    - subscription_events.delta
    - subscriptions.coarse_attribution_category
    pivots:
    - subscriptions.coarse_attribution_category
    fill_fields:
    - subscription_events.event_date
    filters:
      subscription_events.type: New
    sorts:
    - subscription_events.event_date
    - subscriptions.coarse_attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${subscription_events.delta}, -27, 28))
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
    - subscriptions.count
    - active_subscriptions.active_date
    - subscriptions.attribution_category
    pivots:
    - subscriptions.attribution_category
    fill_fields:
    - active_subscriptions.active_date
    sorts:
    - active_subscriptions.active_date desc
    - subscriptions.attribution_category
    limit: 500
    column_limit: 50
    color_application: *color_application
    defaults_version: 1
    listen: *listen
    row: 36
    col: 0
    width: 12
    height: 9
  - title: Average Devices per Active User
    name: Average Devices per Active User
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - active_subscriptions.active_date
    - subscriptions.count
    - devices.count
    fill_fields:
    - active_subscriptions.active_date
    sorts:
    - active_subscriptions.active_date desc
    dynamic_fields:
    - table_calculation: average_devices_per_user
      label: Average Devices per User
      expression: "${devices.count}/${subscriptions.count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    defaults_version: 1
    hidden_fields:
    - subscriptions.count
    - devices.count
    listen: *listen
    row: 36
    col: 12
    width: 12
    height: 9
  - title: 7-day Average of Retention Rate
    name: 7-day Average of Retention Rate
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - retention.retention_type
    - retention_period_end_7_day_aggregate.aggregate_date
    - retention.retention_rate
    pivots:
    - retention.retention_type
    fill_fields:
    - retention_period_end_7_day_aggregate.aggregate_date
    sorts:
    - retention_period_end_7_day_aggregate.aggregate_date desc
    - retention.retention_type
    limit: 500
    color_application: *color_application
    series_colors:
      first month - retention.retention_rate: "#FC2E31"
      subsequent months - retention.retention_rate: "#3D52B9"
    defaults_version: 1
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
    - subscription_events.delta
    - subscription_events.event_month
    fill_fields:
    - subscription_events.event_month
    filters:
      subscription_events.type: New
    sorts:
    - subscription_events.event_month desc
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
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.provider
  - name: Pricing Plan
    title: Pricing Plan
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.pricing_plan
  - name: Country
    title: Country
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.country_name
  - name: Source
    title: Source
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.normalized_source
  - name: Medium
    title: Medium
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.normalized_medium
  - name: Campaign
    title: Campaign
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.normalized_campaign
  - name: Content
    title: Content
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.normalized_content
  - name: Acquisition Channel
    title: Acquisition Channel
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.normalized_acquisition_channel
  - name: Website Channel Group
    title: Website Channel Group
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.website_channel_group
