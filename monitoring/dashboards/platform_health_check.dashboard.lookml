- dashboard: platform_health_check
  title: Platform Health Check
  layout: newspaper
  preferred_viewer: dashboards-next
  description: 'Weekly Health Checks for Data Platform

    '
  refresh: 1 day
  elements:
  - title: Firefox Desktop by Country (legacy telemetry, 1% sample)
    name: Firefox Desktop by Country (legacy telemetry, 1% sample)
    model: firefox_desktop
    explore: client_counts
    type: looker_line
    fields: [client_counts.country, client_counts.client_count, client_counts.submission_date]
    pivots: [client_counts.country]
    fill_fields: [client_counts.submission_date]
    filters:
      client_counts.sample_id: '0'
      client_counts.country: CN,US,CA,DE,GB,FR
    sorts: [client_counts.submission_date desc, client_counts.country]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Submission Date: client_counts.submission_date
    row: 8
    col: 0
    width: 12
    height: 6
  - name: OS | Geo | Channel - Distributions
    type: text
    title_text: OS | Geo | Channel - Distributions
    subtitle_text: ''
    body_text: ''
    row: 6
    col: 0
    width: 24
    height: 2
  - title: Firefox Android by Country (Glean)
    name: Firefox Android by Country (Glean)
    model: fenix
    explore: client_counts
    type: looker_line
    fields: [client_counts.country, client_counts.submission_date, client_counts.client_count]
    pivots: [client_counts.country]
    fill_fields: [client_counts.submission_date]
    filters:
      client_counts.channel: mozdata.fenix.baseline^_clients^_daily
      client_counts.country: CN,US,CA,DE,GB,FR
    sorts: [client_counts.country, client_counts.submission_date desc]
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
    show_null_points: false
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Submission Date: client_counts.submission_date
    row: 14
    col: 12
    width: 12
    height: 6
  - title: Firefox iOS by Country (Glean)
    name: Firefox iOS by Country (Glean)
    model: firefox_ios
    explore: client_counts
    type: looker_line
    fields: [client_counts.client_count, client_counts.submission_date, client_counts.country]
    pivots: [client_counts.country]
    fill_fields: [client_counts.submission_date]
    filters:
      client_counts.channel: mozdata.firefox^_ios.baseline^_clients^_daily
      client_counts.country: CN,US,CA,DE,GB,FR
    sorts: [client_counts.submission_date desc, client_counts.country]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: client_counts.client_count,
            id: CA - client_counts.client_count, name: CA}, {axisId: client_counts.client_count,
            id: CN - client_counts.client_count, name: CN}, {axisId: client_counts.client_count,
            id: DE - client_counts.client_count, name: DE}, {axisId: client_counts.client_count,
            id: FR - client_counts.client_count, name: FR}, {axisId: client_counts.client_count,
            id: GB - client_counts.client_count, name: GB}, {axisId: client_counts.client_count,
            id: US - client_counts.client_count, name: US}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Submission Date: client_counts.submission_date
    row: 8
    col: 12
    width: 12
    height: 6
  - title: Firefox Desktop OS Distribution (legacy telemetry, 1% sample)
    name: Firefox Desktop OS Distribution (legacy telemetry, 1% sample)
    model: firefox_desktop
    explore: client_counts
    type: looker_area
    fields: [client_counts.client_count, client_counts.submission_date, os_version]
    pivots: [os_version]
    filters:
      client_counts.sample_id: '0'
      client_counts.country: CN,US,CA,DE,GB,FR
      client_counts.client_count: ">2000"
    sorts: [client_counts.submission_date desc, os_version]
    limit: 500
    dynamic_fields: [{category: dimension, expression: "concat(${client_counts.os},\
          \ \" \", \n   ${client_counts.normalized_os_version}\n)", label: OS + version,
        value_format: !!null '', value_format_name: !!null '', dimension: os_version,
        _kind_hint: dimension, _type_hint: string}]
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
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: client_counts.client_count,
            id: Darwin 15.6.0 - client_counts.client_count, name: Darwin 15.6.0},
          {axisId: client_counts.client_count, id: Darwin 17.7.0 - client_counts.client_count,
            name: Darwin 17.7.0}, {axisId: client_counts.client_count, id: Darwin
              18.7.0 - client_counts.client_count, name: Darwin 18.7.0}, {axisId: client_counts.client_count,
            id: Darwin 19.6.0 - client_counts.client_count, name: Darwin 19.6.0},
          {axisId: client_counts.client_count, id: Darwin 20.6.0 - client_counts.client_count,
            name: Darwin 20.6.0}, {axisId: client_counts.client_count, id: Linux 5.11.0
              - client_counts.client_count, name: Linux 5.11.0}, {axisId: client_counts.client_count,
            id: Linux 5.4.0 - client_counts.client_count, name: Linux 5.4.0}, {axisId: client_counts.client_count,
            id: Windows_NT 10.0 - client_counts.client_count, name: Windows_NT 10.0},
          {axisId: client_counts.client_count, id: Windows_NT 5.1 - client_counts.client_count,
            name: Windows_NT 5.1}, {axisId: client_counts.client_count, id: Windows_NT
              6.1 - client_counts.client_count, name: Windows_NT 6.1}, {axisId: client_counts.client_count,
            id: Windows_NT 6.3 - client_counts.client_count, name: Windows_NT 6.3}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: []
    series_types: {}
    defaults_version: 1
    listen:
      Submission Date: client_counts.submission_date
    row: 20
    col: 0
    width: 12
    height: 6
  - title: Firefox Android OS Version Distribution (Glean)
    name: Firefox Android OS Version Distribution (Glean)
    model: fenix
    explore: client_counts
    type: looker_area
    fields: [client_counts.submission_date, os_version, client_counts.client_count]
    pivots: [os_version]
    filters:
      client_counts.channel: mozdata.fenix.baseline^_clients^_daily
      client_counts.client_count: ">10000"
    sorts: [client_counts.submission_date desc, os_version]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: dimension, expression: 'concat(${client_counts.normalized_os},
          " ", ${client_counts.normalized_os_version})', label: OS + version, value_format: !!null '',
        value_format_name: !!null '', dimension: os_version, _kind_hint: measure,
        _type_hint: string}]
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
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: client_counts.client_count,
            id: Android 10 - client_counts.client_count, name: Android 10}, {axisId: client_counts.client_count,
            id: Android 11 - client_counts.client_count, name: Android 11}, {axisId: client_counts.client_count,
            id: Android 12 - client_counts.client_count, name: Android 12}, {axisId: client_counts.client_count,
            id: Android 5.0.2 - client_counts.client_count, name: Android 5.0.2},
          {axisId: client_counts.client_count, id: Android 5.1 - client_counts.client_count,
            name: Android 5.1}, {axisId: client_counts.client_count, id: Android 5.1.1
              - client_counts.client_count, name: Android 5.1.1}, {axisId: client_counts.client_count,
            id: Android 6.0 - client_counts.client_count, name: Android 6.0}, {axisId: client_counts.client_count,
            id: Android 6.0.1 - client_counts.client_count, name: Android 6.0.1},
          {axisId: client_counts.client_count, id: Android 7.0 - client_counts.client_count,
            name: Android 7.0}, {axisId: client_counts.client_count, id: Android 7.1.1
              - client_counts.client_count, name: Android 7.1.1}, {axisId: client_counts.client_count,
            id: Android 7.1.2 - client_counts.client_count, name: Android 7.1.2},
          {axisId: client_counts.client_count, id: Android 8.0.0 - client_counts.client_count,
            name: Android 8.0.0}, {axisId: client_counts.client_count, id: Android
              8.1.0 - client_counts.client_count, name: Android 8.1.0}, {axisId: client_counts.client_count,
            id: Android 9 - client_counts.client_count, name: Android 9}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Submission Date: client_counts.submission_date
    row: 26
    col: 0
    width: 12
    height: 9
  - title: Firefox iOS OS version distribution (Glean)
    name: Firefox iOS OS version distribution (Glean)
    model: firefox_ios
    explore: client_counts
    type: looker_area
    fields: [client_counts.client_count, client_counts.submission_date, client_counts.normalized_os_version]
    pivots: [client_counts.normalized_os_version]
    filters:
      client_counts.channel: mozdata.firefox^_ios.baseline^_clients^_daily
      client_counts.client_count: ">25000"
    sorts: [client_counts.submission_date desc, client_counts.normalized_os_version]
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
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: client_counts.client_count,
            id: 12.5.5 - client_counts.client_count, name: 12.5.5}, {axisId: client_counts.client_count,
            id: 14.4 - client_counts.client_count, name: '14.4'}, {axisId: client_counts.client_count,
            id: 14.4.2 - client_counts.client_count, name: 14.4.2}, {axisId: client_counts.client_count,
            id: 14.6 - client_counts.client_count, name: '14.6'}, {axisId: client_counts.client_count,
            id: 14.7.1 - client_counts.client_count, name: 14.7.1}, {axisId: client_counts.client_count,
            id: 14.8 - client_counts.client_count, name: '14.8'}, {axisId: client_counts.client_count,
            id: 15.0 - client_counts.client_count, name: '15.0'}, {axisId: client_counts.client_count,
            id: 15.0.1 - client_counts.client_count, name: 15.0.1}, {axisId: client_counts.client_count,
            id: 15.0.2 - client_counts.client_count, name: 15.0.2}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    listen:
      Submission Date: client_counts.submission_date
    row: 20
    col: 12
    width: 12
    height: 6
  - title: Firefox Desktop by Country (Glean baseline, 1% sample)
    name: Firefox Desktop by Country (Glean baseline, 1% sample)
    model: firefox_desktop
    explore: baseline
    type: looker_line
    fields: [baseline.clients, baseline.submission_date, baseline.normalized_country_code]
    pivots: [baseline.normalized_country_code]
    fill_fields: [baseline.submission_date]
    filters:
      baseline.sample_id: '0'
      baseline.normalized_channel: release
      baseline.normalized_country_code: CN,CA,DE,FR,US,GB
    sorts: [baseline.submission_date desc, baseline.normalized_country_code]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Submission Date: baseline.submission_date
    row: 14
    col: 0
    width: 12
    height: 6
  - name: Missing Columns
    type: text
    title_text: Missing Columns
    subtitle_text: ''
    body_text: |
      Checks:

      1. **Frequently occurring missing columns:** Default. Sort by _Sum of Path Count (last 7 days)_ descending

      2. **New columns that are missing:** Sort by _Sum of Path Count (last 7 days)_ ascending. Null values from two weeks ago indicate that a new column has been added within the last 7 days that is not part of the schemas

      3. **Verify that counts for added columns are decreasing:** Sort by _Diff_ descending.
    row: 35
    col: 0
    width: 24
    height: 4
  - name: Missing Columns in last 14 days (telemetry)
    title: Missing Columns in last 14 days (telemetry)
    merged_queries:
    - model: monitoring
      explore: telemetry_missing_columns
      type: table
      fields: [telemetry_missing_columns.document_namespace, telemetry_missing_columns.document_type,
        telemetry_missing_columns.document_version, telemetry_missing_columns.path,
        sum_of_path_count_last_7_days, missing_columns_notes.notes, missing_columns_notes.bug]
      filters:
        sum_of_path_count_last_7_days: ">10"
        telemetry_missing_columns.submission_date: 7 days
      sorts: [sum_of_path_count_last_7_days desc]
      limit: 500
      dynamic_fields: [{category: measure, expression: '', label: Sum of Path Count
            (last 7 days), based_on: telemetry_missing_columns.path_count, _kind_hint: measure,
          measure: sum_of_path_count_last_7_days, type: sum, _type_hint: number}]
      join_fields: []
    - model: monitoring
      explore: telemetry_missing_columns
      type: table
      fields: [telemetry_missing_columns.document_namespace, telemetry_missing_columns.document_type,
        telemetry_missing_columns.document_version, telemetry_missing_columns.path,
        sum_of_path_count_two_weeks_ago]
      filters:
        telemetry_missing_columns.submission_date: 14 days
        sum_of_path_count_two_weeks_ago: ">10"
      sorts: [sum_of_path_count_two_weeks_ago desc]
      limit: 500
      dynamic_fields: [{category: measure, expression: '', label: Sum of Path Count
            (two weeks ago), based_on: telemetry_missing_columns.path_count, _kind_hint: measure,
          measure: sum_of_path_count_two_weeks_ago, type: sum, _type_hint: number}]
      filter_expression: |-
        (diff_days(${telemetry_missing_columns.submission_date}, now()) >= 7) AND
        (diff_days(${telemetry_missing_columns.submission_date}, now())) < 14
      join_fields:
      - field_name: telemetry_missing_columns.document_namespace
        source_field_name: telemetry_missing_columns.document_namespace
      - field_name: telemetry_missing_columns.document_type
        source_field_name: telemetry_missing_columns.document_type
      - field_name: telemetry_missing_columns.document_version
        source_field_name: telemetry_missing_columns.document_version
      - field_name: telemetry_missing_columns.path
        source_field_name: telemetry_missing_columns.path
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_column_widths:
      telemetry_missing_columns.document_namespace: 120.16700000000003
      telemetry_missing_columns.document_type: 114
      telemetry_missing_columns.document_version: 77
      telemetry_missing_columns.path: 272
    series_cell_visualizations:
      sum_of_path_count_last_7_days:
        is_active: true
      diff_to_two_weeks_ago:
        is_active: false
      sum_of_path_count_two_weeks_ago:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_value_format: {}
    type: looker_grid
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Sum of Path Count (last 7 days)
        label_from_parameter:
        label_short: Sum of Path Count (last 7 days)
        map_layer:
        name: sum_of_path_count_last_7_days
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: telemetry_missing_columns
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Sum of Path Count (last 7 days)
        measure: true
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: sum_of_path_count_last_7_days
        suggest_explore: telemetry_missing_columns
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: sum_of_path_count_last_7_days
        sql_case:
        filters:
        times_used: 0
        aggregate: true
        sorted:
          desc: true
          sort_index: 0
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Sum of Path Count (two weeks ago)
        label_from_parameter:
        label_short: Sum of Path Count (two weeks ago)
        map_layer:
        name: sum_of_path_count_two_weeks_ago
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: telemetry_missing_columns
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Sum of Path Count (two weeks ago)
        measure: true
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: sum_of_path_count_two_weeks_ago
        suggest_explore: telemetry_missing_columns
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: sum_of_path_count_two_weeks_ago
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Telemetry Missing Columns Document Namespace
        label_from_parameter:
        label_short: Document Namespace
        map_layer:
        name: telemetry_missing_columns.document_namespace
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: telemetry_missing_columns
        view_label: Telemetry Missing Columns
        dynamic: false
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Document Namespace
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: telemetry_missing_columns.document_namespace
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Ftelemetry_missing_columns.view.lkml?line=8"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: "${TABLE}.document_namespace "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Telemetry Missing Columns Document Type
        label_from_parameter:
        label_short: Document Type
        map_layer:
        name: telemetry_missing_columns.document_type
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: telemetry_missing_columns
        view_label: Telemetry Missing Columns
        dynamic: false
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Document Type
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: telemetry_missing_columns.document_type
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Ftelemetry_missing_columns.view.lkml?line=13"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: "${TABLE}.document_type "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Telemetry Missing Columns Document Version
        label_from_parameter:
        label_short: Document Version
        map_layer:
        name: telemetry_missing_columns.document_version
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: telemetry_missing_columns
        view_label: Telemetry Missing Columns
        dynamic: false
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Document Version
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: telemetry_missing_columns.document_version
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Ftelemetry_missing_columns.view.lkml?line=18"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: "${TABLE}.document_version "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Telemetry Missing Columns Path
        label_from_parameter:
        label_short: Path
        map_layer:
        name: telemetry_missing_columns.path
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: telemetry_missing_columns
        view_label: Telemetry Missing Columns
        dynamic: false
        week_start_day: monday
        original_view: telemetry_missing_columns
        dimension_group:
        error:
        field_group_variant: Path
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: telemetry_missing_columns
        suggest_dimension: telemetry_missing_columns.path
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Ftelemetry_missing_columns.view.lkml?line=23"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/telemetry_missing_columns.view.lkml
        sql: "${TABLE}.path "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Missing Columns Notes Notes
        label_from_parameter:
        label_short: Notes
        map_layer:
        name: missing_columns_notes.notes
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: missing_columns_notes
        view_label: Missing Columns Notes
        dynamic: false
        week_start_day: monday
        original_view: missing_columns_notes
        dimension_group:
        error:
        field_group_variant: Notes
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: missing_columns_notes
        suggest_dimension: missing_columns_notes.notes
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fmissing_columns_notes.view.lkml?line=28"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/missing_columns_notes.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/missing_columns_notes.view.lkml
        sql: "${TABLE}.notes "
        sql_case:
        filters:
        times_used: 0
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Missing Columns Notes Bug
        label_from_parameter:
        label_short: Bug
        map_layer:
        name: missing_columns_notes.bug
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: missing_columns_notes
        view_label: Missing Columns Notes
        dynamic: false
        week_start_day: monday
        original_view: missing_columns_notes
        dimension_group:
        error:
        field_group_variant: Bug
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: missing_columns_notes
        suggest_dimension: missing_columns_notes.bug
        suggest_explore: telemetry_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fmissing_columns_notes.view.lkml?line=8"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/missing_columns_notes.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/missing_columns_notes.view.lkml
        sql: "${TABLE}.bug "
        sql_case:
        filters:
        times_used: 0
      table_calculations: []
      pivots: []
    hidden_fields: [missing_columns_notes.bug]
    sorts: [sum_of_path_count_last_7_days desc]
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "((${sum_of_path_count_last_7_days}-\
          \ ${sum_of_path_count_two_weeks_ago})/${sum_of_path_count_last_7_days})\
          \ * 100", label: Diff % to two weeks ago, value_format: !!null '', value_format_name: decimal_1,
        _kind_hint: measure, table_calculation: diff_to_two_weeks_ago, _type_hint: number}]
    row: 39
    col: 0
    width: 24
    height: 6
  - name: Missing Columns in last 14 days (structured ingestion)
    title: Missing Columns in last 14 days (structured ingestion)
    merged_queries:
    - model: monitoring
      explore: structured_missing_columns
      type: table
      fields: [structured_missing_columns.document_namespace, structured_missing_columns.document_type,
        structured_missing_columns.document_version, structured_missing_columns.path,
        sum_of_path_count_last_7_days, missing_columns_notes.notes]
      filters:
        structured_missing_columns.submission_date: 7 days
        structured_missing_columns.path: "-%`ping^_info`.`experiments`.%"
      sorts: [sum_of_path_count_last_7_days desc]
      limit: 500
      column_limit: 50
      dynamic_fields: [{category: measure, expression: '', label: Sum of Path Count
            (last 7 days), based_on: structured_missing_columns.path_count, _kind_hint: measure,
          measure: sum_of_path_count_last_7_days, type: sum, _type_hint: number}]
      join_fields: []
    - model: monitoring
      explore: structured_missing_columns
      type: table
      fields: [structured_missing_columns.document_namespace, structured_missing_columns.document_type,
        structured_missing_columns.document_version, structured_missing_columns.path,
        sum_of_path_count_two_weeks_ago]
      filters:
        structured_missing_columns.submission_date: 14 days
        structured_missing_columns.path: "-%`extra`.`enrollmentId`%"
      sorts: [sum_of_path_count_two_weeks_ago desc]
      limit: 500
      dynamic_fields: [{category: measure, expression: '', label: Sum of Path Count
            (two weeks ago), based_on: structured_missing_columns.path_count, _kind_hint: measure,
          measure: sum_of_path_count_two_weeks_ago, type: sum, _type_hint: number}]
      filter_expression: "(diff_days(${structured_missing_columns.submission_date},\
        \ now()) > 7)"
      join_fields:
      - field_name: structured_missing_columns.document_namespace
        source_field_name: structured_missing_columns.document_namespace
      - field_name: structured_missing_columns.document_type
        source_field_name: structured_missing_columns.document_type
      - field_name: structured_missing_columns.document_version
        source_field_name: structured_missing_columns.document_version
      - field_name: structured_missing_columns.path
        source_field_name: structured_missing_columns.path
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_column_widths:
      structured_missing_columns.document_namespace: 145.16700000000003
      structured_missing_columns.document_type: 135
      structured_missing_columns.document_version: 77
      structured_missing_columns.path: 360
    series_cell_visualizations:
      sum_of_path_count_last_7_days:
        is_active: true
      diff_to_two_weeks_ago:
        is_active: false
      sum_of_path_count_two_weeks_ago:
        is_active: true
    series_text_format:
      diff_to_two_weeks_ago:
        align: left
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Sum of Path Count (last 7 days)
        label_from_parameter:
        label_short: Sum of Path Count (last 7 days)
        map_layer:
        name: sum_of_path_count_last_7_days
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: structured_missing_columns
        view_label: ''
        dynamic: true
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Sum of Path Count (last 7 days)
        measure: true
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: sum_of_path_count_last_7_days
        suggest_explore: structured_missing_columns
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: sum_of_path_count_last_7_days
        sql_case:
        filters:
        aggregate: true
        sorted:
          desc: true
          sort_index: 0
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Sum of Path Count (two weeks ago)
        label_from_parameter:
        label_short: Sum of Path Count (two weeks ago)
        map_layer:
        name: sum_of_path_count_two_weeks_ago
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: structured_missing_columns
        view_label: ''
        dynamic: true
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Sum of Path Count (two weeks ago)
        measure: true
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: sum_of_path_count_two_weeks_ago
        suggest_explore: structured_missing_columns
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: sum_of_path_count_two_weeks_ago
        sql_case:
        filters:
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Structured Missing Columns Document Namespace
        label_from_parameter:
        label_short: Document Namespace
        map_layer:
        name: structured_missing_columns.document_namespace
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: structured_missing_columns
        view_label: Structured Missing Columns
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Document Namespace
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: structured_missing_columns.document_namespace
        suggest_explore: structured_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fstructured_missing_columns.view.lkml?line=8"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: "${TABLE}.document_namespace "
        sql_case:
        filters:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Structured Missing Columns Document Type
        label_from_parameter:
        label_short: Document Type
        map_layer:
        name: structured_missing_columns.document_type
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: structured_missing_columns
        view_label: Structured Missing Columns
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Document Type
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: structured_missing_columns.document_type
        suggest_explore: structured_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fstructured_missing_columns.view.lkml?line=13"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: "${TABLE}.document_type "
        sql_case:
        filters:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Structured Missing Columns Document Version
        label_from_parameter:
        label_short: Document Version
        map_layer:
        name: structured_missing_columns.document_version
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: structured_missing_columns
        view_label: Structured Missing Columns
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Document Version
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: structured_missing_columns.document_version
        suggest_explore: structured_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fstructured_missing_columns.view.lkml?line=18"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: "${TABLE}.document_version "
        sql_case:
        filters:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description:
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Structured Missing Columns Path
        label_from_parameter:
        label_short: Path
        map_layer:
        name: structured_missing_columns.path
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: string
        user_attribute_filter_types:
        - string
        - advanced_filter_string
        value_format:
        view: structured_missing_columns
        view_label: Structured Missing Columns
        dynamic: false
        week_start_day: monday
        dimension_group:
        error:
        field_group_variant: Path
        measure: false
        parameter: false
        primary_key: false
        project_name: spoke-default
        scope: structured_missing_columns
        suggest_dimension: structured_missing_columns.path
        suggest_explore: structured_missing_columns
        suggestable: true
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/spoke-default/files/imported_projects%2Flooker-hub%2Fmonitoring%2Fviews%2Fstructured_missing_columns.view.lkml?line=23"
        permanent: true
        source_file: imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        source_file_path: spoke-default/imported_projects/looker-hub/monitoring/views/structured_missing_columns.view.lkml
        sql: "${TABLE}.path "
        sql_case:
        filters:
      table_calculations: []
      pivots: []
    sorts: [sum_of_path_count_last_7_days desc]
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "((${sum_of_path_count_last_7_days}-${sum_of_path_count_two_weeks_ago})/${sum_of_path_count_last_7_days})*100",
        label: Diff % to two weeks ago, value_format: !!null '', value_format_name: decimal_1,
        _kind_hint: measure, table_calculation: diff_to_two_weeks_ago, _type_hint: number}]
    row: 45
    col: 0
    width: 24
    height: 6
  - title: Distinct docid (decoded, stable, live) - telemetry + structured
    name: Distinct docid (decoded, stable, live) - telemetry + structured
    model: monitoring
    explore: distinct_docids
    type: looker_grid
    fields: [distinct_docids.submission_date, distinct_docids.namespace, distinct_docids.doc_type,
      distinct_docids.decoded, distinct_docids.live, distinct_docids.stable, distinct_docids.non_matching_count,
      distinct_docids_notes.notes]
    filters:
      distinct_docids.non_matching_count: ">0"
    sorts: [distinct_docids.submission_date desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${distinct_docids.decoded}\
          \ - ${distinct_docids.live}", label: Diff Live to Decoded, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: diff_live_to_decoded,
        _type_hint: number}, {category: table_calculation, expression: "${distinct_docids.decoded}\
          \ - ${distinct_docids.stable}", label: Diff Stable to Decoded, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: diff_stable_to_decoded,
        _type_hint: number}, {category: table_calculation, expression: "${distinct_docids.live}\
          \ - ${distinct_docids.stable}", label: Diff Stable to Live, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: diff_stable_to_live,
        _type_hint: number}]
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
    defaults_version: 1
    column_order: ["$$$_row_numbers_$$$", distinct_docids.submission_date, distinct_docids.namespace,
      distinct_docids.doc_type, distinct_docids.decoded, distinct_docids.live, distinct_docids.stable,
      diff_live_to_decoded, diff_stable_to_decoded, diff_stable_to_live, distinct_docids.non_matching_count,
      distinct_docids_notes.notes]
    hidden_fields: [distinct_docids.non_matching_count]
    listen:
      Submission Date: distinct_docids.submission_date
    row: 84
    col: 0
    width: 24
    height: 4
  - name: Pipeline latency sum
    type: text
    title_text: Pipeline latency sum
    subtitle_text: An estimate of worst case latency of messages from the decoder
      to live tables.
    body_text: <center> <a href="https://earthangel-b40313e5.influxcloud.net/d/bZHv1mUMk/pipeline-latency?orgId=1&from=now-7d&to=now&var-realm=prod&var-family=telemetry">
      Grafana Dashboard</a> </center>
    row: 143
    col: 0
    width: 24
    height: 4
  - title: 'Overall # of errors per error_type - telemetry'
    name: 'Overall # of errors per error_type - telemetry'
    model: monitoring
    explore: payload_bytes_error_all
    type: looker_line
    fields: [payload_bytes_error_all.calculated_exception_class, payload_bytes_error_all.submission_date,
      payload_bytes_error_all.count_total_exceptions]
    pivots: [payload_bytes_error_all.calculated_exception_class]
    fill_fields: [payload_bytes_error_all.submission_date]
    filters:
      payload_bytes_error_all.pipeline_family: telemetry
    sorts: [payload_bytes_error_all.submission_date desc, payload_bytes_error_all.calculated_exception_class]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: payload_bytes_error_all.count_total_exceptions,
            id: AffectedByBugException - payload_bytes_error_all.count_total_exceptions,
            name: AffectedByBugException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: CharConversionException - payload_bytes_error_all.count_total_exceptions,
            name: CharConversionException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: IOException - payload_bytes_error_all.count_total_exceptions, name: IOException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: JsonEOFException
              - payload_bytes_error_all.count_total_exceptions, name: JsonEOFException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: JsonParseException
              - payload_bytes_error_all.count_total_exceptions, name: JsonParseException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: PayloadTooLargeException
              - payload_bytes_error_all.count_total_exceptions, name: PayloadTooLargeException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: SchemaNotFoundException
              - payload_bytes_error_all.count_total_exceptions, name: SchemaNotFoundException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: UnexpectedPathElementsException
              - payload_bytes_error_all.count_total_exceptions, name: UnexpectedPathElementsException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: UnwantedDataException
              - payload_bytes_error_all.count_total_exceptions, name: UnwantedDataException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: ValidationException
              - payload_bytes_error_all.count_total_exceptions, name: ValidationException}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    series_types: {}
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
    defaults_version: 1
    listen:
      Submission Date: payload_bytes_error_all.submission_date
    row: 107
    col: 0
    width: 13
    height: 8
  - title: 'Overall # of errors per error_type - stub_installer'
    name: 'Overall # of errors per error_type - stub_installer'
    model: monitoring
    explore: payload_bytes_error_all
    type: looker_line
    fields: [payload_bytes_error_all.calculated_exception_class, payload_bytes_error_all.submission_date,
      payload_bytes_error_all.count_total_exceptions]
    pivots: [payload_bytes_error_all.calculated_exception_class]
    fill_fields: [payload_bytes_error_all.submission_date]
    filters:
      payload_bytes_error_all.pipeline_family: '"stub_installer"'
    sorts: [payload_bytes_error_all.submission_date desc, payload_bytes_error_all.calculated_exception_class]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: payload_bytes_error_all.count_total_exceptions,
            id: InvalidIntegerException - payload_bytes_error_all.count_total_exceptions,
            name: InvalidIntegerException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: InvalidUriException - payload_bytes_error_all.count_total_exceptions,
            name: InvalidUriException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: UnexpectedPathElementsException - payload_bytes_error_all.count_total_exceptions,
            name: UnexpectedPathElementsException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: UnknownPingVersionException - payload_bytes_error_all.count_total_exceptions,
            name: UnknownPingVersionException}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: log}]
    series_types: {}
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
    defaults_version: 1
    listen:
      Submission Date: payload_bytes_error_all.submission_date
    row: 115
    col: 0
    width: 13
    height: 7
  - title: 'Overall # of errors per error_type - structured'
    name: 'Overall # of errors per error_type - structured'
    model: monitoring
    explore: payload_bytes_error_all
    type: looker_line
    fields: [payload_bytes_error_all.calculated_exception_class, payload_bytes_error_all.submission_date,
      payload_bytes_error_all.count_total_exceptions]
    pivots: [payload_bytes_error_all.calculated_exception_class]
    fill_fields: [payload_bytes_error_all.submission_date]
    filters:
      payload_bytes_error_all.pipeline_family: structured
    sorts: [payload_bytes_error_all.submission_date desc, payload_bytes_error_all.calculated_exception_class]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: payload_bytes_error_all.count_total_exceptions,
            id: AffectedByBugException - payload_bytes_error_all.count_total_exceptions,
            name: AffectedByBugException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: CharConversionException - payload_bytes_error_all.count_total_exceptions,
            name: CharConversionException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: InvalidUriException - payload_bytes_error_all.count_total_exceptions,
            name: InvalidUriException}, {axisId: payload_bytes_error_all.count_total_exceptions,
            id: IOException - payload_bytes_error_all.count_total_exceptions, name: IOException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: JsonEOFException
              - payload_bytes_error_all.count_total_exceptions, name: JsonEOFException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: JsonParseException
              - payload_bytes_error_all.count_total_exceptions, name: JsonParseException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: PayloadTooLargeException
              - payload_bytes_error_all.count_total_exceptions, name: PayloadTooLargeException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: SchemaNotFoundException
              - payload_bytes_error_all.count_total_exceptions, name: SchemaNotFoundException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: UnexpectedPathElementsException
              - payload_bytes_error_all.count_total_exceptions, name: UnexpectedPathElementsException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: UnwantedDataException
              - payload_bytes_error_all.count_total_exceptions, name: UnwantedDataException},
          {axisId: payload_bytes_error_all.count_total_exceptions, id: ValidationException
              - payload_bytes_error_all.count_total_exceptions, name: ValidationException}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    series_types: {}
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
    defaults_version: 1
    listen:
      Submission Date: payload_bytes_error_all.submission_date
    row: 107
    col: 13
    width: 11
    height: 8
  - title: Firefox Main Ping Column Size Differences
    name: Firefox Main Ping Column Size Differences
    model: monitoring
    explore: column_size_differences
    type: looker_grid
    fields: [column_size.submission_date, column_size.column_name, this_week_byte_size,
      last_week_byte_size]
    sorts: [column_size.submission_date desc, column_size.column_name desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, description: Difference in Byte
          sizes between last week and the current week., expression: "((${this_week_byte_size})\
          \ - (${last_week_byte_size}))", label: diff_to_previous_week_in_gb, value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: dimension, table_calculation: diff_to_previous_week_in_gb,
        _type_hint: number}, {category: dimension, expression: "${column_size.byte_size}/1024/1024/1024\n",
        label: this_week_byte_size, value_format: !!null '', value_format_name: !!null '',
        dimension: this_week_byte_size, _kind_hint: dimension, _type_hint: number},
      {category: dimension, expression: "${column_size_last_week.byte_size}/1024/1024/1024",
        label: last_week_byte_size, value_format: !!null '', value_format_name: !!null '',
        dimension: last_week_byte_size, _kind_hint: dimension, _type_hint: number}]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: [this_week_byte_size, last_week_byte_size]
    listen:
      Submission Date: column_size.submission_date
    row: 175
    col: 0
    width: 24
    height: 7
  - title: Stable Table Sizes (daily)
    name: Stable Table Sizes (daily)
    model: monitoring
    explore: stable_table_sizes
    type: looker_line
    fields: [stable_table_sizes.submission_date, table, total_size]
    pivots: [table]
    fill_fields: [stable_table_sizes.submission_date]
    filters:
      total_size: ">50"
    sorts: [total_size desc 0, table]
    limit: 1000
    column_limit: 100
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Size,
        value_format: !!null '', value_format_name: !!null '', based_on: tb_size,
        _kind_hint: measure, measure: total_size, type: sum, _type_hint: number},
      {category: dimension, expression: 'concat(${stable_table_sizes.dataset_id},
          ".", ${stable_table_sizes.table_id})', label: Table, value_format: !!null '',
        value_format_name: !!null '', dimension: table, _kind_hint: dimension, _type_hint: string},
      {category: dimension, expression: "${stable_table_sizes.byte_size} / 1024 /\
          \ 1024 / 1024", label: TB Size, value_format: !!null '', value_format_name: !!null '',
        dimension: tb_size, _kind_hint: dimension, _type_hint: number}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: 'Partition Size [GB]', orientation: left, series: [{axisId: total_size,
            id: activity_stream_stable.events_v1 - total_size, name: activity_stream_stable.events_v1},
          {axisId: total_size, id: activity_stream_stable.impression_stats_v1 - total_size,
            name: activity_stream_stable.impression_stats_v1}, {axisId: total_size,
            id: activity_stream_stable.sessions_v1 - total_size, name: activity_stream_stable.sessions_v1},
          {axisId: total_size, id: contextual_services_stable.topsites_impression_v1
              - total_size, name: contextual_services_stable.topsites_impression_v1},
          {axisId: total_size, id: firefox_desktop_stable.baseline_v1 - total_size,
            name: firefox_desktop_stable.baseline_v1}, {axisId: total_size, id: firefox_desktop_stable.metrics_v1
              - total_size, name: firefox_desktop_stable.metrics_v1}, {axisId: total_size,
            id: messaging_system_stable.undesired_events_v1 - total_size, name: messaging_system_stable.undesired_events_v1},
          {axisId: total_size, id: org_mozilla_firefox_stable.baseline_v1 - total_size,
            name: org_mozilla_firefox_stable.baseline_v1}, {axisId: total_size, id: org_mozilla_firefox_stable.events_v1
              - total_size, name: org_mozilla_firefox_stable.events_v1}, {axisId: total_size,
            id: org_mozilla_firefox_stable.metrics_v1 - total_size, name: org_mozilla_firefox_stable.metrics_v1},
          {axisId: total_size, id: telemetry_stable.event_v4 - total_size, name: telemetry_stable.event_v4},
          {axisId: total_size, id: telemetry_stable.first_shutdown_v4 - total_size,
            name: telemetry_stable.first_shutdown_v4}, {axisId: total_size, id: telemetry_stable.main_v4
              - total_size, name: telemetry_stable.main_v4}, {axisId: total_size,
            id: telemetry_stable.modules_v4 - total_size, name: telemetry_stable.modules_v4},
          {axisId: total_size, id: telemetry_stable.sync_v4 - total_size, name: telemetry_stable.sync_v4},
          {axisId: total_size, id: telemetry_stable.third_party_modules_v4 - total_size,
            name: telemetry_stable.third_party_modules_v4}, {axisId: total_size, id: telemetry_stable.update_v4
              - total_size, name: telemetry_stable.update_v4}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Submission Date: stable_table_sizes.submission_date
    row: 149
    col: 0
    width: 24
    height: 9
  - title: Stable Table Sizes (weekly)
    name: Stable Table Sizes (weekly)
    model: monitoring
    explore: stable_table_sizes
    type: looker_line
    fields: [table, total_size, stable_table_sizes.submission_week]
    pivots: [table]
    fill_fields: [stable_table_sizes.submission_week]
    filters:
      total_size: ">50"
    sorts: [total_size desc 0, table]
    limit: 1000
    column_limit: 100
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Size,
        value_format: !!null '', value_format_name: !!null '', based_on: tb_size,
        _kind_hint: measure, measure: total_size, type: average, _type_hint: number},
      {category: dimension, expression: 'concat(${stable_table_sizes.dataset_id},
          ".", ${stable_table_sizes.table_id})', label: Table, value_format: !!null '',
        value_format_name: !!null '', dimension: table, _kind_hint: dimension, _type_hint: string},
      {category: dimension, expression: "${stable_table_sizes.byte_size} / 1024 /\
          \ 1024 / 1024", label: TB Size, value_format: !!null '', value_format_name: !!null '',
        dimension: tb_size, _kind_hint: dimension, _type_hint: number}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: 'Partition Size [GB]', orientation: left, series: [{axisId: total_size,
            id: activity_stream_stable.events_v1 - total_size, name: activity_stream_stable.events_v1},
          {axisId: total_size, id: activity_stream_stable.impression_stats_v1 - total_size,
            name: activity_stream_stable.impression_stats_v1}, {axisId: total_size,
            id: activity_stream_stable.sessions_v1 - total_size, name: activity_stream_stable.sessions_v1},
          {axisId: total_size, id: contextual_services_stable.topsites_impression_v1
              - total_size, name: contextual_services_stable.topsites_impression_v1},
          {axisId: total_size, id: firefox_desktop_stable.baseline_v1 - total_size,
            name: firefox_desktop_stable.baseline_v1}, {axisId: total_size, id: firefox_desktop_stable.metrics_v1
              - total_size, name: firefox_desktop_stable.metrics_v1}, {axisId: total_size,
            id: messaging_system_stable.undesired_events_v1 - total_size, name: messaging_system_stable.undesired_events_v1},
          {axisId: total_size, id: org_mozilla_firefox_stable.baseline_v1 - total_size,
            name: org_mozilla_firefox_stable.baseline_v1}, {axisId: total_size, id: org_mozilla_firefox_stable.events_v1
              - total_size, name: org_mozilla_firefox_stable.events_v1}, {axisId: total_size,
            id: org_mozilla_firefox_stable.metrics_v1 - total_size, name: org_mozilla_firefox_stable.metrics_v1},
          {axisId: total_size, id: telemetry_stable.event_v4 - total_size, name: telemetry_stable.event_v4},
          {axisId: total_size, id: telemetry_stable.first_shutdown_v4 - total_size,
            name: telemetry_stable.first_shutdown_v4}, {axisId: total_size, id: telemetry_stable.main_v4
              - total_size, name: telemetry_stable.main_v4}, {axisId: total_size,
            id: telemetry_stable.modules_v4 - total_size, name: telemetry_stable.modules_v4},
          {axisId: total_size, id: telemetry_stable.sync_v4 - total_size, name: telemetry_stable.sync_v4},
          {axisId: total_size, id: telemetry_stable.third_party_modules_v4 - total_size,
            name: telemetry_stable.third_party_modules_v4}, {axisId: total_size, id: telemetry_stable.update_v4
              - total_size, name: telemetry_stable.update_v4}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Submission Date: stable_table_sizes.submission_date
    row: 158
    col: 0
    width: 24
    height: 8
  - title: Firefox Glean Table Sizes
    name: Firefox Glean Table Sizes
    model: monitoring
    explore: stable_table_sizes
    type: looker_line
    fields: [table, total_size, stable_table_sizes.submission_week]
    pivots: [table]
    fill_fields: [stable_table_sizes.submission_week]
    filters:
      stable_table_sizes.dataset_id: '"firefox_desktop_stable"'
    sorts: [total_size desc 0, table]
    limit: 1000
    column_limit: 100
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Size,
        value_format: !!null '', value_format_name: !!null '', based_on: tb_size,
        _kind_hint: measure, measure: total_size, type: average, _type_hint: number},
      {category: dimension, expression: 'concat(${stable_table_sizes.dataset_id},
          ".", ${stable_table_sizes.table_id})', label: Table, value_format: !!null '',
        value_format_name: !!null '', dimension: table, _kind_hint: dimension, _type_hint: string},
      {category: dimension, expression: "${stable_table_sizes.byte_size} / 1024 /\
          \ 1024 / 1024", label: TB Size, value_format: !!null '', value_format_name: !!null '',
        dimension: tb_size, _kind_hint: dimension, _type_hint: number}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: 'Partition Size [GB]', orientation: left, series: [{axisId: total_size,
            id: firefox_desktop_stable.baseline_v1 - total_size, name: firefox_desktop_stable.baseline_v1},
          {axisId: total_size, id: firefox_desktop_stable.deletion_request_v1 - total_size,
            name: firefox_desktop_stable.deletion_request_v1}, {axisId: total_size,
            id: firefox_desktop_stable.events_v1 - total_size, name: firefox_desktop_stable.events_v1},
          {axisId: total_size, id: firefox_desktop_stable.fog_validation_v1 - total_size,
            name: firefox_desktop_stable.fog_validation_v1}, {axisId: total_size,
            id: firefox_desktop_stable.metrics_v1 - total_size, name: firefox_desktop_stable.metrics_v1}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Submission Date: stable_table_sizes.submission_date
    row: 166
    col: 0
    width: 24
    height: 7
  - name: Stable Table Partition Sizes
    type: text
    title_text: Stable Table Partition Sizes
    body_text: ''
    row: 147
    col: 0
    width: 23
    height: 2
  - name: Column Size Differences
    type: text
    title_text: Column Size Differences
    body_text: Shows the differences in column sizes compared to the size of 7 days
      ago. This explains where increases in partition sizes could come from.
    row: 173
    col: 0
    width: 24
    height: 2
  - name: Distinct docids (decoded, stable, live)
    type: text
    title_text: Distinct docids (decoded, stable, live)
    subtitle_text: The table lists all doctypes where the number of distinct doc ids
      doesn't match between decoded, live, and stable.
    body_text: As of 2021-05-02, we filter out all pings containing "automation" in
      the X-Source-Tags header, so these counts may appear lower in some cases compared
      to a direct `COUNT(DISTINCT document_id)` on the relevant table partition. Prior
      to adding this filtering, document types under `org_mozilla_fenix` would consistently
      show mismatches due to test pings present in the decoded and live tables.
    row: 80
    col: 0
    width: 24
    height: 4
  - name: Schema Errors
    type: text
    title_text: Schema Errors
    subtitle_text: ''
    body_text: ''
    row: 51
    col: 0
    width: 24
    height: 2
  - title: Missing document namespaces
    name: Missing document namespaces
    model: monitoring
    explore: missing_namespaces_and_document_types
    type: looker_grid
    fields: [missing_namespaces_and_document_types.document_namespace, missing_namespaces_and_document_types.total_pings,
      list_of_document_type, missing_document_namespaces_notes.notes]
    sorts: [missing_namespaces_and_document_types.total_pings desc]
    limit: 500
    dynamic_fields: [{measure: list_of_document_type, based_on: missing_namespaces_and_document_types.document_type,
        expression: '', label: List of Document Type, type: list, _kind_hint: measure,
        _type_hint: list}]
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
    defaults_version: 1
    listen: {}
    row: 91
    col: 0
    width: 24
    height: 6
  - title: Missing DocTypes/versions
    name: Missing DocTypes/versions
    model: monitoring
    explore: missing_namespaces_and_document_types
    type: looker_grid
    fields: [missing_namespaces_and_document_types.document_namespace, missing_namespaces_and_document_types.total_pings,
      missing_namespaces_and_document_types.document_type, missing_namespaces_and_document_types.document_version,
      missing_document_namespaces_notes.notes]
    sorts: [missing_namespaces_and_document_types.total_pings desc]
    limit: 500
    dynamic_fields: [{measure: list_of_document_type, based_on: missing_namespaces_and_document_types.document_type,
        expression: '', label: List of Document Type, type: list, _kind_hint: measure,
        _type_hint: list}]
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
    defaults_version: 1
    listen: {}
    row: 99
    col: 0
    width: 24
    height: 6
  - name: Missing Document Namespaces
    type: text
    title_text: Missing Document Namespaces
    subtitle_text: ''
    body_text: "Add unknown namespaces to [MessageScrubber](https://github.com/mozilla/gcp-ingestion/blob/b86c6f491ec23bea8c57fc182eb3ccd3b62527be/ingestion-beam/src/main/java/com/mozilla/telemetry/decoder/MessageScrubber.java#L22)\
      \ if threshold exceeds 10,000. Different variation of existing products are\
      \ due to fuzzing. \n\n\nA list of known namespaces can be found inside [probeinfo/glean/app-listings](https://probeinfo.telemetry.mozilla.org/v2/glean/app-listings)."
    row: 88
    col: 0
    width: 24
    height: 3
  - name: Missing Doctypes/Versions
    type: text
    title_text: Missing Doctypes/Versions
    body_text: ''
    row: 97
    col: 0
    width: 24
    height: 2
  - name: 'Overall # of Errors per `error_type`'
    type: text
    title_text: 'Overall # of Errors per `error_type`'
    subtitle_text: Errors encountered during ingestion
    body_text: ''
    row: 105
    col: 0
    width: 24
    height: 2
  - name: Total Columns per Table
    type: text
    title_text: Total Columns per Table
    subtitle_text: ''
    body_text: ''
    row: 122
    col: 0
    width: 24
    height: 3
  - name: Open Issues
    type: text
    title_text: Open Issues
    subtitle_text: All open issues tagged with [data-quality], P1-P3
    body_text: <center> <a href="https://bugzilla.mozilla.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&classification=Client%20Software&classification=Developer%20Infrastructure&classification=Components&classification=Server%20Software&classification=Other&priority=P1&priority=P2&priority=P3&priority=--&resolution=---&status_whiteboard=[data-quality]&status_whiteboard_type=allwordssubstr&list_id=15652480">
      Bugzilla</a> </center>
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Total Columns per Stable Table
    name: Total Columns per Stable Table
    model: monitoring
    explore: stable_table_column_counts
    type: paginated_table
    fields: [stable_table_column_counts.submission_date, stable_table_column_counts.dataset,
      stable_table_column_counts.table_name, stable_table_column_counts.total_columns]
    filters: {}
    sorts: [stable_table_column_counts.submission_date desc, stable_table_column_counts.total_columns
        desc]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    series_types: {}
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
      Submission Date: stable_table_column_counts.submission_date
    row: 125
    col: 0
    width: 24
    height: 7
  - title: Total Columns per Stable Table over Time
    name: Total Columns per Stable Table over Time
    model: monitoring
    explore: stable_table_column_counts
    type: looker_line
    fields: [stable_table_column_counts.submission_date, total_columns_sum, table]
    pivots: [table]
    fill_fields: [stable_table_column_counts.submission_date]
    filters:
      total_columns_sum: ">100"
    sorts: [stable_table_column_counts.submission_date desc, table]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Columns
          Sum, value_format: !!null '', value_format_name: !!null '', based_on: stable_table_column_counts.total_columns,
        _kind_hint: measure, measure: total_columns_sum, type: sum, _type_hint: number},
      {category: dimension, expression: 'concat(${stable_table_column_counts.dataset},
          ".", ${stable_table_column_counts.table_name})', label: Table, value_format: !!null '',
        value_format_name: !!null '', dimension: table, _kind_hint: measure, _type_hint: string}]
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
    y_axes: [{label: Total Columns, orientation: left, series: [{axisId: total_columns_sum,
            id: firefox_desktop_stable.metrics_v1 - total_columns_sum, name: firefox_desktop_stable.metrics_v1},
          {axisId: total_columns_sum, id: firefox_translations_stable.custom_v1 -
              total_columns_sum, name: firefox_translations_stable.custom_v1}, {axisId: total_columns_sum,
            id: mlhackweek_search_stable.action_v1 - total_columns_sum, name: mlhackweek_search_stable.action_v1},
          {axisId: total_columns_sum, id: org_mozilla_bergamot_stable.custom_v1 -
              total_columns_sum, name: org_mozilla_bergamot_stable.custom_v1}, {axisId: total_columns_sum,
            id: org_mozilla_fenix_nightly_stable.metrics_v1 - total_columns_sum, name: org_mozilla_fenix_nightly_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_fenix_nightly_stable.migration_v1
              - total_columns_sum, name: org_mozilla_fenix_nightly_stable.migration_v1},
          {axisId: total_columns_sum, id: org_mozilla_fenix_stable.metrics_v1 - total_columns_sum,
            name: org_mozilla_fenix_stable.metrics_v1}, {axisId: total_columns_sum,
            id: org_mozilla_fenix_stable.migration_v1 - total_columns_sum, name: org_mozilla_fenix_stable.migration_v1},
          {axisId: total_columns_sum, id: org_mozilla_fennec_aurora_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_fennec_aurora_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_fennec_aurora_stable.migration_v1
              - total_columns_sum, name: org_mozilla_fennec_aurora_stable.migration_v1},
          {axisId: total_columns_sum, id: org_mozilla_firefox_beta_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_firefox_beta_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_firefox_beta_stable.migration_v1
              - total_columns_sum, name: org_mozilla_firefox_beta_stable.migration_v1},
          {axisId: total_columns_sum, id: org_mozilla_firefox_stable.metrics_v1 -
              total_columns_sum, name: org_mozilla_firefox_stable.metrics_v1}, {axisId: total_columns_sum,
            id: org_mozilla_firefox_stable.migration_v1 - total_columns_sum, name: org_mozilla_firefox_stable.migration_v1},
          {axisId: total_columns_sum, id: org_mozilla_focus_beta_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_focus_beta_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_focus_nightly_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_focus_nightly_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_focus_stable.metrics_v1 - total_columns_sum,
            name: org_mozilla_focus_stable.metrics_v1}, {axisId: total_columns_sum,
            id: org_mozilla_ios_fennec_stable.metrics_v1 - total_columns_sum, name: org_mozilla_ios_fennec_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_ios_firefox_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_ios_firefox_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_ios_firefoxbeta_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_ios_firefoxbeta_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_ios_focus_stable.metrics_v1
              - total_columns_sum, name: org_mozilla_ios_focus_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_ios_klar_stable.metrics_v1 -
              total_columns_sum, name: org_mozilla_ios_klar_stable.metrics_v1}, {
            axisId: total_columns_sum, id: org_mozilla_klar_stable.metrics_v1 - total_columns_sum,
            name: org_mozilla_klar_stable.metrics_v1}, {axisId: total_columns_sum,
            id: org_mozilla_reference_browser_stable.metrics_v1 - total_columns_sum,
            name: org_mozilla_reference_browser_stable.metrics_v1}, {axisId: total_columns_sum,
            id: org_mozilla_vrbrowser_stable.metrics_v1 - total_columns_sum, name: org_mozilla_vrbrowser_stable.metrics_v1},
          {axisId: total_columns_sum, id: org_mozilla_vrbrowser_stable.session_end_v1
              - total_columns_sum, name: org_mozilla_vrbrowser_stable.session_end_v1},
          {axisId: total_columns_sum, id: regrets_reporter_stable.regrets_reporter_update_v1
              - total_columns_sum, name: regrets_reporter_stable.regrets_reporter_update_v1},
          {axisId: total_columns_sum, id: telemetry_stable.bhr_v4 - total_columns_sum,
            name: telemetry_stable.bhr_v4}, {axisId: total_columns_sum, id: telemetry_stable.crash_v4
              - total_columns_sum, name: telemetry_stable.crash_v4}, {axisId: total_columns_sum,
            id: telemetry_stable.dnssec_study_v1_v4 - total_columns_sum, name: telemetry_stable.dnssec_study_v1_v4},
          {axisId: total_columns_sum, id: telemetry_stable.event_v4 - total_columns_sum,
            name: telemetry_stable.event_v4}, {axisId: total_columns_sum, id: telemetry_stable.first_shutdown_v4
              - total_columns_sum, name: telemetry_stable.first_shutdown_v4}, {axisId: total_columns_sum,
            id: telemetry_stable.heartbeat_v4 - total_columns_sum, name: telemetry_stable.heartbeat_v4},
          {axisId: total_columns_sum, id: telemetry_stable.main_v4 - total_columns_sum,
            name: telemetry_stable.main_v4}, {axisId: total_columns_sum, id: telemetry_stable.modules_v4
              - total_columns_sum, name: telemetry_stable.modules_v4}, {axisId: total_columns_sum,
            id: telemetry_stable.new_profile_v4 - total_columns_sum, name: telemetry_stable.new_profile_v4},
          {axisId: total_columns_sum, id: telemetry_stable.regrets_reporter_update_v4
              - total_columns_sum, name: telemetry_stable.regrets_reporter_update_v4},
          {axisId: total_columns_sum, id: telemetry_stable.saved_session_v4 - total_columns_sum,
            name: telemetry_stable.saved_session_v4}, {axisId: total_columns_sum,
            id: telemetry_stable.shield_icq_v1_v4 - total_columns_sum, name: telemetry_stable.shield_icq_v1_v4},
          {axisId: total_columns_sum, id: telemetry_stable.shield_study_addon_v3 -
              total_columns_sum, name: telemetry_stable.shield_study_addon_v3}, {
            axisId: total_columns_sum, id: telemetry_stable.shield_study_error_v3
              - total_columns_sum, name: telemetry_stable.shield_study_error_v3},
          {axisId: total_columns_sum, id: telemetry_stable.shield_study_v3 - total_columns_sum,
            name: telemetry_stable.shield_study_v3}, {axisId: total_columns_sum, id: telemetry_stable.sync_v4
              - total_columns_sum, name: telemetry_stable.sync_v4}, {axisId: total_columns_sum,
            id: telemetry_stable.sync_v5 - total_columns_sum, name: telemetry_stable.sync_v5},
          {axisId: total_columns_sum, id: telemetry_stable.testpilot_v4 - total_columns_sum,
            name: telemetry_stable.testpilot_v4}, {axisId: total_columns_sum, id: telemetry_stable.third_party_modules_v4
              - total_columns_sum, name: telemetry_stable.third_party_modules_v4},
          {axisId: total_columns_sum, id: telemetry_stable.uninstall_v4 - total_columns_sum,
            name: telemetry_stable.uninstall_v4}, {axisId: total_columns_sum, id: telemetry_stable.untrusted_modules_v4
              - total_columns_sum, name: telemetry_stable.untrusted_modules_v4}, {
            axisId: total_columns_sum, id: telemetry_stable.update_v4 - total_columns_sum,
            name: telemetry_stable.update_v4}, {axisId: total_columns_sum, id: telemetry_stable.voice_v4
              - total_columns_sum, name: telemetry_stable.voice_v4}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: log}]
    series_types: {}
    series_labels: {}
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
    hidden_fields: []
    hidden_points_if_no: []
    listen:
      Submission Date: stable_table_column_counts.submission_date
    row: 132
    col: 0
    width: 24
    height: 11
  - name: Top Schema Errors
    title: Top Schema Errors
    merged_queries:
    - model: monitoring
      explore: schema_error_counts
      type: table
      fields: [schema_error_counts.submission_date, grouped, filtered_error_counts]
      sorts: [filtered_error_counts desc]
      limit: 500
      dynamic_fields: [{category: measure, expression: !!null '', label: filtered_error_counts,
          value_format: !!null '', value_format_name: !!null '', based_on: schema_error_counts.error_count,
          _kind_hint: measure, measure: filtered_error_counts, type: sum, _type_hint: sum},
        {category: dimension, expression: 'concat(${schema_error_counts.path}, " [",
            ${schema_error_counts.document_namespace}, ".", ${schema_error_counts.document_type})',
          label: grouped, value_format: !!null '', value_format_name: !!null '', dimension: grouped,
          _kind_hint: dimension, _type_hint: string}]
    - model: monitoring
      explore: schema_error_counts
      type: table
      fields: [grouped, top_error_counts]
      sorts: [top_error_counts desc]
      limit: 10
      dynamic_fields: [{category: dimension, expression: 'concat(${schema_error_counts.path},
            " [", ${schema_error_counts.document_namespace}, ".", ${schema_error_counts.document_type})',
          label: grouped, value_format: !!null '', value_format_name: !!null '', dimension: grouped,
          _kind_hint: dimension, _type_hint: string}, {category: measure, expression: !!null '',
          label: top_error_counts, value_format: !!null '', value_format_name: !!null '',
          based_on: schema_error_counts.error_count, _kind_hint: measure, measure: top_error_counts,
          type: sum, _type_hint: sum}]
      join_fields:
      - field_name: grouped
        source_field_name: grouped
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Total pings, orientation: left, series: [{axisId: filtered_error_counts,
            id: "# [messaging_system.onboarding_v1 - filtered_error_counts", name: "#\
              \ [messaging_system.onboarding_v1"}, {axisId: filtered_error_counts,
            id: "# [telemetry.mobile_event_v4 - filtered_error_counts", name: "# [telemetry.mobile_event_v4"},
          {axisId: filtered_error_counts, id: "#/application/buildId [telemetry.health_v4\
              \ - filtered_error_counts", name: "#/application/buildId [telemetry.health_v4"},
          {axisId: filtered_error_counts, id: "#/application/version [telemetry.health_v4\
              \ - filtered_error_counts", name: "#/application/version [telemetry.health_v4"},
          {axisId: filtered_error_counts, id: "#/client_info [firefox_desktop_background_update.metrics_v1\
              \ - filtered_error_counts", name: "#/client_info [firefox_desktop_background_update.metrics_v1"},
          {axisId: filtered_error_counts, id: "#/client_info [firefox_desktop.metrics_v1\
              \ - filtered_error_counts", name: "#/client_info [firefox_desktop.metrics_v1"},
          {axisId: filtered_error_counts, id: "#/client_info [org_mozilla_firefox.metrics_v1\
              \ - filtered_error_counts", name: "#/client_info [org_mozilla_firefox.metrics_v1"},
          {axisId: filtered_error_counts, id: "#/clientId [telemetry.crash_v4 - filtered_error_counts",
            name: "#/clientId [telemetry.crash_v4"}, {axisId: filtered_error_counts,
            id: "#/environment/build/buildId [telemetry.main_v4 - filtered_error_counts",
            name: "#/environment/build/buildId [telemetry.main_v4"}, {axisId: filtered_error_counts,
            id: "#/environment/build/version [telemetry.event_v4 - filtered_error_counts",
            name: "#/environment/build/version [telemetry.event_v4"}, {axisId: filtered_error_counts,
            id: "#/environment/build/version [telemetry.main_v4 - filtered_error_counts",
            name: "#/environment/build/version [telemetry.main_v4"}, {axisId: filtered_error_counts,
            id: "#/environment/build/version [telemetry.modules_v4 - filtered_error_counts",
            name: "#/environment/build/version [telemetry.modules_v4"}, {axisId: filtered_error_counts,
            id: "#/environment/build/version [telemetry.third_party_modules_v4 - filtered_error_counts",
            name: "#/environment/build/version [telemetry.third_party_modules_v4"},
          {axisId: filtered_error_counts, id: "#/environment/settings/update/autoDownload\
              \ [telemetry.main_v4 - filtered_error_counts", name: "#/environment/settings/update/autoDownload\
              \ [telemetry.main_v4"}, {axisId: filtered_error_counts, id: "#/environment/system/cpu/cores\
              \ [telemetry.event_v4 - filtered_error_counts", name: "#/environment/system/cpu/cores\
              \ [telemetry.event_v4"}, {axisId: filtered_error_counts, id: "#/environment/system/cpu/cores\
              \ [telemetry.main_v4 - filtered_error_counts", name: "#/environment/system/cpu/cores\
              \ [telemetry.main_v4"}, {axisId: filtered_error_counts, id: "#/environment/system/cpu/cores\
              \ [telemetry.modules_v4 - filtered_error_counts", name: "#/environment/system/cpu/cores\
              \ [telemetry.modules_v4"}, {axisId: filtered_error_counts, id: "#/environment/system/cpu/cores\
              \ [telemetry.new_profile_v4 - filtered_error_counts", name: "#/environment/system/cpu/cores\
              \ [telemetry.new_profile_v4"}, {axisId: filtered_error_counts, id: "#/payload\
              \ [telemetry.update_v4 - filtered_error_counts", name: "#/payload [telemetry.update_v4"},
          {axisId: filtered_error_counts, id: "#/payload/hangs/0/annotations [telemetry.bhr_v4\
              \ - filtered_error_counts", name: "#/payload/hangs/0/annotations [telemetry.bhr_v4"},
          {axisId: filtered_error_counts, id: "#/payload/info/subsessionLength [telemetry.first_shutdown_v4\
              \ - filtered_error_counts", name: "#/payload/info/subsessionLength [telemetry.first_shutdown_v4"},
          {axisId: filtered_error_counts, id: "#/payload/info/subsessionLength [telemetry.main_v4\
              \ - filtered_error_counts", name: "#/payload/info/subsessionLength [telemetry.main_v4"},
          {axisId: filtered_error_counts, id: "#/payload/keyedHistograms/SQLITE_STORE_QUERY/1657114595AmcateirvtiSty.sqlite/values/0\
              \ [telemetry.main_v4 - filtered_error_counts", name: "#/payload/keyedHistograms/SQLITE_STORE_QUERY/1657114595AmcateirvtiSty.sqlite/values/0\
              \ [telemetry.main_v4"}, {axisId: filtered_error_counts, id: "#/payload/keyedHistograms/SQLITE_STORE_QUERY/3870112724rsegmnoittet-es.sqlite/values/0\
              \ [telemetry.main_v4 - filtered_error_counts", name: "#/payload/keyedHistograms/SQLITE_STORE_QUERY/3870112724rsegmnoittet-es.sqlite/values/0\
              \ [telemetry.main_v4"}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    legend_position: right
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [top_error_counts]
    type: looker_line
    pivots: [grouped]
    sorts: [schema_error_counts.submission_date desc]
    listen:
    - Submission Date: schema_error_counts.submission_date
    - Submission Date: schema_error_counts.submission_date
    row: 53
    col: 0
    width: 24
    height: 11
  - title: All schema errors (last 14 days)
    name: All schema errors (last 14 days)
    model: monitoring
    explore: schema_error_counts
    type: looker_grid
    fields: [schema_error_counts.document_namespace, schema_error_counts.document_type,
      schema_error_counts.path, error_count, schema_errors_notes.notes]
    sorts: [error_count desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: error_count,
        value_format: !!null '', value_format_name: !!null '', based_on: schema_error_counts.error_count,
        _kind_hint: measure, measure: error_count, type: sum, _type_hint: sum}]
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
    series_types: {}
    listen: {}
    row: 64
    col: 0
    width: 24
    height: 7
  - name: Top schema errors normalized
    title: Top schema errors normalized
    merged_queries:
    - model: monitoring
      explore: schema_error_counts
      type: table
      fields: [schema_error_counts.document_namespace, schema_error_counts.document_type,
        schema_error_counts.path, schema_error_counts.error_counts_sum, schema_errors_notes.notes]
      filters:
        schema_error_counts.error_counts_sum: ''
      sorts: [schema_error_counts.document_type]
      limit: 5000
      join_fields: []
    - model: monitoring
      explore: distinct_docids
      type: table
      fields: [distinct_docids.namespace, distinct_docids.doc_type, distinct_docids.n_documents]
      sorts: [distinct_docids.doc_type]
      limit: 5000
      join_fields:
      - field_name: distinct_docids.namespace
        source_field_name: schema_error_counts.document_namespace
      - field_name: distinct_docids.doc_type
        source_field_name: schema_error_counts.document_type
    type: table
    sorts: [percent_of_error desc]
    dynamic_fields: [{category: table_calculation, expression: "(${schema_error_counts.error_counts_sum}/(${schema_error_counts.error_counts_sum}+${distinct_docids.n_documents}))\
          \ * 100", label: percent_of_error, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: percent_of_error, _type_hint: number}]
    listen:
    - Submission Date: schema_error_counts.submission_date
    - Submission Date: distinct_docids.submission_date
    row: 71
    col: 0
    width: 24
    height: 9
  - name: Known Issues
    type: text
    title_text: Known Issues
    subtitle_text: ''
    body_text: "<center> <a href=\"https://docs.google.com/spreadsheets/d/1wMKyIyzp8yW7YpNz6hpFe0sHueeeLHdHr3p-1br2TbA\"\
      > Known Data Platform Issues</a> <br/> \n<a href=\"https://docs.google.com/spreadsheets/d/16Cyx_KBieRdQkSBKolivqpBaK2H-VceN9LEZcL0snHg\"\
      > Data Incidents</a>\n</center>\n\n"
    row: 3
    col: 0
    width: 24
    height: 3
  - title: Firefox Desktop Metrics (Glean) - Client Count by Normalized Channel
    name: Firefox Desktop Metrics (Glean) - Client Count by Normalized Channel
    model: firefox_desktop
    explore: metrics
    type: looker_line
    fields: [metrics.submission_date, metrics.sample_id, metrics.normalized_channel,
      metrics.clients]
    pivots: [metrics.normalized_channel]
    filters:
      metrics.submission_date: 90 days
      metrics.sample_id: '0'
      metrics.normalized_channel: nightly,release,Other,beta,aurora
    sorts: [metrics.submission_date desc, metrics.normalized_channel]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.clients, id: aurora
              - metrics.clients, name: aurora}, {axisId: metrics.clients, id: beta
              - metrics.clients, name: beta}, {axisId: metrics.clients, id: nightly
              - metrics.clients, name: nightly}, {axisId: metrics.clients, id: Other
              - metrics.clients, name: Other}, {axisId: metrics.clients, id: release
              - metrics.clients, name: release}], showLabels: true, showValues: true,
        minValue: !!null '', valueFormat: '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 100, type: log}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [metrics.sample_id]
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
    defaults_version: 1
    listen: {}
    row: 26
    col: 12
    width: 12
    height: 9
  filters:
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: 90 day ago for 90 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: monitoring
    explore: stable_table_sizes
    listens_to_filters: []
    field: stable_table_sizes.submission_date
