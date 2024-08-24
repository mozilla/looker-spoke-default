---
- dashboard: monitor_saasboard__churn
  title: Monitor SaaSboard - Churn
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Zzhzz7eA9gBjXRmRWSnHQ0
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

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__subscriptions_growth" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Subscriptions Growth
        </a>

        <a href="https://mozilla.cloud.looker.com/dashboards/subscription_platform::monitor_saasboard__retention" style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;">
          Retention
        </a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; border: 1px solid white; font-weight: bold; text-decoration: underline;">
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

      This dashboard captures the current state of <strong>subscription churn</strong>.

      <ul>
        <li>A cohort refers to a group of subscriptions that started in a particular month. For example, cohort 2024-02 includes all subscriptions that started in the month of February 2024.</li>
        <li>Churn rate is the percentage of not-retained subscriptions out of the number retained from the previous month.</li>
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
  - title: Churn by Subscription Month Number
    name: Churn by Subscription Month Number
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_column
    fields: [retention_by_month.subscription_month_number, retention_by_month.churned_subscription_count,
      retention_by_month.previously_retained_subscription_count]
    sorts: [retention_by_month.subscription_month_number]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: churn_rate
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
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: churn_rate, id: churn_rate, name: Churn Rate}], showLabels: true,
        showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_types:
      churn_rate: line
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
    defaults_version: 1
    hidden_fields: [retention_by_month.previously_retained_subscription_count]
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 6
    col: 0
    width: 12
    height: 8
  - title: Total Churn Rate by Cohort
    name: Total Churn Rate by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [retention_by_month.churned_subscription_count, retention_by_month.previously_retained_subscription_count,
      logical_subscriptions.started_at_month]
    sorts: [logical_subscriptions.started_at_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: churn_rate
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
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
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: churn_rate, id: churn_rate,
            name: Churn Rate}], showLabels: false, showValues: true, valueFormat: 0%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      churn_rate: "#073072"
    x_axis_datetime_label: "%Y-%m"
    x_axis_label_rotation:
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [retention_by_month.previously_retained_subscription_count, retention_by_month.churned_subscription_count]
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Pooled Churn
    name: Pooled Churn
    model: subscription_platform
    explore: monthly_active_logical_subscriptions
    type: looker_column
    fields: [monthly_active_logical_subscriptions.month_month, monthly_active_logical_subscriptions.logical_subscription_count,
      next_month_still_active_subscriptions.logical_subscription_count]
    filters:
      monthly_active_logical_subscriptions.was_active_at_month_start: 'Yes'
      next_month_still_active_subscriptions.logical_subscription_count: ">0"
    sorts: [monthly_active_logical_subscriptions.month_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${monthly_active_logical_subscriptions.logical_subscription_count}\
        \ - ${next_month_still_active_subscriptions.logical_subscription_count}"
      label: Churned Subscription Count
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: churned_subscription_count
      _type_hint: number
    - category: table_calculation
      expression: "(${monthly_active_logical_subscriptions.logical_subscription_count}\
        \ - ${next_month_still_active_subscriptions.logical_subscription_count}) /\
        \ ${monthly_active_logical_subscriptions.logical_subscription_count}"
      label: Pooled Churn Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: pooled_churn_rate
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: churned_subscription_count,
            id: churned_subscription_count, name: Churned Subscription Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: pooled_churn_rate,
            id: pooled_churn_rate, name: Pooled Churn Rate}], showLabels: true, showValues: true,
        valueFormat: 0%, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_types:
      pooled_churn_rate: line
    series_colors:
      pooled_churn_rate: "#0060E0"
      churned: "#FF7139"
      churned_subscription_count: "#FF7139"
    series_labels:
      churned: Churned Subscription Count
    show_null_points: false
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [monthly_active_logical_subscriptions.logical_subscription_count,
      next_month_still_active_subscriptions.logical_subscription_count]
    listen:
      Subscription Start Date: monthly_active_logical_subscriptions.subscription__started_at_date
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
  - title: Daily Churn
    name: Daily Churn
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_column
    fields: [logical_subscriptions.ended_at_date, logical_subscriptions.logical_subscription_count]
    filters: {}
    sorts: [logical_subscriptions.ended_at_date desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: logical_subscriptions.logical_subscription_count,
            id: logical_subscriptions.logical_subscription_count, name: Logical Subscription
              Count}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      logical_subscriptions.logical_subscription_count: "#FF7139"
    series_labels:
      logical_subscriptions.logical_subscription_count: Churned Subscription Count
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 14
    col: 12
    width: 12
    height: 8
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Upcoming Cancellations and Auto-Renew Disabling</b></h3>

      </div>
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Upcoming Cancellations by Plan Interval
    name: Upcoming Cancellations by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_column
    fields: [logical_subscriptions.logical_subscription_count, logical_subscriptions.current_period_ends_at_month,
      logical_subscriptions.plan_interval]
    pivots: [logical_subscriptions.plan_interval]
    fill_fields: [logical_subscriptions.current_period_ends_at_month]
    filters:
      logical_subscriptions.auto_renew: 'No'
      logical_subscriptions.current_period_ends_at_date: after 0 days ago
    sorts: [logical_subscriptions.current_period_ends_at_month, logical_subscriptions.plan_interval]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: add_days(-1, ${table_metadata.last_modified_date})
      label: Date Calculation
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: date_calculation
      _type_hint: date
      is_disabled: true
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      logical_subscriptions.logical_subscription_count: "#ffc286"
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The Subscription Start Date filter does not apply to this chart.
    listen:
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 24
    col: 0
    width: 12
    height: 8
  - title: Days to Disable Auto-Renew by Plan Interval
    name: Days to Disable Auto-Renew by Plan Interval
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_area
    fields: [auto_renew_disabled_date_difference_days, logical_subscription_events.subscription__plan_interval,
      logical_subscription_events.logical_subscription_count]
    pivots: [logical_subscription_events.subscription__plan_interval]
    filters:
      logical_subscription_events.reason: Auto-Renew Disabled
      logical_subscription_events.type: Auto-Renew Change
    sorts: [logical_subscription_events.subscription__plan_interval, auto_renew_disabled_date_difference_days]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: diff_days(${logical_subscription_events.subscription__started_at_date},
        ${logical_subscription_events.subscription__auto_renew_disabled_at_date})
      label: Auto-Renew Disabled Date Difference (Days)
      value_format:
      value_format_name:
      dimension: auto_renew_disabled_date_difference_days
      _kind_hint: dimension
      _type_hint: number
    - args:
      - logical_subscription_events.logical_subscription_count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: logical_subscription_events.logical_subscription_count
      label: Percent of Logical Subscription Events Logical Subscription Count
      source_field: logical_subscription_events.logical_subscription_count
      table_calculation: percent_of_logical_subscription_events_logical_subscription_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [logical_subscription_events.logical_subscription_count]
    note_state: collapsed
    note_display: hover
    note_text: Time to disabling auto-renew is measured relative to the subscription
      start date.
    listen:
      Subscription Start Date: logical_subscription_events.subscription__started_at_date
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscription_events.subscription__has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscription_events.subscription__has_refunds
      Service ID: subscription_services.id
    row: 24
    col: 12
    width: 12
    height: 8
  - title: Auto-Renew Disabled Occurrences
    name: Auto-Renew Disabled Occurrences
    model: subscription_platform
    explore: logical_subscription_events
    type: looker_column
    fields: [logical_subscription_events.timestamp_date, logical_subscription_events.subscription__plan_interval,
      logical_subscription_events.logical_subscription_count]
    pivots: [logical_subscription_events.subscription__plan_interval]
    fill_fields: [logical_subscription_events.timestamp_date]
    filters:
      logical_subscription_events.reason: Auto-Renew Disabled
      logical_subscription_events.type: Auto-Renew Change
    sorts: [logical_subscription_events.timestamp_date desc, logical_subscription_events.subscription__plan_interval]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Subscription Start Date: logical_subscription_events.timestamp_date
      Payment Provider: logical_subscription_events.subscription__payment_provider
      Plan Interval: logical_subscription_events.subscription__plan_interval
      Plan: logical_subscription_events.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscription_events.subscription__has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscription_events.subscription__has_refunds
      Service ID: subscription_services.id
    row: 32
    col: 0
    width: 12
    height: 8
  - title: Percent of Active Subscriptions with Auto-Renew Disabled
    name: Percent of Active Subscriptions with Auto-Renew Disabled
    model: subscription_platform
    explore: daily_active_logical_subscriptions
    type: looker_line
    fields: [auto_renew_disabled_subscription_count, daily_active_logical_subscriptions.date_date,
      daily_active_logical_subscriptions.subscription__plan_interval, daily_active_logical_subscriptions.logical_subscription_count]
    pivots: [daily_active_logical_subscriptions.subscription__plan_interval]
    fill_fields: [daily_active_logical_subscriptions.date_date]
    filters:
      daily_active_logical_subscriptions.was_active_at_day_end: 'Yes'
    sorts: [daily_active_logical_subscriptions.date_date desc, daily_active_logical_subscriptions.subscription__plan_interval]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Auto-Renew Disabled Subscription Count
      value_format:
      value_format_name:
      based_on: daily_active_logical_subscriptions.logical_subscription_count
      _kind_hint: measure
      measure: auto_renew_disabled_subscription_count
      type: count_distinct
      _type_hint: number
      filters:
        current_subscription_state.auto_renew: 'No'
    - category: table_calculation
      expression: "${auto_renew_disabled_subscription_count} / ${daily_active_logical_subscriptions.logical_subscription_count}"
      label: Percent Active Subscriptions Disabled Auto-Renew
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: percent_active_subscriptions_disabled_auto_renew
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [auto_renew_disabled_subscription_count, daily_active_logical_subscriptions.logical_subscription_count]
    listen:
      Subscription Start Date: daily_active_logical_subscriptions.date_date
      Payment Provider: daily_active_logical_subscriptions.subscription__payment_provider
      Plan Interval: daily_active_logical_subscriptions.subscription__plan_interval
      Plan: daily_active_logical_subscriptions.subscription__plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): daily_active_logical_subscriptions.subscription__has_fraudulent_charges
      Has Refunds (Yes / No): daily_active_logical_subscriptions.subscription__has_refunds
      Service ID: subscription_services.id
    row: 32
    col: 12
    width: 12
    height: 8
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Plan Interval</b></h3>

      </div>
    row: 40
    col: 0
    width: 24
    height: 2
  - title: Churn Rate by Plan Interval
    name: Churn Rate by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [retention_by_month.churned_subscription_count, retention_by_month.previously_retained_subscription_count,
      retention_by_month.subscription_month_number, logical_subscriptions.plan_interval]
    pivots: [logical_subscriptions.plan_interval]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: churn_rate
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
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
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      retention_by_month.churned_subscription_count: "#FF7139"
      churn_rate: "#073072"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [retention_by_month.previously_retained_subscription_count, retention_by_month.churned_subscription_count]
    hidden_pivots: {}
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 42
    col: 0
    width: 24
    height: 6
  - title: Churn Rate Table by Plan Interval
    name: Churn Rate Table by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [retention_by_month.churned_subscription_count, retention_by_month.previously_retained_subscription_count,
      retention_by_month.subscription_month_number, logical_subscriptions.plan_interval,
      logical_subscriptions.plan_interval_months]
    pivots: [retention_by_month.subscription_month_number]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval_months]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: churn_rate
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: churn_rate, id: churn_rate, name: Churn Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      churn_rate: "#073072"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [retention_by_month.previously_retained_subscription_count, retention_by_month.churned_subscription_count,
      logical_subscriptions.plan_interval_months]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 48
    col: 0
    width: 24
    height: 4
  - title: Churn Counts Table by Plan Interval
    name: Churn Counts Table by Plan Interval
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [retention_by_month.churned_subscription_count, retention_by_month.subscription_month_number,
      logical_subscriptions.plan_interval, logical_subscriptions.plan_interval_months]
    pivots: [retention_by_month.subscription_month_number]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.plan_interval_months]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: churn_rate
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      retention_by_month.churned_subscription_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: retention_by_month.churned_subscription_count,
            id: retention_by_month.churned_subscription_count, name: Churned Subscription
              Count}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 70, type: linear}, {label: !!null '', orientation: left,
        series: [{axisId: churn_rate, id: churn_rate, name: Churn Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      churn_rate: "#073072"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [logical_subscriptions.plan_interval_months]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 52
    col: 0
    width: 24
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Cohort</b></h3>

      </div>
    row: 56
    col: 0
    width: 24
    height: 2
  - title: Cohort Churn Rate by Subscription Month Number
    name: Cohort Churn Rate by Subscription Month Number
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_line
    fields: [logical_subscriptions.started_at_month, retention_by_month.churned_subscription_count,
      retention_by_month.previously_retained_subscription_count, retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.started_at_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: churn_rate
      _type_hint: number
      is_disabled: false
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count}"
      label: Churn
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: churn
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
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
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    x_axis_datetime_label: "%Y-%m"
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [retention_by_month.churned_subscription_count, retention_by_month.previously_retained_subscription_count]
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 58
    col: 0
    width: 24
    height: 7
  - title: Churn Rate Table by Cohort
    name: Churn Rate Table by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [logical_subscriptions.started_at_month, retention_by_month.churned_subscription_count,
      retention_by_month.previously_retained_subscription_count, retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.started_at_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: churn_rate
      _type_hint: number
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count}"
      label: Churn
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: churn
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [retention_by_month.churned_subscription_count, retention_by_month.previously_retained_subscription_count]
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 65
    col: 0
    width: 24
    height: 5
  - title: Churn Counts Table by Cohort
    name: Churn Counts Table by Cohort
    model: subscription_platform
    explore: logical_subscriptions
    type: looker_grid
    fields: [logical_subscriptions.started_at_month, retention_by_month.churned_subscription_count,
      retention_by_month.subscription_month_number]
    pivots: [retention_by_month.subscription_month_number]
    sorts: [retention_by_month.subscription_month_number, logical_subscriptions.started_at_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count} / ${retention_by_month.previously_retained_subscription_count}"
      label: Churn Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: churn_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${retention_by_month.churned_subscription_count}"
      label: Churn
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: churn
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
      retention_by_month.churned_subscription_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Subscription Start Date: logical_subscriptions.started_at_date
      Payment Provider: logical_subscriptions.payment_provider
      Plan Interval: logical_subscriptions.plan_interval
      Plan: logical_subscriptions.plan_summary
      Region: countries.region_name
      Country: countries.name
      Has Fraudulent Charges (Yes / No): logical_subscriptions.has_fraudulent_charges
      Has Refunds (Yes / No): logical_subscriptions.has_refunds
      Service ID: subscription_services.id
    row: 70
    col: 0
    width: 24
    height: 5
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
    listens_to_filters: [Subscription Start Date, Service ID]
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
    listens_to_filters: [Subscription Start Date, Plan Interval, Service ID]
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
    explore: logical_subscriptions
    listens_to_filters: []
    field: logical_subscriptions.has_refunds
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
