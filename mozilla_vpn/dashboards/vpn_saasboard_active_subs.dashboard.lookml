- dashboard: vpn_saasboard__active_subscriptions
  title: VPN SaaSboard - Active Subscriptions
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  elements:
  - title: Active Subscriptions (Daily)
    name: Active Subscriptions (Daily)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_line
    fields: [active_subscriptions.active_date, active_subscriptions.count_sum]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: Date
    label_value_format: ''
    series_types: {}
    x_axis_datetime_label: "%d-%b-'%y"
    defaults_version: 1
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 8
    col: 8
    width: 16
    height: 11
  - title: Current Active Subscriptions
    name: Current Active Subscriptions
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
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
    custom_color: ''
    single_value_title: ''
    conditional_formatting: [{type: greater than, value: 0, background_color: "#bcb8ff",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 8
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    title_text: ''
    body_text: |2


      <img src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg" width="160" height="50" align="center"/>
    row: 2
    col: 0
    width: 3
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='background-color: #ffffdd; padding: 5px 10px; border:\
      \ solid 3px #ededed; border-radius: 5px; height:150px'>\n\nThis dashboard captures\
      \ the current state and monthly trend of <strong>active subscriptions</strong>.\n\
      \n<ul>\n<li>\nActive subscriptions are paid subscriptions at a moment in time.\
      \  \n</li>\n</ul>\n<br>\n\nPlease submit any questions in  <b><a href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\"\
      >mozilla-vpn-data</a></b> channel on Slack for @wichan or @relud. \n\n</div>"
    row: 2
    col: 3
    width: 16
    height: 4
  - title: Current Active Date
    name: Current Active Date
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.active_date]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Most Recent Data Included
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#cdbfff",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: below
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 2
    col: 19
    width: 5
    height: 4
  - title: Monthly Active Subscriptions (by Country)
    name: Monthly Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.country_name, active_subscriptions.active_month]
    pivots: [active_subscriptions.country_name]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.country_name desc, active_subscriptions.count_sum desc 0]
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
    x_axis_label: Month
    series_types: {}
    series_colors:
      USA - active_subscriptions.count_sum: "#347be3"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: "Country is based on customer billing address.\n\nSubscription counts\
      \ on month end dates except for most current month which may not have reached\
      \ month end. "
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 31
    col: 0
    width: 8
    height: 13
  - title: Monthly Active Subscriptions (by Plan)
    name: Monthly Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.pricing_plan, active_subscriptions.active_month]
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
    x_axis_label: Month
    series_types: {}
    series_colors:
      1-month-usd-4.99 - active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - active_subscriptions.count_sum: "#82a6a8"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 31
    col: 8
    width: 8
    height: 13
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Current Active Subscriptions</b></h3>
    row: 6
    col: 0
    width: 24
    height: 2
  - name: " "
    type: text
    title_text: " "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Country</b></h3>
    row: 19
    col: 0
    width: 8
    height: 3
  - title: Monthly Active Subscriptions (by Provider)
    name: Monthly Active Subscriptions (by Provider)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.active_month, active_subscriptions.provider]
    pivots: [active_subscriptions.provider]
    fill_fields: [active_subscriptions.active_month]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.count_sum desc 0, active_subscriptions.provider desc]
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
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    x_axis_label: Month
    series_types: {}
    series_colors: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 31
    col: 16
    width: 8
    height: 13
  - title: New Tile
    name: New Tile
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${active_subscriptions.count_sum}-offset(${active_subscriptions.count_sum},\
          \ 1))", label: delta_1_day, value_format: !!null '', value_format_name: '',
        _kind_hint: measure, table_calculation: delta_1_day, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: delta 1 day
    value_format: ''
    comparison_label: change since 1 day ago
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#FF505F",
        color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#008000", color_application: {
          collection_id: mozilla, palette_id: mozilla-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [active_subscriptions.count_sum]
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 15
    col: 0
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: mozilla_vpn
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date]
    fill_fields: [active_subscriptions.active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${active_subscriptions.count_sum}-offset(${active_subscriptions.count_sum},\
          \ 7))", label: delta_7_days, value_format: !!null '', value_format_name: '',
        _kind_hint: measure, table_calculation: delta_7_days, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: delta 7 days
    value_format: ''
    comparison_label: change since 7 days ago
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#FF505F",
        color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#008000", color_application: {
          collection_id: mozilla, palette_id: mozilla-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [active_subscriptions.count_sum]
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 15
    col: 4
    width: 4
    height: 4
  - title: Current Active Subscriptions (by Country)
    name: Current Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.count_sum, active_subscriptions.country_name]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.country_name desc]
    limit: 1000
    column_limit: 50
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    series_colors:
      USA: "#347be3"
    show_value_labels: true
    font_size: 12
    hide_legend: false
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
    trellis: row
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 22
    col: 0
    width: 8
    height: 9
  - title: Current Active Subscriptions (by Plan)
    name: Current Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.pricing_plan, active_subscriptions.count_sum]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.pricing_plan]
    limit: 1000
    column_limit: 50
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    series_colors:
      1-month-usd-4.99 - active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - active_subscriptions.count_sum: "#82a6a8"
      1-month-usd-4.99: "#7363A9"
      1-year-chf-71.88: "#D5C679"
    show_value_labels: true
    font_size: 12
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
    trellis: row
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 22
    col: 8
    width: 8
    height: 9
  - title: Current Active Subscriptions (by Provider)
    name: Current Active Subscriptions (by Provider)
    model: mozilla_vpn
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.count_sum, active_subscriptions.provider]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.provider desc]
    limit: 1000
    column_limit: 50
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_colors: {}
    show_value_labels: true
    font_size: 12
    hide_legend: false
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
    trellis: row
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
    row: 22
    col: 16
    width: 8
    height: 9
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards-next/mozilla_vpn::vpn_saasboard__active_subscriptions?Provider=&Pricing+Plan=&Country=&Active+Date=after+2020%2F07%2F20">

       Active Subs</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards-next/mozilla_vpn::vpn_saasboard__subscriptions_growth?Provider=&Pricing+Plan=&Country=&Event+Date=after+2020%2F07%2F20">

       Subs Growth</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards-next/mozilla_vpn::vpn_saasboard__retention?Provider=&Pricing+Plan=&Country=&Subscription+Start+Date=after+2020%2F07%2F20">Retention</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards-next/mozilla_vpn::vpn_saasboard__churn?Provider=&Pricing+Plan=&Country=&Subscription+Start+Date=after+2020%2F07%2F20">Churn</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards-next/mozilla_vpn::vpn_saasboard__revenue?Provider=&Pricing%20Plan=&Country=&Active%20Date=after%202020%2F07%2F20">Revenue</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: "  "
    type: text
    title_text: "  "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan</b></h3>
    row: 19
    col: 8
    width: 8
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Provider</b></h3>
    row: 19
    col: 16
    width: 8
    height: 3
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
    listens_to_filters: [Active Date, Country, Pricing Plan]
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
    listens_to_filters: [Active Date, Country, Provider]
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
    listens_to_filters: [Active Date, Pricing Plan, Provider]
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
