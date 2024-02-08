- dashboard: vpn_acquisition_funnel_view__new_subscriptions_desktop_only
  title: VPN Acquisition Funnel View - New Subscriptions (Desktop Only)
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 day
  preferred_slug: kSalxjVzDnlCtQy4gO69C7
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #FFFFFF; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #000000; padding: 5px 10px; float: left; height: 40px;" src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg"/>

        <a style="color: #000000; border: 1px solid white; padding: 5px 80px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/501?Partition+Date=28+day&Country=&Channel+Group=&UTM+Medium=&UTM+Source=&UTM+Campaign=&UTM+Content=&UTM+Term=&Entrypoint+Experiment=&Entrypoint+Variation=&Pricing+Plan=&OS+Name=&OS+Version=">

      User Journey</a>

        <a style="color: #000000; padding: 5px 80px; float: left; line-height: 40px;font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/499?Start%20Date=28%20day&Country=&Channel%20Group=&Provider=&Pricing%20Plan=&UTM%20Medium=&UTM%20Source=&UTM%20Campaign=&UTM%20Content=&Entrypoint%20Experiment=&Entrypoint%20Variation=">

       New Subs</a>

        <a style="color: #000000; padding: 5px 80px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1_l-ZsbKsxRh7HGqtODz8w8eDBqkw2N9SIZxEE9qG-DQ/edit?usp=sharing">

        Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 22
    height: 2
  - title: Last Updated Date
    name: Last Updated Date
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: single_value
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count]
    sorts: [channel_group_proportions_table.subscription_start_date desc]
    limit: 2
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
    hidden_fields: [channel_group_proportions_table.new_subscription_count]
    refresh: 1 day
    listen:
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Region Name: countries.region_name
    row: 4
    col: 0
    width: 7
    height: 4
  - title: New Subscriptions on the Last Updated Date
    name: New Subscriptions on the Last Updated Date
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: single_value
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count,
      channel_group_proportions_table]
    sorts: [channel_group_proportions_table.subscription_start_date desc]
    limit: 2
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: Difference between the current row’s value and value of the row
        below, divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_difference_from_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: since the previous day
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [channel_group_proportions_table]
    refresh: 1 day
    listen:
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 4
    col: 7
    width: 8
    height: 4
  - title: New Subscriptions by Pricing Plan
    name: New Subscriptions by Pricing Plan
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_pie
    fields: [channel_group_proportions_table.new_subscription_count, channel_group_proportions_table.pricing_plan]
    sorts: [channel_group_proportions_table.new_subscription_count desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-apple - channel_group_proportions_table.new_subscription_count,
            name: 1-month-apple}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-cad-12.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-cad-12.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-chf-10.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-chf-10.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-eur-9.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-eur-9.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-gbp-8.49 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-gbp-8.49}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-myr-44.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-myr-44.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-nzd-15.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-nzd-15.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-sgd-13.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-sgd-13.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-usd-4.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-usd-4.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-month-usd-9.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-month-usd-9.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-apple - channel_group_proportions_table.new_subscription_count,
            name: 1-year-apple}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-cad-74.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-cad-74.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-chf-71.88 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-chf-71.88}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-eur-59.88 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-eur-59.88}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-gbp-51.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-gbp-51.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-myr-269.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-myr-269.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-nzd-99.99 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-nzd-99.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-sgd-86.98 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-sgd-86.98}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 1-year-usd-59.88 - channel_group_proportions_table.new_subscription_count,
            name: 1-year-usd-59.88}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-apple - channel_group_proportions_table.new_subscription_count,
            name: 6-month-apple}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-cad-59.99 - channel_group_proportions_table.new_subscription_count,
            name: 6-month-cad-59.99}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-chf-47.94 - channel_group_proportions_table.new_subscription_count,
            name: 6-month-chf-47.94}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-eur-41.94 - channel_group_proportions_table.new_subscription_count,
            name: 6-month-eur-41.94}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-gbp-41.49 - channel_group_proportions_table.new_subscription_count,
            name: 6-month-gbp-41.49}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: 6-month-usd-47.94 - channel_group_proportions_table.new_subscription_count,
            name: 6-month-usd-47.94}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    refresh: 1 day
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 8
    col: 11
    width: 11
    height: 7
  - title: New Subscriptions by Country
    name: New Subscriptions by Country
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_pie
    fields: [channel_group_proportions_table.new_subscription_count, channel_group_proportions_table.country_name]
    sorts: [channel_group_proportions_table.new_subscription_count desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    defaults_version: 1
    refresh: 1 day
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 8
    col: 0
    width: 11
    height: 7
  - name: Daily Subscriptions Proportion Rate of Each Channel Group
    type: text
    title_text: Daily Subscriptions Proportion Rate of Each Channel Group
    body_text: "This plot shows how daily subscriptions consist of traffic from each\
      \ channel group. It can be used to answer questions like what percent of new\
      \ subscriptions is led by the direct traffic. \n\nMoreover, we can also use\
      \ this plot to detect a sign of a potential problem in the data generating system.\
      \ The **unattributed** and **miscellaneous** subscriptions may be due to the\
      \ logging system missing a part or all of utm parameters consisting of attributions.\
      \ If the rates of those two groups increase, then it can be a sign of a problem\
      \ for the system passing the data. "
    row: 50
    col: 0
    width: 22
    height: 3
  - name: Subscriptions Categorized by Channel Group
    type: text
    title_text: Subscriptions Categorized by Channel Group
    subtitle_text: ''
    body_text: "The channel groups are categorized using the UTM attributions ( medium,\
      \ source, campaign, content). The categorization rules were based on the Marketing\
      \ UTM Parameters - 2021 H2 spreadsheet.\n\n* Direct: traffic led to the VPN\
      \ product page without a campaign attribution. In a web browser, when users\
      \ visit by entering mozilla.org/vpn to the URL bar or there is no campaign UTM\
      \ parameter set passed, they are attributed with (**medium** = `referral` ,\
      \ **source** = `www.mozilla.org-vpn-product-page` , **campaign** = `vpn-product-page`).\
      \  \n* Marketing owned: traffic led by the marketing owned media campaigns (ex.\
      \ Blog.mozilla.org, whatsnew)\n* Marketing paid: traffic led by the paid campaign\
      \ (ex. SEM)\n* Product owned: traffic led by the product owned media campaigns\
      \ (ex. Firefox browser)\n* Unattributed: traffic led with no attribution\n*\
      \ Miscellaneous: traffic led with some attributions that could not be categorized.\
      \ It could be that some of the attribution parameters got lost or attributions\
      \ that were not well documented.  \n* For a more detailed explanation for the\
      \ categorization of the channel groups, please refer to [this documentation](https://docs.google.com/document/d/1ojf1XHb3Iu5GNzMfozDcxWhEw6d9A4QuiaoAm-gDIrk/edit?usp=sharing). "
    row: 29
    col: 0
    width: 22
    height: 5
  - title: Subscription Proportion Rate of Each Channel Group
    name: Subscription Proportion Rate of Each Channel Group
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.total_channel_group_percent_for_date,
      channel_group_proportions_table.channel_group]
    pivots: [channel_group_proportions_table.channel_group]
    filters: {}
    sorts: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.channel_group]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: Difference between the current row’s value and value of the row
        below, divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Cumulative sum of this row and all previous rows in the column
      label: Running row total New Subs
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: running_row_total_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: proportion rate (%), orientation: left, series: [{axisId: channel_group_proportions_table.total_channel_group_percent_for_date,
            id: Marketing Owned Media Channels - channel_group_proportions_table.total_channel_group_percent_for_date,
            name: Marketing Owned Media Channels}, {axisId: channel_group_proportions_table.total_channel_group_percent_for_date,
            id: Owned In-Product Channels - channel_group_proportions_table.total_channel_group_percent_for_date,
            name: Owned In-Product Channels}, {axisId: channel_group_proportions_table.total_channel_group_percent_for_date,
            id: Paid Channels - channel_group_proportions_table.total_channel_group_percent_for_date,
            name: Paid Channels}, {axisId: channel_group_proportions_table.total_channel_group_percent_for_date,
            id: Unpaid Channels - channel_group_proportions_table.total_channel_group_percent_for_date,
            name: Unpaid Channels}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 94, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      Direct - channel_group_proportions_table.total_channel_group_percent_for_date: area
      Marketing Owned - channel_group_proportions_table.total_channel_group_percent_for_date: area
    defaults_version: 1
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 53
    col: 0
    width: 22
    height: 7
  - title: Top 10 Attributions with the Most Subscriptions
    name: Top 10 Attributions with the Most Subscriptions
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_grid
    fields: [channel_group_proportions_table.new_subscription_count, channel_group_proportions_table.channel_group,
      channel_group_proportions_table.utm_medium, channel_group_proportions_table.utm_source,
      channel_group_proportions_table.utm_campaign, channel_group_proportions_table.utm_content]
    sorts: [channel_group_proportions_table.new_subscription_count desc]
    limit: 10
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: "% change of the previous row \nDifference between the current\
        \ row’s value and value of the row below, divided by the value of the row\
        \ below."
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Cumulative sum of this row and all previous rows in the column
      label: Running Total New Subs
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: running_total_new_subs
      args:
      - channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      channel_group_proportions_table.new_subscription_count:
        is_active: true
    defaults_version: 1
    hidden_fields: []
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 60
    col: 0
    width: 22
    height: 6
  - title: Subscriptions by Channel Group
    name: Subscriptions by Channel Group
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count,
      channel_group_proportions_table.channel_group]
    pivots: [channel_group_proportions_table.channel_group]
    filters: {}
    sorts: [channel_group_proportions_table.channel_group, channel_group_proportions_table.subscription_start_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: Cumulative sum of this row and all previous rows in the column
      label: Running Total New Subs
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: running_total_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Difference between the current row’s value and value of the row
        below, divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
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
    interpolation: monotone
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: Marketing Owned Media Channels - channel_group_proportions_table.new_subscription_count,
            name: Marketing Owned Media Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Owned In-Product Channels - channel_group_proportions_table.new_subscription_count,
            name: Owned In-Product Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Paid Channels - channel_group_proportions_table.new_subscription_count,
            name: Paid Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Unpaid Channels - channel_group_proportions_table.new_subscription_count,
            name: Unpaid Channels}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 97, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 34
    col: 0
    width: 11
    height: 8
  - title: New Subscriptions during Filtered Days
    name: New Subscriptions during Filtered Days
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: single_value
    fields: [channel_group_proportions_table.new_subscription_count]
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
    defaults_version: 1
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 4
    col: 15
    width: 7
    height: 4
  - title: Accumulative Subscriptions
    name: Accumulative Subscriptions
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table]
    fill_fields: [channel_group_proportions_table.subscription_start_date]
    sorts: [channel_group_proportions_table.subscription_start_date]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: cumulative sum of new subscriptions
      label: Accumulative subscriptions
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: accumulative_subscriptions
      args:
      - channel_group_proportions_table
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      description: Current row’s value divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_0
      calculation_type: percent_of_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
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
    y_axes: [{label: New Subscriptions, orientation: left, series: [{axisId: accumulative_subscriptions,
            id: accumulative_subscriptions, name: Accumulative subscriptions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 100,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: change_new_subs,
            id: change_new_subs, name: "% Change New Subs"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 100, type: linear}]
    trend_lines: []
    defaults_version: 1
    hidden_fields: [channel_group_proportions_table]
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 15
    col: 11
    width: 11
    height: 7
  - title: New Subscriptions
    name: New Subscriptions
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count]
    fill_fields: [channel_group_proportions_table.subscription_start_date]
    sorts: [channel_group_proportions_table.subscription_start_date desc]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: Cumulative sum of this row and all previous rows in the column
      label: Running Total New Subs
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: running_total_new_subs
      args:
      - channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Current row’s value divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_of_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: channel_group_proportions_table.new_subscription_count, name: New
              Subscriptions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: change_new_subs, id: change_new_subs,
            name: "% Change New Subs"}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}]
    defaults_version: 1
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 15
    col: 0
    width: 11
    height: 7
  - title: New Subscription by Provider
    name: New Subscription by Provider
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.new_subscription_count, channel_group_proportions_table.provider,
      channel_group_proportions_table.subscription_start_date]
    pivots: [channel_group_proportions_table.provider]
    fill_fields: [channel_group_proportions_table.subscription_start_date]
    filters: {}
    sorts: [channel_group_proportions_table.subscription_start_date desc, channel_group_proportions_table.provider]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: Apple Store IAP - channel_group_proportions_table.new_subscription_count,
            name: Apple Store IAP}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: FxA Paypal - channel_group_proportions_table.new_subscription_count,
            name: FxA Paypal}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: FxA Stripe - channel_group_proportions_table.new_subscription_count,
            name: FxA Stripe}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Google Play - channel_group_proportions_table.new_subscription_count,
            name: Google Play}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}]
    defaults_version: 1
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 22
    col: 0
    width: 11
    height: 7
  - title: Daily Trend of Subscriptions Categorized by Coupons
    name: Daily Trend of Subscriptions Categorized by Coupons
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count,
      channel_group_proportions_table.coupon_code]
    pivots: [channel_group_proportions_table.coupon_code]
    fill_fields: [channel_group_proportions_table.subscription_start_date]
    sorts: [channel_group_proportions_table.subscription_start_date desc, channel_group_proportions_table.coupon_code]
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: TEST10 - channel_group_proportions_table.new_subscription_count, name: TEST10},
          {axisId: channel_group_proportions_table.new_subscription_count, id: channel_group_proportions_table.coupon_code___null
              - channel_group_proportions_table.new_subscription_count, name: "∅"}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 100, type: linear}]
    defaults_version: 1
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 69
    col: 0
    width: 22
    height: 7
  - name: Coupon Usage Monitoring
    type: text
    title_text: Coupon Usage Monitoring
    body_text: "* [Suggested ways to monitor coupon usage](https://docs.google.com/document/d/1TbXKLuLmAN6Soz2o7qE3c-quz06i9qti3NfkV901X2E/edit?usp=sharing)\n\
      * User Tip: You may filter Coupon Code = \"is not null\" to only display the\
      \ subscriptions linked with a coupon\n* Leave a comment in [this ticket](https://mozilla-hub.atlassian.net/browse/DVPN-123)\
      \ for feedback and questions. "
    row: 66
    col: 0
    width: 22
    height: 3
  - title: 'Top 10 Total Subscriptions by Attributions and Coupon Codes '
    name: 'Top 10 Total Subscriptions by Attributions and Coupon Codes '
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_grid
    fields: [channel_group_proportions_table.utm_campaign, channel_group_proportions_table.utm_content,
      channel_group_proportions_table.utm_medium, channel_group_proportions_table.utm_source,
      channel_group_proportions_table.coupon_code, channel_group_proportions_table.new_subscription_count]
    sorts: [channel_group_proportions_table.new_subscription_count desc]
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
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 76
    col: 0
    width: 22
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      Contact @yeonjoo for questions in #pxi-data

      Caveat: **the default setting** of this dashboard filters only show  first time subscribers (i.e. Granular event type = 'New') who purchased a subscription through the website. The recorded attributions in this dashboard are for the web subscription flow and only the attributions for the first time subscribers are correct. To monitor total subscription growth , please refer to [VPN SaaSboard - Subscriptions Growth](https://mozilla.cloud.looker.com/dashboards/416?Provider=&Pricing%20Plan=&Country=&Event%20Date=6%20month&Plan%20Interval%20Type=&Granular%20Event%20Type=-Plan%20Change)
    row: 2
    col: 0
    width: 22
    height: 2
  - title: Subscriptions by Channel Group
    name: Subscriptions by Channel Group (2)
    model: mozilla_vpn
    explore: channel_group_proportions_table
    type: looker_line
    fields: [channel_group_proportions_table.subscription_start_date, channel_group_proportions_table.new_subscription_count,
      channel_group_proportions_table.channel_group]
    pivots: [channel_group_proportions_table.channel_group]
    filters: {}
    sorts: [channel_group_proportions_table.channel_group, channel_group_proportions_table.subscription_start_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: New Subscriptions
      value_format:
      value_format_name:
      based_on: channel_group_proportions_table.new_subscription_count
      _kind_hint: measure
      measure: channel_group_proportions_table
      type: sum
      _type_hint: number
    - category: table_calculation
      description: Cumulative sum of this row and all previous rows in the column
      label: Running Total New Subs
      value_format:
      value_format_name: Default formatting
      calculation_type: running_total
      table_calculation: running_total_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Difference between the current row’s value and value of the row
        below, divided by the value of the row below.
      label: "% Change New Subs"
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: change_new_subs
      args:
      - channel_group_proportions_table
      _kind_hint: dimension
      _type_hint: number
      is_disabled: true
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
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: channel_group_proportions_table.new_subscription_count,
            id: Marketing Owned Media Channels - channel_group_proportions_table.new_subscription_count,
            name: Marketing Owned Media Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Owned In-Product Channels - channel_group_proportions_table.new_subscription_count,
            name: Owned In-Product Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Paid Channels - channel_group_proportions_table.new_subscription_count,
            name: Paid Channels}, {axisId: channel_group_proportions_table.new_subscription_count,
            id: Unpaid Channels - channel_group_proportions_table.new_subscription_count,
            name: Unpaid Channels}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 97, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Start Date: channel_group_proportions_table.subscription_start_date
      Country: channel_group_proportions_table.country_name
      Provider: channel_group_proportions_table.provider
      Pricing Plan: channel_group_proportions_table.pricing_plan
      UTM Medium: channel_group_proportions_table.utm_medium
      UTM Source: channel_group_proportions_table.utm_source
      UTM Campaign: channel_group_proportions_table.utm_campaign
      UTM Content: channel_group_proportions_table.utm_content
      Entrypoint Experiment: channel_group_proportions_table.entrypoint_experiment
      Entrypoint Variation: channel_group_proportions_table.entrypoint_variation
      Coupon Code: channel_group_proportions_table.coupon_code
      Channel Group: channel_group_proportions_table.channel_group
      Granular Event Type: channel_group_proportions_table.granular_event_type
      Subregion Name: countries.subregion_name
      Region Name: countries.region_name
    row: 42
    col: 0
    width: 11
    height: 8
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: []
    field: channel_group_proportions_table.subscription_start_date
  - name: Region Name
    title: Region Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: []
    field: countries.region_name
  - name: Subregion Name
    title: Subregion Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: [Region Name]
    field: countries.subregion_name
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
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Channel Group, Provider, Pricing Plan, UTM Source,
      Entrypoint Variation, Coupon Code, Subregion Name, Region Name]
    field: channel_group_proportions_table.country_name
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
    explore: channel_group_proportions_table
    listens_to_filters: [UTM Medium, UTM Source, Entrypoint Variation, Coupon Code]
    field: channel_group_proportions_table.channel_group
  - name: Provider
    title: Provider
    type: field_filter
    default_value: Paypal,Stripe
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Pricing Plan, Coupon Code]
    field: channel_group_proportions_table.provider
  - name: Pricing Plan
    title: Pricing Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: [Country, Provider, Coupon Code]
    field: channel_group_proportions_table.pricing_plan
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
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Source,
      Entrypoint Experiment, Entrypoint Variation, Coupon Code]
    field: channel_group_proportions_table.utm_medium
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
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      Entrypoint Experiment, Entrypoint Variation, Coupon Code]
    field: channel_group_proportions_table.utm_source
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
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      UTM Source, Entrypoint Experiment, Entrypoint Variation, Coupon Code]
    field: channel_group_proportions_table.utm_campaign
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
    explore: channel_group_proportions_table
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      UTM Source, Entrypoint Experiment, Entrypoint Variation, Coupon Code]
    field: channel_group_proportions_table.utm_content
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
    explore: channel_group_proportions_table
    listens_to_filters: [Country, Channel Group, UTM Medium, Entrypoint Variation,
      Coupon Code]
    field: channel_group_proportions_table.entrypoint_experiment
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
    explore: channel_group_proportions_table
    listens_to_filters: [Country, Channel Group, UTM Medium, Entrypoint Experiment,
      Coupon Code]
    field: channel_group_proportions_table.entrypoint_variation
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
    explore: channel_group_proportions_table
    listens_to_filters: []
    field: channel_group_proportions_table.coupon_code
  - name: Granular Event Type
    title: Granular Event Type
    type: field_filter
    default_value: New
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: mozilla_vpn
    explore: channel_group_proportions_table
    listens_to_filters: []
    field: channel_group_proportions_table.granular_event_type
