- dashboard: relay_business_metrics__pooled_monthly_churn_rate
  title: Relay Business Metrics - Pooled Monthly Churn Rate
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: oSQCnMn4EXozd0Pi62zSff
  elements:
  - name: Monthly Churn Rate (not monthly plan users)
    type: text
    title_text: Monthly Churn Rate (not monthly plan users)
    subtitle_text: Period Start = One Month before Period End (x-axis)
    body_text: ''
    row: 7
    col: 0
    width: 24
    height: 2
  - name: This dashboard takes a long time to load (up to 2 minutes)
    type: text
    title_text: This dashboard takes a long time to load (up to 2 minutes).
    body_text: "**\"Pooled\" churn rates** are calculated as follows:\n\n`n lost /\
      \ n start`\n\n* n start = number of subscribers active at start of period\n\
      * n lost = number of subscribers lost during period (of those active at start\
      \ of period)\n\n### Notes\n\n* This is **different to cohort-based** churn rates.\
      \ Cohort-based churn rates are available in Relay SaaSboard - Churn(link will\
      \ be added here).\n* We are counting churn when a user stops having access to\
      \ the product, not when a user cancels their subscription. For monthly customers,\
      \ these are roughly the same thing, for annual customers they are not as customers\
      \ can cancel (aka stop auto renew) long before their subscription end. However\
      \ we do know that most people cancel close to the renewal time (when they get\
      \ their renewal email).\n\n* This dashboard was changed to update the churn\
      \ calculation after the upgrade to the bundle plan feature was released in October\
      \ 11, 2022. "
    row: 0
    col: 0
    width: 24
    height: 7
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      For queries, corrections please contact Yeonjoo Yoo (yeonjoo@mozilla.com).

      1) The number of subscriptions at the start of the period is slightly different to the number of subscriptions shown as active on the Relay SaaSboard - Active Subscriptions(the link will be added here). I believe this is due to slightly different counting methods between `active_subscriptions` table and the query that powers this dashboard being against `subscriptions` table.
    row: 21
    col: 0
    width: 24
    height: 3
  - title: All
    name: All
    model: relay
    explore: subscriptions
    type: looker_line
    fields: [original_subscriptions__active.active_date, period_start, period_end,
      original_subscriptions__retention.subscription_count, n_start, n_lost]
    sorts: [period_start desc]
    limit: 100
    column_limit: 50
    row_total: right
    dynamic_fields: [{category: table_calculation, expression: "${original_subscriptions__retention.subscription_count}\
          \ - ${n_start}", label: Count - N Start, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: count_n_start, _type_hint: number,
        is_disabled: false}, {category: dimension, expression: 'add_months(1, ${original_subscriptions__active.active_date})',
        label: Period End, value_format: !!null '', value_format_name: !!null '',
        dimension: period_end, _kind_hint: dimension, _type_hint: date}, {category: dimension,
        expression: "${original_subscriptions__active.active_date}", label: Period
          Start, value_format: !!null '', value_format_name: !!null '', dimension: period_start,
        _kind_hint: dimension, _type_hint: date}, {category: measure, expression: "(is_null(${subscriptions.ended_reason})\
          \ OR (${subscriptions.ended_reason} != \"Plan Change\"))\nAND\n${subscriptions.original_subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}\n\
          AND \n${subscriptions.end_date} <= ${period_end}\n\n", label: N Lost, value_format: !!null '',
        value_format_name: !!null '', based_on: original_subscriptions__retention.subscription_count,
        filter_expression: "(is_null(${subscriptions.ended_reason}) OR (${subscriptions.ended_reason}\
          \ != \"Plan Change\"))\nAND\n${subscriptions.original_subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}\n\
          AND \n${subscriptions.end_date} <= ${period_end}\n\n", _kind_hint: measure,
        measure: n_lost, type: count_distinct, _type_hint: number}, {category: measure,
        expression: "${subscriptions.original_subscription_start_date} <= ${period_start}\n\
          AND\n${subscriptions.end_date} > ${period_start}\nAND \n(is_null(${subscriptions.ended_reason})OR${subscriptions.ended_reason}\
          \ != \"Plan Change\") ", label: N Start, value_format: !!null '', value_format_name: !!null '',
        based_on: original_subscriptions__retention.subscription_count, filter_expression: "${subscriptions.original_subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}\n\
          AND \n(is_null(${subscriptions.ended_reason})OR${subscriptions.ended_reason}\
          \ != \"Plan Change\") ", _kind_hint: measure, measure: n_start, type: count_distinct,
        _type_hint: number}, {category: table_calculation, expression: "${n_lost}/${n_start}",
        label: Churn rate, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: churn_rate, _type_hint: number, id: YQl7meS99Q,
        is_disabled: false}]
    filter_expression: |
      ${original_subscriptions__active.active_date} = trunc_months(${original_subscriptions__active.active_date})
      AND
      ${original_subscriptions__active.active_date} <= add_months(-1, now())
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: churn_rate, id: churn_rate,
            name: Churn rate}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      churn_rate: "#073072"
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
      subscriptions.subscription_start_month: Cohort
    x_axis_datetime_label: "%Y-%m-%d"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0.065', label: Industry benchmark}]
    x_axis_label_rotation: -45
    discontinuous_nulls: true
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [original_subscriptions__active.active_date, period_start, original_subscriptions__retention.subscription_count,
      n_start, n_lost, count_n_start]
    defaults_version: 1
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: "- Filtered by “Active Date for Churn for All” filter which is active\
      \ date measured from the first subscription plan start date. \n\n- Not affected\
      \ by upgrade events i.e. The churn is calculated using the first subscription\
      \ plan start date and the last subscription plan end date regardless of plan\
      \ changes. \n"
    listen:
      Product Name: subscriptions.product_name
      'Active Date for Churn for All ': original_subscriptions__active.active_date
    row: 9
    col: 0
    width: 12
    height: 12
  - title: By Plan Type
    name: By Plan Type
    model: relay
    explore: subscriptions
    type: looker_line
    fields: [subscriptions__active.active_date, period_start, period_end, subscriptions.count,
      n_start, n_lost, subscriptions.plan_type]
    pivots: [subscriptions.plan_type]
    sorts: [period_start desc, subscriptions.plan_type]
    limit: 100
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${subscriptions.count}\
          \ - ${n_start}", label: Count - N Start, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: count_n_start, _type_hint: number,
        id: 0uW4QDFycp}, {category: dimension, expression: 'add_months(1, ${subscriptions__active.active_date})',
        label: Period End, value_format: !!null '', value_format_name: !!null '',
        dimension: period_end, _kind_hint: dimension, _type_hint: date, id: WsAtxE40zP},
      {category: dimension, expression: "${subscriptions__active.active_date}", label: Period
          Start, value_format: !!null '', value_format_name: !!null '', dimension: period_start,
        _kind_hint: dimension, _type_hint: date, id: zT4PEpg8iM}, {category: measure,
        expression: "${subscriptions.subscription_start_date} <= ${period_start}\n\
          AND\n${subscriptions.end_date} > ${period_start}\nAND \n${subscriptions.end_date}\
          \ <= ${period_end}", label: N Lost, value_format: !!null '', value_format_name: !!null '',
        based_on: subscriptions.count, filter_expression: "${subscriptions.subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}\n\
          AND \n${subscriptions.end_date} <= ${period_end}", _kind_hint: measure,
        measure: n_lost, type: count, _type_hint: number, id: PDTZJ6FOv8}, {category: measure,
        expression: "${subscriptions.subscription_start_date} <= ${period_start}\n\
          AND\n${subscriptions.end_date} > ${period_start}", label: N Start, value_format: !!null '',
        value_format_name: !!null '', based_on: subscriptions.count, filter_expression: "${subscriptions.subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}",
        _kind_hint: measure, measure: n_start, type: count, _type_hint: number, id: rBze1PU7zA},
      {category: table_calculation, expression: "${n_lost}/${n_start}", label: Churn
          rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: churn_rate, _type_hint: number, id: Zhd7xjaxKR}, {category: measure,
        expression: "${subscriptions.subscription_start_date} <= ${period_start}\n\
          AND\n${subscriptions.end_date} > ${period_start}\nAND \n${subscriptions.end_date}\
          \ <= ${period_end}\nAND\n ${subscriptions.ended_reason} = \"Plan Change\"\
          \ ", label: N Lost due to Upgrades, value_format: !!null '', value_format_name: !!null '',
        based_on: subscriptions.count, filter_expression: "${subscriptions.subscription_start_date}\
          \ <= ${period_start}\nAND\n${subscriptions.end_date} > ${period_start}\n\
          AND \n${subscriptions.end_date} <= ${period_end}\nAND\n ${subscriptions.ended_reason}\
          \ = \"Plan Change\" ", _kind_hint: measure, measure: n_lost_due_to_upgrades,
        type: count, _type_hint: number}]
    filter_expression: |
      ${subscriptions__active.active_date} = trunc_months(${subscriptions__active.active_date})
      AND
      ${subscriptions__active.active_date} <= add_months(-1, now())
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
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    x_axis_label: ''
    series_types: {}
    series_labels:
      1 - churn_rate: Month 1
      churned: Subs Churned
      subscriptions__retention.months_since_subscription_start: Months Since Subscription
        Start
      subscriptions.subscription_start_month: Cohort
    x_axis_datetime_label: "%Y-%m-%d"
    x_axis_label_rotation: -45
    discontinuous_nulls: true
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [subscriptions__active.active_date, count_n_start, period_start,
      subscriptions.count, n_start, n_lost]
    defaults_version: 1
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: "- Filtered by “Active Date for Churn for by Plan type” filter which\
      \ is active date measured from each subscription plan start date. \n\n- Affected\
      \ by upgrade events i.e. This churn represents how each subscription plan count\
      \ is lost either by the subscription end or by upgrade to another plan. \n"
    listen:
      Product Name: subscriptions.product_name
      Active Date for Churn by Plan type: subscriptions__active.active_date
    row: 9
    col: 12
    width: 12
    height: 12
  filters:
  - name: 'Active Date for Churn for All '
    title: 'Active Date for Churn for All '
    type: field_filter
    default_value: after 6 month ago
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: relay
    explore: subscriptions
    listens_to_filters: []
    field: original_subscriptions__active.active_date
  - name: Active Date for Churn by Plan type
    title: Active Date for Churn by Plan type
    type: field_filter
    default_value: after 6 month ago
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: relay
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions__active.active_date
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
