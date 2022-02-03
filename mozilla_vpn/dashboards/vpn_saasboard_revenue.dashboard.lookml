- dashboard: vpn_saasboard__revenue
  title: VPN SaaSboard - Revenue
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  elements:
  - title: Month Over Month Growth Rate
    name: Month Over Month Growth Rate
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_line
    fields: [active_subscriptions.active_month, active_subscriptions.count_sum, active_subscriptions.annual_recurring_revenue]
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
        _kind_hint: measure, table_calculation: annual_recurring_revenue_1, _type_hint: number}]
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
    show_null_points: true
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
    hidden_fields: [active_subscriptions.count_sum, active_subscriptions.annual_recurring_revenue]
    listen:
      Pricing Plan: active_subscriptions.pricing_plan
      Active Date: active_subscriptions.active_date
      Country: active_subscriptions.country_name
      Provider: active_subscriptions.provider
    row: 15
    col: 0
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
      \ <strong>revenue</strong>.\n\n<br>\n<br>\nPlease submit any questions in  <b><a\
      \ href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\">mozilla-vpn-data</a></b>\
      \ channel on Slack for @wichan or @relud. \n\n</p>"
    row: 2
    col: 3
    width: 15
    height: 4
  - title: Annual Recurring Revenue (By Country)
    name: Annual Recurring Revenue (By Country)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.country_name, active_subscriptions.annual_recurring_revenue]
    pivots: [active_subscriptions.country_name]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.country_name desc]
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
      Pricing Plan: active_subscriptions.pricing_plan
      Active Date: active_subscriptions.active_date
      Country: active_subscriptions.country_name
      Provider: active_subscriptions.provider
    row: 6
    col: 0
    width: 12
    height: 9
  - title: Annual Recurring Revenue (By Plan)
    name: Annual Recurring Revenue (By Plan)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.active_month, active_subscriptions.pricing_plan, active_subscriptions.annual_recurring_revenue]
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
      Pricing Plan: active_subscriptions.pricing_plan
      Active Date: active_subscriptions.active_date
      Country: active_subscriptions.country_name
      Provider: active_subscriptions.provider
    row: 6
    col: 12
    width: 12
    height: 9
  - name: ARR by Month Graph - bar chart
    type: text
    title_text: ARR by Month Graph - bar chart
    subtitle_text: Under Development - pending finance/accounting support
    body_text: ''
    row: 15
    col: 12
    width: 12
    height: 9
  - title: Untitled
    name: Untitled
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.active_date]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most Recent Data Included
    series_types: {}
    defaults_version: 1
    listen:
      Pricing Plan: active_subscriptions.pricing_plan
      Active Date: active_subscriptions.active_date
      Country: active_subscriptions.country_name
      Provider: active_subscriptions.provider
    row: 2
    col: 18
    width: 6
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/412?Provider=&Pricing+Plan=&Country=&Active+Date=after+2020%2F07%2F20">

       Active Subs</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/416?Provider=&Pricing+Plan=&Country=&Event+Date=after+2020%2F07%2F20">

       Subs Growth</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/414?Provider=&Pricing+Plan=&Country=&Subscription+Start+Date=after+2020%2F07%2F20">Retention</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/413?Provider=&Pricing+Plan=&Country=&Subscription+Start+Date=after+2020%2F07%2F20">Churn</a>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/415?Provider=&Pricing+Plan=&Country=&Active+Date=after+2020%2F07%2F20">Revenue</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
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
      options: []
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Pricing Plan, Country, Active Date]
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
      options: []
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Provider, Country, Active Date]
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
      options: []
    model: mozilla_vpn
    explore: active_subscriptions
    listens_to_filters: [Provider, Pricing Plan, Active Date]
    field: active_subscriptions.country_name
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: after 2020/07/20
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
