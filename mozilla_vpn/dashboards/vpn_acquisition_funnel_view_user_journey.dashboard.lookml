- dashboard: vpn_acquisition_funnel_view_desktop_user_journey
  title: VPN Acquisition Funnel View (desktop)- User Journey
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 day
  preferred_slug: cFlbaWxoWOcrxZQVyxq03z
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #FFFFFF; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #000000; padding: 5px 10px; float: left; height: 40px;" src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg"/>

        <a style="color: #000000; border: 1px solid white; padding: 5px 80px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href ="https://mozilla.cloud.looker.com/dashboards/501?Partition+Date=28+day&Country=&Channel+Group=&UTM+Medium=&UTM+Source=&UTM+Campaign=&UTM+Content=&UTM+Term=&Entrypoint+Experiment=&Entrypoint+Variation=&Pricing+Plan=&OS+Name=&OS+Version=" >

      User Journey</a>

        <a style="color: #000000; padding: 5px 80px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/499?Start+Date=28+day&Country=&Channel+Group=&Provider=&Pricing+Plan=&UTM+Medium=&UTM+Source=&UTM+Campaign=&UTM+Content=&Entrypoint+Experiment=&Entrypoint+Variation=">

      New Subs</a>

        <a style="color: #000000; padding: 5px 80px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1_l-ZsbKsxRh7HGqtODz8w8eDBqkw2N9SIZxEE9qG-DQ/edit?usp=sharing">

        Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |2-

      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Contact @yeonjoo for questions in #mozilla-vpn-data </b></h3>
       <div style="border-bottom: solid 2px #e0e0e0;">
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Last Updated Date
    name: Last Updated Date
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: single_value
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.product_page_visit]
    sorts: [funnel_product_page_to_subscribed_table.partition_date desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [funnel_product_page_to_subscribed_table.product_page_visit]
    refresh: 1 day
    listen:
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
    row: 4
    col: 0
    width: 7
    height: 4
  - title: Product Page Visits on the Last Updated Date
    name: Product Page Visits on the Last Updated Date
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: single_value
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.product_page_visit,
      product_page_visits]
    sorts: [funnel_product_page_to_subscribed_table.partition_date desc]
    limit: 2
    dynamic_fields: [{category: measure, expression: !!null '', label: Product Page
          Visit, value_format: !!null '', value_format_name: !!null '', based_on: funnel_product_page_to_subscribed_table.product_page_visit,
        _kind_hint: measure, measure: product_page_visits, type: sum, _type_hint: number},
      {category: table_calculation, description: 'Difference between the current row’s
          value and value of the row below, divided by the value of the row below.',
        label: "% Change Product Page Visit", value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: change_product_page_visits,
        args: [product_page_visits], _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: since the previous day
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
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
    series_types: {}
    hidden_fields: [product_page_visits]
    refresh: 1 day
    listen:
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 4
    col: 7
    width: 9
    height: 4
  - title: Total Product Page Visits During Filtered Days
    name: Total Product Page Visits During Filtered Days
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: single_value
    fields: [funnel_product_page_to_subscribed_table.product_page_visit]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 4
    col: 16
    width: 8
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "# [Product Page](www.mozilla.org/vpn) Traffic "
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Product Page Visit Trend
    name: Product Page Visit Trend
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_line
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.product_page_visit]
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
    total: true
    dynamic_fields: [{category: measure, expression: !!null '', label: Product Page
          Visit, value_format: !!null '', value_format_name: !!null '', based_on: funnel_product_page_to_subscribed_table.product_page_visit,
        _kind_hint: measure, measure: product_page_visits, type: sum, _type_hint: number},
      {category: table_calculation, description: Current row’s value divided by the
          value of the row below., label: "% Change Product Page Visit", value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: change_product_page_visits, args: [product_page_visits],
        _kind_hint: dimension, _type_hint: number, is_disabled: true}, {category: table_calculation,
        description: Cumulative sum of this row and all previous rows in the column,
        label: Running Total VPN Site Hits, value_format: !!null '', value_format_name: Default
          formatting, calculation_type: running_total, table_calculation: running_total_product_page_visits,
        args: [funnel_product_page_to_subscribed_table.product_page_visit], _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: session counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: funnel_product_page_to_subscribed_table.product_page_visit, name: VPN
              Site Hits}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 99, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 10
    col: 11
    width: 13
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "# Top of the Acquisition Funnel\n"
    row: 37
    col: 0
    width: 24
    height: 2
  - name: All Users Conversion Funnel Steps
    type: text
    title_text: All Users Conversion Funnel Steps
    body_text: "This plot displays the overall user journey through the acquisition\
      \ funnel. Depending on their FxA status(New FxA users, , Signed in FxA users),\
      \ there are different mid-steps to get to each step shown in the plot. For example,\
      \ Signed out FxA users, existing FxA users who were not signed in before entering\
      \ the funnel, have sign-in steps between the acquisition process start step\
      \ and the payment setup engagement step. For more information about the funnel\
      \ steps for each user group, refer to [this board](https://miro.com/app/board/o9J_lq1HHTg=/?invite_link_id=97426737166).\n\
      \n* The **CVR From Payment Site Visit to Payment Complete** is the conversion\
      \ rate of people who completed the payment over people who started the acquisition\
      \ process.\n\n* Click the three dots on the top right of the plot to compare\
      \ the CVRs for different groups on one plot using the **Explore** feature. \
      \ \n\n\n"
    row: 79
    col: 0
    width: 9
    height: 7
  - title: All User Conversion Process
    name: All User Conversion Process
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_column
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
      funnel_product_page_to_subscribed_table.all_users_step2_payment_setup_engage,
      funnel_product_page_to_subscribed_table.all_users_step3_payment_setup_complete,
      funnel_product_page_to_subscribed_table.CVR_from_payment_page_visit_to_payment_complete]
    fill_fields: [funnel_product_page_to_subscribed_table.partition_date]
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: Total Acquisition Process Start}, {axisId: funnel_product_page_to_subscribed_table.all_users_step2_payment_setup_engage,
            id: funnel_product_page_to_subscribed_table.all_users_step2_payment_setup_engage,
            name: Total Payment Setup Engage}, {axisId: funnel_product_page_to_subscribed_table.all_users_step3_payment_setup_complete,
            id: funnel_product_page_to_subscribed_table.all_users_step3_payment_setup_complete,
            name: Total Payment Setup Complete}], showLabels: true, showValues: true,
        maxValue: !!null '', minValue: !!null '', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 75, type: linear}, {label: CVR(%), orientation: right,
        series: [{axisId: funnel_product_page_to_subscribed_table.CVR_from_payment_page_visit_to_payment_complete,
            id: funnel_product_page_to_subscribed_table.CVR_from_payment_page_visit_to_payment_complete,
            name: CVR From Payment Site Visit to Payment Complete}, {axisId: funnel_product_page_to_subscribed_table.overall_CVR_from_payment_page_visit_to_payment_complete,
            id: funnel_product_page_to_subscribed_table.overall_CVR_from_payment_page_visit_to_payment_complete,
            name: Overall CVR From Payment Site Visit to Payment Complete}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 60, type: linear}]
    series_types:
      funnel_product_page_to_subscribed_table.CVR_from_payment_page_visit_to_payment_complete: line
      funnel_product_page_to_subscribed_table.overall_CVR_from_payment_page_visit_to_payment_complete: line
    reference_lines: []
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 79
    col: 9
    width: 15
    height: 7
  - title: CTR from the Product Page to Entering Subscription Flow
    name: CTR from the Product Page to Entering Subscription Flow
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_column
    fields: [funnel_product_page_to_subscribed_table.CTR_from_product_page_visit_to_entering_subscription_flow,
      funnel_product_page_to_subscribed_table.product_page_visit, funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
      funnel_product_page_to_subscribed_table.partition_date]
    filters: {}
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Acquisition
          Process Start, value_format: !!null '', value_format_name: !!null '', based_on: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
        _kind_hint: measure, measure: total_acquisition_process_start, type: sum,
        _type_hint: number}, {category: table_calculation, label: "% Change Total\
          \ Acquisition Process Start", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_difference_from_previous, table_calculation: change_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}, {category: table_calculation, description: Cumulative
          sum of this row and all previous rows in the column, label: Running Total
          Total Acquisition Process Start, value_format: !!null '', value_format_name: Default
          formatting, calculation_type: running_total, table_calculation: running_total_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: All Users Step1 Acquisition Process Start}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: custom, tickDensityCustom: 92,
        type: linear}, {label: CTR(%), orientation: right, series: [{axisId: funnel_product_page_to_subscribed_table.CTR_from_product_page_visit_to_entering_subscription_flow,
            id: funnel_product_page_to_subscribed_table.CTR_from_product_page_visit_to_entering_subscription_flow,
            name: CTR From Product Page Visit to Entering Subscription Flow}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    series_types:
      funnel_product_page_to_subscribed_table.CTR_from_product_page_visits_to_enter_the_funnel: line
      funnel_product_page_to_subscribed_table.CTR_from_product_page_visit_to_entering_subscription_flow: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: [funnel_product_page_to_subscribed_table.product_page_visit]
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 44
    col: 4
    width: 17
    height: 6
  - title: New FxA users Conversion Process
    name: New FxA users Conversion Process
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_column
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.new_fxa_users_step1_input_emails,
      funnel_product_page_to_subscribed_table.new_fxa_users_step2_payment_setup_engage,
      funnel_product_page_to_subscribed_table.new_fxa_users_step3_payment_setup_complete,
      funnel_product_page_to_subscribed_table.new_fxa_CVR]
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: session counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.new_fxa_users_step1_input_emails,
            id: funnel_product_page_to_subscribed_table.new_fxa_users_step1_input_emails,
            name: New FxA User Input Emails}, {axisId: funnel_product_page_to_subscribed_table.new_fxa_users_step2_payment_setup_engage,
            id: funnel_product_page_to_subscribed_table.new_fxa_users_step2_payment_setup_engage,
            name: New FxA Payment Setup Engage}, {axisId: funnel_product_page_to_subscribed_table.new_fxa_users_step3_payment_setup_complete,
            id: funnel_product_page_to_subscribed_table.new_fxa_users_step3_payment_setup_complete,
            name: New FxA Payment Setup Complete}, {axisId: funnel_product_page_to_subscribed_table.overall_New_FxA_user_input_emails,
            id: funnel_product_page_to_subscribed_table.overall_New_FxA_user_input_emails,
            name: Overall New FxA User Input Emails}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 63, type: linear},
      {label: '', orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.overall_New_FxA_payment_setup_complete,
            id: funnel_product_page_to_subscribed_table.overall_New_FxA_payment_setup_complete,
            name: Overall New FxA Payment Setup Complete}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: CVR(%), orientation: right,
        series: [{axisId: funnel_product_page_to_subscribed_table.new_fxa_CVR, id: funnel_product_page_to_subscribed_table.new_fxa_CVR,
            name: New FxA CVR}, {axisId: funnel_product_page_to_subscribed_table.overall_New_FxA_CVR,
            id: funnel_product_page_to_subscribed_table.overall_New_FxA_CVR, name: Overall
              New FxA CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 72, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      funnel_product_page_to_subscribed_table.new_fxa_CVR: line
      funnel_product_page_to_subscribed_table.overall_New_FxA_CVR: line
    show_dropoff: false
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 86
    col: 9
    width: 15
    height: 6
  - name: New FxA Users Conversion Process
    type: text
    title_text: New FxA Users Conversion Process
    body_text: "The three bars in the chart represent steps that summarize the conversion\
      \ process for users who did not have a FxA before entering the acquisition funnel.\
      \ **New FxA User Step 1 Input Emails** is the first step for the new FxA user\
      \ group that is distinguishable from the other two groups with FxA accounts.\
      \ \n\n* The **New FxA CVR** is the rate of users completed the payment out of\
      \ new FxA users who engaged in inputting their emails. \n\n* Click the three\
      \ dots on the top right of the plot to compare the CVRs for different groups\
      \ on one plot using the **Explore** feature.\n"
    row: 86
    col: 0
    width: 9
    height: 6
  - name: Signed Out FxA Users Users Conversion Process
    type: text
    title_text: Signed Out FxA Users Users Conversion Process
    body_text: "The four bars in the chart represent steps that summarize the conversion\
      \ process for users who had a FxA but had not signed in before entering the\
      \ acquisition funnel. **Signed out Fxa Users Step1 Signin CTA Click** is the\
      \ first step for this user group that is distinguishable from the new FxA user\
      \ group. This step is captured when the users click the “sign in” CTA button.\
      \  \n\n* The **Singed Out FxA CVR** is the proportion of the users who completed\
      \ the payment out of the users who clicked the “sign in” CTA button. It is calculated\
      \ based on the filters you set. \n\n* Click the three dots on the top right\
      \ of the plot to compare the CVRs for different groups on one plot the **Explore**\
      \ feature.\n\n"
    row: 92
    col: 0
    width: 9
    height: 7
  - title: Signed out FxA Users Conversion Process
    name: Signed out FxA Users Conversion Process
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_column
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.signed_out_fxa_users_step1_sign_in_CTA_click,
      funnel_product_page_to_subscribed_table.signed_out_fxa_users_step2_payment_setup_view,
      funnel_product_page_to_subscribed_table.signed_out_fxa_users_step3_payment_setup_engage,
      funnel_product_page_to_subscribed_table.signed_out_fxa_users_step4_payment_setup_complete,
      funnel_product_page_to_subscribed_table.signed_out_fxa_CVR]
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step1_sign_in_CTA_click,
            id: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step1_sign_in_CTA_click,
            name: Signed Out Fxa Users Step1 Signin CTA Click}, {axisId: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step2_payment_setup_view,
            id: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step2_payment_setup_view,
            name: Signed Out Fxa Users Step2 Payment Setup View}, {axisId: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step3_payment_setup_engage,
            id: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step3_payment_setup_engage,
            name: Signed Out Fxa Users Step3 Payment Setup Engage}, {axisId: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step4_payment_setup_complete,
            id: funnel_product_page_to_subscribed_table.signed_out_fxa_users_step4_payment_setup_complete,
            name: Signed Out Fxa Users Step4 Payment Setup Complete}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 99,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: funnel_product_page_to_subscribed_table.signed_out_fxa_CVR,
            id: funnel_product_page_to_subscribed_table.signed_out_fxa_CVR, name: Signed
              Out Fxa CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hidden_series: []
    series_types:
      funnel_product_page_to_subscribed_table.signed_out_fxa_users_CVR: line
      funnel_product_page_to_subscribed_table.signed_out_fxa_CVR: line
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: false
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 92
    col: 9
    width: 15
    height: 7
  - title: Signed in FxA Users Conversion Process
    name: Signed in FxA Users Conversion Process
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_column
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.signed_in_fxa_users_step1_payment_setup_view,
      funnel_product_page_to_subscribed_table.signed_in_fxa_users_step2_payment_setup_engage,
      funnel_product_page_to_subscribed_table.signed_in_fxa_users_step3_payment_setup_complete,
      funnel_product_page_to_subscribed_table.signed_in_fxa_CVR]
    sorts: [funnel_product_page_to_subscribed_table.partition_date]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step1_payment_setup_view,
            id: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step1_payment_setup_view,
            name: Signed In Fxa Users Step1 Payment Setup View}, {axisId: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step2_payment_setup_engage,
            id: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step2_payment_setup_engage,
            name: Signed In Fxa Users Step2 Payment Setup Engage}, {axisId: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step3_payment_setup_complete,
            id: funnel_product_page_to_subscribed_table.signed_in_fxa_users_step3_payment_setup_complete,
            name: Signed In Fxa Users Step3 Payment Setup Complete}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 97,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: funnel_product_page_to_subscribed_table.signed_in_fxa_CVR,
            id: funnel_product_page_to_subscribed_table.signed_in_fxa_CVR, name: Signed
              In Fxa CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hide_legend: false
    series_types:
      funnel_product_page_to_subscribed_table.signed_in_fxa_users_CVR: line
      funnel_product_page_to_subscribed_table.overall_Existing_Fxa_SignedIn_CVR: line
      funnel_product_page_to_subscribed_table.signed_in_fxa_CVR: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 99
    col: 9
    width: 15
    height: 7
  - name: Signed in FxA Users Conversion Process (2)
    type: text
    title_text: Signed in FxA Users Conversion Process
    body_text: "The three bars in the chart represent steps that summarize the conversion\
      \ process for users who had a FxA and had already signed in before entering\
      \ the acquisition funnel. \n\n**Signed In FxA Users Step1 Payment Setup View**\
      \ is the first step for this user group and it is captured when the users visit\
      \ the payment page from the VPN product page by choosing a plan. \n\n* The **Signed\
      \ In FxA CVR**  is the proportion of users who completed the payment out of\
      \ the users entered the funnel with a signed in FxA account. It is calculated\
      \ based on the filters you set. \n\n* Click the three dots on the top right\
      \ of the plot to compare the CVRs for different groups on one plot using the\
      \ **Explore** feature.\n\n"
    row: 99
    col: 0
    width: 9
    height: 7
  - title: Product Page Visits by Country
    name: Product Page Visits by Country
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_pie
    fields: [funnel_product_page_to_subscribed_table.product_page_visit, funnel_product_page_to_subscribed_table.country]
    sorts: [funnel_product_page_to_subscribed_table.product_page_visit desc]
    limit: 20
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    ordering: none
    show_null_labels: false
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
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 10
    col: 0
    width: 11
    height: 6
  - title: Chosen Pricing Plan on the Top of the Funnel
    name: Chosen Pricing Plan on the Top of the Funnel
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_grid
    fields: [funnel_product_page_to_subscribed_table.pricing_plan, funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start]
    sorts: [funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start
        desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    y_axes: [{label: Session Count, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: Total Acquisition Process Start}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 52
    col: 4
    width: 17
    height: 6
  - title: Product Page Visits by Channel Group
    name: Product Page Visits by Channel Group
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_line
    fields: [funnel_product_page_to_subscribed_table.product_page_visit, funnel_product_page_to_subscribed_table.partition_date,
      funnel_product_page_to_subscribed_table.channel_group]
    pivots: [funnel_product_page_to_subscribed_table.channel_group]
    sorts: [funnel_product_page_to_subscribed_table.product_page_visit desc 0, funnel_product_page_to_subscribed_table.channel_group]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Product Page
          Visit, value_format: !!null '', value_format_name: !!null '', based_on: funnel_product_page_to_subscribed_table.product_page_visit,
        _kind_hint: measure, measure: product_page_visits, type: sum, _type_hint: number},
      {category: table_calculation, description: 'Difference between the current row’s
          value and value of the row below, divided by the value of the row below.',
        label: "% Change Product Page Visit", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_difference_from_previous, table_calculation: change_product_page_visits,
        args: [product_page_visits], _kind_hint: dimension, _type_hint: number, is_disabled: true},
      {category: table_calculation, description: Cumulative sum of this row and all
          previous rows in the column, label: Running Total Product Page Visits, value_format: !!null '',
        value_format_name: Default formatting, calculation_type: running_total, table_calculation: running_total_product_page_visits,
        args: [funnel_product_page_to_subscribed_table.product_page_visit], _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: direct - funnel_product_page_to_subscribed_table.product_page_visit,
            name: direct}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: marketing_owned - funnel_product_page_to_subscribed_table.product_page_visit,
            name: marketing_owned}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: marketing_paid - funnel_product_page_to_subscribed_table.product_page_visit,
            name: marketing_paid}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: miscellaneous - funnel_product_page_to_subscribed_table.product_page_visit,
            name: miscellaneous}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: organic - funnel_product_page_to_subscribed_table.product_page_visit,
            name: organic}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: product_owned - funnel_product_page_to_subscribed_table.product_page_visit,
            name: product_owned}, {axisId: funnel_product_page_to_subscribed_table.product_page_visit,
            id: unattributed - funnel_product_page_to_subscribed_table.product_page_visit,
            name: unattributed}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 97, type: linear}]
    series_types: {}
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 24
    col: 4
    width: 17
    height: 7
  - title: Top of the Funnel by Channel Group
    name: Top of the Funnel by Channel Group
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_line
    fields: [funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
      funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.channel_group]
    pivots: [funnel_product_page_to_subscribed_table.channel_group]
    sorts: [funnel_product_page_to_subscribed_table.partition_date desc, funnel_product_page_to_subscribed_table.channel_group]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Acquisition
          Process Start, value_format: !!null '', value_format_name: !!null '', based_on: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
        _kind_hint: measure, measure: total_acquisition_process_start, type: sum,
        _type_hint: number}, {category: table_calculation, description: Current row’s
          value divided by the value of the row below., label: "% Change Total Acquisition\
          \ Process Start", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_of_previous, table_calculation: change_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}, {category: table_calculation, label: Running Total Total
          Acquisition Process Start, value_format: !!null '', value_format_name: Default
          formatting, calculation_type: running_row_total, table_calculation: running_total_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: measure, _type_hint: number,
        is_disabled: true}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Session Count, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: direct - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: direct}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: marketing_owned - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: marketing_owned}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: marketing_paid - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: marketing_paid}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: miscellaneous - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: miscellaneous}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: organic - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: organic}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: product_owned - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: product_owned}, {axisId: funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            id: unattributed - funnel_product_page_to_subscribed_table.all_users_step1_acquisition_process_start,
            name: unattributed}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}]
    series_types: {}
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
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 61
    col: 4
    width: 17
    height: 6
  - name: Product Site Visits by Channel Group
    type: text
    title_text: Product Site Visits by Channel Group
    body_text: "The channel groups are categorized using the UTM attributions ( medium,\
      \ source, campaign, content). The categorization rules were based on the Marketing\
      \ UTM Parameters - 2021 H2 spreadsheet.\n\n* Direct: traffic led to the VPN\
      \ product page or the mobile app stores without a campaign attribution. In a\
      \ web browser, when users visit through the link from their search results or\
      \ by entering mozilla.org/vpn to the URL bar, they are attributed with (**medium**\
      \ = `referral` , **source** = `www.mozilla.org-vpn-product-page` , **campaign**\
      \ = `vpn-product-page`). In a mobile app store, the direct traffic is attributed\
      \ with (**medium** = `organic`, **source** =`google-play`). \n\n* Marketing\
      \ owned: traffic led by the marketing owned media campaigns (ex. Blog.mozilla.org,\
      \ whatsnew)\n\n* Marketing paid: traffic led by the paid campaign(ex. SEM)\n\
      \n* Product owned: traffic led by the product owned media campaigns (ex. Firefox\
      \ browser)\n\n* Unattributed: traffic led with no attribution\n\n* Miscellaneous:\
      \ traffic led with some attributions that could not be categorized. It could\
      \ be that some of the attribution parameters got lost or attributions that were\
      \ not well documented.  \n* For a more detailed explanation for the categorization\
      \ of the channel groups, please refer to [this documentation](https://docs.google.com/document/d/1ojf1XHb3Iu5GNzMfozDcxWhEw6d9A4QuiaoAm-gDIrk/edit?usp=sharing). "
    row: 16
    col: 0
    width: 24
    height: 8
  - title: Top 10 Attributions that Led the Most Site Visits
    name: Top 10 Attributions that Led the Most Site Visits
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_grid
    fields: [funnel_product_page_to_subscribed_table.product_page_visit, funnel_product_page_to_subscribed_table.channel_group,
      funnel_product_page_to_subscribed_table.utm_medium, funnel_product_page_to_subscribed_table.utm_source,
      funnel_product_page_to_subscribed_table.utm_campaign, funnel_product_page_to_subscribed_table.utm_content]
    sorts: [funnel_product_page_to_subscribed_table.product_page_visit desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 31
    col: 4
    width: 17
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "# Conversion Funnel Steps\n\nDepending on users status with their\
      \ FxA, the conversion funnel varies. For all users, there are three common steps\
      \ between groups that are plotted to monitor overall trend. Then there are three\
      \ separate plots for\n\n*  New FxA users: people who did not have a FxA before\
      \ entering the acquisition funnel \n\n* Signed off FxA users : people who had\
      \ a FxA but did not sign in before entering the funnel, existing FxA users who\
      \ were signed in before entering the funnel. \n\n* Signed in FxA users: people\
      \ who had a FxA and already signed in before entering the funnel.\n\nFor more\
      \ information about each funnel, refer to [this board](https://miro.com/app/board/o9J_lq1HHTg=/?invite_link_id=97426737166).\n\
      \nTo understand how each step in the user journey of each user group,  refer\
      \ to [this documentation](https://docs.google.com/document/d/1LpxDmkmwEHbD_7y_Qb3SKEjCLDS9j3ZoIKE4N9TU64A/edit?usp=sharing). "
    row: 73
    col: 0
    width: 24
    height: 6
  - name: Click Through Rate (CTR)  from choosing a pricing plan to start the acquisition
      process
    type: text
    title_text: Click Through Rate (CTR)  from choosing a pricing plan to start the
      acquisition process
    body_text: "The CTR is calculated as a rate of the number of people on the top\
      \ of the funnel by clicking a pricing plan in [the VPN product page](www.mozilla.org/vpn).\
      \ \n\n* **CTR (Click Through Rate in %)= (the payment page visits)/(VPN product\
      \ page visits)*100**\n\n* Using filters on the top, you can get the CTR for\
      \ a specific group. \n\n* Click the three dots on the top right of the plot\
      \ to compare the CTRs for different groups on one plot using the **Explore**\
      \ feature.  \n"
    row: 39
    col: 0
    width: 24
    height: 5
  - name: Pricing Plans Chosen while Entering the Funnel
    type: text
    title_text: Pricing Plans Chosen while Entering the Funnel
    body_text: 'Users choose one of the three pricing plans (monthly, 6 months, 12
      months) to enter the subscription flow. This chart represents the number of
      sessions that chose each plan. '
    row: 50
    col: 0
    width: 24
    height: 2
  - name: Top of the Funnel traffic by Channel Group
    type: text
    title_text: Top of the Funnel traffic by Channel Group
    body_text: 'This plot shows how many people from each channel group entered the
      acquisition funnel after landing on the VPN product page. The conversion rate
      for each group from the product page to the top of the funnel can be found in
      **CTR From Product Page Visit to Entering Subscription Flow** above using the
      channel group filter on the top.  '
    row: 58
    col: 0
    width: 24
    height: 3
  - title: Top 10 Attributions that Led to the Top of the Funnel
    name: Top 10 Attributions that Led to the Top of the Funnel
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_grid
    fields: [funnel_product_page_to_subscribed_table.channel_group, funnel_product_page_to_subscribed_table.utm_medium,
      funnel_product_page_to_subscribed_table.utm_source, funnel_product_page_to_subscribed_table.utm_campaign,
      funnel_product_page_to_subscribed_table.utm_content, funnel_product_page_to_subscribed_table.product_page_visit]
    sorts: [funnel_product_page_to_subscribed_table.product_page_visit desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Country: funnel_product_page_to_subscribed_table.country
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 67
    col: 4
    width: 17
    height: 6
  - name: Coupon Usage Monitoring
    type: text
    title_text: Coupon Usage Monitoring
    subtitle_text: ''
    body_text: "* [Suggested ways to monitor coupon usage](https://docs.google.com/document/d/1TbXKLuLmAN6Soz2o7qE3c-quz06i9qti3NfkV901X2E/edit?usp=sharing)\
      \ \n* User Tip: You may filter Coupon Code = \"is not null\" to only display\
      \ the subscriptions linked with a coupon\n* Leave comment in [this ticket](https://mozilla-hub.atlassian.net/browse/DVPN-123)\
      \ for feedback and questions. "
    row: 106
    col: 0
    width: 24
    height: 3
  - title: Coupon Applied Sessions and Acceptance Rate
    name: Coupon Applied Sessions and Acceptance Rate
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_line
    fields: [funnel_product_page_to_subscribed_table.partition_date, funnel_product_page_to_subscribed_table.discount_coupon_submit,
      funnel_product_page_to_subscribed_table.discount_coupon_success]
    fill_fields: [funnel_product_page_to_subscribed_table.partition_date]
    sorts: [funnel_product_page_to_subscribed_table.partition_date desc]
    limit: 500
    column_limit: 15
    dynamic_fields: [{category: table_calculation, expression: "${funnel_product_page_to_subscribed_table.discount_coupon_success}/${funnel_product_page_to_subscribed_table.discount_coupon_submit}",
        label: Acceptance Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: acceptance_rate, _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: Coupon Event Count, orientation: left, series: [{axisId: funnel_product_page_to_subscribed_table.discount_coupon_submit,
            id: funnel_product_page_to_subscribed_table.discount_coupon_submit, name: Discount
              Coupon Submit}, {axisId: funnel_product_page_to_subscribed_table.discount_coupon_success,
            id: funnel_product_page_to_subscribed_table.discount_coupon_success, name: Discount
              Coupon Success}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: Acceptance Rate(%), orientation: right,
        series: [{axisId: acceptance_rate, id: acceptance_rate, name: Acceptance Rate}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 100, type: linear}]
    hidden_fields:
    defaults_version: 1
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      Country: funnel_product_page_to_subscribed_table.country
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 109
    col: 9
    width: 15
    height: 7
  - title: Top 10 attributions in Coupon Submission Count
    name: Top 10 attributions in Coupon Submission Count
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_grid
    fields: [funnel_product_page_to_subscribed_table.channel_group, funnel_product_page_to_subscribed_table.utm_medium,
      funnel_product_page_to_subscribed_table.utm_source, funnel_product_page_to_subscribed_table.utm_campaign,
      funnel_product_page_to_subscribed_table.utm_content, funnel_product_page_to_subscribed_table.coupon_code,
      funnel_product_page_to_subscribed_table.discount_coupon_submit]
    sorts: [funnel_product_page_to_subscribed_table.channel_group]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      Country: funnel_product_page_to_subscribed_table.country
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 116
    col: 9
    width: 15
    height: 7
  - title: Top 10 attributions in Coupon Success Count
    name: Top 10 attributions in Coupon Success Count
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    type: looker_grid
    fields: [funnel_product_page_to_subscribed_table.channel_group, funnel_product_page_to_subscribed_table.utm_medium,
      funnel_product_page_to_subscribed_table.utm_source, funnel_product_page_to_subscribed_table.utm_campaign,
      funnel_product_page_to_subscribed_table.utm_content, funnel_product_page_to_subscribed_table.coupon_code,
      funnel_product_page_to_subscribed_table.discount_coupon_success]
    sorts: [funnel_product_page_to_subscribed_table.channel_group]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    defaults_version: 1
    series_types: {}
    listen:
      Partition Date: funnel_product_page_to_subscribed_table.partition_date
      Country: funnel_product_page_to_subscribed_table.country
      UTM Medium: funnel_product_page_to_subscribed_table.utm_medium
      UTM Source: funnel_product_page_to_subscribed_table.utm_source
      UTM Campaign: funnel_product_page_to_subscribed_table.utm_campaign
      UTM Content: funnel_product_page_to_subscribed_table.utm_content
      UTM Term: funnel_product_page_to_subscribed_table.utm_term
      Entrypoint Experiment: funnel_product_page_to_subscribed_table.entrypoint_experiment
      Entrypoint Variation: funnel_product_page_to_subscribed_table.entrypoint_variation
      Pricing Plan: funnel_product_page_to_subscribed_table.pricing_plan
      OS Name: funnel_product_page_to_subscribed_table.os_name
      OS Version: funnel_product_page_to_subscribed_table.os_version
      Coupon Code: funnel_product_page_to_subscribed_table.coupon_code
      Channel Group: funnel_product_page_to_subscribed_table.channel_group
    row: 123
    col: 9
    width: 15
    height: 8
  - name: Coupon submissions associated with attributions
    type: text
    title_text: Coupon submissions associated with attributions
    subtitle_text: ''
    body_text: 'This is the session counts in the filtered range of *Partition Date*
      for **Coupon Submission**. '
    row: 116
    col: 0
    width: 9
    height: 7
  - name: Coupon Success associated with attributions
    type: text
    title_text: Coupon Success associated with attributions
    subtitle_text: ''
    body_text: 'This is the session counts in the filtered range of *Partition Date*
      where **a coupon was successfully applied**. '
    row: 123
    col: 0
    width: 9
    height: 8
  - name: 'Coupon Application Event Tracking '
    type: text
    title_text: 'Coupon Application Event Tracking '
    subtitle_text: ''
    body_text: 'This tile tracks the number of sessions using flow ids when a coupon
      was submitted and/or was successfully applied. The acceptance rate is the ratio
      of the number of sessions that have a coupon successfully applied over the ones
      that have a coupon submitted in percent. '
    row: 109
    col: 0
    width: 9
    height: 7
  filters:
  - name: Partition Date
    title: Partition Date
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: []
    field: funnel_product_page_to_subscribed_table.partition_date
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Channel Group, Entrypoint Variation, Entrypoint Experiment,
      Pricing Plan, UTM Medium, UTM Source, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.country
  - name: Channel Group
    title: Channel Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Entrypoint Variation, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.channel_group
  - name: UTM Medium
    title: UTM Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Source, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.utm_medium
  - name: UTM Source
    title: UTM Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Medium, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.utm_source
  - name: UTM Campaign
    title: UTM Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Medium, UTM Source, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.utm_campaign
  - name: UTM Content
    title: UTM Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, Coupon Code]
    field: funnel_product_page_to_subscribed_table.utm_content
  - name: UTM Term
    title: UTM Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Channel Group, Entrypoint Variation, Entrypoint Experiment,
      Pricing Plan, UTM Medium, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.utm_term
  - name: Entrypoint Experiment
    title: Entrypoint Experiment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.entrypoint_experiment
  - name: Entrypoint Variation
    title: Entrypoint Variation
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content, Coupon Code]
    field: funnel_product_page_to_subscribed_table.entrypoint_variation
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
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [Country, Channel Group, UTM Campaign]
    field: funnel_product_page_to_subscribed_table.pricing_plan
  - name: OS Name
    title: OS Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: []
    field: funnel_product_page_to_subscribed_table.os_name
  - name: OS Version
    title: OS Version
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: [OS Name]
    field: funnel_product_page_to_subscribed_table.os_version
  - name: Coupon Code
    title: Coupon Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: funnel_product_page_to_subscribed_table
    listens_to_filters: []
    field: funnel_product_page_to_subscribed_table.coupon_code
