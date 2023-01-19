- dashboard: relay_saasboard__churn
  title: Relay Saasboard - Churn
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: gu7GJgZtDKDOoL57w4VREO
  elements:
  - name: ''
    type: text
    title_text: ''
    body_text: |2


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn Rate</b></h3>

      <h4> <b><code>Original Subscription Start Date</code> is used to discard subscription removal due to plan changes(upgrades).</b> </h4>
    row: 5
    col: 0
    width: 24
    height: 3
  - title: Churn by Months Since Subscription Start
    name: Churn by Months Since Subscription Start
    model: relay
    explore: subscriptions
    type: looker_column
    fields: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained,
      original_subscriptions__retention.months_since_original_subscription_start]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
      original_subscriptions__retention.months_since_original_subscription_start: ">0"
    sorts: [original_subscriptions__retention.months_since_original_subscription_start]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: "${previously_retained}-${churned}",
        label: Retained, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: retained, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${original_subscriptions__retention.churned}/${original_subscriptions__retention.previously_retained}",
        label: Total Churn Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: total_churn_rate, _type_hint: number,
        is_disabled: false}]
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
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#858585"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: churn_rate, id: churn_rate,
            name: Churn Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
        series: [{axisId: subscriptions__retention.churned, id: subscriptions__retention.churned,
            name: Churned}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_label: Months Since Subscription Start
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      churn_rate: line
      total_churn_rate: line
    series_colors:
      churned: "#FF7139"
      churn_rate: "#000000"
      retained_from_previous: "#12B5CB"
      retained: "#0060E0"
      subscriptions__retention.churned: "#FF7139"
      original_subscriptions__retention.churned: "#FF7139"
      total_churn_rate: "#000000"
    series_labels:
      subscriptions__retention.churned: Churn Counts
    label_color: []
    x_axis_datetime_label: ''
    column_group_spacing_ratio: 0.3
    hidden_fields: [original_subscriptions__retention.previously_retained]
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: hover
    note_text: This visualization captures the percentage of subscriptions that churned
      at a particular month since subscriptions started.
    hidden_pivots: {}
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 8
    col: 0
    width: 13
    height: 9
  - title: Average Monthly Churn by Cohort
    name: Average Monthly Churn by Cohort
    model: relay
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.original_subscription_start_month, original_subscriptions__retention.churned,
      original_subscriptions__retention.previously_retained]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: "${original_subscriptions__retention.churned}/${original_subscriptions__retention.previously_retained}",
        label: Total Churn Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: total_churn_rate, _type_hint: number,
        is_disabled: false}]
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
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: churn_rate, id: churn_rate,
            name: Churn Rate}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
        series: [{axisId: subscriptions__retention.churned, id: subscriptions__retention.churned,
            name: Churned}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      total_churn_rate: line
    series_colors:
      churned: "#FF7139"
      churn_rate: "#000000"
      retained: "#80CABB"
      retained_from_previous: "#80CABB"
      subscriptions__retention.churned: "#FF7139"
      total_churn_rate: "#000000"
    series_labels:
      subscriptions__retention.churned: Churn Counts
    label_color: []
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    column_group_spacing_ratio: 0.3
    show_null_points: false
    interpolation: linear
    hidden_fields: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This visualization captures the average churn rate of each cohort over
      every month since subscription started.
    hidden_pivots: {}
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 8
    col: 13
    width: 11
    height: 9
  - title: Cohort Churn Rate by Months Since Subscription Start
    name: Cohort Churn Rate by Months Since Subscription Start
    model: relay
    explore: subscriptions
    type: looker_line
    fields: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained,
      original_subscriptions__retention.months_since_original_subscription_start,
      subscriptions.original_subscription_start_month]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: "${original_subscriptions__retention.churned}/${original_subscriptions__retention.previously_retained}",
        label: Total Churn Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: total_churn_rate, _type_hint: number}]
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
    legend_position: left
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      0 - churn_rate: "#ffffff"
      0 - total_churn_rate: "#ffffff"
    series_labels:
      1 - churn_rate: Month 1
      2 - churn_rate: Month 2
      3 - churn_rate: Month 3
      4 - churn_rate: Month 4
      5 - churn_rate: Month 5
      6 - churn_rate: Month 6
      7 - churn_rate: Month 7
      8 - churn_rate: Month 8
      9 - churn_rate: Month 9
      10 - churn_rate: Month 10
      11 - churn_rate: Month 11
      12 - churn_rate: Month 12
      13 - churn_rate: Month 13
      14 - churn_rate: Month 14
      15 - churn_rate: Month 15
      16 - churn_rate: Month 16
      17 - churn_rate: Month 17
      18 - churn_rate: Month 18
      19 - churn_rate: Month 19
      20 - churn_rate: Month 20
      21 - churn_rate: Month 21
      0 - churn_rate: "."
      22 - churn_rate: Month 22
      0 - total_churn_rate: "."
      1 - total_churn_rate: Month 1
      2 - total_churn_rate: Month 2
      3 - total_churn_rate: Month 3
      4 - total_churn_rate: Month 4
      5 - total_churn_rate: Month 5
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
    defaults_version: 1
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
    hidden_pivots: {}
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 41
    col: 0
    width: 24
    height: 9
  - title: " Churn Rate Table (by Cohort)"
    name: " Churn Rate Table (by Cohort)"
    model: relay
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions.original_subscription_start_month, original_subscriptions__retention.churned,
      original_subscriptions__retention.previously_retained, original_subscriptions__retention.months_since_original_subscription_start]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
      original_subscriptions__retention.months_since_original_subscription_start: ">0"
    sorts: [subscriptions.original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: "${original_subscriptions__retention.churned}/${original_subscriptions__retention.previously_retained}",
        label: Total Churn Rate, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: total_churn_rate, _type_hint: number,
        is_disabled: false}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_column_widths:
      subscriptions.subscription_start_month: 256
      churned: 115
      churn_rate: 115
    series_cell_visualizations:
      churned:
        is_active: false
    series_text_format:
      subscriptions.subscription_start_month:
        align: center
        bold: true
      churn_rate:
        align: center
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Cohort
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: left
    series_types: {}
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%Y-%m"
    y_axis_combined: true
    x_axis_label_rotation: -45
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [original_subscriptions__retention.churned, original_subscriptions__retention.previously_retained]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 50
    col: 0
    width: 24
    height: 7
  - title: " Churn Counts Table (by Cohort)"
    name: " Churn Counts Table (by Cohort)"
    model: relay
    explore: subscriptions
    type: looker_grid
    fields: [original_subscriptions__retention.previously_retained, original_subscriptions__retention.churned,
      original_subscriptions__retention.months_since_original_subscription_start,
      subscriptions.original_subscription_start_month]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
      original_subscriptions__retention.months_since_original_subscription_start: ">0"
    sorts: [subscriptions.original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
    total: true
    dynamic_fields: [{category: measure, expression: "if(\n  ${subscriptions__retention.months_since_subscription_start}\
          \ > 0,\n  ${subscriptions__retention.months_since_subscription_start} <=\
          \ ${subscriptions.months_retained} + 1,\n  null\n)", label: Previously Retained,
        based_on: subscriptions__retention.count, filter_expression: "if(\n  ${subscriptions__retention.months_since_subscription_start}\
          \ > 0,\n  ${subscriptions__retention.months_since_subscription_start} <=\
          \ ${subscriptions.months_retained} + 1,\n  null\n)", _kind_hint: measure,
        measure: previously_retained, type: count, _type_hint: number}, {category: measure,
        expression: "${subscriptions__retention.months_since_subscription_start} =\
          \ ${subscriptions.months_retained} + 1", label: Churned, based_on: subscriptions__retention.count,
        filter_expression: "${subscriptions__retention.months_since_subscription_start}\
          \ = ${subscriptions.months_retained} + 1", _kind_hint: measure, measure: churned,
        type: count, _type_hint: number}, {table_calculation: churn_rate, expression: "${churned}/${previously_retained}",
        label: Churn Rate, value_format_name: percent_2, is_disabled: true}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
      subscriptions.subscription_start_month: Cohort
    series_column_widths:
      subscriptions.subscription_start_month: 256
      churned: 115
    series_cell_visualizations:
      churned:
        is_active: false
    series_text_format:
      subscriptions__retention.months_since_subscription_start:
        bold: true
        align: center
      subscriptions.subscription_start_month:
        bold: true
        align: center
      churned:
        align: center
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 50, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Cohort
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: left
    series_types: {}
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%Y-%m"
    y_axis_combined: true
    x_axis_label_rotation: -45
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [original_subscriptions__retention.previously_retained]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 57
    col: 0
    width: 24
    height: 7
  - title: Untitled
    name: Untitled
    model: relay
    explore: subscriptions
    type: single_value
    fields: [metadata.last_modified_date]
    fill_fields: [metadata.last_modified_date]
    filters:
      subscriptions__active.is_max_active_date: 'Yes'
    sorts: [metadata.last_modified_date desc]
    limit: 1
    dynamic_fields: [{category: table_calculation, expression: 'add_days(-1,${metadata.last_modified_date})',
        label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: new_calculation, _type_hint: date}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Data Last Updated
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
    hidden_fields: [metadata.last_modified_date]
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Cohort</b></h3>

      <h4> <b><code>Original Subscription Start Date</code> is used to discard subscription removal due to plan changes(upgrades).</b> </h4>
    row: 38
    col: 0
    width: 24
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Plan</b></h3>

      <h4> <b><code>Subscription Start Date</code> is used to track subscription removal due to plan changes(upgrades).</b> </h4>
    row: 17
    col: 0
    width: 24
    height: 3
  - title: Churn Rate Table (by Plan Type)
    name: Churn Rate Table (by Plan Type)
    model: relay
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_type]
    pivots: [subscriptions__retention.months_since_subscription_start]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned
        desc 0]
    total: true
    dynamic_fields: [{category: measure, expression: "if(\n  ${subscriptions__retention.months_since_subscription_start}\
          \ > 0,\n  ${subscriptions__retention.months_since_subscription_start} <=\
          \ ${subscriptions.months_retained} + 1,\n  null\n)", label: Previously Retained,
        based_on: subscriptions__retention.count, filter_expression: "if(\n  ${subscriptions__retention.months_since_subscription_start}\
          \ > 0,\n  ${subscriptions__retention.months_since_subscription_start} <=\
          \ ${subscriptions.months_retained} + 1,\n  null\n)", _kind_hint: measure,
        measure: previously_retained, type: count, _type_hint: number}, {category: measure,
        expression: "${subscriptions__retention.months_since_subscription_start} =\
          \ ${subscriptions.months_retained} + 1", label: Churned, based_on: subscriptions__retention.count,
        filter_expression: "${subscriptions__retention.months_since_subscription_start}\
          \ = ${subscriptions.months_retained} + 1", _kind_hint: measure, measure: churned,
        type: count, _type_hint: number}, {category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}, {
        category: table_calculation, expression: 'max(pivot_row(if(is_null(${subscriptions__retention.previously_retained}),null,${subscriptions__retention.months_since_subscription_start})))',
        label: Months Since Plan Start, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: months_since_plan_start, _type_hint: number},
      {category: table_calculation, description: for sorting plans by volume, expression: 'pivot_offset(${subscriptions__retention.previously_retained},
          0)', label: Total Subscribers, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_subscribers, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_column_widths:
      subscriptions.subscription_start_month: 243
      churned: 115
      churn_rate: 115
      subscriptions.pricing_plan: 256
      subscriptions.plan_type: 243
    series_cell_visualizations:
      churned:
        is_active: false
    series_text_format:
      subscriptions.subscription_start_month:
        align: center
        bold: true
      churn_rate:
        align: center
      subscriptions.pricing_plan:
        bold: true
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Cohort
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: left
    series_types: {}
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%Y-%m"
    y_axis_combined: true
    x_axis_label_rotation: -45
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [total_subscribers, months_since_plan_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained]
    defaults_version: 1
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Subscription Start Date: subscriptions.subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 26
    col: 0
    width: 24
    height: 6
  - title: Churn Counts Table (by Plan Type)
    name: Churn Counts Table (by Plan Type)
    model: relay
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_type]
    pivots: [subscriptions__retention.months_since_subscription_start]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned
        desc 0]
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: 'max(pivot_row(if(is_null(${subscriptions__retention.previously_retained}),null,${subscriptions__retention.months_since_subscription_start})))',
        label: Months Since Plan Start, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: months_since_plan_start, _type_hint: number},
      {category: table_calculation, description: for sorting plans by volume, expression: 'pivot_offset(${subscriptions__retention.previously_retained},
          0)', label: Total Subscribers, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_subscribers, _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_column_widths:
      subscriptions.subscription_start_month: 243
      churned: 115
      churn_rate: 115
      subscriptions.pricing_plan: 256
      subscriptions.plan_type: 243
      subscriptions__retention.churned: 115
    series_cell_visualizations:
      churned:
        is_active: false
    series_text_format:
      subscriptions.subscription_start_month:
        align: center
        bold: true
      churn_rate:
        align: center
      subscriptions.pricing_plan:
        bold: true
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Cohort
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: left
    series_types: {}
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%Y-%m"
    y_axis_combined: true
    x_axis_label_rotation: -45
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [total_subscribers, months_since_plan_start, subscriptions__retention.previously_retained]
    defaults_version: 1
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Subscription Start Date: subscriptions.subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 32
    col: 0
    width: 24
    height: 6
  - title: " Churn Rate  (by Plan Type)"
    name: " Churn Rate  (by Plan Type)"
    model: relay
    explore: subscriptions
    type: looker_line
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_type]
    pivots: [subscriptions.plan_type]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start, subscriptions.plan_type,
      months_since_plan_start desc 0, total_subscribers desc 0]
    limit: 1000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}, {
        category: table_calculation, expression: 'max(pivot_row(if(is_null(${subscriptions__retention.previously_retained}),null,${subscriptions__retention.months_since_subscription_start})))',
        label: Months Since Plan Start, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: months_since_plan_start, _type_hint: number},
      {category: table_calculation, description: for sorting plans by volume, expression: 'pivot_offset(${subscriptions__retention.previously_retained},
          0)', label: Total Subscribers, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_subscribers, _type_hint: number}]
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
    legend_position: left
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    x_axis_label: Months Since Subscription Start
    series_types: {}
    series_colors:
      1-month-usd-4.99 - churn_rate: "#7363A9"
      6-month-chf-47.94 - churn_rate: "#82a6a8"
      1_month - churn_rate: "#ffd95f"
      1_year - churn_rate: "#4276be"
      6_month - churn_rate: "#b42f37"
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Started
    x_axis_datetime_label: ''
    discontinuous_nulls: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      subscriptions.subscription_start_month: 243
      churned: 115
      churn_rate: 115
      subscriptions.pricing_plan: 256
    series_cell_visualizations:
      churned:
        is_active: false
    series_text_format:
      subscriptions.subscription_start_month:
        align: center
        bold: true
      churn_rate:
        align: center
      subscriptions.pricing_plan:
        bold: true
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 100, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: false, reverse: false, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [total_subscribers, months_since_plan_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained]
    defaults_version: 1
    listen:
      Plan Type: subscriptions.plan_type
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Subscription Start Date: subscriptions.subscription_start_date
      Product Name: subscriptions.product_name
      Provider: subscriptions.provider
    row: 20
    col: 0
    width: 24
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":"This dashboard capture "},{"text":"subscription
      churn","bold":true},{"text":".  Churn is defined as when a subscription officially
      ends and the client no longer has access to the relay service.\n"}],"id":1672267234120},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"A
      cohort refers to the group of subscriptions that started in a \nparticular month.  For
      example, cohort 07-2020 includes all \nsubscriptions that started in the month
      of July 2020.\n  "}],"id":1672267234153}],"id":1672267234122},{"type":"li","children":[{"type":"lic","children":[{"text":"Churn
      rate is the percentage of not-retained subscriptions out of the number retained
      from the previous month. \n  "}],"id":1672267234149}],"id":1672267234122},{"type":"li","children":[{"type":"lic","children":[{"text":"Churn
      rate can be aggregated to get the average churn per month by not specifying
      "},{"text":"Months Since Subscription Start","bold":true},{"text":". This differs
      from retention rate, which is cumulative and therefore must not be aggregated.\n  "}],"id":1672267234137}],"id":1672267234122},{"type":"li","children":[{"type":"lic","children":[{"text":"Churn
      Rate is not defined for 0 months since subscription started, because there is
      no previous month.\n"}],"id":1672267234126}],"id":1672267234122}],"id":1672267234121},{"type":"p","id":1674079862816,"children":[{"text":"Please
      submit any questions to "},{"text":"@yeonjoo","bold":true},{"text":" in "},{"text":"#fx-private-relay
      ","bold":true},{"text":"channel on Slack. \n\n\n"}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 19
    height: 5
  filters:
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
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.pricing_plan
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
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.country_name
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
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.plan_type
  - name: Subscription Start Date
    title: Subscription Start Date
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: relay
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.subscription_start_date
  - name: Original Subscription Start Date
    title: Original Subscription Start Date
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: relay
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.original_subscription_start_date
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Relay Premium,Mozilla VPN & Firefox Relay
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: relay
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.product_name
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
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.provider
