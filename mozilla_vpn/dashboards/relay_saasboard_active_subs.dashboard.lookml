- dashboard: relay_saasboard_active_subs
  title: Relay Saasboard Active Subs
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kSCIuJ5vJVsHzv75UgS175
  elements:
  - title: Active Subscriptions (Daily)
    name: Active Subscriptions (Daily)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_line
    fields: [relay_active_subscriptions.active_date, relay_active_subscriptions.count_sum]
    sorts: [relay_active_subscriptions.active_date desc]
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
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 7
    col: 8
    width: 16
    height: 11
  - title: Current Active Subscriptions
    name: Current Active Subscriptions
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: single_value
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.active_date,
      relay_active_subscriptions.is_max_active_date]
    filters:
      relay_active_subscriptions.is_max_active_date: 'Yes'
    sorts: [relay_active_subscriptions.active_date desc]
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    hidden_points_if_no: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 7
    col: 0
    width: 8
    height: 7
  - title: Current Active Date
    name: Current Active Date
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: single_value
    fields: [metadata.last_modified_date]
    fill_fields: [metadata.last_modified_date]
    sorts: [metadata.last_modified_date desc]
    limit: 1
    dynamic_fields: [{category: table_calculation, expression: 'add_days(-1, ${metadata.last_modified_date})',
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: new_calculation, _type_hint: date}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Data Last Updated
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
    hidden_fields: [metadata.last_modified_date]
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Current Active Subscriptions</b></h3>
    row: 4
    col: 0
    width: 24
    height: 3
  - name: " "
    type: text
    title_text: " "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Country</b></h3>
    row: 39
    col: 0
    width: 13
    height: 4
  - title: Monthly Active Subscriptions (by Provider)
    name: Monthly Active Subscriptions (by Provider)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_column
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.active_month,
      relay_active_subscriptions.provider, relay_active_subscriptions.is_max_active_date]
    pivots: [relay_active_subscriptions.provider]
    filters:
      relay_active_subscriptions.is_end_of_month: 'Yes'
    sorts: [relay_active_subscriptions.count_sum desc 0, relay_active_subscriptions.provider
        desc]
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 51
    col: 13
    width: 11
    height: 11
  - title: New Tile
    name: New Tile
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: single_value
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.active_date,
      relay_active_subscriptions.is_max_active_date]
    sorts: [relay_active_subscriptions.active_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${relay_active_subscriptions.count_sum}-offset(${relay_active_subscriptions.count_sum},\
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
    hidden_fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.is_max_active_date]
    hidden_points_if_no: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 14
    col: 0
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: single_value
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.active_date,
      relay_active_subscriptions.is_max_active_date]
    sorts: [relay_active_subscriptions.active_date desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${relay_active_subscriptions.count_sum}-offset(${relay_active_subscriptions.count_sum},\
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
    hidden_fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.is_max_active_date]
    hidden_points_if_no: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 14
    col: 4
    width: 4
    height: 4
  - title: Current Active Subscriptions (by Plan)
    name: Current Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_pie
    fields: [relay_active_subscriptions.pricing_plan, relay_active_subscriptions.count_sum,
      relay_active_subscriptions.is_max_active_date]
    filters:
      relay_active_subscriptions.is_max_active_date: 'Yes'
    sorts: [relay_active_subscriptions.count_sum desc]
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
      1-month-usd-4.99 - relay_active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - relay_active_subscriptions.count_sum: "#82a6a8"
      1-month-usd-4.99: "#7363A9"
      1-year-chf-71.88: "#D5C679"
      1-month-apple: "#4276BE"
      1-month-cad-12.99: "#3FB0D5"
      1-month-chf-10.99: "#9ED7D7"
      1-month-eur-9.99: "#E57947"
      1-month-gbp-8.49: "#FBB556"
      1-month-myr-44.99: "#FFD95F"
      1-month-nzd-15.99: "#D5C679"
      1-month-usd-9.99: "#6A013A"
      1-year-apple: "#7363A9"
      1-year-cad-74.99: "#44759A"
      1-year-egp-939.99: "#8cd0e6"
      1-year-eur-59.88: "#c5e7e7"
      1-year-gbp-51.99: "#efaf91"
      1-year-myr-269.99: "#fdd39a"
      1-year-nzd-99.99: "#ffe89f"
      1-year-sgd-86.98: "#e6ddaf"
      1-year-usd-59.88: "#e6c5af"
      6-month-apple: "#d28287"
      6-month-cad-59.99: "#a66789"
      6-month-chf-47.94: "#aba1cb"
      6-month-eur-41.94: "#8facc2"
      6-month-gbp-41.49: "#284772"
      6-month-usd-47.94: "#266a80"
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 21
    col: 0
    width: 13
    height: 7
  - title: Current Active Subscriptions (by Provider)
    name: Current Active Subscriptions (by Provider)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_pie
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.provider,
      relay_active_subscriptions.is_max_active_date]
    filters:
      relay_active_subscriptions.is_max_active_date: 'Yes'
    sorts: [relay_active_subscriptions.count_sum desc]
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 43
    col: 13
    width: 11
    height: 8
  - name: "  "
    type: text
    title_text: "  "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan</b></h3>
    row: 18
    col: 0
    width: 13
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Provider</b></h3>
    row: 39
    col: 13
    width: 11
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan Interval Type</b></h3>
    row: 18
    col: 13
    width: 11
    height: 3
  - title: Monthly Active Subscriptions (by Plan Interval Type)
    name: Monthly Active Subscriptions (by Plan Interval Type)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_column
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.active_month,
      relay_active_subscriptions.plan_interval_type, relay_active_subscriptions.is_max_active_date]
    pivots: [relay_active_subscriptions.plan_interval_type]
    filters:
      relay_active_subscriptions.is_end_of_month: 'Yes'
    sorts: [relay_active_subscriptions.active_month desc, relay_active_subscriptions.plan_interval_type]
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
      palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
      options:
        steps: 5
    x_axis_label: Month
    series_types: {}
    series_colors:
      1-month-usd-4.99 - relay_active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - relay_active_subscriptions.count_sum: "#82a6a8"
      1_year - relay_active_subscriptions.count_sum: "#4276BE"
      1_month - relay_active_subscriptions.count_sum: "#FFD95F"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 28
    col: 13
    width: 11
    height: 11
  - title: Current Active Subscriptions (by Plan Interval Type)
    name: Current Active Subscriptions (by Plan Interval Type)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_pie
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.plan_interval_type,
      relay_active_subscriptions.is_max_active_date]
    filters:
      relay_active_subscriptions.is_max_active_date: 'Yes'
    sorts: [relay_active_subscriptions.count_sum desc]
    limit: 1000
    column_limit: 50
    value_labels: labels
    label_type: labPer
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
      options:
        steps: 5
    series_colors:
      1-month-usd-4.99 - relay_active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - relay_active_subscriptions.count_sum: "#82a6a8"
      1-month-usd-4.99: "#7363A9"
      1-year-chf-71.88: "#D5C679"
      1-month-apple: "#4276BE"
      1-month-cad-12.99: "#3FB0D5"
      1-month-chf-10.99: "#9ED7D7"
      1-month-eur-9.99: "#E57947"
      1-month-gbp-8.49: "#FBB556"
      1-month-myr-44.99: "#FFD95F"
      1-month-nzd-15.99: "#D5C679"
      1-month-usd-9.99: "#6A013A"
      1-year-apple: "#7363A9"
      1-year-cad-74.99: "#44759A"
      1-year-egp-939.99: "#8cd0e6"
      1-year-eur-59.88: "#c5e7e7"
      1-year-gbp-51.99: "#efaf91"
      1-year-myr-269.99: "#fdd39a"
      1-year-nzd-99.99: "#ffe89f"
      1-year-sgd-86.98: "#e6ddaf"
      1-year-usd-59.88: "#e6c5af"
      6-month-apple: "#d28287"
      6-month-cad-59.99: "#a66789"
      6-month-chf-47.94: "#aba1cb"
      6-month-eur-41.94: "#8facc2"
      6-month-gbp-41.49: "#284772"
      6-month-usd-47.94: "#266a80"
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 21
    col: 13
    width: 11
    height: 7
  - title: Monthly Active Subscriptions (by Plan)
    name: Monthly Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_column
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.pricing_plan,
      relay_active_subscriptions.active_month, relay_active_subscriptions.is_end_of_month]
    pivots: [relay_active_subscriptions.pricing_plan]
    filters:
      relay_active_subscriptions.is_end_of_month: 'Yes'
    sorts: [relay_active_subscriptions.active_month desc, relay_active_subscriptions.pricing_plan]
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
      1-month-usd-4.99 - relay_active_subscriptions.count_sum: "#7363A9"
      1-month-apple - relay_active_subscriptions.count_sum: "#4276BE"
      1-month-cad-12.99 - relay_active_subscriptions.count_sum: "#3FB0D5"
      1-month-chf-10.99 - relay_active_subscriptions.count_sum: "#9ED7D7"
      1-month-eur-9.99 - relay_active_subscriptions.count_sum: "#E57947"
      1-month-gbp-8.49 - relay_active_subscriptions.count_sum: "#FBB556"
      1-month-myr-44.99 - relay_active_subscriptions.count_sum: "#FFD95F"
      1-month-nzd-15.99 - relay_active_subscriptions.count_sum: "#D5C679"
      1-month-sgd-13.99 - relay_active_subscriptions.count_sum: "#D59E79"
      1-month-usd-9.99 - relay_active_subscriptions.count_sum: "#6A013A"
      1-year-apple - relay_active_subscriptions.count_sum: "#7363A9"
      1-year-cad-74.99 - relay_active_subscriptions.count_sum: "#44759A"
      1-year-chf-71.88 - relay_active_subscriptions.count_sum: "#D5C679"
      1-year-egp-939.99 - relay_active_subscriptions.count_sum: "#8cd0e6"
      1-year-eur-59.88 - relay_active_subscriptions.count_sum: "#c5e7e7"
      1-year-gbp-51.99 - relay_active_subscriptions.count_sum: "#efaf91"
      1-year-myr-269.99 - relay_active_subscriptions.count_sum: "#fdd39a"
      1-year-nzd-99.99 - relay_active_subscriptions.count_sum: "#ffe89f"
      1-year-sgd-86.98 - relay_active_subscriptions.count_sum: "#e6ddaf"
      1-year-usd-59.88 - relay_active_subscriptions.count_sum: "#e6c5af"
      6-month-apple - relay_active_subscriptions.count_sum: "#d28287"
      6-month-cad-59.99 - relay_active_subscriptions.count_sum: "#a66789"
      6-month-chf-47.94 - relay_active_subscriptions.count_sum: "#aba1cb"
      6-month-eur-41.94 - relay_active_subscriptions.count_sum: black
      6-month-gbp-41.49 - relay_active_subscriptions.count_sum: "#284772"
      6-month-usd-47.94 - relay_active_subscriptions.count_sum: "#266a80"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    hidden_fields: [relay_active_subscriptions.is_end_of_month]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 28
    col: 0
    width: 13
    height: 11
  - title: Current Active Subscriptions (by Country)
    name: Current Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_pie
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.country_name,
      relay_active_subscriptions.is_max_active_date]
    filters:
      relay_active_subscriptions.is_max_active_date: 'Yes'
    sorts: [relay_active_subscriptions.count_sum desc]
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
      United Kingdom: "#a9c574"
      United Arab Emirates: "#929292"
      Switzerland: "#9fdee0"
      Sweden: "#1f3e5a"
      Spain: "#90c8ae"
      Singapore: "#92818d"
      Russia: "#c5c6a6"
      Romania: "#82c2ca"
      Reunion: "#cee0a0"
      Puerto Rico: "#928fb4"
      Poland: "#9fc190"
      ? ''
      : "#a1d6e5"
      Norway: "#cbdcac"
      New Zealand: "#bebebe"
      Netherlands: "#c5ebec"
      Malaysia: "#798b9c"
      Italy: "#bcdece"
      Ireland: "#beb3bb"
      Guam: "#dcddca"
      Germany: "#b4dadf"
      France: "#928fb4"
      Egypt: "#bebcd2"
      Canada: "#1f3e5a"
      Belgium: "#3b707f"
      Austria: "#657646"
      Australia: "#585858"
      Argentina: "#5f8586"
      American Samoa: "#132536"
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
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 43
    col: 0
    width: 13
    height: 8
  - title: Monthly Active Subscriptions (by Country)
    name: Monthly Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: relay_active_subscriptions
    type: looker_column
    fields: [relay_active_subscriptions.count_sum, relay_active_subscriptions.country_name,
      relay_active_subscriptions.active_month, relay_active_subscriptions.is_max_active_date]
    pivots: [relay_active_subscriptions.country_name]
    filters:
      relay_active_subscriptions.is_end_of_month: 'Yes'
    sorts: [relay_active_subscriptions.country_name desc, relay_active_subscriptions.count_sum
        desc 0]
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
      USA - relay_active_subscriptions.count_sum: "#347be3"
      United Kingdom - relay_active_subscriptions.count_sum: "#a9c574"
      United Arab Emirates - relay_active_subscriptions.count_sum: "#929292"
      Switzerland - relay_active_subscriptions.count_sum: "#9fdee0"
      Sweden - relay_active_subscriptions.count_sum: "#1f3e5a"
      Spain - relay_active_subscriptions.count_sum: "#90c8ae"
      Singapore - relay_active_subscriptions.count_sum: "#92818d"
      Russia - relay_active_subscriptions.count_sum: "#c5c6a6"
      Romania - relay_active_subscriptions.count_sum: "#82c2ca"
      Reunion - relay_active_subscriptions.count_sum: "#cee0a0"
      Puerto Rico - relay_active_subscriptions.count_sum: "#928fb4"
      Poland - relay_active_subscriptions.count_sum: "#9fc190"
      Null - relay_active_subscriptions.count_sum: "#a1d6e5"
      Norway - relay_active_subscriptions.count_sum: "#cbdcac"
      New Zealand - relay_active_subscriptions.count_sum: "#bebebe"
      Netherlands - relay_active_subscriptions.count_sum: "#c5ebec"
      Malaysia - relay_active_subscriptions.count_sum: "#798b9c"
      Italy - relay_active_subscriptions.count_sum: "#bcdece"
      Ireland - relay_active_subscriptions.count_sum: "#beb3bb"
      Guam - relay_active_subscriptions.count_sum: "#dcddca"
      Germany - relay_active_subscriptions.count_sum: "#b4dadf"
      France - relay_active_subscriptions.count_sum: "#928fb4"
      Egypt - relay_active_subscriptions.count_sum: "#bebcd2"
      Canada - relay_active_subscriptions.count_sum: "#1f3e5a"
      Belgium - relay_active_subscriptions.count_sum: "#3b707f"
      Austria - relay_active_subscriptions.count_sum: "#657646"
      Australia - relay_active_subscriptions.count_sum: "#585858"
      Argentina - relay_active_subscriptions.count_sum: "#5f8586"
      American Samoa - relay_active_subscriptions.count_sum: "#132536"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    hidden_fields: [relay_active_subscriptions.is_max_active_date]
    listen:
      Provider: relay_active_subscriptions.provider
      Pricing Plan: relay_active_subscriptions.pricing_plan
      Country: relay_active_subscriptions.country_name
      Active Date: relay_active_subscriptions.active_date
      Plan Interval Type: relay_active_subscriptions.plan_interval_type
      Product Name: relay_active_subscriptions.product_name
    row: 51
    col: 0
    width: 13
    height: 11
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"This dashboard captures the current
      state and monthly trend of "},{"text":"active subscriptions","bold":true},{"text":"."}],"id":1672430082794},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Active
      subscriptions are paid subscriptions at a moment in time.  \n"}],"id":1672430082798}],"id":1672430082795}],"id":1672430082795},{"type":"p","id":1672430093267,"children":[{"text":"Please
      submit any questions in  "},{"type":"a","url":"https://mozilla.slack.com/messages/mozilla-vpn-data/","children":[{"text":"mozilla-vpn-data","bold":true}],"id":1672430082796},{"text":"
      channel on Slack. \n\n"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 19
    height: 4
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
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Country, Pricing Plan]
    field: relay_active_subscriptions.provider
  - name: Pricing Plan
    title: Pricing Plan
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Country, Provider]
    field: relay_active_subscriptions.pricing_plan
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: [Plan Interval Type, Active Date, Pricing Plan, Provider]
    field: relay_active_subscriptions.country_name
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: []
    field: relay_active_subscriptions.active_date
  - name: Plan Interval Type
    title: Plan Interval Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: [Active Date, Country, Pricing Plan, Provider]
    field: relay_active_subscriptions.plan_interval_type
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Mozilla VPN & Firefox Relay,Relay Premium
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: relay_active_subscriptions
    listens_to_filters: []
    field: relay_active_subscriptions.product_name
