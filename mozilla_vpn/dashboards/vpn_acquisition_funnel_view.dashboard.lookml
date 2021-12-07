# - dashboard: vpn_acquisition_funnel_view
#   title: VPN Acquisition Funnel View
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   elements:
#   - name: Old Conversion Funnel
#     type: text
#     title_text: Old Conversion Funnel
#     subtitle_text: Before 8/25/2021
#     body_text: ''
#     row: 0
#     col: 0
#     width: 24
#     height: 2
#   - title: 'Exisiting users '
#     name: 'Exisiting users '
#     model: mozilla_vpn
#     explore: newfunnel_from08252021
#     type: looker_line
#     fields: [newfunnel_from08252021.start_date, newfunnel_from08252021.Existing_FxA_pay_setup_complete,
#       newfunnel_from08252021.Existing_FxA_payment_setup_engage, newfunnel_from08252021.Existing_FxA_payment_setup_view]
#     fill_fields: [newfunnel_from08252021.start_date]
#     sorts: [newfunnel_from08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     defaults_version: 1
#     series_types: {}
#     listen:
#       Plan Name: newfunnel_from08252021.plan_name
#     row: 10
#     col: 16
#     width: 8
#     height: 6
#   - title: 'New FxA users '
#     name: 'New FxA users '
#     model: mozilla_vpn
#     explore: newfunnel_from08252021
#     type: looker_line
#     fields: [newfunnel_from08252021.start_date, newfunnel_from08252021.Existing_FxA_pay_setup_complete,
#       newfunnel_from08252021.Existing_FxA_payment_setup_engage, newfunnel_from08252021.Existing_FxA_payment_setup_view]
#     fill_fields: [newfunnel_from08252021.start_date]
#     sorts: [newfunnel_from08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     listen:
#       Plan Name: newfunnel_from08252021.plan_name
#     row: 10
#     col: 8
#     width: 8
#     height: 6
#   - title: New FxA users
#     name: New FxA users
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     type: looker_line
#     fields: [oldfunnel_before08252021.start_date, oldfunnel_before08252021.Existing_FxA_login_complete,
#       oldfunnel_before08252021.Existing_FxA_login_view, oldfunnel_before08252021.Existing_FxA_payment_complete,
#       oldfunnel_before08252021.Existing_FxA_paymet_setup_start]
#     fill_fields: [oldfunnel_before08252021.start_date]
#     sorts: [oldfunnel_before08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     listen:
#       UTM Medium: oldfunnel_before08252021.UTM_medium
#       UTM Source: oldfunnel_before08252021.UTM_source
#       UTM Campaign: oldfunnel_before08252021.UTM_campaign
#       UTM Content: oldfunnel_before08252021.UTM_content
#       Entrypoint Experiment: oldfunnel_before08252021.entrypoint_experiment
#       Entrypoint Variation: oldfunnel_before08252021.entrypoint_variation
#       Pricing Plan: oldfunnel_before08252021.pricing_plan
#     row: 2
#     col: 8
#     width: 8
#     height: 6
#   - title: 'Total conversion '
#     name: 'Total conversion '
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     type: looker_line
#     fields: [oldfunnel_before08252021.VPN_site_hits, oldfunnel_before08252021.total_payment_setup_start,
#       oldfunnel_before08252021.total_payment_complete, oldfunnel_before08252021.start_date,
#       oldfunnel_before08252021.total_login_complete]
#     fill_fields: [oldfunnel_before08252021.start_date]
#     sorts: [oldfunnel_before08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     listen:
#       UTM Medium: oldfunnel_before08252021.UTM_medium
#       UTM Source: oldfunnel_before08252021.UTM_source
#       UTM Campaign: oldfunnel_before08252021.UTM_campaign
#       UTM Content: oldfunnel_before08252021.UTM_content
#       Entrypoint Experiment: oldfunnel_before08252021.entrypoint_experiment
#       Entrypoint Variation: oldfunnel_before08252021.entrypoint_variation
#       Pricing Plan: oldfunnel_before08252021.pricing_plan
#     row: 2
#     col: 0
#     width: 8
#     height: 6
#   - title: 'Total conversion '
#     name: Total conversion  (2)
#     model: mozilla_vpn
#     explore: newfunnel_from08252021
#     type: looker_line
#     fields: [newfunnel_from08252021.start_date, newfunnel_from08252021.total_payment_setup_complete,
#       newfunnel_from08252021.total_payment_setup_engage, newfunnel_from08252021.VPN_site_hits]
#     fill_fields: [newfunnel_from08252021.start_date]
#     sorts: [newfunnel_from08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: editable
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     defaults_version: 1
#     series_types: {}
#     listen:
#       Plan Name: newfunnel_from08252021.plan_name
#     row: 10
#     col: 0
#     width: 8
#     height: 6
#   - name: New Conversion Funnel
#     type: text
#     title_text: New Conversion Funnel
#     subtitle_text: From 08/25/2021
#     body_text: ''
#     row: 8
#     col: 0
#     width: 24
#     height: 2
#   - title: Existing FxA users
#     name: Existing FxA users
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     type: looker_line
#     fields: [oldfunnel_before08252021.Existing_FxA_login_complete, oldfunnel_before08252021.Existing_FxA_login_view,
#       oldfunnel_before08252021.Existing_FxA_payment_complete, oldfunnel_before08252021.Existing_FxA_paymet_setup_start,
#       oldfunnel_before08252021.start_date]
#     fill_fields: [oldfunnel_before08252021.start_date]
#     sorts: [oldfunnel_before08252021.start_date desc]
#     limit: 500
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     show_null_points: true
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     defaults_version: 1
#     series_types: {}
#     listen:
#       UTM Medium: oldfunnel_before08252021.UTM_medium
#       UTM Source: oldfunnel_before08252021.UTM_source
#       UTM Campaign: oldfunnel_before08252021.UTM_campaign
#       UTM Content: oldfunnel_before08252021.UTM_content
#       Entrypoint Experiment: oldfunnel_before08252021.entrypoint_experiment
#       Entrypoint Variation: oldfunnel_before08252021.entrypoint_variation
#       Pricing Plan: oldfunnel_before08252021.pricing_plan
#     row: 2
#     col: 16
#     width: 8
#     height: 6
#   filters:
#   - name: Start Date
#     title: Start Date
#     type: field_filter
#     default_value: 2021/08/01 to 2021/08/26
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: day_range_picker
#       display: inline
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: []
#     field: oldfunnel_before08252021.start_date
#   - name: Country
#     title: Country
#     type: field_filter
#     default_value: United States
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, UTM Medium, UTM Source, UTM Campaign, UTM Content,
#       Entrypoint Experiment, Entrypoint Variation, Plan Name, Pricing Plan]
#     field: oldfunnel_before08252021.country
#   - name: UTM Medium
#     title: UTM Medium
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Source, UTM Campaign, UTM Content,
#       Entrypoint Experiment, Entrypoint Variation]
#     field: oldfunnel_before08252021.UTM_medium
#   - name: UTM Source
#     title: UTM Source
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Campaign, UTM Content,
#       Entrypoint Experiment, Entrypoint Variation]
#     field: oldfunnel_before08252021.UTM_source
#   - name: UTM Campaign
#     title: UTM Campaign
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Content,
#       Entrypoint Experiment, Entrypoint Variation]
#     field: oldfunnel_before08252021.UTM_campaign
#   - name: UTM Content
#     title: UTM Content
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Campaign,
#       Entrypoint Experiment, Entrypoint Variation]
#     field: oldfunnel_before08252021.UTM_content
#   - name: Entrypoint Experiment
#     title: Entrypoint Experiment
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Campaign,
#       UTM Content, Entrypoint Variation]
#     field: oldfunnel_before08252021.entrypoint_experiment
#   - name: Entrypoint Variation
#     title: Entrypoint Variation
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Campaign,
#       UTM Content, Entrypoint Experiment]
#     field: oldfunnel_before08252021.entrypoint_variation
#   - name: Pricing Plan
#     title: Pricing Plan
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: oldfunnel_before08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Campaign,
#       UTM Content, Entrypoint Experiment, Entrypoint Variation, Plan Name]
#     field: oldfunnel_before08252021.pricing_plan
#   - name: Plan Name
#     title: Plan Name
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: newfunnel_from08252021
#     listens_to_filters: [Start Date, Country, UTM Medium, UTM Source, UTM Campaign,
#       UTM Content, Entrypoint Experiment, Entrypoint Variation, Pricing Plan]
#     field: newfunnel_from08252021.plan_name
