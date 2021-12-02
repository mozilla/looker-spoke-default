- dashboard: android_release_mobile_mr2_product_dashboard
  title: Android Release Mobile MR2 Product Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Metrics Close Tab Setting
    name: Metrics Close Tab Setting
    model: fenix
    explore: metrics
    type: looker_line
    fields: [metrics.submission_date, metrics.metrics__string__metrics_close_tab_setting,
      metrics.clients]
    pivots: [metrics.metrics__string__metrics_close_tab_setting]
    filters:
      metrics.channel: mozdata.fenix.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc, metrics.metrics__string__metrics_close_tab_setting]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.clients, id: MANUAL
              - metrics.clients, name: MANUAL}, {axisId: metrics.clients, id: ONE_DAY
              - metrics.clients, name: ONE_DAY}, {axisId: metrics.clients, id: ONE_MONTH
              - metrics.clients, name: ONE_MONTH}, {axisId: metrics.clients, id: ONE_WEEK
              - metrics.clients, name: ONE_WEEK}, {axisId: metrics.clients, id: metrics.metrics__string__metrics_close_tab_setting___null
              - metrics.clients, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Counts for how many users have opted for the different settings available
      for closing tabs.
    listen: {}
    row: 96
    col: 12
    width: 12
    height: 7
  - title: v94 DAU
    name: v94 DAU
    model: fenix
    explore: client_counts
    type: looker_line
    fields: [client_counts.submission_date, client_counts.client_count, client_counts.app_display_version]
    pivots: [client_counts.app_display_version]
    fill_fields: [client_counts.submission_date]
    filters:
      client_counts.channel: mozdata.fenix.baseline^_clients^_daily
      client_counts.submission_date: 28 days
      client_counts.app_display_version: 94%
    sorts: [client_counts.submission_date desc, client_counts.app_display_version]
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
            id: client_counts.client_count, name: Client Count}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 8
    height: 7
  - title: How many times was a Recently Closed Tab opened?
    name: How many times was a Recently Closed Tab opened?
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.event_count]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: events
      events.event_name: '"recently_closed_tabs_opened"'
      events.normalized_channel: release
    sorts: [events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: events.event_count, name: Event Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen: {}
    row: 82
    col: 12
    width: 12
    height: 7
  - title: How are users landing on Home Screen?
    name: How are users landing on Home Screen?
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.event_count, events.event_name]
    pivots: [events.event_name]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: '"start_on_home",events'
      events.event_name: '"enter_home_screen","browser_toolbar_home_tapped","search_bar_tapped"'
      events.normalized_channel: release
    sorts: [events.submission_date desc, events.event_name]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: events.event_count, name: Event Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: |-
      A count comparison of the two primary ways that users can navigate to the home screen

      1. After 4 hours or more of being away, Firefox will send them to home upon return to the app (enter_home_screen)
      2. On Fenix there is the new addition of the home screen button on an existing tab (toolbar_home_tapped)
      3. On an existing tab, when the user taps on the search bar the home screen will now show up in the background (search_bar_tapped)

      We expect counts from #1 to be higher than counts in #2 because it happens automatically, while the second requires user action.
    listen: {}
    row: 45
    col: 0
    width: 24
    height: 8
  - title: Default Browser Indicator
    name: Default Browser Indicator
    model: fenix
    explore: metrics
    type: looker_line
    fields: [metrics.submission_date, metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count,
      metrics.metrics__boolean__metrics_default_browser]
    pivots: [metrics.metrics__boolean__metrics_default_browser]
    fill_fields: [metrics.submission_date, metrics.metrics__boolean__metrics_default_browser]
    filters:
      metrics.channel: mozdata.fenix.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc, metrics.metrics__boolean__metrics_default_browser]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: No - metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count,
            id: No - metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count,
            name: 'No'}, {axisId: Yes - metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count,
            id: Yes - metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count,
            name: 'Yes'}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [No - metrics__metrics__labeled_counter__glean_validation_pings_submitted.client_count]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: A "yes" for this metric indicates activity from a device that has Firefox
      set as the default browser.
    listen: {}
    row: 12
    col: 0
    width: 12
    height: 7
  - title: Awesomebar Actions
    name: Awesomebar Actions
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.event_count, events.submission_date, events.event_name]
    pivots: [events.event_name]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: awesomebar
      events.event_name: '"search_suggestion_clicked","search_action_clicked","history_suggestion_clicked","bookmark_suggestion_clicked","opened_tab_suggestion_clicked","clipboard_suggestion_clicked"'
      events.normalized_channel: release
    sorts: [events.submission_date desc, events.event_name]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: bookmark_suggestion_clicked - events.event_count, name: bookmark_suggestion_clicked},
          {axisId: events.event_count, id: clipboard_suggestion_clicked - events.event_count,
            name: clipboard_suggestion_clicked}, {axisId: events.event_count, id: history_suggestion_clicked
              - events.event_count, name: history_suggestion_clicked}, {axisId: events.event_count,
            id: opened_tab_suggestion_clicked - events.event_count, name: opened_tab_suggestion_clicked},
          {axisId: events.event_count, id: search_action_clicked - events.event_count,
            name: search_action_clicked}, {axisId: events.event_count, id: search_suggestion_clicked
              - events.event_count, name: search_suggestion_clicked}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Counts for various items clicked through the awesome. There are more
      details here https://docs.google.com/document/d/1j0s7WePugsxheC7sDp4rPyUEtF1rAkE3BHZiTiYo6EA/edit
      around changes to the awesomebar.
    listen: {}
    row: 19
    col: 0
    width: 24
    height: 9
  - title: Default and Frecency Top Site Opens
    name: Default and Frecency Top Site Opens
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.event_count, events.event_name]
    pivots: [events.event_name]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: '"top_sites"'
      events.event_name: '"open_default","open_frecency","open_google_search_attribution","open_baidu_search_attribution"'
      events.normalized_channel: release
    sorts: [events.submission_date desc, events.event_name]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: open_default - events.event_count, name: open_default}, {axisId: events.event_count,
            id: open_frecency - events.event_count, name: open_frecency}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Counts that indicate the frequency of different top sites clicked,
      including the default top sites and ones that are added based on frecency sites.
    listen: {}
    row: 53
    col: 0
    width: 24
    height: 7
  - name: Home Screen
    type: text
    title_text: Home Screen
    subtitle_text: ''
    body_text: ''
    row: 35
    col: 0
    width: 24
    height: 2
  - name: Tabs & Tabs Tray
    type: text
    title_text: Tabs & Tabs Tray
    subtitle_text: ''
    body_text: One major feature of the tabs tray is search term groupings. Once the
      telemetry is implemented for these groupings we will be able to add metrics
      around their usage.
    row: 74
    col: 0
    width: 24
    height: 2
  - title: Actions for Bookmark Management
    name: Actions for Bookmark Management
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.client_count, events.event_name, events.submission_date]
    pivots: [events.event_name]
    fill_fields: [events.submission_date]
    filters:
      events.normalized_channel: release
      events.event_name: open,copied,edited,"folder_add","folder_remove",moved,"multi_removed","open_in_new_tab","open_in_new_tabs","open_in_private_tab","open_in_private_tabs",removed,shared
      events.event_category: '"bookmarks_management"'
      events.submission_date: 56 days
    sorts: [events.event_name, events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.client_count,
            id: copied - events.client_count, name: copied}, {axisId: events.client_count,
            id: edited - events.client_count, name: edited}, {axisId: events.client_count,
            id: folder_add - events.client_count, name: folder_add}, {axisId: events.client_count,
            id: folder_remove - events.client_count, name: folder_remove}, {axisId: events.client_count,
            id: moved - events.client_count, name: moved}, {axisId: events.client_count,
            id: multi_removed - events.client_count, name: multi_removed}, {axisId: events.client_count,
            id: open - events.client_count, name: open}, {axisId: events.client_count,
            id: open_in_new_tab - events.client_count, name: open_in_new_tab}, {axisId: events.client_count,
            id: open_in_new_tabs - events.client_count, name: open_in_new_tabs}, {
            axisId: events.client_count, id: open_in_private_tab - events.client_count,
            name: open_in_private_tab}, {axisId: events.client_count, id: open_in_private_tabs
              - events.client_count, name: open_in_private_tabs}, {axisId: events.client_count,
            id: removed - events.client_count, name: removed}, {axisId: events.client_count,
            id: shared - events.client_count, name: shared}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 96
    col: 0
    width: 12
    height: 7
  - title: Search Metrics
    name: Search Metrics
    model: search
    explore: mobile_search_counts
    type: looker_line
    fields: [mobile_search_clients_engines_sources_daily.submission_date, mobile_search_clients_engines_sources_daily.total_searches,
      mobile_search_clients_engines_sources_daily.total_organic_searches, mobile_search_clients_engines_sources_daily.total_ad_clicks]
    fill_fields: [mobile_search_clients_engines_sources_daily.submission_date]
    filters:
      mobile_search_clients_engines_sources_daily.submission_date: 28 days
      mobile_search_clients_engines_sources_daily.channel: release
      mobile_search_clients_engines_sources_daily.normalized_app_name: Fenix
    sorts: [mobile_search_clients_engines_sources_daily.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_search_clients_engines_sources_daily.total_searches,
            id: mobile_search_clients_engines_sources_daily.total_searches, name: Total
              Searches}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    listen: {}
    row: 28
    col: 0
    width: 24
    height: 7
  - name: Product Dashboard
    type: text
    title_text: Product Dashboard
    subtitle_text: For questions or feedback, @kimmy on slack.
    body_text: |-
      This dashboard focuses on metrics that track product changes made during the launch of MR2 for Android, primarily for the release channel. There is a separate dashboard for the Beta channel. There are a few primary sections for these metrics

      1. Overall Product Metrics
      2. Home Screen Metrics
      3. Tabs Tray Metrics

      A description for the changes made in each of these areas can be found in the [MR2 product overview](https://docs.google.com/document/d/1-km2FKtDqzazGe_Go84gcHDQ2scacHUKpJ7k-qS-w_o/edit#).
    row: 0
    col: 0
    width: 13
    height: 5
  - name: Notes about dashboard data
    type: text
    title_text: Notes about dashboard data
    subtitle_text: ''
    body_text: |-
      The data is aggregated per day as opposed to per session. For example if we are considering actions taken from the home screen (measured as a percentage), and a user visited the home screen many times in a day but only took the action of interest once (say clicked on a tab from the "Jump back in" section), then the home screen visits and click are both counted as occurring once that day.

      If you click on an item in the legend below the graph, it will remove it from the graph (or add if you re-click it). This is useful when there are lines that morph the scale, or if you are interested in viewing just one line or trend at a time.
    row: 0
    col: 13
    width: 11
    height: 5
  - title: Home Screen to Recent Tab Opened (Jump back in)
    name: Home Screen to Recent Tab Opened (Jump back in)
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"start_on_home"'
      step_1.event: '"enter_home_screen"'
      step_2.category: '"recent_tabs"'
      step_2.event: '"recent_tab_opened"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Recent Tab Opened from Home", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of users that opened a recent tab from the home screen Jump
      Back In section.
    listen: {}
    row: 60
    col: 0
    width: 12
    height: 7
  - title: Home Screen to Recent Tabs "Show all" Click (Jump back in)
    name: Home Screen to Recent Tabs "Show all" Click (Jump back in)
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"start_on_home"'
      step_1.event: '"enter_home_screen"'
      step_2.category: '"recent_tabs"'
      step_2.event: '"show_all_clicked"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Show All Clicks from Home", orientation: left, series: [{
            axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of users that opted to show all tabs from the recent tabs
      section on the home screen.
    listen: {}
    row: 60
    col: 12
    width: 12
    height: 7
  - title: Count of Users Clicking Recent Bookmarks from Home
    name: Count of Users Clicking Recent Bookmarks from Home
    model: fenix
    explore: metrics
    type: looker_line
    fields: [metrics.submission_date, metrics.recent_bookmarks_bookmark_clicked_client_count,
      metrics.recent_bookmarks_bookmark_clicked]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.fenix.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
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
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.metrics_tabs_open_count,
            id: metrics.metrics_tabs_open_count, name: Metrics Tabs Open Count}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: How often was a recently bookmarked item opened from the home screen?
    listen: {}
    row: 67
    col: 0
    width: 24
    height: 7
  - title: Daily Count of App Opens
    name: Daily Count of App Opens
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.event_count, events.client_count]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: events
      events.event_name: '"app_opened"'
      events.normalized_channel: release
    sorts: [events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: events.event_count, name: Event Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    hidden_series: [events.client_count]
    note_state: collapsed
    note_display: above
    note_text: The number of times (and clients) that open the browser from cold start.
    listen: {}
    row: 12
    col: 12
    width: 12
    height: 7
  - title: Start on Home to Open Tabs Tray
    name: Start on Home to Open Tabs Tray
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"start_on_home"'
      step_1.event: '"enter_home_screen"'
      step_2.category: '"start_on_home"'
      step_2.event: '"open_tabs_tray"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Opened Tabs Tray from Home Screen", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of users that opened the tabs tray after landing on the
      home page upon opening Firefox.
    listen: {}
    row: 37
    col: 12
    width: 12
    height: 8
  - title: Tabs Tray to New Tab Tapped
    name: Tabs Tray to New Tab Tapped
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"tabs_tray"'
      step_1.event: opened
      step_2.category: '"tabs_tray"'
      step_2.event: '"new_tab_tapped"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% New Tab Clicked from Tabs Tray", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of users visiting tabs tray that also open a new tab.
    listen: {}
    row: 82
    col: 0
    width: 12
    height: 7
  - title: Fenix New Profiles
    name: Fenix New Profiles
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.country: ''
    sorts: [mobile_usage_2021.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.new_profiles_7day_ma,
            id: mobile_usage_2021.new_profiles_7day_ma, name: New Profiles 7day Ma}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_labels:
      mobile_usage_2021.new_profiles_7day_ma: 2021 New Profiles (7 Day MA)
      mobile_usage_2021.year_over_year_new_profiles_7day_ma: 2020 New Profiles (7
        Day MA)
    defaults_version: 1
    listen: {}
    row: 5
    col: 8
    width: 8
    height: 7
  - title: Fenix CDoU Forecast Difference
    name: Fenix CDoU Forecast Difference
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_target_count, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"fennec_fenix"'
      mobile_usage_2021.date: after 2021/01/01
      mobile_usage_2021.country: ''
    sorts: [mobile_usage_2021.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_target_count,
            id: mobile_usage_2021.delta_from_target_count, name: Difference From Target},
          {axisId: mobile_usage_2021.delta_from_forecast_count, id: mobile_usage_2021.delta_from_forecast_count,
            name: Difference From Forecast}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      mobile_usage_2021.delta_from_target_count: "#3FE1B0"
      mobile_usage_2021.delta_from_forecast_count: "#0060E0"
    series_labels:
      mobile_usage_2021.delta_from_target_count: Cumulative Difference vs Stretch
        Goal
      mobile_usage_2021.delta_from_forecast_count: Cumulative Difference vs Forecast
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '0', label: At Forecast/Stretch Goal}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: This graph addresses how we are doing relative to our forecasted CDoU.
      If we are above 0 that means we are trending above forecasted values (realized
      values are higher than what was forecasted).
    listen: {}
    row: 5
    col: 16
    width: 8
    height: 7
  - title: Tabs Tray to Expand Inactive Tabs
    name: Tabs Tray to Expand Inactive Tabs
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"tabs_tray"'
      step_1.event: opened
      step_2.category: '"tabs_tray"'
      step_2.event: '"inactive_tabs_expanded"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Expand Inactive Tabs from Tabs Tray", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of tabs tray visits that also expand inactive tabs.
    listen: {}
    row: 89
    col: 0
    width: 12
    height: 7
  - title: Customize Home - Preference Toggled
    name: Customize Home - Preference Toggled
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: events
      step_1.event: '"app_opened"'
      step_2.category: '"customize_home"'
      step_2.event: '"preference_toggled"'
      funnel_analysis.app_channel: release
      funnel_analysis.sample_id: '1'
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Toggled Customize Home Preference", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of sampled daily users that toggled a preference regarding customizing
      the home page (jump back in, most visited sites, recently saved, recently visited,
      pocket).
    listen: {}
    row: 37
    col: 0
    width: 12
    height: 8
  - title: Inactive Tabs Enabled
    name: Inactive Tabs Enabled
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: events
      step_1.event: '"app_opened"'
      step_2.category: preferences
      step_2.event: '"inactive_tabs_enabled"'
      funnel_analysis.app_channel: release
      funnel_analysis.sample_id: '1'
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Toggled Customize Home Preference", orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Current there is no data for this preference - investigating why but
      leaving the graph available for now.
    listen: {}
    row: 103
    col: 0
    width: 12
    height: 8
  - title: Tabs Tray to Collapse Inactive Tabs
    name: Tabs Tray to Collapse Inactive Tabs
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.submission_date, funnel_analysis.fraction_completed_step_2]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 28 days
      step_1.category: '"tabs_tray"'
      step_1.event: opened
      step_2.category: '"tabs_tray"'
      step_2.event: '"inactive_tabs_collapsed"'
      funnel_analysis.app_channel: release
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: "% Collapse Inactive Tabs from Tabs Tray", orientation: left,
        series: [{axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Percentage of tabs tray visits that also expand inactive tabs.
    listen: {}
    row: 89
    col: 12
    width: 12
    height: 7
  - title: 'Count of New Tabs Opened and Clients Opening New Tabs '
    name: 'Count of New Tabs Opened and Clients Opening New Tabs '
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.client_count, events.event_count]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: '"tabs_tray"'
      events.event_name: '"new_tab_tapped"'
    sorts: [events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.client_count,
            id: events.client_count, name: Client Count}, {axisId: events.event_count,
            id: events.event_count, name: Event Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    row: 76
    col: 0
    width: 24
    height: 6
  - title: Pocket Recommendations - Category Clicked
    name: Pocket Recommendations - Category Clicked
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.submission_date, events.event_count]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: pocket
      events.event_name: '"home_recs_category_clicked"'
      events.client_info__app_channel: release
    sorts: [events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: events.event_count, name: Event Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: The count of times a Pocket stories category is clicked.
    row: 114
    col: 12
    width: 12
    height: 7
  - title: Pocket Recommendations - Story Clicked
    name: Pocket Recommendations - Story Clicked
    model: fenix
    explore: event_counts
    type: looker_line
    fields: [events.event_count, events.client_count, events.submission_date]
    fill_fields: [events.submission_date]
    filters:
      events.submission_date: 28 days
      events.event_category: pocket
      events.event_name: '"home_recs_story_clicked"'
    sorts: [events.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: events.event_count,
            id: events.event_count, name: Event Count}, {axisId: events.client_count,
            id: events.client_count, name: Client Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    row: 114
    col: 0
    width: 12
    height: 7
  - title: "% of App Opens to Pocket Category Clicks"
    name: "% of App Opens to Pocket Category Clicks"
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.fraction_completed_step_2, funnel_analysis.submission_date]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 14 days
      step_1.category: events
      step_1.event: '"app_opened"'
      step_2.category: pocket
      step_2.event: '"home_recs_category_clicked"'
      funnel_analysis.app_channel: release
      funnel_analysis.sample_id: "<=10"
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: Daily % App Opened to Category Click, orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [funnel_analysis.count_completed_step_1, funnel_analysis.count_completed_step_2]
    defaults_version: 1
    listen: {}
    row: 121
    col: 0
    width: 12
    height: 7
  - name: Pocket
    type: text
    title_text: Pocket
    subtitle_text: ''
    body_text: ''
    row: 111
    col: 0
    width: 24
    height: 3
  - title: Count of Inactive Tabs Opened
    name: Count of Inactive Tabs Opened
    model: fenix
    explore: metrics
    type: looker_line
    fields: [metrics.tabs_tray_open_inactive_tab, metrics.submission_date]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.fenix.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.tabs_tray_open_inactive_tab,
            id: metrics.tabs_tray_open_inactive_tab, name: Tabs Tray Open Inactive
              Tab}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    row: 103
    col: 12
    width: 12
    height: 8
  - title: "% of App Opens to Pocket Story Clicks"
    name: "% of App Opens to Pocket Story Clicks"
    model: fenix
    explore: funnel_analysis
    type: looker_line
    fields: [funnel_analysis.fraction_completed_step_2, funnel_analysis.submission_date]
    fill_fields: [funnel_analysis.submission_date]
    filters:
      funnel_analysis.submission_date: 14 days
      step_1.category: events
      step_1.event: '"app_opened"'
      step_2.category: pocket
      step_2.event: '"home_recs_story_clicked"'
      funnel_analysis.app_channel: release
      funnel_analysis.sample_id: '10'
    sorts: [funnel_analysis.submission_date desc]
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
    y_axes: [{label: Daily % App Opened to Category Click, orientation: left, series: [
          {axisId: funnel_analysis.fraction_completed_step_2, id: funnel_analysis.fraction_completed_step_2,
            name: Fraction Completed Step 2}], showLabels: true, showValues: true,
        valueFormat: 0.00%, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [funnel_analysis.count_completed_step_1, funnel_analysis.count_completed_step_2]
    defaults_version: 1
    row: 121
    col: 12
    width: 12
    height: 7
