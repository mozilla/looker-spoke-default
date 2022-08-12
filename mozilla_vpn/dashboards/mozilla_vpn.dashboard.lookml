- dashboard: mozilla_vpn
  title: Mozilla VPN - DEPRECATED
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
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Source: subscriptions.normalized_source
      Medium: subscriptions.normalized_medium
      Campaign: subscriptions.normalized_campaign
      Content: subscriptions.normalized_content
      Acquisition Channel: subscriptions.normalized_acquisition_channel
      Website Channel Group: subscriptions.website_channel_group
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
  - title: Churn Rate 7-day Average
    name: Churn Rate 7-day Average
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields:
    - subscriptions__retention.period_start_date
    - churn_type
    - previously_retained
    - churned
    filters:
      subscriptions__retention.period_start_date: after 2020/07/01
    pivots:
    - churn_type
    fill_fields:
    - subscriptions__retention.period_start_date
    sorts:
    - subscriptions__retention.period_start_date
    - churn_type
    dynamic_fields:
    - dimension: churn_type
      label: Churn Type
      expression: 'if(${subscriptions__retention.months_since_subscription_start} = 1, "first month", "subsequent months")'
    - measure: previously_retained
      label: Previously Retained
      based_on: subscriptions__retention.count
      filter_expression: |-
        ${subscriptions__retention.months_since_subscription_start} <= ${subscriptions.months_retained}
        OR ${subscriptions__retention.months_since_subscription_start} = ${subscriptions.months_retained} + 1
    - measure: churned
      label: Churned
      based_on: subscriptions__retention.count
      filter_expression: |-
        ${subscriptions__retention.months_since_subscription_start} = ${subscriptions.months_retained} + 1
    - table_calculation: churn_rate_7_day_average
      label: Churn Rate 7-day Average
      expression: |-
        sum(offset_list(${churned}, -6, 7)) / sum(offset_list(${previously_retained}, -6, 7))
    show_null_points: false
    color_application: *color_application
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 6
    series_colors:
      first month - churn_rate_7_day_average: "#FC2E31"
      subsequent months - churn_rate_7_day_average: "#3D52B9"
    discontinuous_nulls: true
    defaults_version: 1
    hidden_fields:
    - previously_retained
    - churned
    listen: *listen
    row: 45
    col: 0
    width: 12
    height: 9
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
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
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.website_channel_group
