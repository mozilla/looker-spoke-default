- dashboard: new_subscriptions
  title: New Subscriptions
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 day
  elements:
  - title: Last Updated Date
    name: Last Updated Date
    model: mozilla_vpn
    explore: new_subscriptions
    type: single_value
    fields: [new_subscriptions.start_date, new_subscriptions.Daily_New_Subscriptions]
    sorts: [new_subscriptions.start_date desc]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [new_subscriptions.Daily_New_Subscriptions]
    refresh: 1 day
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 3
  - title: Daily New Subscriptions
    name: Daily New Subscriptions
    model: mozilla_vpn
    explore: new_subscriptions
    type: single_value
    fields: [new_subscriptions.start_date, new_subscriptions.New_Subscriptions]
    sorts: [new_subscriptions.start_date desc]
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
    series_types: {}
    defaults_version: 1
    refresh: 1 day
    listen:
      UTM Content: new_subscriptions.UTM_content
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 0
    col: 7
    width: 8
    height: 3
  - title: New Subscriptions by Pricing Plan
    name: New Subscriptions by Pricing Plan
    model: mozilla_vpn
    explore: new_subscriptions
    type: looker_pie
    fields: [new_subscriptions.pricing_plan, new_subscriptions.New_Subscriptions]
    sorts: [new_subscriptions.New_Subscriptions desc]
    limit: 500
    value_labels: labels
    label_type: labPer
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    refresh: 1 day
    listen:
      UTM Content: new_subscriptions.UTM_content
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 3
    col: 12
    width: 12
    height: 6
  - title: New Subscriptions by Country
    name: New Subscriptions by Country
    model: mozilla_vpn
    explore: new_subscriptions
    type: looker_pie
    fields: [new_subscriptions.New_Subscriptions, new_subscriptions.country]
    sorts: [new_subscriptions.New_Subscriptions desc]
    limit: 500
    value_labels: labels
    label_type: labPer
    series_types: {}
    defaults_version: 1
    refresh: 1 day
    listen:
      UTM Content: new_subscriptions.UTM_content
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 3
    col: 0
    width: 12
    height: 6
  - name: Daily Subscriptions Proportion Rate of Each Channel Group
    type: text
    title_text: Daily Subscriptions Proportion Rate of Each Channel Group
    subtitle_text: ''
    body_text: "This plot shows how daily subscriptions consist of traffics from each\
      \ channel group. It can be used to answer questions like what percent of new\
      \ subscriptions is led by the direct traffic. \n\nMoreover, we can also use\
      \ this plot to detect a sign of a potential problem in the data generating system.\
      \ The **unattributed** and **miscellaneous** subscriptions may be due to the\
      \ logging system missing a part or all or attributions. If the rates of those\
      \ two groups increase, then it can be a sign of a problem for the system passing\
      \ the data. "
    row: 25
    col: 0
    width: 24
    height: 4
  - name: Subscriptions Grouped by Channel Group
    type: text
    title_text: Subscriptions Grouped by Channel Group
    subtitle_text: ''
    body_text: "The channel groups are categorized using the UTM attributions ( medium,\
      \ source, campaign, content). The categorization rule was based on the Marketing\
      \ UTM Parameters - 2021 H2 spreadsheet.\n\n* Direct: direct traffic led by putting\
      \ the product site address on a url bar. For direct traffic, the default set\
      \ of utm parameters are passed from Bedrock. \nThe default set of utm parameters\
      \ are\n**medium = `referral` , source = `www.mozilla.org-vpn-product-page` ,\
      \ campaign = `vpn-product-page`**. \n\n* Organic: traffic led by finding the\
      \ site through a search engine (ex. google). The **organic traffic is identified\
      \ by the medium parameter values being `organic` or `organic-search`.**\n\n\
      * Marketing_owned: traffic led by the marketing owned media campaigns (ex. Blog.mozilla.org,\
      \ whatsnew)\n\n* Marketing_paid: traffic led by the paid campaign(ex. SEM)\n\
      \n* Product_owned: traffic led by the product owned media campaigns (ex. Firefox\
      \ browser)\n\n* Unattributed: traffic led with no attribution\n\n* Miscellaneous:\
      \ traffic led with some attributions that could not be categorized. It could\
      \ be that some of the attribution parameters got lost or attributions that were\
      \ not well documented.\n\n* For more detailed explanation for the categorization\
      \ of the channel groups, please refer to [this documentation](https://docs.google.com/document/d/1ojf1XHb3Iu5GNzMfozDcxWhEw6d9A4QuiaoAm-gDIrk/edit?usp=sharing). "
    row: 9
    col: 0
    width: 24
    height: 9
  - title: Subscription Proportion Rate by Each Channel Group
    name: Subscription Proportion Rate by Each Channel Group
    model: mozilla_vpn
    explore: new_subscriptions
    type: looker_line
    fields: [new_subscriptions.start_date, new_subscriptions.channel_group_proportion,
      new_subscriptions.Channel_group]
    pivots: [new_subscriptions.Channel_group]
    sorts: [new_subscriptions.start_date, new_subscriptions.Channel_group]
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
    y_axes: [{label: proportion rate (%), orientation: left, series: [{axisId: new_subscriptions.channel_group_proportion,
            id: Marketing Owned Media Channels - new_subscriptions.channel_group_proportion,
            name: Marketing Owned Media Channels}, {axisId: new_subscriptions.channel_group_proportion,
            id: Owned In-Product Channels - new_subscriptions.channel_group_proportion,
            name: Owned In-Product Channels}, {axisId: new_subscriptions.channel_group_proportion,
            id: Paid Channels - new_subscriptions.channel_group_proportion, name: Paid
              Channels}, {axisId: new_subscriptions.channel_group_proportion, id: Unpaid
              Channels - new_subscriptions.channel_group_proportion, name: Unpaid
              Channels}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 94, type: linear}]
    defaults_version: 1
    listen:
      UTM Content: new_subscriptions.UTM_content
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 29
    col: 3
    width: 19
    height: 7
  - title: Top 10 Attributions with the Most Subscriptions
    name: Top 10 Attributions with the Most Subscriptions
    model: mozilla_vpn
    explore: new_subscriptions
    type: looker_grid
    fields: [new_subscriptions.New_Subscriptions, new_subscriptions.Channel_group,
      new_subscriptions.UTM_medium, new_subscriptions.UTM_source, new_subscriptions.UTM_campaign,
      new_subscriptions.UTM_content]
    sorts: [new_subscriptions.New_Subscriptions desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      new_subscriptions.New_Subscriptions:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      UTM Content: new_subscriptions.UTM_content
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 36
    col: 3
    width: 19
    height: 6
  - title: Subscriptions by Channel Group
    name: Subscriptions by Channel Group
    model: mozilla_vpn
    explore: new_subscriptions
    type: looker_line
    fields: [new_subscriptions.start_date, new_subscriptions.New_Subscriptions, new_subscriptions.Channel_group]
    pivots: [new_subscriptions.Channel_group]
    sorts: [new_subscriptions.start_date desc, new_subscriptions.Channel_group]
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: new_subscriptions.New_Subscriptions,
            id: Marketing Owned Media Channels - new_subscriptions.New_Subscriptions,
            name: Marketing Owned Media Channels}, {axisId: new_subscriptions.New_Subscriptions,
            id: Owned In-Product Channels - new_subscriptions.New_Subscriptions, name: Owned
              In-Product Channels}, {axisId: new_subscriptions.New_Subscriptions,
            id: Paid Channels - new_subscriptions.New_Subscriptions, name: Paid Channels},
          {axisId: new_subscriptions.New_Subscriptions, id: Unpaid Channels - new_subscriptions.New_Subscriptions,
            name: Unpaid Channels}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 97, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      UTM Content: new_subscriptions.UTM_content
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 18
    col: 3
    width: 19
    height: 7
  - title: Total Subscriptions
    name: Total Subscriptions
    model: mozilla_vpn
    explore: new_subscriptions
    type: single_value
    fields: [new_subscriptions.New_Subscriptions]
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
    series_types: {}
    defaults_version: 1
    listen:
      Start Date: new_subscriptions.start_date
      Country: new_subscriptions.country
      Channel Group: new_subscriptions.Channel_group
      Provider: new_subscriptions.provider
      Pricing Plan: new_subscriptions.pricing_plan
      UTM Medium: new_subscriptions.UTM_medium
      UTM Source: new_subscriptions.UTM_source
      Entrypoint Experiment: new_subscriptions.entrypoint_experiment
      Entrypoint Variation: new_subscriptions.entrypoint_variation
      UTM Campaign: new_subscriptions.UTM_campaign
    row: 0
    col: 15
    width: 7
    height: 3
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 14 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: []
    field: new_subscriptions.start_date
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Start Date, Channel Group, Provider, Pricing Plan, UTM Source,
      Entrypoint Variation]
    field: new_subscriptions.country
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
    explore: new_subscriptions
    listens_to_filters: [UTM Medium, UTM Source, Entrypoint Variation]
    field: new_subscriptions.Channel_group
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
    explore: new_subscriptions
    listens_to_filters: [Start Date, Pricing Plan]
    field: new_subscriptions.provider
  - name: Pricing Plan
    title: Pricing Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Country, Provider]
    field: new_subscriptions.pricing_plan
  - name: UTM Medium
    title: UTM Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Source,
      Entrypoint Experiment, Entrypoint Variation]
    field: new_subscriptions.UTM_medium
  - name: UTM Source
    title: UTM Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      Entrypoint Experiment, Entrypoint Variation]
    field: new_subscriptions.UTM_source
  - name: UTM Campaign
    title: UTM Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      UTM Source, Entrypoint Experiment, Entrypoint Variation]
    field: new_subscriptions.UTM_campaign
  - name: UTM Content
    title: UTM Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Start Date, Country, Channel Group, Pricing Plan, UTM Medium,
      UTM Source, Entrypoint Experiment, Entrypoint Variation]
    field: new_subscriptions.UTM_content
  - name: Entrypoint Experiment
    title: Entrypoint Experiment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Country, Channel Group, UTM Medium, Entrypoint Variation]
    field: new_subscriptions.entrypoint_experiment
  - name: Entrypoint Variation
    title: Entrypoint Variation
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_subscriptions
    listens_to_filters: [Country, Channel Group, UTM Medium, Entrypoint Experiment]
    field: new_subscriptions.entrypoint_variation
