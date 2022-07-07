- dashboard: tcp_rollout_phase_2_2
  title: Tcp Rollout - Phase 2
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: CjK6WdLAmmfbQG8gPJvI9Q
  elements:
  - title: Tagged Searches by Day
    name: Tagged Searches by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: tagged_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: tcp_rollout_phase_2.Total,
            id: opt-in - tcp_rollout_phase_2.Total, name: opt-in}, {axisId: tcp_rollout_phase_2.Total,
            id: opt-out - tcp_rollout_phase_2.Total, name: opt-out}, {axisId: tcp_rollout_phase_2.Total,
            id: pref-does-not-exist - tcp_rollout_phase_2.Total, name: pref-does-not-exist}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 29
    col: 0
    width: 12
    height: 6
  - title: Tagged Follow on Searches by Day
    name: Tagged Follow on Searches by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: tagged_follow_on_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 29
    col: 12
    width: 12
    height: 6
  - title: Searches with Ads by Day
    name: Searches with Ads by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: search_with_ads
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 35
    col: 12
    width: 12
    height: 6
  - title: Ad Clicks by Day
    name: Ad Clicks by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: ad_click
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 35
    col: 0
    width: 12
    height: 6
  - title: Organic Search Count by Day
    name: Organic Search Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: organic_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 41
    col: 0
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |+
      This dashboard is for monitoring search metrics related to [phase 2 of the TCP rollout](https://docs.google.com/document/d/1Bs8Hh2YsEsDMfR2D9IePMV_RgrIjgo0etvfYwYtUhQQ/edit#heading=h.sx0uqyvuopfw)

      * **enabled**: Clients with TCP flipped to ON state in Standard Browsing
      * **disabledt**: Clients with TCP staying in OFF state in Standard Browsing

    row: 0
    col: 0
    width: 24
    height: 2
  - title: SAP Search Count by Day
    name: SAP Search Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: sap
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 41
    col: 12
    width: 12
    height: 6
  - title: Organic Ad Click Count by Day
    name: Organic Ad Click Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: ad_click_organic
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 47
    col: 0
    width: 12
    height: 6
  - title: Organic Searches with Ads by Day
    name: Organic Searches with Ads by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Total]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: search_with_ads_organic
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 47
    col: 12
    width: 12
    height: 6
  - name: Search Metrics Daily Averages
    type: text
    title_text: Search Metrics Daily Averages
    subtitle_text: ''
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 1
  - name: Search Metrics Day by Day
    type: text
    title_text: Search Metrics Day by Day
    subtitle_text: Daily search metrics for each branch. ⚠️ The group sizes might
      be different for each branch
    body_text: ''
    row: 27
    col: 0
    width: 24
    height: 2
  - title: Average Tagged Searches by Day
    name: Average Tagged Searches by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: tagged_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: tcp_rollout_phase_2.Total,
            id: opt-in - tcp_rollout_phase_2.Total, name: opt-in}, {axisId: tcp_rollout_phase_2.Total,
            id: opt-out - tcp_rollout_phase_2.Total, name: opt-out}, {axisId: tcp_rollout_phase_2.Total,
            id: pref-does-not-exist - tcp_rollout_phase_2.Total, name: pref-does-not-exist}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 3
    col: 0
    width: 12
    height: 6
  - title: Average Tagged Follow on Searches by Day
    name: Average Tagged Follow on Searches by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: tagged_follow_on_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 3
    col: 12
    width: 12
    height: 6
  - title: Average Searches with Ads by Day
    name: Average Searches with Ads by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: search_with_ads
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 9
    col: 12
    width: 12
    height: 6
  - title: Average Organic Ad Click Count by Day
    name: Average Organic Ad Click Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: ad_click_organic
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 21
    col: 0
    width: 12
    height: 6
  - title: Average Organic Search Count by Day
    name: Average Organic Search Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: organic_search_count
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 15
    col: 0
    width: 12
    height: 6
  - title: Average SAP Search Count by Day
    name: Average SAP Search Count by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: sap
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 15
    col: 12
    width: 12
    height: 6
  - title: Average Ad Clicks by Day
    name: Average Ad Clicks by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: ad_click
      tcp_rollout_phase_2.percentile_conf: '95'
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 9
    col: 0
    width: 12
    height: 6
  - title: Average Organic Searches with Ads by Day
    name: Average Organic Searches with Ads by Day
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    type: looker_line
    fields: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch, tcp_rollout_phase_2.Average]
    pivots: [tcp_rollout_phase_2.branch]
    filters:
      tcp_rollout_phase_2.probe: search_with_ads_organic
      tcp_rollout_phase_2.branch: disabled,enabled
    sorts: [tcp_rollout_phase_2.submission_date, tcp_rollout_phase_2.branch]
    dynamic_fields: [{args: [tcp_rollout_phase_2.Total], calculation_type: running_row_total,
        category: table_calculation, based_on: tcp_rollout_phase_2.Total, label: Running
          row total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_row_total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {args: [tcp_rollout_phase_2.Total],
        calculation_type: running_total, category: table_calculation, based_on: tcp_rollout_phase_2.Total,
        label: Running total of Tcp Rollout Scalar Total, source_field: tcp_rollout_phase_2.Total,
        table_calculation: running_total_of_tcp_rollout_phase_2_total, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [tcp_rollout_phase_2.Total], calculation_type: running_total, category: table_calculation,
        based_on: tcp_rollout_phase_2.Total, label: Running total of Tcp Rollout Scalar
          Total, source_field: tcp_rollout_phase_2.Total, table_calculation: running_total_of_tcp_rollout_phase_2_total_2,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: opt-in - running_total_of_tcp_rollout_phase_2_total_2, name: opt-in},
          {axisId: running_total_of_tcp_rollout_phase_2_total_2, id: opt-out - running_total_of_tcp_rollout_phase_2_total_2,
            name: opt-out}, {axisId: running_total_of_tcp_rollout_phase_2_total_2,
            id: pref-does-not-exist - running_total_of_tcp_rollout_phase_2_total_2,
            name: pref-does-not-exist}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    hidden_fields: [running_total_of_tcp_rollout_phase_2_total_2]
    hidden_points_if_no: []
    field_x: tcp_rollout_phase_2.submission_date
    field_y: tcp_rollout_phase_2.percentile
    log_scale: true
    ci_lower: tcp_rollout_phase_2.low
    ci_upper: tcp_rollout_phase_2.high
    show_grid: true
    control: "#3FE1B0"
    opt-in: "#0060E0"
    opt-out: "#9059FF"
    pref-does-not-exist: "#B933E1"
    defaults_version: 1
    listen:
      OS: tcp_rollout_phase_2.os
      Country: tcp_rollout_phase_2.country
      Submission Date: tcp_rollout_phase_2.submission_date
    row: 21
    col: 12
    width: 12
    height: 6
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    listens_to_filters: []
    field: tcp_rollout_phase_2.country
  - name: OS
    title: OS
    type: field_filter
    default_value: Linux,Mac,Windows
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    listens_to_filters: []
    field: tcp_rollout_phase_2.os
  - name: Submission Date
    title: Submission Date
    type: field_filter
    default_value: after 2022/05/11
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: operational_monitoring
    explore: tcp_rollout_phase_2
    listens_to_filters: []
    field: tcp_rollout_phase_2.submission_date
