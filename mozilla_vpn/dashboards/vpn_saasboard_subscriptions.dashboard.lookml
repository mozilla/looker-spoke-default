- dashboard: vpn_saasboard__subscriptions
  title: VPN SaaSboard - Subscriptions
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  elements:
  - title: Active Subscriptions (Daily)
    name: Active Subscriptions (Daily)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_line
    fields: [subscriptions__active.active_date, subscriptions.count]
    fill_fields: [subscriptions__active.active_date]
    sorts: [subscriptions__active.active_date desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 8
    col: 8
    width: 16
    height: 11
  - title: Current Active Subscriptions
    name: Current Active Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [subscriptions.count, subscriptions__active.active_date]
    fill_fields: [subscriptions__active.active_date]
    sorts: [subscriptions__active.active_date desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
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
    subtitle_text: ''
    body_text: "<p style='background-color: #ffffdd; padding: 5px 10px; border: solid\
      \ 3px #ededed; border-radius: 5px; height:150px'>\n\nThis dashboard captures\
      \ the current state and monthly trend of active and new subscriptions.\n<br>\n\
      <br>\n* Active subscriptions are paid subscriptions at a moment in time.  \n\
      <br>\n* New subscriptions are subscriptions that started at a particular date.\n\
      <br>\n<br>\n\nPlease submit any questions in  <b><a href=\"https://mozilla.slack.com/messages/mozilla-vpn-data/\"\
      >mozilla-vpn-data</a></b> channel on Slack for @wichan or @relud. \n\n</p>"
    row: 2
    col: 3
    width: 16
    height: 4
  - title: Current Active Date
    name: Current Active Date
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [subscriptions__active.active_date]
    fill_fields: [subscriptions__active.active_date]
    sorts: [subscriptions__active.active_date desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 2
    col: 19
    width: 5
    height: 4
  - title: Monthly Active Subscriptions (by Country)
    name: Monthly Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.count, subscriptions.country_name, subscriptions__active.active_month]
    pivots: [subscriptions.country_name]
    fill_fields: [subscriptions__active.active_month]
    filters:
      subscriptions__active.is_end_of_month: 'Yes'
    sorts: [subscriptions.country_name desc, subscriptions.count desc 0]
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
      USA - subscriptions.count: "#347be3"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: "Country is based on customer billing address.\n\nSubscription counts\
      \ on month end dates except for most current month which may not have reached\
      \ month end. "
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 29
    col: 0
    width: 8
    height: 13
  - title: Monthly Active Subscriptions (by Plan)
    name: Monthly Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.count, subscriptions.pricing_plan, subscriptions__active.active_month]
    pivots: [subscriptions.pricing_plan]
    fill_fields: [subscriptions__active.active_month]
    filters:
      subscriptions__active.is_end_of_month: 'Yes'
    sorts: [subscriptions__active.active_month desc, subscriptions.pricing_plan]
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
      1-month-usd-4.99 - subscriptions.count: "#7363A9"
      6-month-chf-47.94 - subscriptions.count: "#82a6a8"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Subscription counts on month end dates except for most current month
      which may not have reached month end. '
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 29
    col: 8
    width: 8
    height: 13
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
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
    subtitle_text: ''
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
    explore: subscriptions
    type: looker_column
    fields: [subscriptions.count, subscriptions__active.active_month, subscriptions.provider]
    pivots: [subscriptions.provider]
    fill_fields: [subscriptions__active.active_month]
    filters:
      subscriptions__active.is_end_of_month: 'Yes'
    sorts: [subscriptions.count desc 0, subscriptions.provider desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 29
    col: 16
    width: 8
    height: 13
  - title: New Subscriptions (By Country)
    name: New Subscriptions (By Country)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.event_month, subscriptions.country_name, subscriptions.count]
    pivots: [subscriptions.country_name]
    fill_fields: [subscriptions__events.event_month]
    filters:
      subscriptions__events.type: New
    sorts: [subscriptions__events.event_month desc, subscriptions.country_name desc]
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
        reverse: false
    y_axes: [{label: Subscriptions, orientation: left, series: [{axisId: USA - subscriptions.count,
            id: USA - subscriptions.count, name: USA}, {axisId: United Kingdom - subscriptions.count,
            id: United Kingdom - subscriptions.count, name: United Kingdom}, {axisId: Switzerland
              - subscriptions.count, id: Switzerland - subscriptions.count, name: Switzerland},
          {axisId: Spain - subscriptions.count, id: Spain - subscriptions.count, name: Spain},
          {axisId: Singapore - subscriptions.count, id: Singapore - subscriptions.count,
            name: Singapore}, {axisId: Puerto Rico - subscriptions.count, id: Puerto
              Rico - subscriptions.count, name: Puerto Rico}, {axisId: New Zealand
              - subscriptions.count, id: New Zealand - subscriptions.count, name: New
              Zealand}, {axisId: Malaysia - subscriptions.count, id: Malaysia - subscriptions.count,
            name: Malaysia}, {axisId: Italy - subscriptions.count, id: Italy - subscriptions.count,
            name: Italy}, {axisId: Guam - subscriptions.count, id: Guam - subscriptions.count,
            name: Guam}, {axisId: Germany - subscriptions.count, id: Germany - subscriptions.count,
            name: Germany}, {axisId: France - subscriptions.count, id: France - subscriptions.count,
            name: France}, {axisId: Canada - subscriptions.count, id: Canada - subscriptions.count,
            name: Canada}, {axisId: Belgium - subscriptions.count, id: Belgium - subscriptions.count,
            name: Belgium}, {axisId: Austria - subscriptions.count, id: Austria -
              subscriptions.count, name: Austria}, {axisId: American Samoa - subscriptions.count,
            id: American Samoa - subscriptions.count, name: American Samoa}, {axisId: subscriptions.country_name___null
              - subscriptions.count, id: subscriptions.country_name___null - subscriptions.count,
            name: "∅"}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    font_size: ''
    series_types: {}
    series_colors:
      USA - subscriptions.count: "#347be3"
    x_axis_datetime_label: ''
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: true
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      subscriptions__events.delta:
        is_active: true
    table_theme: gray
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '20'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: hover
    note_text: Country is based on customer billing address.
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 44
    col: 0
    width: 8
    height: 13
  - title: New Subscriptions (By Plan)
    name: New Subscriptions (By Plan)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.event_month, subscriptions.pricing_plan, subscriptions.count]
    pivots: [subscriptions.pricing_plan]
    fill_fields: [subscriptions__events.event_month]
    filters:
      subscriptions__events.type: New
    sorts: [subscriptions__events.event_month desc, subscriptions.pricing_plan]
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
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 1-month-apple - subscriptions.count,
            id: 1-month-apple - subscriptions.count, name: 1-month-apple}, {axisId: 1-month-chf-10.99
              - subscriptions.count, id: 1-month-chf-10.99 - subscriptions.count,
            name: 1-month-chf-10.99}, {axisId: 1-month-eur-9.99 - subscriptions.count,
            id: 1-month-eur-9.99 - subscriptions.count, name: 1-month-eur-9.99}, {
            axisId: 1-month-usd-4.99 - subscriptions.count, id: 1-month-usd-4.99 -
              subscriptions.count, name: 1-month-usd-4.99}, {axisId: 1-month-usd-9.99
              - subscriptions.count, id: 1-month-usd-9.99 - subscriptions.count, name: 1-month-usd-9.99},
          {axisId: 1-year-apple - subscriptions.count, id: 1-year-apple - subscriptions.count,
            name: 1-year-apple}, {axisId: 1-year-chf-71.88 - subscriptions.count,
            id: 1-year-chf-71.88 - subscriptions.count, name: 1-year-chf-71.88}, {
            axisId: 1-year-eur-59.88 - subscriptions.count, id: 1-year-eur-59.88 -
              subscriptions.count, name: 1-year-eur-59.88}, {axisId: 1-year-usd-59.88
              - subscriptions.count, id: 1-year-usd-59.88 - subscriptions.count, name: 1-year-usd-59.88},
          {axisId: 6-month-apple - subscriptions.count, id: 6-month-apple - subscriptions.count,
            name: 6-month-apple}, {axisId: 6-month-chf-47.94 - subscriptions.count,
            id: 6-month-chf-47.94 - subscriptions.count, name: 6-month-chf-47.94},
          {axisId: 6-month-eur-41.94 - subscriptions.count, id: 6-month-eur-41.94
              - subscriptions.count, name: 6-month-eur-41.94}, {axisId: 6-month-usd-47.94
              - subscriptions.count, id: 6-month-usd-47.94 - subscriptions.count,
            name: 6-month-usd-47.94}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    font_size: ''
    series_types: {}
    series_colors:
      1-month-usd-4.99 - subscriptions.count: "#7363A9"
      6-month-chf-47.94 - subscriptions.count: "#82a6a8"
    x_axis_datetime_label: ''
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: true
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      subscriptions__events.delta:
        is_active: true
    table_theme: gray
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '20'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: hover
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 44
    col: 8
    width: 8
    height: 13
  - title: New vs Returning Subscriptions
    name: New vs Returning Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.event_month, subscriptions__events.granular_type,
      subscriptions__events.delta]
    pivots: [subscriptions__events.granular_type]
    fill_fields: [subscriptions__events.event_month]
    filters:
      subscriptions__events.type: New
    sorts: [subscriptions__events.event_month desc, subscriptions__events.granular_type]
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
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      Row Total - subscriptions__events.delta: line
    series_colors:
      Resurrected - subscriptions.count: "#47f5bf"
      New - subscriptions.count: "#80ab62"
      New - subscriptions__events.delta: "#80ab62"
      Resurrected - subscriptions__events.delta: "#47f5bf"
    series_labels:
      Resurrected - subscriptions.count: Returning
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Returning subscriptions are new subscriptions from customers that previously
      held a subscription.
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 59
    col: 8
    width: 8
    height: 13
  - title: Subscription Cancellations
    name: Subscription Cancellations
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.event_month, subscriptions__events.granular_type,
      subscriptions__events.delta]
    pivots: [subscriptions__events.granular_type]
    fill_fields: [subscriptions__events.event_month]
    filters:
      subscriptions__events.type: Cancelled
    sorts: [subscriptions__events.event_month desc, subscriptions__events.granular_type]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors:
      Cancelled by IAP - subscriptions.count: "#AEC8C1"
      Cancelled by Customer - subscriptions.count: "#f56776"
      Payment Failed - subscriptions.count: "#ffdec2"
      Cancelled by Customer - subscriptions__events.delta: "#ffdac4"
    series_labels:
      Resurrected - subscriptions.count: Returning
      Cancelled by IAP - subscriptions.count: Not reported (Apple IAP)
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 59
    col: 16
    width: 8
    height: 13
  - title: Net New Subscriptions
    name: Net New Subscriptions
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.type, subscriptions__events.delta, subscriptions__events.event_month]
    pivots: [subscriptions__events.type]
    fill_fields: [subscriptions__events.event_month]
    sorts: [subscriptions__events.event_month desc, subscriptions__events.type]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(pivot_row(${subscriptions__events.delta}))',
        label: Net Subscriptions, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: net_subscriptions, _type_hint: number}]
    x_axis_gridlines: true
    y_axis_gridlines: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#3D52B9"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Subscriptions, orientation: left, series: [{axisId: Cancelled
              - subscriptions__events.delta, id: Cancelled - subscriptions__events.delta,
            name: Cancelled}, {axisId: New - subscriptions__events.delta, id: New
              - subscriptions__events.delta, name: New}, {axisId: net_subscriptions,
            id: net_subscriptions, name: Net Subscriptions}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 4, type: linear}]
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      Row Total - subscriptions__events.delta: line
      net_subscriptions: line
    series_colors:
      Row Total - subscriptions__events.delta: "#3D52B9"
      New - subscriptions__events.delta: "#08B248"
      Cancelled - subscriptions__events.delta: "#FC2E31"
      net_subscriptions: "#3D52B9"
    series_labels:
      Row Total - subscriptions__events.delta: Net Paid Subscriptions
      Cancelled - subscriptions__events.delta: Cancelled
      New - subscriptions__events.delta: New
    label_color: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 59
    col: 0
    width: 8
    height: 13
  - title: New Subscriptions (By Provider)
    name: New Subscriptions (By Provider)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_column
    fields: [subscriptions__events.event_month, subscriptions.count, subscriptions.provider]
    pivots: [subscriptions.provider]
    fill_fields: [subscriptions__events.event_month]
    filters:
      subscriptions__events.type: New
    sorts: [subscriptions__events.event_month desc, subscriptions.provider desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: 1-month-apple - subscriptions.count,
            id: 1-month-apple - subscriptions.count, name: 1-month-apple}, {axisId: 1-month-chf-10.99
              - subscriptions.count, id: 1-month-chf-10.99 - subscriptions.count,
            name: 1-month-chf-10.99}, {axisId: 1-month-eur-9.99 - subscriptions.count,
            id: 1-month-eur-9.99 - subscriptions.count, name: 1-month-eur-9.99}, {
            axisId: 1-month-usd-4.99 - subscriptions.count, id: 1-month-usd-4.99 -
              subscriptions.count, name: 1-month-usd-4.99}, {axisId: 1-month-usd-9.99
              - subscriptions.count, id: 1-month-usd-9.99 - subscriptions.count, name: 1-month-usd-9.99},
          {axisId: 1-year-apple - subscriptions.count, id: 1-year-apple - subscriptions.count,
            name: 1-year-apple}, {axisId: 1-year-chf-71.88 - subscriptions.count,
            id: 1-year-chf-71.88 - subscriptions.count, name: 1-year-chf-71.88}, {
            axisId: 1-year-eur-59.88 - subscriptions.count, id: 1-year-eur-59.88 -
              subscriptions.count, name: 1-year-eur-59.88}, {axisId: 1-year-usd-59.88
              - subscriptions.count, id: 1-year-usd-59.88 - subscriptions.count, name: 1-year-usd-59.88},
          {axisId: 6-month-apple - subscriptions.count, id: 6-month-apple - subscriptions.count,
            name: 6-month-apple}, {axisId: 6-month-chf-47.94 - subscriptions.count,
            id: 6-month-chf-47.94 - subscriptions.count, name: 6-month-chf-47.94},
          {axisId: 6-month-eur-41.94 - subscriptions.count, id: 6-month-eur-41.94
              - subscriptions.count, name: 6-month-eur-41.94}, {axisId: 6-month-usd-47.94
              - subscriptions.count, id: 6-month-usd-47.94 - subscriptions.count,
            name: 6-month-usd-47.94}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    font_size: ''
    series_types: {}
    series_colors: {}
    x_axis_datetime_label: ''
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: true
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      subscriptions__events.delta:
        is_active: true
    table_theme: gray
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '20'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: hover
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__events.event_date
    row: 44
    col: 16
    width: 8
    height: 13
  - title: New Tile
    name: New Tile
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [subscriptions.count, subscriptions__active.active_date]
    fill_fields: [subscriptions__active.active_date]
    filters: {}
    sorts: [subscriptions__active.active_date desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${subscriptions.count}-offset(${subscriptions.count},\
          \ 1)) / offset(${subscriptions.count}, 1)", label: delta_1_day, value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, table_calculation: delta_1_day,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: delta 1 day
    value_format: ''
    comparison_label: change since 7 days
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
    hidden_fields: [subscriptions.count]
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 15
    col: 0
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: mozilla_vpn
    explore: subscriptions
    type: single_value
    fields: [subscriptions.count, subscriptions__active.active_date]
    fill_fields: [subscriptions__active.active_date]
    filters: {}
    sorts: [subscriptions__active.active_date desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${subscriptions.count}-offset(${subscriptions.count},\
          \ 7)) / offset(${subscriptions.count}, 7)", label: delta_7_days, value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, table_calculation: delta_7_days,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: delta 7 days
    value_format: ''
    comparison_label: change since 7 days
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
    hidden_fields: [subscriptions.count]
    listen:
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 15
    col: 4
    width: 4
    height: 4
  - title: Current Active Subscriptions (by Country)
    name: Current Active Subscriptions (by Country)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_pie
    fields: [subscriptions.count, subscriptions.country_name]
    filters:
      subscriptions__active.is_max_active_date: 'Yes'
    sorts: [subscriptions.country_name desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 22
    col: 0
    width: 8
    height: 7
  - title: Current Active Subscriptions (by Plan)
    name: Current Active Subscriptions (by Plan)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_pie
    fields: [subscriptions.pricing_plan, subscriptions.count]
    filters:
      subscriptions__active.is_max_active_date: 'Yes'
    sorts: [subscriptions.pricing_plan]
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
      1-month-usd-4.99 - subscriptions.count: "#7363A9"
      6-month-chf-47.94 - subscriptions.count: "#82a6a8"
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 22
    col: 8
    width: 8
    height: 7
  - title: Current Active Subscriptions (by Provider)
    name: Current Active Subscriptions (by Provider)
    model: mozilla_vpn
    explore: subscriptions
    type: looker_pie
    fields: [subscriptions.count, subscriptions.provider]
    filters:
      subscriptions__active.is_max_active_date: 'Yes'
    sorts: [subscriptions.provider desc]
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
      Provider: subscriptions.provider
      Pricing Plan: subscriptions.pricing_plan
      Country: subscriptions.country_name
      Active Date: subscriptions__active.active_date
    row: 22
    col: 16
    width: 8
    height: 7
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |
      <div style="border-radius: 5px; padding: 5px 10px; background: #412399; height: 60px; color: red;">

      <nav style="font-size: 20px;">

        <img style="color: #efefef; padding: 5px 15px; float: left; height: 40px;" src="https://wwwstatic.lookercdn.com/logos/looker_all_white.svg"/>

        <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px; font-weight: bold;" href="#home">

       Subscriptions</a>

        <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#news">Retention</a>

        <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#contact">Churn</a>

        <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#about">Revenue</a>

        <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="https://docs.google.com/document/d/1VtrTwm8Eqt9cPLZLaH1kjnM413gKtdaZArS29xcxXpA/edit?usp=sharing">Documentation</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Net New Subscriptions</b></h3>
    row: 57
    col: 0
    width: 24
    height: 2
  - name: "  "
    type: text
    title_text: "  "
    subtitle_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Plan</b></h3>
    row: 19
    col: 8
    width: 8
    height: 3
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>Active Subscriptions by Provider</b></h3>
    row: 19
    col: 16
    width: 8
    height: 3
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |2-


      <div style="border-top: solid 2px #e0e0e0;">

      <h3><b>New Subscriptions</b></h3>
    row: 42
    col: 0
    width: 24
    height: 2
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
    explore: subscriptions
    listens_to_filters: []
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
      options: []
    model: mozilla_vpn
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
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions.country_name
  - name: Active Date
    title: Active Date
    type: field_filter
    default_value: 2020/07/20 to today
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: mozilla_vpn
    explore: subscriptions
    listens_to_filters: []
    field: subscriptions__active.active_date
