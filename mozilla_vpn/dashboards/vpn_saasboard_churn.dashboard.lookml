- dashboard: vpn_saasboard__churn
  title: VPN SaaSboard - Churn
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 2147484 seconds
  preferred_slug: eYqxHc9qMbz6bbuVVlyyBp
  elements:
  - name: ''
    type: text
    body_text: <img src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg"
      width="160" height="50" align="center"/>
    row: 3
    col: 0
    width: 3
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='background-color: #ffffdd; padding: 5px 10px; border:\
      \ solid 3px #ededed; border-radius: 5px; height:220px'>\n\nThis dashboard capture\
      \ <strong>subscription churn</strong>.\n\n<ul>\n  <li>A cohort refers to the\
      \ group of subscriptions that started in a particular month.  For example, cohort\
      \ 07-2020 includes all subscriptions that started in the month of July 2020.</li>\n\
      \  <li>Churn rate is the percentage of not-retained subscriptions out of the\
      \ number retained from the previous month. </li>\n  <li>Churn rate can be aggregated\
      \ to get the average churn per month by not specifying <b>Months Since Subscription\
      \ Start</b>. This differs from retention rate, which is cumulative and therefore\
      \ must not be aggregated.</li>\n  <li>Churn Rate is not defined for 0 months\
      \ since subscription started, because there is no previous month.</li>\n</ul>\n\
      <br>\n\nPlease submit any questions in  <b><a href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\"\
      >mozilla-vpn-data</a></b> channel on Slack for @wichan or @relud. \n\n</div>"
    row: 3
    col: 3
    width: 16
    height: 5
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn Rate</b></h3>
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Churn by Months Since Subscription Start
    name: Churn by Months Since Subscription Start
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}, {
        category: table_calculation, expression: "${previously_retained}-${churned}",
        label: Retained, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: retained, _type_hint: number, is_disabled: true}]
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
    series_types:
      churn_rate: line
    series_colors:
      churned: "#FF7139"
      churn_rate: "#000000"
      retained_from_previous: "#12B5CB"
      retained: "#0060E0"
      subscriptions__retention.churned: "#FF7139"
    series_labels:
      subscriptions__retention.churned: Churn Counts
    label_color: []
    x_axis_datetime_label: ''
    column_group_spacing_ratio: 0.3
    hidden_fields: [subscriptions__retention.previously_retained]
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: hover
    note_text: This visualization captures the percentage of subscriptions that churned
      at a particular month since subscriptions started.
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 10
    col: 0
    width: 13
    height: 9
  - title: Average Monthly Churn by Cohort
    name: Average Monthly Churn by Cohort
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.subscription_start_month, subscriptions__retention.churned,
      subscriptions__retention.previously_retained]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.subscription_start_month]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}]
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
    series_types:
      churn_rate: line
    series_colors:
      churned: "#FF7139"
      churn_rate: "#000000"
      retained: "#80CABB"
      retained_from_previous: "#80CABB"
      subscriptions__retention.churned: "#FF7139"
    series_labels:
      subscriptions__retention.churned: Churn Counts
    label_color: []
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    column_group_spacing_ratio: 0.3
    hidden_fields: [subscriptions__retention.previously_retained, subscriptions__retention.churned]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: This visualization captures the average churn rate of each cohort over
      every month since subscription started.
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 10
    col: 13
    width: 11
    height: 9
  - title: Cohort Churn Rate by Months Since Subscription Start
    name: Cohort Churn Rate by Months Since Subscription Start
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.churned, subscriptions__retention.previously_retained]
    pivots: [subscriptions__retention.months_since_subscription_start]
    fill_fields: [subscriptions.subscription_start_month]
    filters:
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start]
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}]
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
    series_types: {}
    series_colors:
      0 - churn_rate: "#ffffff"
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
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    discontinuous_nulls: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [subscriptions__retention.previously_retained, subscriptions__retention.churned]
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
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 41
    col: 0
    width: 24
    height: 9
  - title: " Churn Rate Table (by Cohort)"
    name: " Churn Rate Table (by Cohort)"
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.churned, subscriptions__retention.previously_retained]
    pivots: [subscriptions__retention.months_since_subscription_start]
    fill_fields: [subscriptions.subscription_start_month]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start]
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions__retention.churned}/${subscriptions__retention.previously_retained}",
        label: Churn Rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number}]
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
    hidden_fields: [subscriptions__retention.previously_retained, subscriptions__retention.churned]
    defaults_version: 1
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 50
    col: 0
    width: 24
    height: 11
  - title: " Churn Counts Table (by Cohort)"
    name: " Churn Counts Table (by Cohort)"
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.churned, subscriptions__retention.previously_retained]
    pivots: [subscriptions__retention.months_since_subscription_start]
    fill_fields: [subscriptions.subscription_start_month]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.subscription_start_month, subscriptions__retention.months_since_subscription_start]
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
    hidden_fields: [subscriptions__retention.previously_retained]
    defaults_version: 1
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 61
    col: 0
    width: 24
    height: 11
  - title: Untitled
    name: Untitled
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [subscriptions.subscription_start_date]
    fill_fields: [subscriptions.subscription_start_date]
    sorts: [subscriptions.subscription_start_date desc]
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
    single_value_title: Most Recent Data Included
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
    listen:
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 3
    col: 19
    width: 5
    height: 5
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Cohort</b></h3>
    row: 39
    col: 0
    width: 24
    height: 2
  - title: Churn Rate Table (by Plan Interval Type)
    name: Churn Rate Table (by Plan Interval Type)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_interval_type]
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
      subscriptions.plan_interval_type: 243
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
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 27
    col: 0
    width: 24
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Churn by Plan</b></h3>
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Churn Counts Table (by Plan Interval Type)
    name: Churn Counts Table (by Plan Interval Type)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_interval_type]
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
      subscriptions.plan_interval_type: 243
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
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 33
    col: 0
    width: 24
    height: 6
  - title: " Churn Rate  (by Plan Interval Type)"
    name: " Churn Rate  (by Plan Interval Type)"
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [subscriptions__retention.months_since_subscription_start, subscriptions__retention.churned,
      subscriptions__retention.previously_retained, subscriptions.plan_interval_type]
    pivots: [subscriptions.plan_interval_type]
    filters:
      subscriptions__retention.months_since_subscription_start: ">0"
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start, subscriptions.plan_interval_type,
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
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Subscription Start Date: subscriptions.subscription_start_date
      Plan Interval Type: subscriptions.plan_interval_type
    row: 21
    col: 0
    width: 24
    height: 6
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/412">

       Active Subs</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/416">

       Subs Growth</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/414">Retention</a>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/413">Churn</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px; " href="https://mozilla.cloud.looker.com/dashboards/433">Revenue</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
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
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: [Provider, Plan Interval Type, Subscription Start Date, Country,
      Pricing Plan]
    field: subscriptions.provider
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
    explore: subscriptions
    listens_to_filters: [Pricing Plan, Plan Interval Type, Subscription Start Date,
      Country, Provider]
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
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: [Country, Plan Interval Type, Subscription Start Date, Pricing
        Plan, Provider]
    field: subscriptions.country_name
  - name: Subscription Start Date
    title: Subscription Start Date
    type: field_filter
    default_value: after 2021/03/01
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: [Subscription Start Date]
    field: subscriptions.subscription_start_date
  - name: Plan Interval Type
    title: Plan Interval Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: [Subscription Start Date, Country, Pricing Plan, Provider]
    field: subscriptions.plan_interval_type
