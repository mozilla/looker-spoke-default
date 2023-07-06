- dashboard: relay_saasboard__revenue
  title: Relay Saasboard - Revenue
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CQQUBUJlvWy9eF0ASbXwWX
  elements:
  - title: Month Over Month Growth Rate
    name: Month Over Month Growth Rate
    model: relay
    explore: active_subscriptions
    type: looker_line
    fields: [active_subscriptions.active_month, active_subscriptions.count_sum, active_subscriptions.annual_recurring_revenue,
      active_subscriptions.monthly_recurring_revenue]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${active_subscriptions.count_sum}\
          \ / offset(${active_subscriptions.count_sum}, -1) -1", label: Active Subscriptions,
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: active_subscriptions, _type_hint: number}, {category: table_calculation,
        expression: "${active_subscriptions.annual_recurring_revenue} / offset(${active_subscriptions.annual_recurring_revenue},\
          \ -1) -1", label: Annual Recurring Revenue, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: annual_recurring_revenue_1, _type_hint: number},
      {category: table_calculation, expression: "${active_subscriptions.monthly_recurring_revenue}\
          \ / offset(${active_subscriptions.monthly_recurring_revenue}, -1) -1", label: Monthly
          Recurring Revenue, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: monthly_recurring_revenue, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: active_subscribers,
            id: active_subscribers, name: Active Subscribers}, {axisId: arr, id: arr,
            name: ARR}], showLabels: true, showValues: true, maxValue: 0.45, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    font_size: ''
    label_value_format: 0.0%
    series_types: {}
    series_colors:
      new_calculation: "#0060E0"
      active_subscribers: "#0060E0"
      arr: "#FF505F"
      active_subscriptions: "#0060E0"
      annual_recurring_revenue_1: "#ff3825"
      annual_recurring_revenue_chg: "#FF505F"
      active_subscriptions_chg: "#0060E0"
    x_axis_datetime_label: ''
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [active_subscriptions.count_sum, active_subscriptions.annual_recurring_revenue,
      active_subscriptions.monthly_recurring_revenue]
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 32
    col: 0
    width: 12
    height: 9
  - title: Annual Recurring Revenue (By Country)
    name: Annual Recurring Revenue (By Country)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.country_name,
      active_subscriptions.annual_recurring_revenue]
    pivots: [active_subscriptions.country_name]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.country_name
        desc]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    y_axes: [{label: "$ in millions", orientation: left, series: [{axisId: sum_of_revenue,
            id: sum_of_revenue, name: Sum of Revenue}], showLabels: true, showValues: true,
        valueFormat: "$0.00,,", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Month
    font_size: 13px
    label_value_format: "$0.00,,"
    series_types: {}
    series_colors:
      USA - active_subscriptions.annual_recurring_revenue: "#347be3"
    x_axis_datetime_label: ''
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 23
    col: 0
    width: 12
    height: 9
  - title: Annual Recurring Revenue (By Plan)
    name: Annual Recurring Revenue (By Plan)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.pricing_plan,
      active_subscriptions.annual_recurring_revenue]
    pivots: [active_subscriptions.pricing_plan]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.pricing_plan]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: "$ in millions", orientation: left, series: [{axisId: sum_of_revenue,
            id: sum_of_revenue, name: Sum of Revenue}], showLabels: true, showValues: true,
        valueFormat: "$0.00,,", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Month
    font_size: 13px
    label_value_format: "$0.00,,"
    series_types: {}
    series_colors:
      6-month-chf-47.94 - active_subscriptions.annual_recurring_revenue: "#82a6a8"
      1-month-usd-4.99 - active_subscriptions.annual_recurring_revenue: "#7363A9"
    x_axis_datetime_label: ''
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 23
    col: 12
    width: 12
    height: 9
  - title: New Tile
    name: New Tile
    model: relay
    explore: active_subscriptions
    type: single_value
    fields: [metadata.last_modified_date]
    fill_fields: [metadata.last_modified_date]
    sorts: [metadata.last_modified_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'add_days(-1, ${metadata.last_modified_date})',
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: new_calculation, _type_hint: date}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Data Last Updated
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#cdbfff",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
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
    note_state: collapsed
    note_display: below
    hidden_fields: [metadata.last_modified_date]
    listen: {}
    row: 1
    col: 18
    width: 6
    height: 4
  - title: Monthly Recurring Revenue (By Country)
    name: Monthly Recurring Revenue (By Country)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.country_name,
      active_subscriptions.monthly_recurring_revenue]
    pivots: [active_subscriptions.country_name]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.country_name
        desc]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    y_axes: [{label: "$ in millions", orientation: left, series: [{axisId: sum_of_revenue,
            id: sum_of_revenue, name: Sum of Revenue}], showLabels: true, showValues: true,
        valueFormat: "$0.00,,", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Month
    font_size: 13px
    label_value_format: "$0.00,,"
    series_types: {}
    series_colors:
      USA - active_subscriptions.annual_recurring_revenue: "#347be3"
    x_axis_datetime_label: ''
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 14
    col: 0
    width: 12
    height: 9
  - title: Monthly Recurring Revenue (By Plan)
    name: Monthly Recurring Revenue (By Plan)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.pricing_plan,
      active_subscriptions.monthly_recurring_revenue]
    pivots: [active_subscriptions.pricing_plan]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.pricing_plan]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: "$ in millions", orientation: left, series: [{axisId: sum_of_revenue,
            id: sum_of_revenue, name: Sum of Revenue}], showLabels: true, showValues: true,
        valueFormat: "$0.00,,", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Month
    font_size: 13px
    label_value_format: "$0.00,,"
    series_types: {}
    series_colors:
      6-month-chf-47.94 - active_subscriptions.annual_recurring_revenue: "#82a6a8"
      1-month-usd-4.99 - active_subscriptions.annual_recurring_revenue: "#7363A9"
    x_axis_datetime_label: ''
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 14
    col: 12
    width: 12
    height: 9
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"This
      dashboard captures "},{"text":"revenue","bold":true},{"text":" for each active
      subscription.  Note that revenue calculations in this dashboard do not follow
      the recognized revenue accounting method (eg. recognizing revenuefor 6 month
      plans over 7 months.)\n"}],"id":1672432889836}],"id":1672432948234}],"id":1672432948229},{"type":"p","id":1672432957634,"children":[{"text":"Please
      submit any questions to "},{"text":"@yeonjoo","bold":true},{"text":" in "},{"text":"#fx-private-relay
      ","bold":true},{"text":"channel on Slack. \n \n\n"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 1
    col: 0
    width: 18
    height: 4
  - type: button
    name: button_13661
    rich_content_json: '{"text":"Relay SaaSboard Documentation","description":"User
      guide/definitions of metrics/event logs that may have affected Relay data.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/document/d/1attwr_1afDim9v-h4eDbA5XL09yKZez-RddSO-A0P8U/edit?usp=sharing"}'
    row: 0
    col: 0
    width: 13
    height: 1
  - type: button
    name: button_13662
    rich_content_json: '{"text":"SaaSboard Explained","description":"This deck explains
      how the subscription data is recorded in databases and how metrics are counted
      to load in the SaaSBoard.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/presentation/d/1Y3lDe1IktTbF-Xaw8dmlcNgWMhRosyH3p9G6ITQBPhc/edit?usp=sharing"}'
    row: 0
    col: 13
    width: 11
    height: 1
  - title: Monthly Recurring Revenue(MRR) and Average Revenue Per Unit(ARPU)
    name: Monthly Recurring Revenue(MRR) and Average Revenue Per Unit(ARPU)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.monthly_recurring_revenue,
      active_subscriptions.count_sum]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: "% change from previous\
          \ month", value_format: !!null '', value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: change_from_previous_month, args: [active_subscriptions.monthly_recurring_revenue],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${active_subscriptions.monthly_recurring_revenue}/${active_subscriptions.count_sum}",
        label: ARPU(MRR/EoM Active subs), value_format: !!null '', value_format_name: decimal_1,
        _kind_hint: measure, table_calculation: arpumrreom_active_subs, _type_hint: number}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    y_axes: [{label: "$ in thousands", orientation: left, series: [{axisId: active_subscriptions.monthly_recurring_revenue,
            id: active_subscriptions.monthly_recurring_revenue, name: Monthly Recurring
              Revenue}], showLabels: true, showValues: true, valueFormat: '$#, "K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 34, type: linear},
      {label: ARPU in $, orientation: right, series: [{axisId: arpumrreom_active_subs,
            id: arpumrreom_active_subs, name: ARPU(MRR/EoM Active subs)}], showLabels: true,
        showValues: true, valueFormat: "$0.0", unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 13px
    label_value_format: $0.0, "K"
    series_types:
      percent_change_from_previous_active_subscriptions_monthly_recurring_revenue: line
      change_from_previous_month: line
      arpumrreom_active_subs: line
    series_colors:
      USA - active_subscriptions.annual_recurring_revenue: "#347be3"
    x_axis_datetime_label: ''
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    hidden_pivots: {}
    hidden_fields: [active_subscriptions.count_sum]
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 5
    col: 0
    width: 24
    height: 9
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Country, Pricing Plan]
    field: active_subscriptions.provider
  - name: Pricing Plan
    title: Pricing Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Country, Provider]
    field: active_subscriptions.pricing_plan
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Pricing Plan, Provider]
    field: active_subscriptions.country_name
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: relay
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.active_date
  - name: Plan Type
    title: Plan Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Active Date, Country, Pricing Plan, Provider]
    field: active_subscriptions.plan_type
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Mozilla VPN & Firefox Relay,Relay Premium
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.product_name
