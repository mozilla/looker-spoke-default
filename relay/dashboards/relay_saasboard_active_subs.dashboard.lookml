- dashboard: relay_saasboard__active_subs
  title: Relay Saasboard - Active Subs
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: kVc8W2Z0lAMTYBMw222pfR
  elements:
  - title: Active Subscriptions (Daily)
    name: Active Subscriptions (Daily)
    model: relay
    explore: active_subscriptions
    type: looker_line
    fields: [active_subscriptions.active_date, active_subscriptions.count_sum]
    sorts: [active_subscriptions.active_date desc]
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
    x_axis_datetime_label: "%d-%b-'%y"
    defaults_version: 1
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 8
    col: 8
    width: 16
    height: 11
  - title: Current Active Subscriptions
    name: Current Active Subscriptions
    model: relay
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date, active_subscriptions.is_max_active_date]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.active_date desc]
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
    hidden_fields: [active_subscriptions.is_max_active_date]
    hidden_points_if_no: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 8
    col: 0
    width: 8
    height: 7
  - title: Current Active Date
    name: Current Active Date
    model: relay
    explore: active_subscriptions
    type: single_value
    fields: [metadata.last_modified_date]
    fill_fields: [metadata.last_modified_date]
    sorts: [metadata.last_modified_date desc]
    limit: 1
    dynamic_fields:
    - category: table_calculation
      expression: add_days(-1, ${metadata.last_modified_date})
      label: New Calculation
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: new_calculation
      _type_hint: date
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
    y_axes: []
    listen: {}
    row: 1
    col: 17
    width: 7
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Current Active Subscriptions</b></h3>
    row: 5
    col: 0
    width: 24
    height: 3
  - name: " "
    type: text
    title_text: " "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Country</b></h3>
    row: 40
    col: 0
    width: 13
    height: 4
  - title: Monthly Active Subscriptions (by Provider)
    name: Monthly Active Subscriptions (by Provider)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.active_month, active_subscriptions.provider,
      active_subscriptions.is_max_active_date]
    pivots: [active_subscriptions.provider]
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
    series_colors: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 52
    col: 13
    width: 11
    height: 11
  - title: New Tile
    name: New Tile
    model: relay
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date, active_subscriptions.is_max_active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${active_subscriptions.count_sum}-offset(${active_subscriptions.count_sum},\
        \ 1))"
      label: delta_1_day
      value_format:
      value_format_name: ''
      _kind_hint: measure
      table_calculation: delta_1_day
      _type_hint: number
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
    hidden_fields: [active_subscriptions.count_sum, active_subscriptions.is_max_active_date]
    hidden_points_if_no: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 15
    col: 0
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: relay
    explore: active_subscriptions
    type: single_value
    fields: [active_subscriptions.count_sum, active_subscriptions.active_date, active_subscriptions.is_max_active_date]
    sorts: [active_subscriptions.active_date desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${active_subscriptions.count_sum}-offset(${active_subscriptions.count_sum},\
        \ 7))"
      label: delta_7_days
      value_format:
      value_format_name: ''
      _kind_hint: measure
      table_calculation: delta_7_days
      _type_hint: number
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
    hidden_fields: [active_subscriptions.count_sum, active_subscriptions.is_max_active_date]
    hidden_points_if_no: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 15
    col: 4
    width: 4
    height: 4
  - title: Current Active Subscriptions (by Plan)
    name: Current Active Subscriptions (by Plan)
    model: relay
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.pricing_plan, active_subscriptions.count_sum, active_subscriptions.is_max_active_date]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.count_sum desc]
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
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 22
    col: 0
    width: 13
    height: 7
  - title: Current Active Subscriptions (by Provider)
    name: Current Active Subscriptions (by Provider)
    model: relay
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.count_sum, active_subscriptions.provider, active_subscriptions.is_max_active_date]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.count_sum desc]
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
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 44
    col: 13
    width: 11
    height: 8
  - name: "  "
    type: text
    title_text: "  "
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan</b></h3>
    row: 19
    col: 0
    width: 13
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Provider</b></h3>
    row: 40
    col: 13
    width: 11
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan Type</b></h3>
    row: 19
    col: 13
    width: 11
    height: 3
  - title: Monthly Active Subscriptions (by Plan Type)
    name: Monthly Active Subscriptions (by Plan Type)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.active_month, active_subscriptions.plan_type,
      active_subscriptions.is_max_active_date]
    pivots: [active_subscriptions.plan_type]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.active_month desc, active_subscriptions.plan_type]
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
    series_colors:
      1-month-usd-4.99 - active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - active_subscriptions.count_sum: "#82a6a8"
      1_year - active_subscriptions.count_sum: "#4276BE"
      1_month - active_subscriptions.count_sum: "#FFD95F"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 29
    col: 13
    width: 11
    height: 11
  - title: Current Active Subscriptions (by Plan Type)
    name: Current Active Subscriptions (by Plan Type)
    model: relay
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.count_sum, active_subscriptions.plan_type, active_subscriptions.is_max_active_date]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.count_sum desc]
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
      1-month-usd-4.99 - active_subscriptions.count_sum: "#7363A9"
      6-month-chf-47.94 - active_subscriptions.count_sum: "#82a6a8"
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
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 22
    col: 13
    width: 11
    height: 7
  - title: Monthly Active Subscriptions (by Plan)
    name: Monthly Active Subscriptions (by Plan)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.pricing_plan, active_subscriptions.active_month,
      active_subscriptions.is_end_of_month]
    pivots: [active_subscriptions.pricing_plan]
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
    series_colors:
      1-month-usd-4.99 - active_subscriptions.count_sum: "#7363A9"
      1-month-apple - active_subscriptions.count_sum: "#4276BE"
      1-month-cad-12.99 - active_subscriptions.count_sum: "#3FB0D5"
      1-month-chf-10.99 - active_subscriptions.count_sum: "#9ED7D7"
      1-month-eur-9.99 - active_subscriptions.count_sum: "#E57947"
      1-month-gbp-8.49 - active_subscriptions.count_sum: "#FBB556"
      1-month-myr-44.99 - active_subscriptions.count_sum: "#FFD95F"
      1-month-nzd-15.99 - active_subscriptions.count_sum: "#D5C679"
      1-month-sgd-13.99 - active_subscriptions.count_sum: "#D59E79"
      1-month-usd-9.99 - active_subscriptions.count_sum: "#6A013A"
      1-year-apple - active_subscriptions.count_sum: "#7363A9"
      1-year-cad-74.99 - active_subscriptions.count_sum: "#44759A"
      1-year-chf-71.88 - active_subscriptions.count_sum: "#D5C679"
      1-year-egp-939.99 - active_subscriptions.count_sum: "#8cd0e6"
      1-year-eur-59.88 - active_subscriptions.count_sum: "#c5e7e7"
      1-year-gbp-51.99 - active_subscriptions.count_sum: "#efaf91"
      1-year-myr-269.99 - active_subscriptions.count_sum: "#fdd39a"
      1-year-nzd-99.99 - active_subscriptions.count_sum: "#ffe89f"
      1-year-sgd-86.98 - active_subscriptions.count_sum: "#e6ddaf"
      1-year-usd-59.88 - active_subscriptions.count_sum: "#e6c5af"
      6-month-apple - active_subscriptions.count_sum: "#d28287"
      6-month-cad-59.99 - active_subscriptions.count_sum: "#a66789"
      6-month-chf-47.94 - active_subscriptions.count_sum: "#aba1cb"
      6-month-eur-41.94 - active_subscriptions.count_sum: black
      6-month-gbp-41.49 - active_subscriptions.count_sum: "#284772"
      6-month-usd-47.94 - active_subscriptions.count_sum: "#266a80"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    hidden_fields: [active_subscriptions.is_end_of_month]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 29
    col: 0
    width: 13
    height: 11
  - title: Current Active Subscriptions (by Country)
    name: Current Active Subscriptions (by Country)
    model: relay
    explore: active_subscriptions
    type: looker_pie
    fields: [active_subscriptions.count_sum, active_subscriptions.country_name, active_subscriptions.is_max_active_date]
    filters:
      active_subscriptions.is_max_active_date: 'Yes'
    sorts: [active_subscriptions.count_sum desc]
    limit: 50
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
    hidden_fields: [active_subscriptions.is_max_active_date]
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 44
    col: 0
    width: 13
    height: 8
  - title: Monthly Active Subscriptions (by Country)
    name: Monthly Active Subscriptions (by Country)
    model: relay
    explore: active_subscriptions
    type: looker_column
    fields: [active_subscriptions.count_sum, active_subscriptions.country_name, active_subscriptions.active_month,
      active_subscriptions.is_max_active_date]
    pivots: [active_subscriptions.country_name]
    filters:
      active_subscriptions.is_end_of_month: 'Yes'
    sorts: [active_subscriptions.country_name desc, active_subscriptions.count_sum
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
    series_colors:
      USA - active_subscriptions.count_sum: "#347be3"
      United Kingdom - active_subscriptions.count_sum: "#a9c574"
      United Arab Emirates - active_subscriptions.count_sum: "#929292"
      Switzerland - active_subscriptions.count_sum: "#9fdee0"
      Sweden - active_subscriptions.count_sum: "#1f3e5a"
      Spain - active_subscriptions.count_sum: "#90c8ae"
      Singapore - active_subscriptions.count_sum: "#92818d"
      Russia - active_subscriptions.count_sum: "#c5c6a6"
      Romania - active_subscriptions.count_sum: "#82c2ca"
      Reunion - active_subscriptions.count_sum: "#cee0a0"
      Puerto Rico - active_subscriptions.count_sum: "#928fb4"
      Poland - active_subscriptions.count_sum: "#9fc190"
      Null - active_subscriptions.count_sum: "#a1d6e5"
      Norway - active_subscriptions.count_sum: "#cbdcac"
      New Zealand - active_subscriptions.count_sum: "#bebebe"
      Netherlands - active_subscriptions.count_sum: "#c5ebec"
      Malaysia - active_subscriptions.count_sum: "#798b9c"
      Italy - active_subscriptions.count_sum: "#bcdece"
      Ireland - active_subscriptions.count_sum: "#beb3bb"
      Guam - active_subscriptions.count_sum: "#dcddca"
      Germany - active_subscriptions.count_sum: "#b4dadf"
      France - active_subscriptions.count_sum: "#928fb4"
      Egypt - active_subscriptions.count_sum: "#bebcd2"
      Canada - active_subscriptions.count_sum: "#1f3e5a"
      Belgium - active_subscriptions.count_sum: "#3b707f"
      Austria - active_subscriptions.count_sum: "#657646"
      Australia - active_subscriptions.count_sum: "#585858"
      Argentina - active_subscriptions.count_sum: "#5f8586"
      American Samoa - active_subscriptions.count_sum: "#132536"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    hidden_fields: [active_subscriptions.is_max_active_date]
    y_axes: []
    listen:
      Provider: active_subscriptions.provider
      Pricing Plan: active_subscriptions.pricing_plan
      Country: active_subscriptions.country_name
      Active Date: active_subscriptions.active_date
      Plan Type: active_subscriptions.plan_type
      Product Name: active_subscriptions.product_name
    row: 52
    col: 0
    width: 13
    height: 11
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"This dashboard captures the current
      state and monthly trend of "},{"text":"active subscriptions","bold":true},{"text":"."}],"id":1672430082794},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Active
      subscriptions are paid subscriptions at a moment in time.  \n"}],"id":1672430082798}],"id":1672430082795}],"id":1672430082795},{"type":"p","id":1672430093267,"children":[{"text":"Please
      submit any questions to "},{"text":"@yeonjoo","bold":true},{"text":" in "},{"text":"#fx-private-relay
      ","bold":true},{"text":"channel on Slack. \n\n"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 1
    col: 0
    width: 17
    height: 4
  - type: button
    name: button_13653
    rich_content_json: '{"text":"Relay SaaSBoard Documentation","description":"User
      guide/ definition of metrics/ event logs that may affected Relay data. ","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/document/d/1attwr_1afDim9v-h4eDbA5XL09yKZez-RddSO-A0P8U/edit?usp=sharing"}'
    row: 0
    col: 0
    width: 12
    height: 1
  - type: button
    name: button_13654
    rich_content_json: '{"text":"SaaSboard Explained ","description":"This deck explains
      how the subscription data is recorded in databases and how metrics are counted
      to load in the SaaSBoard.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/presentation/d/1Y3lDe1IktTbF-Xaw8dmlcNgWMhRosyH3p9G6ITQBPhc/edit?usp=sharing"}'
    row: 0
    col: 12
    width: 11
    height: 1
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
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Country, Pricing Plan]
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
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Country, Provider]
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
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Plan Type, Active Date, Pricing Plan, Provider]
    field: active_subscriptions.country_name
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
    model: relay
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.active_date
  - name: Plan Type
    title: Plan Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: [Active Date, Country, Pricing Plan, Provider]
    field: active_subscriptions.plan_type
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Mozilla VPN & Firefox Relay,Relay Premium
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: active_subscriptions
    listens_to_filters: []
    field: active_subscriptions.product_name
