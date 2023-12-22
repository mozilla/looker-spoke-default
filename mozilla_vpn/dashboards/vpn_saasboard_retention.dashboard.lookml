- dashboard: vpn_saasboard__retention
  title: VPN SaaSboard - Retention
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 2147484 seconds
  preferred_slug: Xy9m1LuSVOyM1ql8YcKOGA
  elements:
  - name: ''
    type: text
    body_text: <img src="https://www.mozilla.org/media/img/logos/vpn/logo-with-wordmark.c1659f9e6dd6.svg"
      style="width:160px;height:50px;" >
    row: 2
    col: 0
    width: 3
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div style='background-color: #ffffdd; padding: 5px 10px; border:\
      \ solid 3px #ededed; border-radius: 5px; height:220px'>\n\nThese visualizations\
      \ capture <strong>subscription retention</strong>.\n<ul>\n<li>Retention rate\
      \ is the percentage of active subscriptions out of all subscriptions. </li>\n\
      <li>Subscriptions are counted in every month less than or equal to their current\
      \ months since subscription started.</li>\n\n<li>Retention rate must not be\
      \ aggregated over multiple months because it is cumulative. Therefore, when\
      \ Months Since Subscription Start not shown, the retention rate shows data for\
      \ the current month.</li>\n\n<li>A cohort refers to a group of subscriptions\
      \ that started their subscriptions in a particular month.  For example, cohort\
      \ 07-2020 includes all subscriptions that started in the month of July 2020.</li>\n\
      </ul>\n<br>\nPlease submit any questions in  <b><a href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\"\
      >mozilla-vpn-data</a></b> channel on Slack. \n</div>"
    row: 2
    col: 3
    width: 16
    height: 5
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention Rate</b></h3>

      <h4> <b><code>Original Subscription Start Date</code> is used to discard subscription removal due to plan changes(upgrades).</b> </h4>
    row: 7
    col: 0
    width: 24
    height: 3
  - title: Retention Rate Table (by Cohort)
    name: Retention Rate Table (by Cohort)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count,
      subscriptions.original_subscription_start_month]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month]
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
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
      subscriptions__retention.age_in_months: Months Since Subcription Started
      subscriptions.subscription_start_month: Cohort
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_cell_visualizations:
      subscriptions__retention.age_in_months:
        is_active: false
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 0a238a55-cee3-6513-fab8-e325a1654f8e, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2019-10
              - retention_rate, name: 2019-10}, {axisId: retention_rate, id: 2019-11
              - retention_rate, name: 2019-11}, {axisId: retention_rate, id: 2019-12
              - retention_rate, name: 2019-12}, {axisId: retention_rate, id: 2020-01
              - retention_rate, name: 2020-01}, {axisId: retention_rate, id: 2020-02
              - retention_rate, name: 2020-02}, {axisId: retention_rate, id: 2020-03
              - retention_rate, name: 2020-03}, {axisId: retention_rate, id: 2020-04
              - retention_rate, name: 2020-04}, {axisId: retention_rate, id: 2020-05
              - retention_rate, name: 2020-05}, {axisId: retention_rate, id: 2020-06
              - retention_rate, name: 2020-06}, {axisId: retention_rate, id: 2020-07
              - retention_rate, name: 2020-07}, {axisId: retention_rate, id: 2020-08
              - retention_rate, name: 2020-08}, {axisId: retention_rate, id: 2020-09
              - retention_rate, name: 2020-09}, {axisId: retention_rate, id: 2020-10
              - retention_rate, name: 2020-10}, {axisId: retention_rate, id: 2020-11
              - retention_rate, name: 2020-11}, {axisId: retention_rate, id: 2020-12
              - retention_rate, name: 2020-12}, {axisId: retention_rate, id: 2021-01
              - retention_rate, name: 2021-01}, {axisId: retention_rate, id: 2021-02
              - retention_rate, name: 2021-02}, {axisId: retention_rate, id: 2021-03
              - retention_rate, name: 2021-03}, {axisId: retention_rate, id: 2021-04
              - retention_rate, name: 2021-04}, {axisId: retention_rate, id: 2021-05
              - retention_rate, name: 2021-05}, {axisId: retention_rate, id: 2021-06
              - retention_rate, name: 2021-06}, {axisId: retention_rate, id: 2021-07
              - retention_rate, name: 2021-07}, {axisId: retention_rate, id: 2021-08
              - retention_rate, name: 2021-08}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 51
    col: 0
    width: 24
    height: 7
  - title: Retention Counts Table (by Cohort)
    name: Retention Counts Table (by Cohort)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count,
      subscriptions.original_subscription_start_month]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month]
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
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
      subscriptions__retention.age_in_months: Months Since Subcription Started
      subscriptions.subscription_start_month: Cohort
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_cell_visualizations:
      subscriptions__retention.age_in_months:
        is_active: false
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 0a238a55-cee3-6513-fab8-e325a1654f8e, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    trellis: pivot
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
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2019-10
              - retention_rate, name: 2019-10}, {axisId: retention_rate, id: 2019-11
              - retention_rate, name: 2019-11}, {axisId: retention_rate, id: 2019-12
              - retention_rate, name: 2019-12}, {axisId: retention_rate, id: 2020-01
              - retention_rate, name: 2020-01}, {axisId: retention_rate, id: 2020-02
              - retention_rate, name: 2020-02}, {axisId: retention_rate, id: 2020-03
              - retention_rate, name: 2020-03}, {axisId: retention_rate, id: 2020-04
              - retention_rate, name: 2020-04}, {axisId: retention_rate, id: 2020-05
              - retention_rate, name: 2020-05}, {axisId: retention_rate, id: 2020-06
              - retention_rate, name: 2020-06}, {axisId: retention_rate, id: 2020-07
              - retention_rate, name: 2020-07}, {axisId: retention_rate, id: 2020-08
              - retention_rate, name: 2020-08}, {axisId: retention_rate, id: 2020-09
              - retention_rate, name: 2020-09}, {axisId: retention_rate, id: 2020-10
              - retention_rate, name: 2020-10}, {axisId: retention_rate, id: 2020-11
              - retention_rate, name: 2020-11}, {axisId: retention_rate, id: 2020-12
              - retention_rate, name: 2020-12}, {axisId: retention_rate, id: 2021-01
              - retention_rate, name: 2021-01}, {axisId: retention_rate, id: 2021-02
              - retention_rate, name: 2021-02}, {axisId: retention_rate, id: 2021-03
              - retention_rate, name: 2021-03}, {axisId: retention_rate, id: 2021-04
              - retention_rate, name: 2021-04}, {axisId: retention_rate, id: 2021-05
              - retention_rate, name: 2021-05}, {axisId: retention_rate, id: 2021-06
              - retention_rate, name: 2021-06}, {axisId: retention_rate, id: 2021-07
              - retention_rate, name: 2021-07}, {axisId: retention_rate, id: 2021-08
              - retention_rate, name: 2021-08}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.subscription_count, total_retention_rate]
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 58
    col: 0
    width: 24
    height: 7
  - title: Current Retention by Cohort
    name: Current Retention by Cohort
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.original_subscription_start_month, filtered_original_subscription_retention_retained_updated,
      original_subscriptions__retention.subscription_count]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${subscriptions.count}-${subscriptions__retention.retained}"
      label: Not Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: not_retained
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Filtered Retention - Retained - Updated
      value_format:
      value_format_name:
      based_on: subscriptions__retention.retained
      _kind_hint: measure
      measure: filtered_retention_retained_updated
      type: count_distinct
      _type_hint: number
      filters:
        subscriptions.is_ended: 'No'
    - category: table_calculation
      expression: "${filtered_retention_retained_updated}/${subscriptions.count}"
      label: Retention Rate - Updated
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate_updated
      _type_hint: number
      is_disabled: true
    - category: measure
      expression:
      label: Filtered Original Subscription Retention - Retained - Updated
      value_format:
      value_format_name:
      based_on: original_subscriptions__retention.retained
      _kind_hint: measure
      measure: filtered_original_subscription_retention_retained_updated
      type: count_distinct
      _type_hint: number
      filters:
        subscriptions.is_ended: 'No'
    - category: table_calculation
      expression: "${filtered_original_subscription_retention_retained_updated}/${original_subscriptions__retention.subscription_count}"
      label: Total Rentention Rate - Updated
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_rentention_rate_updated
      _type_hint: number
    x_axis_gridlines: true
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: Retention Rate, orientation: left, series: [{axisId: total_rentention_rate_updated,
            id: total_rentention_rate_updated, name: Total Rentention Rate - Updated}],
        showLabels: true, showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        type: linear}, {label: Retention Counts, orientation: right, series: [{axisId: filtered_original_subscription_retention_retained_updated,
            id: filtered_original_subscription_retention_retained_updated, name: Filtered
              Original Subscription Retention - Retained - Updated}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [subscriptions.count]
    series_types:
      total_rentention_rate_updated: line
    series_colors:
      retained: "#0060E0"
      retention_rate: "#000000"
      churned: "#F9CB67"
      not_retained: "#F9CB67"
      subscriptions__retention.retained: "#0060E0"
      retention_rate_updated: "#000000"
      filtered_retention_retained_updated: "#1A73E8"
      total_rentention_rate_updated: "#000000"
      filtered_original_subscription_retention_retained_updated: "#0060E0"
    series_labels:
      filtered_retention_retained_updated: Retained
      retention_rate_updated: Retention Rate
    label_color: []
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    column_group_spacing_ratio: 0.3
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.subscription_count]
    note_state: expanded
    note_display: hover
    note_text: This views show the current retention rate and counts for each cohort.
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 10
    col: 12
    width: 12
    height: 10
  - title: Retention at Months Since Subscription Start
    name: Retention at Months Since Subscription Start
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [original_subscriptions__retention.retained desc]
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${subscriptions.count}-${subscriptions__retention.retained}"
      label: Not Retained
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: not_retained
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: original_subscriptions__retention.retained,
            id: original_subscriptions__retention.retained, name: Retained}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: left, series: [{axisId: subscriptions.count, id: subscriptions.count,
            name: Subscriptions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: total_retention_rate, id: total_retention_rate, name: Total Retention
              Rate}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_label: Months Since Subscription Start
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      total_retention_rate: line
    series_colors:
      retention_rate: "#000000"
      churned: "#ffa993"
      retained: "#0060E0"
      not_retained: "#F9CB67"
      total_retention_rate: "#000000"
    label_color: []
    column_group_spacing_ratio: 0.3
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.subscription_count]
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
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 10
    col: 0
    width: 12
    height: 10
  - title: Untitled
    name: Untitled
    model: mozilla_vpn
    explore: subscriptions
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
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Data Last Updated
    defaults_version: 1
    hidden_fields: [metadata.last_modified_date]
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Subscription Start Date: subscriptions.subscription_start_month
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 2
    col: 19
    width: 5
    height: 5
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention by Cohort</b></h3>

      <h4> <b><code>Original Subscription Start Date</code> is used to discard subscription removal due to plan changes(upgrades).</b> </h4>
    row: 39
    col: 0
    width: 24
    height: 3
  - name: " (5)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention by Plan Interval Type</b></h3>

      <h4> <b><code>Subscription Start Date</code> is used to track subscription removal due to plan changes(upgrades).</b> </h4>
    row: 20
    col: 0
    width: 24
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Retention by Forcast Region</b></h3>

      <h4> <b><code>Original Subscription Start Date</code> is used to discard subscription removal due to plan changes(upgrades).</b> </h4>
    row: 65
    col: 0
    width: 24
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 25px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/412">

       Active Subs</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/416">

       Subs Growth</a>

        <a style="color: #efefef; border: 1px solid white; padding: 5px 25px; float: left; line-height: 40px; font-weight: bold; text-decoration: underline" href="https://mozilla.cloud.looker.com/dashboards/414">Retention</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/413">Churn</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://mozilla.cloud.looker.com/dashboards/433">Revenue</a>

        <a style="color: #efefef; padding: 5px 25px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Docs</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Cohort Retention Rate By Months Since Subscription Start (A)
    name: Cohort Retention Rate By Months Since Subscription Start (A)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count,
      subscriptions.original_subscription_start_month]
    pivots: [original_subscriptions__retention.months_since_original_subscription_start]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions.original_subscription_start_month, original_subscriptions__retention.months_since_original_subscription_start]
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
      _type_hint: number
    x_axis_gridlines: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2019-10
              - retention_rate, name: 2019-10}, {axisId: retention_rate, id: 2019-11
              - retention_rate, name: 2019-11}, {axisId: retention_rate, id: 2019-12
              - retention_rate, name: 2019-12}, {axisId: retention_rate, id: 2020-01
              - retention_rate, name: 2020-01}, {axisId: retention_rate, id: 2020-02
              - retention_rate, name: 2020-02}, {axisId: retention_rate, id: 2020-03
              - retention_rate, name: 2020-03}, {axisId: retention_rate, id: 2020-04
              - retention_rate, name: 2020-04}, {axisId: retention_rate, id: 2020-05
              - retention_rate, name: 2020-05}, {axisId: retention_rate, id: 2020-06
              - retention_rate, name: 2020-06}, {axisId: retention_rate, id: 2020-07
              - retention_rate, name: 2020-07}, {axisId: retention_rate, id: 2020-08
              - retention_rate, name: 2020-08}, {axisId: retention_rate, id: 2020-09
              - retention_rate, name: 2020-09}, {axisId: retention_rate, id: 2020-10
              - retention_rate, name: 2020-10}, {axisId: retention_rate, id: 2020-11
              - retention_rate, name: 2020-11}, {axisId: retention_rate, id: 2020-12
              - retention_rate, name: 2020-12}, {axisId: retention_rate, id: 2021-01
              - retention_rate, name: 2021-01}, {axisId: retention_rate, id: 2021-02
              - retention_rate, name: 2021-02}, {axisId: retention_rate, id: 2021-03
              - retention_rate, name: 2021-03}, {axisId: retention_rate, id: 2021-04
              - retention_rate, name: 2021-04}, {axisId: retention_rate, id: 2021-05
              - retention_rate, name: 2021-05}, {axisId: retention_rate, id: 2021-06
              - retention_rate, name: 2021-06}, {axisId: retention_rate, id: 2021-07
              - retention_rate, name: 2021-07}, {axisId: retention_rate, id: 2021-08
              - retention_rate, name: 2021-08}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Cohort
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_labels:
      0 - retention_rate: Month 0
      1 - retention_rate: Month 1
      2 - retention_rate: Month 2
      3 - retention_rate: Month 3
      4 - retention_rate: Month 4
      5 - retention_rate: Month 5
      6 - retention_rate: Month 6
      7 - retention_rate: Month 7
      8 - retention_rate: Month 8
      9 - retention_rate: Month 9
      13 - retention_rate: Month 13
      12 - retention_rate: Month 12
      11 - retention_rate: Month 11
      10 - retention_rate: Month 10
      14 - retention_rate: Month 14
      15 - retention_rate: Month 15
      16 - retention_rate: Month 16
      17 - retention_rate: Month 17
      18 - retention_rate: Month 18
      19 - retention_rate: Month 19
      20 - retention_rate: Month 20
      21 - retention_rate: Month 21
      0 - total_retention_rate: Month 0
      1 - total_retention_rate: Month 1
      2 - total_retention_rate: Month 2
      3 - total_retention_rate: Month 3
      4 - total_retention_rate: Month 4
    x_axis_datetime_label: "%m-%Y"
    x_axis_label_rotation: -45
    discontinuous_nulls: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
    hide_totals: false
    hide_row_totals: false
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 42
    col: 0
    width: 12
    height: 9
  - title: Retention Rate Table (By Plan Interval Type)
    name: Retention Rate Table (By Plan Interval Type)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions.count, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.retained, subscriptions.plan_interval_type]
    pivots: [subscriptions__retention.months_since_subscription_start]
    filters:
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start]
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    - category: table_calculation
      expression: max(pivot_row(if(is_null(${subscriptions.count}),null,${subscriptions__retention.months_since_subscription_start})))
      label: Months Since Plan Start
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: months_since_plan_start
      _type_hint: number
    - category: table_calculation
      description: for sorting plans by volume
      expression: pivot_offset(${subscriptions.count}, 0)
      label: Total Subscribers
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_subscribers
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
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
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    series_cell_visualizations:
      retained:
        is_active: false
    series_text_format:
      retention_rate:
        align: center
      subscriptions__retention.months_since_subscription_start:
        align: center
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e,
          custom: {id: f7c6f923-568d-4870-0fb1-bcf663bd1626, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, stepped: true}},
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
    trellis: pivot
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
    x_axis_label: Months Since Subscription Started
    series_colors: {}
    defaults_version: 1
    hidden_fields: [subscriptions.count, new_calculation, months_since_plan_start,
      pricing_plan_for_sorting, total_subscriptions, total_subscriptions_for_sorting,
      total_subscribers, subscriptions__retention.retained]
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Subscription Start Date: subscriptions.subscription_start_month
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 29
    col: 0
    width: 24
    height: 5
  - title: Retention Counts Table (By Plan Interval Type)
    name: Retention Counts Table (By Plan Interval Type)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_grid
    fields: [subscriptions.count, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.retained, subscriptions.plan_interval_type]
    pivots: [subscriptions__retention.months_since_subscription_start]
    filters:
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start]
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    - category: table_calculation
      expression: max(pivot_row(if(is_null(${subscriptions.count}),null,${subscriptions__retention.months_since_subscription_start})))
      label: Months Since Plan Start
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: months_since_plan_start
      _type_hint: number
    - category: table_calculation
      description: for sorting plans by volume
      expression: pivot_offset(${subscriptions.count}, 0)
      label: Total Subscribers
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_subscribers
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
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
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
      retained: Subs Retained
    series_cell_visualizations:
      retained:
        is_active: false
    series_text_format:
      retention_rate: {}
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e,
          custom: {id: 85eacb9d-f942-94f5-a329-7ac6ede930c2, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, stepped: true}},
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
    trellis: pivot
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
    x_axis_label: Months Since Subscription Started
    series_colors: {}
    defaults_version: 1
    hidden_fields: [subscriptions.count, new_calculation, months_since_plan_start,
      pricing_plan_for_sorting, total_subscriptions, total_subscriptions_for_sorting,
      total_subscribers, retention_rate]
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Subscription Start Date: subscriptions.subscription_start_month
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 34
    col: 0
    width: 24
    height: 5
  - title: Retention Rate  (By Plan Interval Type)
    name: Retention Rate  (By Plan Interval Type)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [subscriptions.count, subscriptions__retention.months_since_subscription_start,
      subscriptions__retention.retained, subscriptions.plan_interval_type]
    pivots: [subscriptions.plan_interval_type]
    filters:
      subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [subscriptions__retention.months_since_subscription_start, subscriptions.plan_interval_type,
      months_since_plan_start desc 0, total_subscribers desc 0]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
    - category: table_calculation
      expression: max(pivot_row(if(is_null(${subscriptions.count}),null,${subscriptions__retention.months_since_subscription_start})))
      label: Months Since Plan Start
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      table_calculation: months_since_plan_start
      _type_hint: number
    - category: table_calculation
      description: for sorting plans by volume
      expression: pivot_offset(${subscriptions.count}, 0)
      label: Total Subscribers
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_subscribers
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
    series_colors:
      1-month-usd-4.99 - retention_rate: "#7363A9"
      6-month-chf-47.94 - retention_rate: "#82a6a8"
      1_month - retention_rate: "#ffd95f"
      1_year - retention_rate: "#4276be"
      6_month - retention_rate: "#b42f37"
    discontinuous_nulls: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      retained:
        is_active: false
    series_text_format:
      retention_rate: {}
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e,
          custom: {id: f7c6f923-568d-4870-0fb1-bcf663bd1626, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [subscriptions.count, new_calculation, months_since_plan_start,
      pricing_plan_for_sorting, total_subscriptions, total_subscriptions_for_sorting,
      total_subscribers, subscriptions__retention.retained]
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Subscription Start Date: subscriptions.subscription_start_month
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 23
    col: 0
    width: 24
    height: 6
  - title: Cohort Retention Rate By Months Since Subscription Start (B)
    name: Cohort Retention Rate By Months Since Subscription Start (B)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count,
      subscriptions.original_subscription_start_month]
    pivots: [subscriptions.original_subscription_start_month]
    fill_fields: [subscriptions.original_subscription_start_month]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [original_subscriptions__retention.retained desc 0, subscriptions.original_subscription_start_month]
    dynamic_fields:
    - category: table_calculation
      expression: "${subscriptions__retention.retained}/${subscriptions.count}"
      label: Retention Rate
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: retention_rate
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
      _type_hint: number
    x_axis_gridlines: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2019-10
              - retention_rate, name: 2019-10}, {axisId: retention_rate, id: 2019-11
              - retention_rate, name: 2019-11}, {axisId: retention_rate, id: 2019-12
              - retention_rate, name: 2019-12}, {axisId: retention_rate, id: 2020-01
              - retention_rate, name: 2020-01}, {axisId: retention_rate, id: 2020-02
              - retention_rate, name: 2020-02}, {axisId: retention_rate, id: 2020-03
              - retention_rate, name: 2020-03}, {axisId: retention_rate, id: 2020-04
              - retention_rate, name: 2020-04}, {axisId: retention_rate, id: 2020-05
              - retention_rate, name: 2020-05}, {axisId: retention_rate, id: 2020-06
              - retention_rate, name: 2020-06}, {axisId: retention_rate, id: 2020-07
              - retention_rate, name: 2020-07}, {axisId: retention_rate, id: 2020-08
              - retention_rate, name: 2020-08}, {axisId: retention_rate, id: 2020-09
              - retention_rate, name: 2020-09}, {axisId: retention_rate, id: 2020-10
              - retention_rate, name: 2020-10}, {axisId: retention_rate, id: 2020-11
              - retention_rate, name: 2020-11}, {axisId: retention_rate, id: 2020-12
              - retention_rate, name: 2020-12}, {axisId: retention_rate, id: 2021-01
              - retention_rate, name: 2021-01}, {axisId: retention_rate, id: 2021-02
              - retention_rate, name: 2021-02}, {axisId: retention_rate, id: 2021-03
              - retention_rate, name: 2021-03}, {axisId: retention_rate, id: 2021-04
              - retention_rate, name: 2021-04}, {axisId: retention_rate, id: 2021-05
              - retention_rate, name: 2021-05}, {axisId: retention_rate, id: 2021-06
              - retention_rate, name: 2021-06}, {axisId: retention_rate, id: 2021-07
              - retention_rate, name: 2021-07}, {axisId: retention_rate, id: 2021-08
              - retention_rate, name: 2021-08}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    hidden_series: []
    series_labels:
      0 - retention_rate: Month 0
      1 - retention_rate: Month 1
      2 - retention_rate: Month 2
      3 - retention_rate: Month 3
      4 - retention_rate: Month 4
      5 - retention_rate: Month 5
      6 - retention_rate: Month 6
      7 - retention_rate: Month 7
      8 - retention_rate: Month 8
      9 - retention_rate: Month 9
      13 - retention_rate: Month 13
      12 - retention_rate: Month 12
      11 - retention_rate: Month 11
      10 - retention_rate: Month 10
      14 - retention_rate: Month 14
      15 - retention_rate: Month 15
      16 - retention_rate: Month 16
      17 - retention_rate: Month 17
      18 - retention_rate: Month 18
      19 - retention_rate: Month 19
      20 - retention_rate: Month 20
      21 - retention_rate: Month 21
    x_axis_datetime_label: ''
    discontinuous_nulls: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count]
    hide_totals: false
    hide_row_totals: false
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 42
    col: 12
    width: 12
    height: 9
  - title: Retention Rate Table (by Forecast Region)
    name: Retention Rate Table (by Forecast Region)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [original_subscriptions__retention.months_since_original_subscription_start,
      original_subscriptions__retention.retained, original_subscriptions__retention.subscription_count,
      subscriptions.forecast_region]
    pivots: [subscriptions.forecast_region]
    filters:
      original_subscriptions__retention.is_cohort_complete: 'Yes'
    sorts: [original_subscriptions__retention.months_since_original_subscription_start,
      subscriptions.forecast_region]
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${original_subscriptions__retention.retained}/${original_subscriptions__retention.subscription_count}"
      label: Total Retention Rate
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: total_retention_rate
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
    legend_position: left
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: retention_rate, id: 2019-10
              - retention_rate, name: 2019-10}, {axisId: retention_rate, id: 2019-11
              - retention_rate, name: 2019-11}, {axisId: retention_rate, id: 2019-12
              - retention_rate, name: 2019-12}, {axisId: retention_rate, id: 2020-01
              - retention_rate, name: 2020-01}, {axisId: retention_rate, id: 2020-02
              - retention_rate, name: 2020-02}, {axisId: retention_rate, id: 2020-03
              - retention_rate, name: 2020-03}, {axisId: retention_rate, id: 2020-04
              - retention_rate, name: 2020-04}, {axisId: retention_rate, id: 2020-05
              - retention_rate, name: 2020-05}, {axisId: retention_rate, id: 2020-06
              - retention_rate, name: 2020-06}, {axisId: retention_rate, id: 2020-07
              - retention_rate, name: 2020-07}, {axisId: retention_rate, id: 2020-08
              - retention_rate, name: 2020-08}, {axisId: retention_rate, id: 2020-09
              - retention_rate, name: 2020-09}, {axisId: retention_rate, id: 2020-10
              - retention_rate, name: 2020-10}, {axisId: retention_rate, id: 2020-11
              - retention_rate, name: 2020-11}, {axisId: retention_rate, id: 2020-12
              - retention_rate, name: 2020-12}, {axisId: retention_rate, id: 2021-01
              - retention_rate, name: 2021-01}, {axisId: retention_rate, id: 2021-02
              - retention_rate, name: 2021-02}, {axisId: retention_rate, id: 2021-03
              - retention_rate, name: 2021-03}, {axisId: retention_rate, id: 2021-04
              - retention_rate, name: 2021-04}, {axisId: retention_rate, id: 2021-05
              - retention_rate, name: 2021-05}, {axisId: retention_rate, id: 2021-06
              - retention_rate, name: 2021-06}, {axisId: retention_rate, id: 2021-07
              - retention_rate, name: 2021-07}, {axisId: retention_rate, id: 2021-08
              - retention_rate, name: 2021-08}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    trellis_rows: 1
    series_labels:
      subscriptions__retention.age_in_months: Months Since Subcription Started
      subscriptions.subscription_start_month: Cohort
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
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
    series_cell_visualizations:
      subscriptions__retention.age_in_months:
        is_active: false
    header_background_color: "#D8D8D8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, custom: {
            id: 0a238a55-cee3-6513-fab8-e325a1654f8e, label: Custom, type: continuous,
            stops: [{color: "#fff", offset: 0}, {color: "#a5e6ff", offset: 50}, {
                color: "#0060E0", offset: 100}]}, options: {steps: 100, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [original_subscriptions__retention.subscription_count, original_subscriptions__retention.retained]
    hidden_pivots: {}
    listen:
      Country: subscriptions.country_name
      Pricing Plan: subscriptions.pricing_plan
      Provider: subscriptions.provider
      Plan Interval Type: subscriptions.plan_interval_type
      Product Name: subscriptions.product_name
      Original Subscription Start Date: subscriptions.original_subscription_start_date
      Plan ID: subscriptions.plan_id
      Has Fraudulent Charge Refunds (Yes / No): subscriptions.has_fraudulent_charge_refunds
      Has Fraudulent Charges (Yes / No): subscriptions.has_fraudulent_charges
    row: 68
    col: 0
    width: 24
    height: 7
  filters:
  - name: Provider
    title: Provider
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
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
    default_value: 6 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.subscription_start_month
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
  - name: Product Name
    title: Product Name
    type: field_filter
    default_value: Mozilla VPN,Mozilla VPN & Firefox Relay
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.product_name
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
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.original_subscription_start_date
  - name: Has Fraudulent Charge Refunds (Yes / No)
    title: Has Fraudulent Charge Refunds (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.has_fraudulent_charge_refunds
  - name: Has Fraudulent Charges (Yes / No)
    title: Has Fraudulent Charges (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.has_fraudulent_charges
  - name: Plan ID
    title: Plan ID
    type: field_filter
    default_value: -"price_1MzNRCJNcmPzuWtRMCwUWADu"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: overflow
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.plan_id
