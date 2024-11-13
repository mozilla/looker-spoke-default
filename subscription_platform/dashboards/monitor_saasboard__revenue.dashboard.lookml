- dashboard: monitor_saasboard__revenue
  title: Monitor SaaSboard - Revenue
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3DytEe8WoL7g9nrSccwTfT
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px;">

      <nav style="font-size: 20px;">

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__active_subscriptions" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Active Subscriptions
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__subscriptions_growth" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Subscriptions Growth
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__retention" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Retention
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__churn" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Churn
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__revenue" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold; text-decoration: underline;">
          Revenue
        </a>

        <!--<a href="" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Docs
        </a>-->

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style='background-color: #ffffdd; padding: 5px 10px; border:\
      \ solid 3px #ededed; border-radius: 5px; height:160px'>\n\nThis dashboard captures\
      \ <strong>projected revenue</strong> for each active subscription.\n\n<ul>\n<li>\nRevenue\
      \ is not counted for subscriptions that have auto-renew turned off. \n</li>\n\
      <li>\nDiscounts and coupons are also currently not considered.\n</li>\n</ul>\n\
      <br>\n\n</div>"
    row: 2
    col: 0
    width: 15
    height: 4
  - title: Most Recent Data
    name: Most Recent Data
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: single_value
    fields: [daily_active_logical_subscriptions.date_date]
    filters:
      daily_active_logical_subscriptions.date_date: 1 months
    sorts: [daily_active_logical_subscriptions.date_date desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen: {}
    row: 2
    col: 15
    width: 9
    height: 4
  - title: Annual Recurring Revenue
    name: Annual Recurring Revenue
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
      monthly_active_logical_subscriptions.logical_subscription_count]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd}\
        \ / ${monthly_active_logical_subscriptions.logical_subscription_count}"
      label: ARPU (ARR/Active Subs)
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: arpu_arractive_subs
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
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: "$ in thousands", orientation: left, series: [{axisId: monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Total Annual Recurring Revenue (USD)}], showLabels: true, showValues: true,
        valueFormat: '$#, "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: ARPU in $, orientation: right, series: [{axisId: arpu_arractive_subs,
            id: arpu_arractive_subs, name: ARPU (ARR/Active Subs)}], showLabels: true,
        showValues: true, valueFormat: "$0.0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#, "K"
    series_types:
      arpu_arractive_subs: line
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [monthly_active_logical_subscriptions.logical_subscription_count,
      arpu_arractive_subs]
    listen:
      Active Date: monthly_active_logical_subscriptions.month_month
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Service ID: subscription_services.id
    row: 6
    col: 0
    width: 12
    height: 8
  - title: Average Revenue Per Unit
    name: Average Revenue Per Unit
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
      monthly_active_logical_subscriptions.logical_subscription_count]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd}\
        \ / ${monthly_active_logical_subscriptions.logical_subscription_count}"
      label: ARPU (ARR/Active Subs)
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      table_calculation: arpu_arractive_subs
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: ARPU in $, orientation: left, series: [{axisId: arpu_arractive_subs,
            id: arpu_arractive_subs, name: ARPU (ARR/Active Subs)}], showLabels: true,
        showValues: true, valueFormat: "$0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: "$0"
    series_types:
      arpu_arractive_subs: line
    series_colors:
      monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd: "#FF7139"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [monthly_active_logical_subscriptions.logical_subscription_count,
      monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd]
    note_state: collapsed
    note_display: hover
    note_text: ARPU = ARR / Active Subscriptions
    listen:
      Active Date: monthly_active_logical_subscriptions.month_month
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Service ID: subscription_services.id
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Annual Recurring Revenue by Country
    name: Annual Recurring Revenue by Country
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, countries.name, monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd]
    pivots: [countries.name]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, countries.name]
    limit: 500
    column_limit: 50
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
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: "$ in thousands", orientation: left, series: [{axisId: Canada
              - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: Canada - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Canada}, {axisId: Germany - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: Germany - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Germany}, {axisId: Romania - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: Romania - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Romania}, {axisId: Singapore - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: Singapore - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Singapore}, {axisId: Switzerland - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: Switzerland - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Switzerland}, {axisId: United Kingdom - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: United Kingdom - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: United Kingdom}, {axisId: United States - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: United States - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: United States}, {axisId: countries.name___null - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: countries.name___null - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: "∅"}], showLabels: true, showValues: true, valueFormat: '$#, "K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#, "K"
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Active Date: monthly_active_logical_subscriptions.month_month
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Service ID: subscription_services.id
    row: 14
    col: 0
    width: 12
    height: 8
  - title: Annual Recurring Revenue by Plan
    name: Annual Recurring Revenue by Plan
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
      monthly_active_logical_subscriptions.subscription__plan_summary]
    pivots: [monthly_active_logical_subscriptions.subscription__plan_summary]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, monthly_active_logical_subscriptions.subscription__plan_summary]
    limit: 500
    column_limit: 50
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
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: "$ in thousands", orientation: left, series: [{axisId: 1 month
              USD 13.99 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: 1 month USD 13.99 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: 1 month USD 13.99}, {axisId: 1 year USD 100.00 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: 1 year USD 100.00 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: 1 year USD 100.00}, {axisId: 1 year USD 107.88 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: 1 year USD 107.88 - monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: 1 year USD 107.88}], showLabels: true, showValues: true, valueFormat: '$#,
          "K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: $#, "K"
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Active Date: monthly_active_logical_subscriptions.month_month
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Service ID: subscription_services.id
    row: 14
    col: 12
    width: 12
    height: 8
  - title: Month Over Month Growth Rates
    name: Month Over Month Growth Rates
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_line
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
      monthly_active_logical_subscriptions.logical_subscription_count]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${monthly_active_logical_subscriptions.logical_subscription_count}\
        \ / offset(${monthly_active_logical_subscriptions.logical_subscription_count},\
        \ -1) -1"
      label: Active Subscriptions
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: active_subscriptions
      _type_hint: number
    - category: table_calculation
      expression: "${monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd}\
        \ / offset(${monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd},\
        \ -1) -1"
      label: Annual Recurring Revenue
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: annual_recurring_revenue
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            id: monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
            name: Total Annual Recurring Revenue (USD)}, {axisId: monthly_active_logical_subscriptions.logical_subscription_count,
            id: monthly_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: 0.0%
    series_colors: {}
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [monthly_active_logical_subscriptions.total_annual_recurring_revenue_usd,
      monthly_active_logical_subscriptions.logical_subscription_count]
    listen:
      Active Date: monthly_active_logical_subscriptions.month_month
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Service ID: subscription_services.id
    row: 22
    col: 0
    width: 12
    height: 7
  filters:
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: after 2024/02/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: []
    field: monthly_active_logical_subscriptions.month_month
  - name: Payment Provider
    title: Payment Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: [Active Date, Service ID]
    field: monthly_active_logical_subscriptions.subscription__payment_provider
  - name: Plan Interval
    title: Plan Interval
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: [Active Date, Service ID]
    field: monthly_active_logical_subscriptions.subscription__plan_interval
  - name: Plan
    title: Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: [Active Date, Service ID, Plan Interval]
    field: monthly_active_logical_subscriptions.subscription__plan_summary
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: [Active Date, Service ID]
    field: countries.region_name
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: [Active Date, Service ID, Region]
    field: countries.name
  - name: Has Refunds (Yes / No)
    title: Has Refunds (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: []
    field: current_subscription_state.has_refunds
  - name: Has Fraudulent Charges (Yes / No)
    title: Has Fraudulent Charges (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: []
    field: current_subscription_state.has_fraudulent_charges
  - name: Service ID
    title: Service ID
    type: field_filter
    default_value: Monitor
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: overflow
      options:
      - Monitor
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    listens_to_filters: []
    field: subscription_services.id
