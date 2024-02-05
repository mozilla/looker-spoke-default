---
- dashboard: monitor_saasboard__retention
  title: Monitor SaaSboard - Retention
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 4OLpCAQsglh1d434LNOjP5
  filters:
  - name: Subscription Start Date
    title: Subscription Start Date
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: subscription_platform
    explore: logical_subscriptions
    listens_to_filters: []
    field: logical_subscriptions.started_at_date
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
    explore: logical_subscriptions
    listens_to_filters: [Subscription Start Date, Service ID]
    field: logical_subscriptions.payment_provider
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
    explore: logical_subscriptions
    listens_to_filters: [Service ID]
    field: logical_subscriptions.plan_interval
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
    explore: logical_subscriptions
    listens_to_filters: [Plan Interval, Service ID]
    field: logical_subscriptions.plan_summary
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
    explore: logical_subscriptions
    listens_to_filters: [Subscription Start Date, Service ID]
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
    explore: logical_subscriptions
    listens_to_filters: [Region, Subscription Start Date, Service ID]
    field: countries.name
  - name: Has Refunds (Yes / No)
    title: Has Refunds (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: subscription_platform
    explore: logical_subscriptions
    listens_to_filters: []
    field: logical_subscriptions.has_refunds
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
    explore: logical_subscriptions
    listens_to_filters: []
    field: logical_subscriptions.has_fraudulent_charges
  - name: Service ID
    title: Service ID
    type: field_filter
    default_value: Monitor
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: overflow
      options:
      - Monitor
    model: subscription_platform
    explore: logical_subscriptions
    listens_to_filters: []
    field: subscription_services.id
  elements:
  - name: Navbar
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px;">

      <nav style="font-size: 20px;">

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__active_subscriptions" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Active Subscriptions
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__subscriptions_growth" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Subscriptions Growth
        </a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold;">
          Retention
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__churn" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Churn
        </a>

        <!--<a href="" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Revenue
        </a>-->

        <!--<a href="" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Docs
        </a>-->

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Notes
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style='background-color: #ffffdd; padding: 5px 10px; border: solid 3px #ededed; border-radius: 5px; height:160px'>

      This dashboard captures the current state and trend of <strong>subscription retention</strong>.

      <ul>
        <li>Retention rate is the percentage of active subscriptions out of all subscriptions.</li>
        <li>A cohort refers to a group of subscriptions that started in a particular month. For example, cohort 2024-02 includes all subscriptions that started in the month of February 2024.</li>
      </ul>
      <br>

      </div>
    row: 3
    col: 0
    width: 16
    height: 4
  - title: Most Recent Data
    name: Most Recent Data
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: single_value
    fields: [daily_active_logical_subscriptions.date_date]
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
    row: 3
    col: 16
    width: 8
    height: 4
  - name: Retention Rate heading
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention Rate</b></h3>

      </div>
    row: 7
    col: 0
    width: 24
    height: 2
  - title: Retention by Subscription Month Number
    name: Retention by Subscription Month Number
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_column
    fields: [retention_by_month.subscription_month_number, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count]
    filters: {}
    sorts: [retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: retention_rate
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_by_month.retained_subscription_count,
            id: retention_by_month.retained_subscription_count, name: Retained Subscription
              Count}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: retention_rate, id: retention_rate, name: Retention Rate}], showLabels: true,
        showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      retention_rate: line
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#0060E0"
      retention_rate: "#080808"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 9
    col: 0
    width: 12
    height: 9
  - title: Retention by Cohort
    name: Retention by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_column
    fields: [retention_by_month.retained_subscription_count, logical_subscriptions.started_at_month,
      logical_subscriptions.logical_subscription_count]
    filters: {}
    sorts: [logical_subscriptions.started_at_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: retention_rate
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_by_month.retained_subscription_count,
            id: retention_by_month.retained_subscription_count, name: Retained Subscription
              Count}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: retention_rate, id: retention_rate, name: Retention Rate}], showLabels: true,
        showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      retention_rate: line
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#0060E0"
      retention_rate: "#000000"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 9
    col: 12
    width: 12
    height: 9
  - name: Retention by Plan Interval heading
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention by Plan Interval</b></h3>

      </div>
    row: 18
    col: 0
    width: 24
    height: 2
  - title: Retention by Plan Interval
    name: Retention by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [retention_by_month.subscription_month_number, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, logical_subscriptions.plan_interval]
    pivots: [logical_subscriptions.plan_interval]
    filters: {}
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: retention_rate
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 1
              month - retention_rate, name: 1 month}, {axisId: retention_rate, id: 1
              year - retention_rate, name: 1 year}], showLabels: true, showValues: true,
        valueFormat: 0%, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_by_month.retained_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 20
    col: 0
    width: 24
    height: 6
  - title: Retention Rates by Plan Interval
    name: Retention Rates by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [retention_by_month.subscription_month_number, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, logical_subscriptions.plan_interval,
      logical_subscriptions.plan_interval_months]
    pivots: [retention_by_month.subscription_month_number]
    filters: {}
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval_months]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 0f658052-1e2b-a73a-2781-4709abe9c8ab, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#0060E0", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    series_value_format:
      retention_rate:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: churn_percentage, id: churn_percentage, name: Churn Percentage}],
        showLabels: true, showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_by_month.retained_subscription_count,
      logical_subscriptions.plan_interval_months]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 26
    col: 0
    width: 24
    height: 3
  - title: Retention Counts by Plan Interval
    name: Retention Counts by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [retention_by_month.subscription_month_number, retention_by_month.retained_subscription_count,
      logical_subscriptions.plan_interval, logical_subscriptions.plan_interval_months]
    pivots: [retention_by_month.subscription_month_number]
    filters: {}
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval_months]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      retention_by_month.retained_subscription_count:
        is_active: false
        palette:
          palette_id: mozilla-diverging-0
          collection_id: mozilla
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: e1a5fe84-7c35-66f1-5c18-bfca571b6593, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#0060E0", offset: 100}]},
          options: {steps: 100, stepped: true, mirror: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: along a scale..., value: !!null '',
        background_color: !!null '', font_color: !!null '', color_application: {collection_id: mozilla,
          palette_id: mozilla-diverging-0}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: churn_percentage, id: churn_percentage, name: Churn Percentage}],
        showLabels: true, showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.plan_interval_months]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 29
    col: 0
    width: 24
    height: 3
  - name: Retention Rate by Cohort heading
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention Rate by Cohort</b></h3>

      </div>
    row: 32
    col: 0
    width: 24
    height: 2
  - title: Subscription Month Number Retention Rate by Cohort
    name: Subscription Month Number Retention Rate by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [logical_subscriptions.started_at_month, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    fill_fields: [logical_subscriptions.started_at_month]
    filters: {}
    sorts: [logical_subscriptions.started_at_month, retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: retention_rate
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 1
              - retention_rate, name: '1'}, {axisId: retention_rate, id: 2 - retention_rate,
            name: '2'}, {axisId: retention_rate, id: 3 - retention_rate, name: '3'},
          {axisId: retention_rate, id: 4 - retention_rate, name: '4'}, {axisId: retention_rate,
            id: 5 - retention_rate, name: '5'}, {axisId: retention_rate, id: 6 - retention_rate,
            name: '6'}], showLabels: true, showValues: true, valueFormat: 0%, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    x_axis_datetime_label: "%Y-%m"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_by_month.retained_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 34
    col: 0
    width: 12
    height: 8
  - title: Cohort Retention Rate by Subscription Month Number
    name: Cohort Retention Rate by Subscription Month Number
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [logical_subscriptions.started_at_month, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, retention_by_month.subscription_month_number]
    pivots: [logical_subscriptions.started_at_month]
    fill_fields: [logical_subscriptions.started_at_month]
    filters: {}
    sorts: [logical_subscriptions.started_at_month, retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: retention_rate
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2023-08
              - retention_rate, name: 2023-08}, {axisId: retention_rate, id: 2023-09
              - retention_rate, name: 2023-09}, {axisId: retention_rate, id: 2023-10
              - retention_rate, name: 2023-10}, {axisId: retention_rate, id: 2023-11
              - retention_rate, name: 2023-11}, {axisId: retention_rate, id: 2023-12
              - retention_rate, name: 2023-12}, {axisId: retention_rate, id: 2024-01
              - retention_rate, name: 2024-01}], showLabels: true, showValues: true,
        valueFormat: 0%, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_by_month.retained_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 34
    col: 12
    width: 12
    height: 8
  - title: Retention Rate Table by Cohort
    name: Retention Rate Table by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [logical_subscriptions.started_at_month, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    filters: {}
    sorts: [logical_subscriptions.started_at_month, retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 6e202dea-4711-4f97-d43b-bc07da472d7c, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#0060E0", offset: 100}]},
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    series_value_format:
      retention_rate:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: churn_percentage, id: churn_percentage, name: Churn Percentage}],
        showLabels: true, showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle_outline
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_by_month.retained_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 42
    col: 0
    width: 24
    height: 5
  - title: Retention Counts Table by Cohort
    name: Retention Counts Table by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [logical_subscriptions.started_at_month, retention_by_month.retained_subscription_count,
      logical_subscriptions.logical_subscription_count, retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    fill_fields: [logical_subscriptions.started_at_month]
    filters: {}
    sorts: [logical_subscriptions.started_at_month, retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.retained_subscription_count} / ${logical_subscriptions.logical_subscription_count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      retention_by_month.retained_subscription_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 5fb21dfb-e30d-02cb-7cef-9d2b3613492b, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#0060E0", offset: 100}]},
          options: {steps: 5, stepped: true}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: churn_percentage, id: churn_percentage, name: Churn Percentage}],
        showLabels: true, showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle_outline
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      retention_by_month.retained_subscription_count: "#005E5D"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.logical_subscription_count, retention_rate]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Payment Provider: logical_subscriptions.payment_provider
      Region: countries.region_name
      Country: countries.name
      Service ID: subscription_services.id
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
    row: 47
    col: 0
    width: 24
    height: 6
