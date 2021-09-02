- dashboard: new_tab_test
  title: New Tab Test
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: New Tab Overview
    type: text
    title_text: New Tab Overview
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Pocket Impressions By Day
    name: Pocket Impressions By Day
    model: activity_stream
    explore: pocket_tile_impressions
    type: looker_line
    fields: [impression_stats_flat.submission_date, impression_stats_flat.impression_count]
    fill_fields: [impression_stats_flat.submission_date]
    filters:
      impression_stats_flat.submission_date: 28 days
    sorts: [impression_stats_flat.submission_date desc]
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
    defaults_version: 1
    row: 47
    col: 0
    width: 8
    height: 6
  - title: Pocket Clicks By Day
    name: Pocket Clicks By Day
    model: activity_stream
    explore: pocket_tile_impressions
    type: looker_line
    fields: [impression_stats_flat.submission_date, impression_stats_flat.click_count]
    fill_fields: [impression_stats_flat.submission_date]
    filters:
      impression_stats_flat.submission_date: 28 days
    sorts: [impression_stats_flat.submission_date desc]
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
    defaults_version: 1
    row: 47
    col: 8
    width: 8
    height: 6
  - title: Newtab Searches
    name: Newtab Searches
    model: search
    explore: desktop_search_counts
    type: looker_line
    fields: [search_clients_engines_sources_daily.submission_date, search_clients_engines_sources_daily.total_searches]
    fill_fields: [search_clients_engines_sources_daily.submission_date]
    filters:
      search_clients_engines_sources_daily.submission_date: 28 days
      search_clients_engines_sources_daily.source: newtab
    sorts: [search_clients_engines_sources_daily.submission_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 25
    col: 0
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "New Tab Impressions per User \n\n* define \"user\" (user with new\
      \ tab session? or DAU)"
    row: 14
    col: 11
    width: 9
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "% of DAU with at least one New Tab session"
    row: 2
    col: 16
    width: 5
    height: 6
  - name: New Tab Search
    type: text
    title_text: New Tab Search
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 0
    width: 23
    height: 2
  - name: Topsites
    type: text
    title_text: Topsites
    subtitle_text: ''
    body_text: ''
    row: 31
    col: 0
    width: 23
    height: 2
  - name: Pocket
    type: text
    title_text: Pocket
    subtitle_text: ''
    body_text: ''
    row: 45
    col: 0
    width: 23
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "% Users with Pocket enabled"
    row: 53
    col: 16
    width: 8
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "% users with topsites enabled\n"
    row: 33
    col: 16
    width: 8
    height: 6
  - title: Topsites Clicks
    name: Topsites Clicks
    model: contextual_services
    explore: topsites_clicks
    type: looker_line
    fields: [topsites_click.submission_date, topsites_click.ping_count]
    fill_fields: [topsites_click.submission_date]
    filters:
      topsites_click.submission_date: 28 days
    sorts: [topsites_click.submission_date desc]
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
    defaults_version: 1
    row: 33
    col: 0
    width: 8
    height: 6
  - title: Topsites Impressions
    name: Topsites Impressions
    model: contextual_services
    explore: topsites_impressions
    type: looker_line
    fields: [topsites_impression.submission_date, topsites_impression.ping_count]
    fill_fields: [topsites_impression.submission_date]
    filters:
      topsites_impression.submission_date: 28 days
    sorts: [topsites_impression.submission_date desc]
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
    defaults_version: 1
    row: 33
    col: 8
    width: 8
    height: 6
  - title: Clients with a New Tab Session
    name: Clients with a New Tab Session
    model: activity_stream
    explore: session_counts
    type: looker_line
    fields: [sessions.submission_date, sessions.clients]
    fill_fields: [sessions.submission_date]
    filters:
      sessions.submission_date: 28 days
    sorts: [sessions.submission_date desc]
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
    defaults_version: 1
    row: 8
    col: 8
    width: 8
    height: 6
  - title: New Tab Sessions
    name: New Tab Sessions
    model: activity_stream
    explore: session_counts
    type: looker_line
    fields: [sessions.session_count, sessions.submission_date]
    fill_fields: [sessions.submission_date]
    filters:
      sessions.submission_date: 28 days
    sorts: [sessions.submission_date desc]
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
    defaults_version: 1
    row: 8
    col: 0
    width: 8
    height: 6
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: Tiles shown
    row: 39
    col: 0
    width: 8
    height: 6
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: Sponsored clicks
    row: 53
    col: 8
    width: 8
    height: 6
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: 'Sponsored impressions

      '
    row: 53
    col: 0
    width: 8
    height: 6
  - title: Clients who search
    name: Clients who search
    model: search
    explore: desktop_search_counts
    type: looker_line
    fields: [search_clients_engines_sources_daily.submission_date, search_clients_engines_sources_daily.clients]
    filters:
      search_clients_engines_sources_daily.submission_date: 28 days
      search_clients_engines_sources_daily.source: "%newtab%"
      search_clients_engines_sources_daily.total_searches: ">0"
    sorts: [search_clients_engines_sources_daily.submission_date desc]
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
    defaults_version: 1
    row: 25
    col: 16
    width: 8
    height: 6
  - title: New Tab sessions past 7 days
    name: New Tab sessions past 7 days
    model: activity_stream
    explore: session_counts
    type: single_value
    fields: [sessions.session_count]
    filters:
      sessions.submission_date: 7 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 2
    col: 0
    width: 8
    height: 6
  - title: New Tab Searches by Engine
    name: New Tab Searches by Engine
    model: search
    explore: desktop_search_counts
    type: looker_line
    fields: [search_clients_engines_sources_daily.submission_date, search_clients_engines_sources_daily.normalized_engine,
      search_clients_engines_sources_daily.total_searches]
    pivots: [search_clients_engines_sources_daily.normalized_engine]
    fill_fields: [search_clients_engines_sources_daily.submission_date]
    filters:
      search_clients_engines_sources_daily.submission_date: 28 days
      search_clients_engines_sources_daily.source: "%newtab%"
    sorts: [search_clients_engines_sources_daily.submission_date desc, search_clients_engines_sources_daily.normalized_engine]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    row: 25
    col: 8
    width: 8
    height: 6
  - name: Revenue
    type: text
    title_text: Revenue
    subtitle_text: ''
    body_text: Placeholder until rev data is imported
    row: 20
    col: 0
    width: 24
    height: 3
  - title: Total Searches on New Tab, past 7 days
    name: Total Searches on New Tab, past 7 days
    model: search
    explore: desktop_search_counts
    type: single_value
    fields: [search_clients_engines_sources_daily.total_searches]
    filters:
      search_clients_engines_sources_daily.submission_date: 7 days
      search_clients_engines_sources_daily.source: "%newtab%"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 2
    col: 8
    width: 8
    height: 6
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: 'clients who saw a tile

      '
    row: 39
    col: 16
    width: 8
    height: 6
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: AdM stats
    row: 39
    col: 8
    width: 8
    height: 6
  - title: Pocket stats
    name: Pocket stats
    model: activity_stream
    explore: pocket_tile_impressions
    type: looker_line
    fields: [impression_stats_flat.submission_date, impression_stats_flat.impression_count,
      impression_stats_flat.loaded_count, impression_stats_flat.pocketed_count, impression_stats_flat.click_count]
    fill_fields: [impression_stats_flat.submission_date]
    filters:
      impression_stats_flat.submission_date: 28 days
    sorts: [impression_stats_flat.submission_date desc]
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
    defaults_version: 1
    row: 47
    col: 16
    width: 8
    height: 6
