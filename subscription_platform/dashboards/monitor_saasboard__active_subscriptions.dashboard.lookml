---
- dashboard: monitor_saasboard__active_subscriptions
  title: Monitor SaaSboard - Active Subscriptions
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kbZLX0RzUz7eacP24o7ZIo
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px;">

      <nav style="font-size: 20px;">

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold; text-decoration: underline;">
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

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__revenue" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
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
    body_text: |-
      <div style='background-color: #ffffdd; padding: 5px 10px; border: solid 3px #ededed; border-radius: 5px; height:160px'>

      This dashboard captures the current state and trend of <strong>active subscriptions</strong>.

      <ul>
        <li>Active subscriptions are subscriptions that are receiving active service at a moment in time.</li>

      </ul>
      <br>

      </div>
    row: 2
    col: 0
    width: 16
    height: 4
  - title: Most Recent Data
    name: Most Recent Data
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: single_value
    fields: [daily_active_logical_subscriptions.date_date]
    filters:
      daily_active_logical_subscriptions.date_date: 1 month
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
    col: 16
    width: 8
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions</b></h3>

      </div>
    row: 6
    col: 0
    width: 24
    height: 2
  - title: Active Subscriptions
    name: Active Subscriptions
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: single_value
    fields: [daily_active_logical_subscriptions.date_date, daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 8
    col: 0
    width: 8
    height: 8
  - title: Daily Active Subscriptions
    name: Daily Active Subscriptions
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_line
    fields: [daily_active_logical_subscriptions.date_date, daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 8
    col: 8
    width: 16
    height: 8
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan</b></h3>

      </div>
    row: 16
    col: 0
    width: 24
    height: 2
  - title: Active Subscriptions by Plan
    name: Active Subscriptions by Plan
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_pie
    fields: [daily_active_logical_subscriptions.date_date, daily_active_logical_subscriptions.subscription__plan_summary,
      daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc, daily_active_logical_subscriptions.logical_subscription_count
        desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${daily_active_logical_subscriptions.date_date} = index(${daily_active_logical_subscriptions.date_date},\
        \ 1)"
      label: Is Latest Date
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: is_latest_date
      _type_hint: yesno
    value_labels: labels
    label_type: labPer
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [is_latest_date, daily_active_logical_subscriptions.date_date]
    hidden_points_if_no: [is_latest_date]
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 18
    col: 0
    width: 12
    height: 8
  - title: Monthly Active Subscriptions by Plan
    name: Monthly Active Subscriptions by Plan
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.logical_subscription_count,
      monthly_active_logical_subscriptions.subscription__plan_summary]
    pivots: [monthly_active_logical_subscriptions.subscription__plan_summary]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, monthly_active_logical_subscriptions.subscription__plan_summary]
    limit: 5000
    column_limit: 100
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Active Date: monthly_active_logical_subscriptions.month_month
    row: 18
    col: 12
    width: 12
    height: 8
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan Interval</b></h3>

      </div>
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Active Subscriptions by Plan Interval
    name: Active Subscriptions by Plan Interval
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_pie
    fields: [daily_active_logical_subscriptions.date_date, daily_active_logical_subscriptions.subscription__plan_interval,
      daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc, daily_active_logical_subscriptions.logical_subscription_count
        desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${daily_active_logical_subscriptions.date_date} = index(${daily_active_logical_subscriptions.date_date},\
        \ 1)"
      label: Is Latest Date
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: is_latest_date
      _type_hint: yesno
    value_labels: labels
    label_type: labPer
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [daily_active_logical_subscriptions.date_date]
    hidden_points_if_no: [is_latest_date]
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 28
    col: 0
    width: 12
    height: 8
  - title: Monthly Active Subscriptions by Plan Interval
    name: Monthly Active Subscriptions by Plan Interval
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.logical_subscription_count,
      monthly_active_logical_subscriptions.subscription__plan_interval]
    pivots: [monthly_active_logical_subscriptions.subscription__plan_interval]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, monthly_active_logical_subscriptions.subscription__plan_interval]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Active Date: monthly_active_logical_subscriptions.month_month
    row: 28
    col: 12
    width: 12
    height: 8
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Payment Provider</b></h3>

      </div>
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Active Subscriptions by Payment Provider
    name: Active Subscriptions by Payment Provider
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_pie
    fields: [daily_active_logical_subscriptions.date_date, daily_active_logical_subscriptions.subscription__payment_provider,
      daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc, daily_active_logical_subscriptions.logical_subscription_count
        desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${daily_active_logical_subscriptions.date_date} = index(${daily_active_logical_subscriptions.date_date},\
        \ 1)"
      label: Is Latest Date
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: is_latest_date
      _type_hint: yesno
    value_labels: labels
    label_type: labPer
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_fields: [daily_active_logical_subscriptions.date_date]
    hidden_points_if_no: [is_latest_date]
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 38
    col: 0
    width: 12
    height: 8
  - title: Monthly Active Subscriptions by Payment Provider
    name: Monthly Active Subscriptions by Payment Provider
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.logical_subscription_count,
      monthly_active_logical_subscriptions.subscription__payment_provider]
    pivots: [monthly_active_logical_subscriptions.subscription__payment_provider]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, monthly_active_logical_subscriptions.subscription__payment_provider]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Active Date: monthly_active_logical_subscriptions.month_month
    row: 38
    col: 12
    width: 12
    height: 8
  - name: " (7)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Country</b></h3>

      </div>
    row: 46
    col: 0
    width: 24
    height: 2
  - title: Active Subscriptions by Country
    name: Active Subscriptions by Country
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_pie
    fields: [daily_active_logical_subscriptions.date_date, countries.name, daily_active_logical_subscriptions.logical_subscription_count]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc, daily_active_logical_subscriptions.logical_subscription_count
        desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${daily_active_logical_subscriptions.date_date} = index(${daily_active_logical_subscriptions.date_date},\
        \ 1)"
      label: Is Latest Date
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: is_latest_date
      _type_hint: yesno
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_active_logical_subscriptions.logical_subscription_count,
            id: daily_active_logical_subscriptions.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    hidden_points_if_no: [is_latest_date]
    hidden_fields: [daily_active_logical_subscriptions.date_date]
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Active Date: daily_active_logical_subscriptions.date_date
    row: 48
    col: 0
    width: 12
    height: 7
  - title: Monthly Active Subscriptions by Country
    name: Monthly Active Subscriptions by Country
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.logical_subscription_count,
      countries.name]
    pivots: [countries.name]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_end: 'Yes'
    sorts: [monthly_active_logical_subscriptions.month_month desc, countries.name]
    limit: 5000
    column_limit: 100
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Country: countries.name
      Region: countries.region_name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
      Payment Provider: monthly_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: monthly_active_logical_subscriptions.subscription__plan_interval
      Plan: monthly_active_logical_subscriptions.subscription__plan_summary
      Active Date: monthly_active_logical_subscriptions.month_month
    row: 48
    col: 12
    width: 12
    height: 7
  filters:
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: after 2024-02-01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    listens_to_filters: []
    field: daily_active_logical_subscriptions.date_date
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: [Service ID, Active Date]
    field: daily_active_logical_subscriptions.subscription__payment_provider
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: [Service ID, Active Date]
    field: daily_active_logical_subscriptions.subscription__plan_interval
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: [Service ID, Active Date, Plan Interval]
    field: daily_active_logical_subscriptions.subscription__plan_summary
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: [Service ID, Active Date]
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: [Region, Service ID, Active Date]
    field: countries.name
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: []
    field: current_subscription_state.has_fraudulent_charges
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: []
    field: current_subscription_state.has_refunds
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
    explore: daily_active_logical_subscriptions
    listens_to_filters: []
    field: subscription_services.id
