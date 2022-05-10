- dashboard: mobile_mr2_ios_product_dashboard_
  title: 'Mobile MR2 iOS Product Dashboard '
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Home Button Counts
    name: Home Button Counts
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.firefox_home_page_open_from_menu_home_button, metrics.submission_date,
      metrics.app_menu_home, metrics.firefox_home_page_open_from_awesomebar]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.firefox_home_page_open_from_menu_home_button,
            id: metrics.firefox_home_page_open_from_menu_home_button, name: Firefox
              Home Page Open From Menu Home Button}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    row: 12
    col: 0
    width: 13
    height: 7
  - title: Jump Back in Section Interactions
    name: Jump Back in Section Interactions
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.firefox_home_page_jump_back_in_show_all, metrics.firefox_home_page_jump_back_in_tab_opened,
      metrics.submission_date, metrics.firefox_home_page_jump_back_in_group_opened]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Measurement of interactions with 3 primary areas of the Jump back in
      section - opening a tab, opening a group, and clicking the "show all" button
      of this section.
    listen: {}
    row: 26
    col: 13
    width: 11
    height: 8
  - title: Jump Back In Section Views
    name: Jump Back In Section Views
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.firefox_home_page_jump_back_in_section_view, metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: iPhone/iPad/iPod,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: iphoneipadipod, args: [metrics.client_info__device_model, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: iPhone, filter: "%iPhone%"}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: iPad, filter: "%iPad%"}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: iPod, filter: "%iPod%"}], Other], _kind_hint: dimension, _type_hint: string}]
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
    note_display: above
    note_text: Measurement of how often the Jump back in section is viewed on the
      various platforms.
    listen: {}
    row: 26
    col: 0
    width: 13
    height: 8
  - title: Home Page Setting
    name: Home Page Setting
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.metrics__string__preferences_home_page_setting, metrics.submission_date,
      metrics.clients]
    pivots: [metrics.metrics__string__preferences_home_page_setting]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc, metrics.metrics__string__preferences_home_page_setting]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: Home - metrics.clients,
            id: Home - metrics.clients, name: Home}, {axisId: other - metrics.clients,
            id: other - metrics.clients, name: other}, {axisId: metrics.metrics__string__preferences_home_page_setting___null
              - metrics.clients, id: metrics.metrics__string__preferences_home_page_setting___null
              - metrics.clients, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: The metric a user chooses as their home page setting
    row: 19
    col: 0
    width: 24
    height: 7
  - title: Firefox for iOS New Profiles
    name: Firefox for iOS New Profiles
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.new_profiles_7day_ma, mobile_usage_2021.year_over_year_new_profiles_7day_ma]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.app_name: '"firefox_ios"'
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
    row: 4
    col: 16
    width: 8
    height: 8
  - title: Pocket Section Impressions
    name: Pocket Section Impressions
    model: firefox_ios
    explore: counters
    type: looker_line
    fields: [counters.total_count, counters.submission_date]
    fill_fields: [counters.submission_date]
    filters:
      counters.submission_date: 14 days ago for 14 days
      counters.metric: '"counter.pocket_section_impressions"'
    sorts: [counters.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: counters.total_count,
            id: counters.total_count, name: Total Count}, {axisId: counters.user_count,
            id: counters.user_count, name: User Count}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Counts for when a user sees the Pocket section of Firefox Home.
    listen: {}
    row: 34
    col: 0
    width: 13
    height: 8
  - title: Firefox Opened as Default Browser
    name: Firefox Opened as Default Browser
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.app_opened_as_default_browser, metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: Client Info Device
          Model Groups, value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: client_info_device_model_groups, args: [metrics.client_info__device_model,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPhone, filter: "%iPhone%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPad, filter: "%iPad%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPod, filter: ''}],
          Other], _kind_hint: dimension, _type_hint: string}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.app_opened_as_default_browser,
            id: metrics.app_opened_as_default_browser, name: App Opened As Default
              Browser}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: The count of times an external link was opened by Firefox as the default
      browser. Split by device type.
    listen: {}
    row: 4
    col: 8
    width: 8
    height: 8
  - title: iOS DAU by Version (30s)
    name: iOS DAU by Version (30s)
    model: firefox_ios
    explore: baseline
    type: looker_line
    fields: [baseline.submission_date, baseline.clients, baseline.client_info__app_display_version]
    pivots: [baseline.client_info__app_display_version]
    fill_fields: [baseline.submission_date]
    filters:
      baseline.channel: mozdata.firefox^_ios.baseline
      baseline.submission_date: 28 days
      baseline.client_info__app_display_version: 3%
    sorts: [baseline.submission_date desc, baseline.client_info__app_display_version]
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
    listen: {}
    row: 4
    col: 0
    width: 8
    height: 8
  - name: iOS MR2 Product Dashboard
    type: text
    title_text: iOS MR2 Product Dashboard
    subtitle_text: For questions, contact @kimmy on slack.
    body_text: There were differences in what was changed from iOS to Android, so
      the dashboards will not look the same (also due to telemetry differences in
      what is available between the two).
    row: 0
    col: 1
    width: 23
    height: 4
  - title: Pocket Story Opens by Tile Position
    name: Pocket Story Opens by Tile Position
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.submission_date, metrics__metrics__labeled_counter__pocket_open_story_position.label,
      metrics__metrics__labeled_counter__pocket_open_story_position.count]
    pivots: [metrics__metrics__labeled_counter__pocket_open_story_position.label]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc, metrics__metrics__labeled_counter__pocket_open_story_position.label]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: __other__ - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: __other__}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-0 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-0}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-1 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-1}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-2 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-2}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-3 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-3}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-4 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-4}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-5 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-5}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-6 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-6}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-7 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-7}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-8 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-8}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: position-9 - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: position-9}, {axisId: metrics__metrics__labeled_counter__pocket_open_story_position.count,
            id: metrics__metrics__labeled_counter__pocket_open_story_position.label___null
              - metrics__metrics__labeled_counter__pocket_open_story_position.count,
            name: "∅"}], showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Counts for when a user opens Pocket article from Firefox Home Pocket
      feed. The label is position of tile (i.e. 0, 1, 2).
    row: 42
    col: 0
    width: 24
    height: 8
  - title: Home Button Counts BY DEVICE
    name: Home Button Counts BY DEVICE
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.firefox_home_page_open_from_menu_home_button, metrics.submission_date,
      metrics.app_menu_home, metrics.firefox_home_page_open_from_awesomebar]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: Client Info Device
          Model Groups, value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: client_info_device_model_groups, args: [metrics.client_info__device_model,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPhone, filter: "%iPhone%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPad, filter: "%iPad%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPod, filter: "%iPod%"}],
          Other], _kind_hint: dimension, _type_hint: string}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.firefox_home_page_open_from_menu_home_button,
            id: metrics.firefox_home_page_open_from_menu_home_button, name: Firefox
              Home Page Open From Menu Home Button}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: A slightly cluttered graph, but you can select/deselect lines from
      the legend to examine certain ones closer. This is the same graph as Home Button
      Counts but with the counts split out by either iPad/iPhone/iPod/Other.
    listen: {}
    row: 12
    col: 13
    width: 11
    height: 7
  - title: Pocket Section Impressions BY DEVICE
    name: Pocket Section Impressions BY DEVICE
    model: firefox_ios
    explore: metrics
    type: looker_line
    fields: [metrics.pocket_section_impressions, metrics.submission_date]
    fill_fields: [metrics.submission_date]
    filters:
      metrics.channel: mozdata.firefox^_ios.metrics
      metrics.submission_date: 28 days
    sorts: [metrics.submission_date desc]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: Client Info Device
          Model Groups, value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: client_info_device_model_groups, args: [metrics.client_info__device_model,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPhone, filter: "%iPhone%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPad, filter: "%iPad%"},
            !ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: iPod, filter: "%iPod%"}],
          Other], _kind_hint: dimension, _type_hint: string}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: metrics.pocket_section_impressions,
            id: metrics.pocket_section_impressions, name: Pocket Section Impressions}],
        showLabels: true, showValues: true, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Eventually this graph will be split by device (debugging some issues
      with groups currently)
    listen: {}
    row: 34
    col: 13
    width: 11
    height: 8
