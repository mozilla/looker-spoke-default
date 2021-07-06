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
    - subscriptions__active.active_date
    fill_fields:
    - subscriptions__active.active_date
    sorts:
    - subscriptions__active.active_date desc
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
    - subscriptions__active.active_date
    fill_fields:
    - subscriptions__active.active_date
    sorts:
    - subscriptions__active.active_date desc
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
    - subscriptions__active.active_date
    - subscriptions.subscription_start_month
    pivots:
    - subscriptions.subscription_start_month
    fill_fields:
    - subscriptions__active.active_date
    - subscriptions.subscription_start_month
    sorts:
    - subscriptions__active.active_date desc
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
    - subscriptions__events.event_date
    - subscriptions__events.type
    - subscriptions__events.delta
    pivots:
    - subscriptions__events.type
    fill_fields:
    - subscriptions__events.event_date
    sorts:
    - subscriptions__events.event_date
    - subscriptions__events.type
    limit: 500
    row_total: right
    dynamic_fields:
    - table_calculation: 7_day_sum
      label: 7-day Sum
      expression: sum(offset_list(${subscriptions__events.delta}, -6, 7))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: net_7_day_sum
      label: Net Paid Subscriptions - 7-day Sum
      expression: sum(offset_list(${subscriptions__events.delta:row_total}, -6,
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
    - subscriptions__events.delta
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
    - subscriptions__events.event_date
    - subscriptions__events.delta
    - subscriptions__events.type
    pivots:
    - subscriptions__events.type
    fill_fields:
    - subscriptions__events.event_date
    sorts:
    - subscriptions__events.event_date desc
    - subscriptions__events.type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - subscriptions__events.delta: "#08B248"
      Cancelled - subscriptions__events.delta: "#FC2E31"
      Row Total - subscriptions__events.delta: "#3D52B9"
    series_labels:
      Row Total - subscriptions__events.delta: Net Paid Subscriptions
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
    - stage_1_completed_login
    - stage_2_returned_from_login
    - stage_3_paid_for_subscription
    - stage_4_registered_device
    - stage_5_protected
    fill_fields:
    - funnel_fxa_login_to_protected.start_date
    filters:
      funnel_fxa_login_to_protected.start_date: after 2020/05/01
    sorts:
    - funnel_fxa_login_to_protected.start_date desc
    limit: 500
    dynamic_fields:
    - measure: stage_1_completed_login
      based_on: funnel_fxa_login_to_protected.count
      filters: {funnel_fxa_login_to_protected.completed_login: "yes"}
    - measure: stage_2_returned_from_login
      based_on: funnel_fxa_login_to_protected.count
      filters: {funnel_fxa_login_to_protected.returned_from_login: "yes"}
    - measure: stage_3_paid_for_subscription
      based_on: funnel_fxa_login_to_protected.count
      filters: {funnel_fxa_login_to_protected.paid_for_subscription: "yes"}
    - measure: stage_4_registered_device
      based_on: funnel_fxa_login_to_protected.count
      filters: {funnel_fxa_login_to_protected.registered_device: "yes"}
    - measure: stage_5_protected
      based_on: funnel_fxa_login_to_protected.count
      filters: {funnel_fxa_login_to_protected.protected: "yes"}
    - table_calculation: stage_1_completed_login_percent
      label: Stage 1 Completed Login % of Total
      expression: "${stage_1_completed_login}/${funnel_fxa_login_to_protected.count}"
      value_format: "0.00%"
    - table_calculation: stage_2_returned_from_login_percent
      label: Stage 2 Returned from Login % of Total
      expression: "${stage_2_returned_from_login}/${funnel_fxa_login_to_protected.count}"
      value_format: "0.00%"
    - table_calculation: stage_3_paid_for_subscription_percent
      label: Stage 3 Paid for Subscription % of Total
      expression: "${stage_3_paid_for_subscription}/${funnel_fxa_login_to_protected.count}"
      value_format: "0.00%"
    - table_calculation: stage_4_registered_device_percent
      label: Stage 4 Registered Device % of Total
      expression: "${stage_4_registered_device}/${funnel_fxa_login_to_protected.count}"
      value_format: "0.00%"
    - table_calculation: stage_5_protected_percent
      label: Stage 5 Protected by Product % of Total
      expression: "${stage_5_protected}/${funnel_fxa_login_to_protected.count}"
      value_format: "0.00%"
    y_axes:
    - label: ""
      orientation: left
      series:
      - axisId: stage_1_completed_login_percent
        id: stage_1_completed_login_percent
      - axisId: stage_2_returned_from_login_percent
        id: stage_2_returned_from_login_percent
      - axisId: stage_3_paid_for_subscription_percent
        id: stage_3_paid_for_subscription_percent
      - axisId: stage_4_registered_device_percent
        id: stage_4_registered_device_percent
      - axisId: stage_5_protected_percent
        id: stage_5_protected_percent
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
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    defaults_version: 1
    hidden_fields:
    - stage_1_completed_login
    - stage_2_returned_from_login
    - stage_3_paid_for_subscription
    - stage_4_registered_device
    - stage_5_protected
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
    - subscriptions__events.event_date
    - subscriptions__events.delta
    - subscriptions__events.granular_type
    pivots:
    - subscriptions__events.granular_type
    fill_fields:
    - subscriptions__events.event_date
    sorts:
    - subscriptions__events.event_date desc
    - subscriptions__events.granular_type
    limit: 500
    row_total: right
    color_application: *color_application
    series_colors:
      New - subscriptions__events.delta: "#08B248"
      Resurrected - subscriptions__events.delta: "#C9DC10"
      Cancelled by Customer - subscriptions__events.delta: "#FC2E31"
      Cancelled by IAP - subscriptions__events.delta: "#FA2F90"
      Payment Failed = subscriptions__events.delta: "#FA9200"
      Row Total - subscriptions__events.delta: "#3D52B9"
    series_labels:
      Row Total - subscriptions__events.delta: Net Paid Subscriptions
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
    - subscriptions__events.event_date
    - subscriptions__events.delta
    - subscriptions.attribution_category
    pivots:
    - subscriptions.attribution_category
    fill_fields:
    - subscriptions__events.event_date
    filters:
      subscriptions__events.type: New
    sorts:
    - subscriptions__events.event_date
    - subscriptions.attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${subscriptions__events.delta}, -27, 28))
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
    - subscriptions__events.event_date
    - subscriptions__events.delta
    - subscriptions.coarse_attribution_category
    pivots:
    - subscriptions.coarse_attribution_category
    fill_fields:
    - subscriptions__events.event_date
    filters:
      subscriptions__events.type: New
    sorts:
    - subscriptions__events.event_date
    - subscriptions.coarse_attribution_category
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: 28_day_sum
      label: 28-day Sum
      expression: sum(offset_list(${subscriptions__events.delta}, -27, 28))
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
    - subscriptions__active.active_date
    - subscriptions.attribution_category
    pivots:
    - subscriptions.attribution_category
    fill_fields:
    - subscriptions__active.active_date
    sorts:
    - subscriptions__active.active_date desc
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
    - subscriptions__active.active_date
    - subscriptions.count
    - devices.count
    fill_fields:
    - subscriptions__active.active_date
    sorts:
    - subscriptions__active.active_date desc
    dynamic_fields:
    - table_calculation: average_devices_per_user
      label: Average Devices per User
      expression: "${devices.count}/${subscriptions.count}"
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
    - subscriptions__retention.retention_type
    - retention_period_end_7_day_aggregate.aggregate_date
    - subscriptions.count
    - subscriptions__retention.retained
    pivots:
    - subscriptions__retention.retention_type
    fill_fields:
    - retention_period_end_7_day_aggregate.aggregate_date
    sorts:
    - retention_period_end_7_day_aggregate.aggregate_date desc
    - subscriptions__retention.retention_type
    limit: 500
    dynamic_fields:
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
    color_application: *color_application
    series_colors:
      first month - retention_rate: "#FC2E31"
      subsequent months - retention_rate: "#3D52B9"
    defaults_version: 1
    hidden_fields:
    - subscriptions.count
    - subscriptions__retention.retained
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
    - subscriptions__events.delta
    - subscriptions__events.event_month
    fill_fields:
    - subscriptions__events.event_month
    filters:
      subscriptions__events.type: New
    sorts:
    - subscriptions__events.event_month desc
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
