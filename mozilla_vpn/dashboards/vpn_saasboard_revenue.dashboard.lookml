- dashboard: vpn_saasboard__revenue
  title: VPN SaaSboard - Revenue
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: PvDUYmlVKFey6B01C3uKZu
  elements:
  - title: Month Over Month Growth Rate
    name: Month Over Month Growth Rate
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_line
    fields: [active_subscriptions.active_month, active_subscriptions.count_sum, active_subscriptions.annual_recurring_revenue,
      active_subscriptions.monthly_recurring_revenue]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: "${active_subscriptions.count_sum} / offset(${active_subscriptions.count_sum},\
        \ -1) -1"
      label: Active Subscriptions
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: active_subscriptions
      _type_hint: number
    - category: table_calculation
      expression: "${active_subscriptions.annual_recurring_revenue} / offset(${active_subscriptions.annual_recurring_revenue},\
        \ -1) -1"
      label: Annual Recurring Revenue
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: annual_recurring_revenue_1
      _type_hint: number
    - category: table_calculation
      expression: "${active_subscriptions.monthly_recurring_revenue} / offset(${active_subscriptions.monthly_recurring_revenue},\
        \ -1) -1"
      label: Monthly Recurring Revenue
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: monthly_recurring_revenue
      _type_hint: number
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
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 33
    col: 12
    width: 12
    height: 9
  - name: ''
    type: text
    title_text: ''
    body_text: <img src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg"
      style="width:160px;height:50px;">
    row: 2
    col: 0
    width: 3
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<p style='background-color: #ffffdd; padding: 5px 10px; border: solid\
      \ 3px #ededed; border-radius: 5px; height:150px'>\n\nThis dashboard captures\
      \ <strong>revenue</strong> for each active subscription.  Note that revenue\
      \ calculations in this dashboard do not follow the recognized revenue accounting\
      \ method (eg. recognizing revenue for 6 month plans over 7 months.)\n<br>\n\
      <br>\nRevenue from Apple Store is inflated because VAT rates and exchange rates\
      \ were not considered.\n<br>\n<br>\n<br>\n<br>\nPlease submit any questions\
      \ in  <b><a href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\">mozilla-vpn-data</a></b>\
      \ channel on Slack. \n\n</p>"
    row: 2
    col: 3
    width: 15
    height: 4
  - title: Annual Recurring Revenue (By Country)
    name: Annual Recurring Revenue (By Country)
    model: mozilla_vpn
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
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 24
    col: 0
    width: 12
    height: 9
  - title: Annual Recurring Revenue (By Plan)
    name: Annual Recurring Revenue (By Plan)
    model: mozilla_vpn
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
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 24
    col: 12
    width: 12
    height: 9
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/412">

       Active Subs</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/416">

       Subs Growth</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/414">Retention</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/413">Churn</a>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/433">Revenue</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [metadata.last_modified_date]
    fill_fields: [metadata.last_modified_date]
    sorts: [metadata.last_modified_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: add_days(-1, ${metadata.last_modified_date})
      label: New Calculation
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: new_calculation
      _type_hint: date
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
    listen:
      Plan ID: active_subscriptions.plan_id
    row: 2
    col: 18
    width: 6
    height: 4
  - title: Monthly Recurring Revenue (By Country)
    name: Monthly Recurring Revenue (By Country)
    model: mozilla_vpn
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
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 15
    col: 0
    width: 12
    height: 9
  - title: Monthly Recurring Revenue (By Plan)
    name: Monthly Recurring Revenue (By Plan)
    model: mozilla_vpn
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
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 15
    col: 12
    width: 12
    height: 9
  - title: Monthly Recurring Revenue and Average Revenue Per Unit
    name: Monthly Recurring Revenue and Average Revenue Per Unit
    model: mozilla_vpn
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
    dynamic_fields:
    - category: table_calculation
      expression: "${active_subscriptions.monthly_recurring_revenue}/${active_subscriptions.count_sum}"
      label: ARPU(MRR/EoM Active subs)
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: arpumrreom_active_subs
      _type_hint: number
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
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: ARPU in$, orientation: right, series: [{axisId: arpumrreom_active_subs,
            id: arpumrreom_active_subs, name: ARPU(MRR/EoM Active subs)}], showLabels: true,
        showValues: true, valueFormat: "$0.0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: 13px
    label_value_format: $#, "K"
    series_types:
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
    hidden_fields: [active_subscriptions.count_sum]
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Interval Type: active_subscriptions.plan_interval_type
      Plan ID: active_subscriptions.plan_id
    row: 6
    col: 0
    width: 24
    height: 9
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Country, Pricing Plan]
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
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Country, Provider]
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
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Pricing Plan, Provider]
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
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.active_date
  - name: Plan Interval Type
    title: Plan Interval Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Active Date, Country, Pricing Plan, Provider]
    field: active_subscriptions.plan_interval_type
  - name: Plan ID
    title: Plan ID
    type: field_filter
    default_value: -"price_1MzNRCJNcmPzuWtRMCwUWADu"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: overflow
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.plan_id
