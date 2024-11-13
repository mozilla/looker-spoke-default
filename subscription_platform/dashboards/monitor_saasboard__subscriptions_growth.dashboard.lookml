---
- dashboard: monitor_saasboard__subscriptions_growth
  title: Monitor SaaSboard - Subscriptions Growth
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: STOyQVJV1ejgsvmUcLxFFH
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px;">

      <nav style="font-size: 20px;">

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__active_subscriptions" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Active Subscriptions
        </a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold; text-decoration: underline;">
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

      This dashboard captures the current state and trend of <strong>new subscriptions</strong>.

      <ul>
        <li>New subscriptions are subscriptions that started on a particular date.</li>
        <li>New subscriptions do include trial subscriptions.</li>
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

      <h3><b>New Subscriptions</b></h3>

      </div>
    row: 6
    col: 0
    width: 24
    height: 2
  - title: New Subscriptions
    name: New Subscriptions
    model: subscription_platform
    explore: logical_subscription_events
    type: single_value
    fields: [logical_subscription_events.logical_subscription_count]
    filters:
      logical_subscription_events.type: Subscription Start
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
    single_value_title: ''
    value_format: ''
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 8
    col: 0
    width: 8
    height: 7
  - title: Daily New Subscriptions
    name: Daily New Subscriptions
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.timestamp_date]
    fill_fields: [logical_subscription_events.timestamp_date]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 8
    col: 8
    width: 16
    height: 7
  - title: Monthly New Subscriptions by Country
    name: Monthly New Subscriptions by Country
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, countries.name,
      logical_subscription_events.timestamp_month]
    pivots: [countries.name]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, countries.name]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 15
    col: 0
    width: 12
    height: 12
  - title: Monthly New Subscriptions by Plan Interval
    name: Monthly New Subscriptions by Plan Interval
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.subscription__plan_interval,
      logical_subscription_events.timestamp_month]
    pivots: [logical_subscription_events.subscription__plan_interval]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.subscription__plan_interval]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 15
    col: 12
    width: 12
    height: 6
  - title: Monthly New Subscriptions Proportions by Plan Interval
    name: Monthly New Subscriptions Proportions by Plan Interval
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_area
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.subscription__plan_interval,
      logical_subscription_events.timestamp_month]
    pivots: [logical_subscription_events.subscription__plan_interval]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.subscription__plan_interval]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 21
    col: 12
    width: 12
    height: 6
  - title: Monthly New Subscriptions by Payment Provider
    name: Monthly New Subscriptions by Payment Provider
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.subscription__payment_provider,
      logical_subscription_events.timestamp_month]
    pivots: [logical_subscription_events.subscription__payment_provider]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.subscription__payment_provider]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 27
    col: 0
    width: 12
    height: 10
  - title: Monthly New Subscriptions by Plan
    name: Monthly New Subscriptions by Plan
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.subscription__plan_summary,
      logical_subscription_events.timestamp_month]
    pivots: [logical_subscription_events.subscription__plan_summary]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.subscription__plan_summary]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 27
    col: 12
    width: 12
    height: 10
  - title: Monthly New Subscriptions by Type
    name: Monthly New Subscriptions by Type
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.reason,
      logical_subscription_events.timestamp_month]
    pivots: [logical_subscription_events.reason]
    filters:
      logical_subscription_events.type: Subscription Start
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.reason]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 37
    col: 0
    width: 12
    height: 10
  - title: Monthly New Subscriptions by Campaign
    name: Monthly New Subscriptions by Campaign
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.logical_subscription_count, logical_subscription_events.timestamp_month,
      logical_subscription_events.subscription__last_touch_attribution__utm_campaign]
    pivots: [logical_subscription_events.subscription__last_touch_attribution__utm_campaign]
    filters:
      logical_subscription_events.type: Subscription Start
      logical_subscription_events.subscription__last_touch_attribution__utm_campaign: "-EMPTY"
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.subscription__last_touch_attribution__utm_campaign]
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: logical_subscription_events.logical_subscription_count,
            id: logical_subscription_events.logical_subscription_count, name: Logical
              Subscription Count}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: This chart only includes new subscriptions that were attributed to
      a campaign.
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 37
    col: 12
    width: 12
    height: 10
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Net New Subscriptions</b></h3>

      </div>
    row: 47
    col: 0
    width: 24
    height: 2
  - title: Net New Subscriptions
    name: Net New Subscriptions
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.net_logical_subscription_count, logical_subscription_events.timestamp_month,
      logical_subscription_events.type]
    pivots: [logical_subscription_events.type]
    filters:
      logical_subscription_events.type: Subscription Start,Subscription End
    sorts: [logical_subscription_events.timestamp_month desc, logical_subscription_events.type]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(pivot_row(${logical_subscription_events.net_logical_subscription_count}))
      label: Net subscriptions
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: net_subscriptions
      _type_hint: number
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#0000FF"
    y_axes: [{label: '', orientation: left, series: [{axisId: net_subscriptions, id: net_subscriptions,
            name: Net subscriptions}, {axisId: Subscription End - logical_subscription_events.net_logical_subscription_count,
            id: Subscription End - logical_subscription_events.net_logical_subscription_count,
            name: Canceled}, {axisId: Subscription Start - logical_subscription_events.net_logical_subscription_count,
            id: Subscription Start - logical_subscription_events.net_logical_subscription_count,
            name: New}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      net_subscriptions: line
    series_colors:
      Subscription End - logical_subscription_events.net_logical_subscription_count: "#FF0000"
      Subscription Start - logical_subscription_events.net_logical_subscription_count: "#16bd49"
      net_subscriptions: "#0000FF"
    series_labels:
      Subscription End - logical_subscription_events.net_logical_subscription_count: Canceled
      Subscription Start - logical_subscription_events.net_logical_subscription_count: New
      net_subscriptions: Net
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Subscription Start Date: logical_subscription_events.timestamp_date
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Refunds (Yes / No): current_subscription_state.has_refunds
      Has Fraudulent Charges (Yes / No): current_subscription_state.has_fraudulent_charges
      Service ID: subscription_services.id
    row: 49
    col: 0
    width: 12
    height: 9
  filters:
  - name: Subscription Start Date
    title: Subscription Start Date
    type: field_filter
    default_value: after 2024-02-01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: subscription_platform
    explore: logical_subscription_events
    listens_to_filters: []
    field: logical_subscription_events.timestamp_date
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
    explore: logical_subscription_events
    listens_to_filters: [Service ID, Subscription Start Date]
    field: logical_subscription_events.subscription__payment_provider
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
    explore: logical_subscription_events
    listens_to_filters: [Service ID, Subscription Start Date]
    field: logical_subscription_events.subscription__plan_interval
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
    explore: logical_subscription_events
    listens_to_filters: [Service ID, Subscription Start Date, Plan Interval]
    field: logical_subscription_events.subscription__plan_summary
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
    explore: logical_subscription_events
    listens_to_filters: [Service ID, Subscription Start Date]
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
    explore: logical_subscription_events
    listens_to_filters: [Region, Service ID, Subscription Start Date]
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
    explore: logical_subscription_events
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
    explore: logical_subscription_events
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
    explore: logical_subscription_events
    listens_to_filters: []
    field: subscription_services.id
