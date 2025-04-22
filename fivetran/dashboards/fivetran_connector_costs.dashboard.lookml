- dashboard: fivetran_connector_costs
  title: Fivetran Connector Costs
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: lyQwwJDGYBrn6B2y5QDKTI
  elements:
  - title: Total Costs
    name: Total Costs
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.cost_in_USD, connector_costs.time_frame]
    sorts: [connector_costs.cost_in_USD desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 11
    col: 0
    width: 5
    height: 5
  - title: Costs and Paid Active Rows
    name: Costs and Paid Active Rows
    model: fivetran
    explore: connector_costs
    type: looker_column
    fields: [connector_costs.measured_month, connector_costs.cost_in_USD, connector_costs.paid_active_rows,
      connector_costs.spent_rate]
    fill_fields: [connector_costs.measured_month]
    sorts: [connector_costs.measured_month]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: connector_costs.paid_active_rows,
            id: connector_costs.paid_active_rows, name: Paid Active Rows}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: connector_costs.cost_in_USD, id: connector_costs.cost_in_USD,
            name: Cost In USD}, {axisId: connector_costs.spent_rate, id: connector_costs.spent_rate,
            name: Cost per Mio Active Rows}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      connector_costs.spent_rate: line
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#FF2A8A",
        line_value: '5000', label: Spending Limit}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
    row: 2
    col: 0
    width: 24
    height: 7
  - title: Paid Active Rows
    name: Paid Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.paid_active_rows, connector_costs.time_frame]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 11
    col: 10
    width: 5
    height: 5
  - title: Cost per Million Active Rows
    name: Cost per Million Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.spent_rate, connector_costs.time_frame]
    sorts: [connector_costs.time_frame desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 11
    col: 5
    width: 5
    height: 5
  - title: Active Rows
    name: Active Rows
    model: fivetran
    explore: connector_costs
    type: looker_column
    fields: [connector_costs.measured_date, connector_costs.total_active_rows, connector_costs.billing_type]
    pivots: [connector_costs.billing_type]
    fill_fields: [connector_costs.measured_date]
    sorts: [connector_costs.measured_date desc, connector_costs.billing_type desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 16
    col: 0
    width: 24
    height: 9
  - title: Connectors
    name: Connectors
    model: fivetran
    explore: connector_costs
    type: looker_grid
    fields: [connector_costs.destination, connector_costs.connector_group, connector_costs.connector,
      connector_costs.paid_active_rows, connector_costs.percentage_of_paid_active_rows,
      connector_costs.total_active_rows, connector_costs.cost_in_USD]
    sorts: [connector_costs.paid_active_rows desc]
    limit: 500
    column_limit: 50
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
    hidden_pivots: {}
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
    series_column_widths:
      connector_costs.destination: 126
      connector_costs.connector_group: 118
      connector_costs.paid_active_rows: 339
      connector_costs.total_active_rows: 124
      connector_costs.percentage_of_paid_active_rows: 198
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 25
    col: 0
    width: 24
    height: 10
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677007226682},{"type":"h1","children":[{"text":"Overview"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":1677007228625},{"type":"h1","children":[{"text":"Details
      for selected Filters"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 24
    height: 2
  - title: Total Active Rows
    name: Total Active Rows
    model: fivetran
    explore: connector_costs
    type: single_value
    fields: [connector_costs.total_active_rows, connector_costs.time_frame]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 11
    col: 15
    width: 5
    height: 5
  - title: Project's Cost Share
    name: Project's Cost Share
    model: fivetran
    explore: connector_costs
    type: looker_pie
    fields: [connector_costs.destination, connector_costs.cost_in_USD]
    sorts: [connector_costs.cost_in_USD desc]
    limit: 500
    column_limit: 50
    value_labels: none
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
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
      Measured Month: connector_costs.measured_month
    row: 11
    col: 20
    width: 4
    height: 5
  - title: 'Paid Active Rows per Connetor Group over Time '
    name: 'Paid Active Rows per Connetor Group over Time '
    model: fivetran
    explore: connector_costs
    type: looker_line
    fields: [connector_costs.measured_month, connector_costs.paid_active_rows, connector_costs.connector_group]
    pivots: [connector_costs.connector_group]
    fill_fields: [connector_costs.measured_month]
    sorts: [connector_costs.measured_month, connector_costs.connector_group]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: connector_costs.paid_active_rows,
            id: admarket - connector_costs.paid_active_rows, name: admarket}, {axisId: connector_costs.paid_active_rows,
            id: admarket_place - connector_costs.paid_active_rows, name: admarket_place},
          {axisId: connector_costs.paid_active_rows, id: admarketplace_rpm_sftp -
              connector_costs.paid_active_rows, name: admarketplace_rpm_sftp}, {axisId: connector_costs.paid_active_rows,
            id: admarketplace_sftp - connector_costs.paid_active_rows, name: admarketplace_sftp},
          {axisId: connector_costs.paid_active_rows, id: airflow_metadata - connector_costs.paid_active_rows,
            name: airflow_metadata}, {axisId: connector_costs.paid_active_rows, id: akomar_bing
              - connector_costs.paid_active_rows, name: akomar_bing}, {axisId: connector_costs.paid_active_rows,
            id: akomar_bing_gross_update - connector_costs.paid_active_rows, name: akomar_bing_gross_update},
          {axisId: connector_costs.paid_active_rows, id: akomar_bing_test_2019 - connector_costs.paid_active_rows,
            name: akomar_bing_test_2019}, {axisId: connector_costs.paid_active_rows,
            id: amazon - connector_costs.paid_active_rows, name: amazon}, {axisId: connector_costs.paid_active_rows,
            id: apple_app_store - connector_costs.paid_active_rows, name: apple_app_store},
          {axisId: connector_costs.paid_active_rows, id: apple_search_ads - connector_costs.paid_active_rows,
            name: apple_search_ads}, {axisId: connector_costs.paid_active_rows, id: bing
              - connector_costs.paid_active_rows, name: bing}, {axisId: connector_costs.paid_active_rows,
            id: bing_operational_tmp - connector_costs.paid_active_rows, name: bing_operational_tmp},
          {axisId: connector_costs.paid_active_rows, id: box_test - connector_costs.paid_active_rows,
            name: box_test}, {axisId: connector_costs.paid_active_rows, id: bugzilla
              - connector_costs.paid_active_rows, name: bugzilla}, {axisId: connector_costs.paid_active_rows,
            id: buzilla_test_ak - connector_costs.paid_active_rows, name: buzilla_test_ak},
          {axisId: connector_costs.paid_active_rows, id: canonical - connector_costs.paid_active_rows,
            name: canonical}, {axisId: connector_costs.paid_active_rows, id: casa
              - connector_costs.paid_active_rows, name: casa}, {axisId: connector_costs.paid_active_rows,
            id: casatest - connector_costs.paid_active_rows, name: casatest}, {axisId: connector_costs.paid_active_rows,
            id: duck_duck_go - connector_costs.paid_active_rows, name: duck_duck_go},
          {axisId: connector_costs.paid_active_rows, id: ecosia - connector_costs.paid_active_rows,
            name: ecosia}, {axisId: connector_costs.paid_active_rows, id: ecosia_dev
              - connector_costs.paid_active_rows, name: ecosia_dev}, {axisId: connector_costs.paid_active_rows,
            id: ecosia_temp - connector_costs.paid_active_rows, name: ecosia_temp},
          {axisId: connector_costs.paid_active_rows, id: firefox_android_google_play
              - connector_costs.paid_active_rows, name: firefox_android_google_play},
          {axisId: connector_costs.paid_active_rows, id: firefox_app_store - connector_costs.paid_active_rows,
            name: firefox_app_store}, {axisId: connector_costs.paid_active_rows, id: fivetran_log
              - connector_costs.paid_active_rows, name: fivetran_log}, {axisId: connector_costs.paid_active_rows,
            id: google - connector_costs.paid_active_rows, name: google}, {axisId: connector_costs.paid_active_rows,
            id: google_ads - connector_costs.paid_active_rows, name: google_ads},
          {axisId: connector_costs.paid_active_rows, id: google_dev_v2 - connector_costs.paid_active_rows,
            name: google_dev_v2}, {axisId: connector_costs.paid_active_rows, id: google_play_store
              - connector_costs.paid_active_rows, name: google_play_store}, {axisId: connector_costs.paid_active_rows,
            id: google_search_console - connector_costs.paid_active_rows, name: google_search_console},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_addons
              - connector_costs.paid_active_rows, name: google_search_console_addons},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_blog
              - connector_costs.paid_active_rows, name: google_search_console_blog},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_pocket
              - connector_costs.paid_active_rows, name: google_search_console_pocket},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_support
              - connector_costs.paid_active_rows, name: google_search_console_support},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_www
              - connector_costs.paid_active_rows, name: google_search_console_www},
          {axisId: connector_costs.paid_active_rows, id: google_sheets.finance_revenue_by_month
              - connector_costs.paid_active_rows, name: google_sheets.finance_revenue_by_month},
          {axisId: connector_costs.paid_active_rows, id: google_sheets.sales_deals
              - connector_costs.paid_active_rows, name: google_sheets.sales_deals},
          {axisId: connector_costs.paid_active_rows, id: greenhouse - connector_costs.paid_active_rows,
            name: greenhouse}, {axisId: connector_costs.paid_active_rows, id: helpscout
              - connector_costs.paid_active_rows, name: helpscout}, {axisId: connector_costs.paid_active_rows,
            id: mailru - connector_costs.paid_active_rows, name: mailru}, {axisId: connector_costs.paid_active_rows,
            id: microsoft_api - connector_costs.paid_active_rows, name: microsoft_api},
          {axisId: connector_costs.paid_active_rows, id: microsoft_pubcenter_api -
              connector_costs.paid_active_rows, name: microsoft_pubcenter_api}, {
            axisId: connector_costs.paid_active_rows, id: netsuite - connector_costs.paid_active_rows,
            name: netsuite}, {axisId: connector_costs.paid_active_rows, id: netsuite_test_1
              - connector_costs.paid_active_rows, name: netsuite_test_1}, {axisId: connector_costs.paid_active_rows,
            id: qwant - connector_costs.paid_active_rows, name: qwant}, {axisId: connector_costs.paid_active_rows,
            id: rakuten - connector_costs.paid_active_rows, name: rakuten}, {axisId: connector_costs.paid_active_rows,
            id: revenue_amazon - connector_costs.paid_active_rows, name: revenue_amazon},
          {axisId: connector_costs.paid_active_rows, id: revenue_bing - connector_costs.paid_active_rows,
            name: revenue_bing}, {axisId: connector_costs.paid_active_rows, id: revenue_bing_operational
              - connector_costs.paid_active_rows, name: revenue_bing_operational},
          {axisId: connector_costs.paid_active_rows, id: revenue_canonical - connector_costs.paid_active_rows,
            name: revenue_canonical}, {axisId: connector_costs.paid_active_rows, id: revenue_ddg_v2
              - connector_costs.paid_active_rows, name: revenue_ddg_v2}, {axisId: connector_costs.paid_active_rows,
            id: revenue_duck_duck_go - connector_costs.paid_active_rows, name: revenue_duck_duck_go},
          {axisId: connector_costs.paid_active_rows, id: revenue_duck_duck_go_v2 -
              connector_costs.paid_active_rows, name: revenue_duck_duck_go_v2}, {
            axisId: connector_costs.paid_active_rows, id: revenue_ebay - connector_costs.paid_active_rows,
            name: revenue_ebay}, {axisId: connector_costs.paid_active_rows, id: revenue_ecosia
              - connector_costs.paid_active_rows, name: revenue_ecosia}, {axisId: connector_costs.paid_active_rows,
            id: revenue_ecosia_v2 - connector_costs.paid_active_rows, name: revenue_ecosia_v2},
          {axisId: connector_costs.paid_active_rows, id: revenue_google - connector_costs.paid_active_rows,
            name: revenue_google}, {axisId: connector_costs.paid_active_rows, id: revenue_google_v2
              - connector_costs.paid_active_rows, name: revenue_google_v2}, {axisId: connector_costs.paid_active_rows,
            id: revenue_mailru - connector_costs.paid_active_rows, name: revenue_mailru},
          {axisId: connector_costs.paid_active_rows, id: revenue_qwant - connector_costs.paid_active_rows,
            name: revenue_qwant}, {axisId: connector_costs.paid_active_rows, id: revenue_rakuten
              - connector_costs.paid_active_rows, name: revenue_rakuten}, {axisId: connector_costs.paid_active_rows,
            id: revenue_seznam - connector_costs.paid_active_rows, name: revenue_seznam},
          {axisId: connector_costs.paid_active_rows, id: revenue_united - connector_costs.paid_active_rows,
            name: revenue_united}, {axisId: connector_costs.paid_active_rows, id: revenue_yahoo_japan
              - connector_costs.paid_active_rows, name: revenue_yahoo_japan}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_australia - connector_costs.paid_active_rows, name: sage_intacct_australia},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_belgium - connector_costs.paid_active_rows,
            name: sage_intacct_belgium}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_canada - connector_costs.paid_active_rows, name: sage_intacct_canada},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_china_vie -
              connector_costs.paid_active_rows, name: sage_intacct_china_vie}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_china_wofe - connector_costs.paid_active_rows, name: sage_intacct_china_wofe},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_denmark - connector_costs.paid_active_rows,
            name: sage_intacct_denmark}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_finland - connector_costs.paid_active_rows, name: sage_intacct_finland},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_france - connector_costs.paid_active_rows,
            name: sage_intacct_france}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_germany - connector_costs.paid_active_rows, name: sage_intacct_germany},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_moz - connector_costs.paid_active_rows,
            name: sage_intacct_moz}, {axisId: connector_costs.paid_active_rows, id: sage_intacct_netherlands
              - connector_costs.paid_active_rows, name: sage_intacct_netherlands},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_nz - connector_costs.paid_active_rows,
            name: sage_intacct_nz}, {axisId: connector_costs.paid_active_rows, id: sage_intacct_pocket
              - connector_costs.paid_active_rows, name: sage_intacct_pocket}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_spain - connector_costs.paid_active_rows, name: sage_intacct_spain},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_sweden - connector_costs.paid_active_rows,
            name: sage_intacct_sweden}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_taiwan - connector_costs.paid_active_rows, name: sage_intacct_taiwan},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_uk - connector_costs.paid_active_rows,
            name: sage_intacct_uk}, {axisId: connector_costs.paid_active_rows, id: seznam
              - connector_costs.paid_active_rows, name: seznam}, {axisId: connector_costs.paid_active_rows,
            id: stripe - connector_costs.paid_active_rows, name: stripe}, {axisId: connector_costs.paid_active_rows,
            id: stripe_dev_relud - connector_costs.paid_active_rows, name: stripe_dev_relud},
          {axisId: connector_costs.paid_active_rows, id: stripe_nonprod - connector_costs.paid_active_rows,
            name: stripe_nonprod}, {axisId: connector_costs.paid_active_rows, id: test_test_test_leli
              - connector_costs.paid_active_rows, name: test_test_test_leli}, {axisId: connector_costs.paid_active_rows,
            id: test_test_test_leli.test_merged - connector_costs.paid_active_rows,
            name: test_test_test_leli.test_merged}, {axisId: connector_costs.paid_active_rows,
            id: united - connector_costs.paid_active_rows, name: united}, {axisId: connector_costs.paid_active_rows,
            id: workday - connector_costs.paid_active_rows, name: workday}, {axisId: connector_costs.paid_active_rows,
            id: workday_hcm - connector_costs.paid_active_rows, name: workday_hcm},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.employee_details_report
              - connector_costs.paid_active_rows, name: workday_raas.employee_details_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.open_position_details_report
              - connector_costs.paid_active_rows, name: workday_raas.open_position_details_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.promotions_in_date_range_report
              - connector_costs.paid_active_rows, name: workday_raas.promotions_in_date_range_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.total_staffing_report
              - connector_costs.paid_active_rows, name: workday_raas.total_staffing_report},
          {axisId: connector_costs.paid_active_rows, id: zendesk - connector_costs.paid_active_rows,
            name: zendesk}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    swap_axes: false
    defaults_version: 1
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
    row: 37
    col: 0
    width: 24
    height: 8
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Over Time"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 35
    col: 0
    width: 24
    height: 2
  - title: Paid Active Rows per Connector over Time
    name: Paid Active Rows per Connector over Time
    model: fivetran
    explore: connector_costs
    type: looker_line
    fields: [connector_costs.measured_month, connector_costs.paid_active_rows, connector_costs.connector]
    pivots: [connector_costs.connector]
    fill_fields: [connector_costs.measured_month]
    filters: {}
    sorts: [connector_costs.measured_month, connector_costs.connector]
    limit: 500
    column_limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: connector_costs.paid_active_rows,
            id: admarket - connector_costs.paid_active_rows, name: admarket}, {axisId: connector_costs.paid_active_rows,
            id: admarket_place - connector_costs.paid_active_rows, name: admarket_place},
          {axisId: connector_costs.paid_active_rows, id: admarketplace_rpm_sftp -
              connector_costs.paid_active_rows, name: admarketplace_rpm_sftp}, {axisId: connector_costs.paid_active_rows,
            id: admarketplace_sftp - connector_costs.paid_active_rows, name: admarketplace_sftp},
          {axisId: connector_costs.paid_active_rows, id: airflow_metadata - connector_costs.paid_active_rows,
            name: airflow_metadata}, {axisId: connector_costs.paid_active_rows, id: akomar_bing
              - connector_costs.paid_active_rows, name: akomar_bing}, {axisId: connector_costs.paid_active_rows,
            id: akomar_bing_gross_update - connector_costs.paid_active_rows, name: akomar_bing_gross_update},
          {axisId: connector_costs.paid_active_rows, id: akomar_bing_test_2019 - connector_costs.paid_active_rows,
            name: akomar_bing_test_2019}, {axisId: connector_costs.paid_active_rows,
            id: amazon - connector_costs.paid_active_rows, name: amazon}, {axisId: connector_costs.paid_active_rows,
            id: apple_app_store - connector_costs.paid_active_rows, name: apple_app_store},
          {axisId: connector_costs.paid_active_rows, id: apple_search_ads - connector_costs.paid_active_rows,
            name: apple_search_ads}, {axisId: connector_costs.paid_active_rows, id: bing
              - connector_costs.paid_active_rows, name: bing}, {axisId: connector_costs.paid_active_rows,
            id: bing_operational_tmp - connector_costs.paid_active_rows, name: bing_operational_tmp},
          {axisId: connector_costs.paid_active_rows, id: box_test - connector_costs.paid_active_rows,
            name: box_test}, {axisId: connector_costs.paid_active_rows, id: bugzilla
              - connector_costs.paid_active_rows, name: bugzilla}, {axisId: connector_costs.paid_active_rows,
            id: buzilla_test_ak - connector_costs.paid_active_rows, name: buzilla_test_ak},
          {axisId: connector_costs.paid_active_rows, id: canonical - connector_costs.paid_active_rows,
            name: canonical}, {axisId: connector_costs.paid_active_rows, id: casa
              - connector_costs.paid_active_rows, name: casa}, {axisId: connector_costs.paid_active_rows,
            id: casatest - connector_costs.paid_active_rows, name: casatest}, {axisId: connector_costs.paid_active_rows,
            id: duck_duck_go - connector_costs.paid_active_rows, name: duck_duck_go},
          {axisId: connector_costs.paid_active_rows, id: ecosia - connector_costs.paid_active_rows,
            name: ecosia}, {axisId: connector_costs.paid_active_rows, id: ecosia_dev
              - connector_costs.paid_active_rows, name: ecosia_dev}, {axisId: connector_costs.paid_active_rows,
            id: ecosia_temp - connector_costs.paid_active_rows, name: ecosia_temp},
          {axisId: connector_costs.paid_active_rows, id: firefox_android_google_play
              - connector_costs.paid_active_rows, name: firefox_android_google_play},
          {axisId: connector_costs.paid_active_rows, id: firefox_app_store - connector_costs.paid_active_rows,
            name: firefox_app_store}, {axisId: connector_costs.paid_active_rows, id: fivetran_log
              - connector_costs.paid_active_rows, name: fivetran_log}, {axisId: connector_costs.paid_active_rows,
            id: google - connector_costs.paid_active_rows, name: google}, {axisId: connector_costs.paid_active_rows,
            id: google_ads - connector_costs.paid_active_rows, name: google_ads},
          {axisId: connector_costs.paid_active_rows, id: google_dev_v2 - connector_costs.paid_active_rows,
            name: google_dev_v2}, {axisId: connector_costs.paid_active_rows, id: google_play_store
              - connector_costs.paid_active_rows, name: google_play_store}, {axisId: connector_costs.paid_active_rows,
            id: google_search_console - connector_costs.paid_active_rows, name: google_search_console},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_addons
              - connector_costs.paid_active_rows, name: google_search_console_addons},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_blog
              - connector_costs.paid_active_rows, name: google_search_console_blog},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_pocket
              - connector_costs.paid_active_rows, name: google_search_console_pocket},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_support
              - connector_costs.paid_active_rows, name: google_search_console_support},
          {axisId: connector_costs.paid_active_rows, id: google_search_console_www
              - connector_costs.paid_active_rows, name: google_search_console_www},
          {axisId: connector_costs.paid_active_rows, id: google_sheets.finance_revenue_by_month
              - connector_costs.paid_active_rows, name: google_sheets.finance_revenue_by_month},
          {axisId: connector_costs.paid_active_rows, id: google_sheets.sales_deals
              - connector_costs.paid_active_rows, name: google_sheets.sales_deals},
          {axisId: connector_costs.paid_active_rows, id: greenhouse - connector_costs.paid_active_rows,
            name: greenhouse}, {axisId: connector_costs.paid_active_rows, id: helpscout
              - connector_costs.paid_active_rows, name: helpscout}, {axisId: connector_costs.paid_active_rows,
            id: mailru - connector_costs.paid_active_rows, name: mailru}, {axisId: connector_costs.paid_active_rows,
            id: microsoft_api - connector_costs.paid_active_rows, name: microsoft_api},
          {axisId: connector_costs.paid_active_rows, id: microsoft_pubcenter_api -
              connector_costs.paid_active_rows, name: microsoft_pubcenter_api}, {
            axisId: connector_costs.paid_active_rows, id: netsuite - connector_costs.paid_active_rows,
            name: netsuite}, {axisId: connector_costs.paid_active_rows, id: netsuite_test_1
              - connector_costs.paid_active_rows, name: netsuite_test_1}, {axisId: connector_costs.paid_active_rows,
            id: qwant - connector_costs.paid_active_rows, name: qwant}, {axisId: connector_costs.paid_active_rows,
            id: rakuten - connector_costs.paid_active_rows, name: rakuten}, {axisId: connector_costs.paid_active_rows,
            id: revenue_amazon - connector_costs.paid_active_rows, name: revenue_amazon},
          {axisId: connector_costs.paid_active_rows, id: revenue_bing - connector_costs.paid_active_rows,
            name: revenue_bing}, {axisId: connector_costs.paid_active_rows, id: revenue_bing_operational
              - connector_costs.paid_active_rows, name: revenue_bing_operational},
          {axisId: connector_costs.paid_active_rows, id: revenue_canonical - connector_costs.paid_active_rows,
            name: revenue_canonical}, {axisId: connector_costs.paid_active_rows, id: revenue_ddg_v2
              - connector_costs.paid_active_rows, name: revenue_ddg_v2}, {axisId: connector_costs.paid_active_rows,
            id: revenue_duck_duck_go - connector_costs.paid_active_rows, name: revenue_duck_duck_go},
          {axisId: connector_costs.paid_active_rows, id: revenue_duck_duck_go_v2 -
              connector_costs.paid_active_rows, name: revenue_duck_duck_go_v2}, {
            axisId: connector_costs.paid_active_rows, id: revenue_ebay - connector_costs.paid_active_rows,
            name: revenue_ebay}, {axisId: connector_costs.paid_active_rows, id: revenue_ecosia
              - connector_costs.paid_active_rows, name: revenue_ecosia}, {axisId: connector_costs.paid_active_rows,
            id: revenue_ecosia_v2 - connector_costs.paid_active_rows, name: revenue_ecosia_v2},
          {axisId: connector_costs.paid_active_rows, id: revenue_google - connector_costs.paid_active_rows,
            name: revenue_google}, {axisId: connector_costs.paid_active_rows, id: revenue_google_v2
              - connector_costs.paid_active_rows, name: revenue_google_v2}, {axisId: connector_costs.paid_active_rows,
            id: revenue_mailru - connector_costs.paid_active_rows, name: revenue_mailru},
          {axisId: connector_costs.paid_active_rows, id: revenue_qwant - connector_costs.paid_active_rows,
            name: revenue_qwant}, {axisId: connector_costs.paid_active_rows, id: revenue_rakuten
              - connector_costs.paid_active_rows, name: revenue_rakuten}, {axisId: connector_costs.paid_active_rows,
            id: revenue_seznam - connector_costs.paid_active_rows, name: revenue_seznam},
          {axisId: connector_costs.paid_active_rows, id: revenue_united - connector_costs.paid_active_rows,
            name: revenue_united}, {axisId: connector_costs.paid_active_rows, id: revenue_yahoo_japan
              - connector_costs.paid_active_rows, name: revenue_yahoo_japan}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_australia - connector_costs.paid_active_rows, name: sage_intacct_australia},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_belgium - connector_costs.paid_active_rows,
            name: sage_intacct_belgium}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_canada - connector_costs.paid_active_rows, name: sage_intacct_canada},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_china_vie -
              connector_costs.paid_active_rows, name: sage_intacct_china_vie}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_china_wofe - connector_costs.paid_active_rows, name: sage_intacct_china_wofe},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_denmark - connector_costs.paid_active_rows,
            name: sage_intacct_denmark}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_finland - connector_costs.paid_active_rows, name: sage_intacct_finland},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_france - connector_costs.paid_active_rows,
            name: sage_intacct_france}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_germany - connector_costs.paid_active_rows, name: sage_intacct_germany},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_moz - connector_costs.paid_active_rows,
            name: sage_intacct_moz}, {axisId: connector_costs.paid_active_rows, id: sage_intacct_netherlands
              - connector_costs.paid_active_rows, name: sage_intacct_netherlands},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_nz - connector_costs.paid_active_rows,
            name: sage_intacct_nz}, {axisId: connector_costs.paid_active_rows, id: sage_intacct_pocket
              - connector_costs.paid_active_rows, name: sage_intacct_pocket}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_spain - connector_costs.paid_active_rows, name: sage_intacct_spain},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_sweden - connector_costs.paid_active_rows,
            name: sage_intacct_sweden}, {axisId: connector_costs.paid_active_rows,
            id: sage_intacct_taiwan - connector_costs.paid_active_rows, name: sage_intacct_taiwan},
          {axisId: connector_costs.paid_active_rows, id: sage_intacct_uk - connector_costs.paid_active_rows,
            name: sage_intacct_uk}, {axisId: connector_costs.paid_active_rows, id: seznam
              - connector_costs.paid_active_rows, name: seznam}, {axisId: connector_costs.paid_active_rows,
            id: stripe - connector_costs.paid_active_rows, name: stripe}, {axisId: connector_costs.paid_active_rows,
            id: stripe_dev_relud - connector_costs.paid_active_rows, name: stripe_dev_relud},
          {axisId: connector_costs.paid_active_rows, id: stripe_nonprod - connector_costs.paid_active_rows,
            name: stripe_nonprod}, {axisId: connector_costs.paid_active_rows, id: test_test_test_leli
              - connector_costs.paid_active_rows, name: test_test_test_leli}, {axisId: connector_costs.paid_active_rows,
            id: test_test_test_leli.test_merged - connector_costs.paid_active_rows,
            name: test_test_test_leli.test_merged}, {axisId: connector_costs.paid_active_rows,
            id: united - connector_costs.paid_active_rows, name: united}, {axisId: connector_costs.paid_active_rows,
            id: workday - connector_costs.paid_active_rows, name: workday}, {axisId: connector_costs.paid_active_rows,
            id: workday_hcm - connector_costs.paid_active_rows, name: workday_hcm},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.employee_details_report
              - connector_costs.paid_active_rows, name: workday_raas.employee_details_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.open_position_details_report
              - connector_costs.paid_active_rows, name: workday_raas.open_position_details_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.promotions_in_date_range_report
              - connector_costs.paid_active_rows, name: workday_raas.promotions_in_date_range_report},
          {axisId: connector_costs.paid_active_rows, id: workday_raas.total_staffing_report
              - connector_costs.paid_active_rows, name: workday_raas.total_staffing_report},
          {axisId: connector_costs.paid_active_rows, id: zendesk - connector_costs.paid_active_rows,
            name: zendesk}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    swap_axes: false
    defaults_version: 1
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Project: connector_costs.destination
      Connector: connector_costs.connector
      Billing Type: connector_costs.billing_type
    row: 45
    col: 0
    width: 24
    height: 8
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.destination
  - name: Measured Month
    title: Measured Month
    type: field_filter
    default_value: 1 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.measured_month
  - name: Connector
    title: Connector
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: [Project, Measured Month]
    field: connector_costs.connector
  - name: Billing Type
    title: Billing Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: fivetran
    explore: connector_costs
    listens_to_filters: []
    field: connector_costs.billing_type
