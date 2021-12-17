# - dashboard: vpn_acquisition_funnel_view_old_funnel
#   title: VPN Acquisition Funnel View- Old Funnel
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   description: ''
#   elements:
#   - name: Old Funnel Conversion Funnel Analysis
#     type: text
#     title_text: Old Funnel Conversion Funnel Analysis
#     subtitle_text: before 08/25/2021
#     body_text: ''
#     row: 0
#     col: 0
#     width: 24
#     height: 2
#   - title: Existing FxA users
#     name: Existing FxA users
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     type: looker_column
#     fields: [old_funnel_before_08252021.start_date, old_funnel_before_08252021.Existing_FxA_login_view,
#       old_funnel_before_08252021.Existing_FxA_login_complete, old_funnel_before_08252021.Existing_FxA_paymet_setup_start,
#       old_funnel_before_08252021.Existing_FxA_paymet_setup_engage, old_funnel_before_08252021.Existing_FxA_payment_complete]
#     fill_fields: [old_funnel_before_08252021.start_date]
#     sorts: [old_funnel_before_08252021.start_date desc]
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
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     series_types: {}
#     listen:
#       Ua Browser: old_funnel_before_08252021.ua_browser
#       Ua Version: old_funnel_before_08252021.ua_version
#     row: 8
#     col: 0
#     width: 8
#     height: 6
#   - title: New FxA users
#     name: New FxA users
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     type: looker_column
#     fields: [old_funnel_before_08252021.New_FxA_reg_start, old_funnel_before_08252021.New_FxA_account_create,
#       old_funnel_before_08252021.New_FxA_reg_complete, old_funnel_before_08252021.New_FxA_login_complete,
#       old_funnel_before_08252021.New_FxA_payment_setup_start, old_funnel_before_08252021.New_FxA_payment_setup_engage,
#       old_funnel_before_08252021.New_FxA_payment_complete, old_funnel_before_08252021.start_date]
#     fill_fields: [old_funnel_before_08252021.start_date]
#     sorts: [old_funnel_before_08252021.start_date desc]
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
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     series_types: {}
#     listen:
#       Ua Browser: old_funnel_before_08252021.ua_browser
#       Ua Version: old_funnel_before_08252021.ua_version
#     row: 14
#     col: 0
#     width: 8
#     height: 6
#   - title: Total Conversion
#     name: Total Conversion
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     type: looker_column
#     fields: [old_funnel_before_08252021.start_date, old_funnel_before_08252021.total_login_complete,
#       old_funnel_before_08252021.total_payment_setup_start, old_funnel_before_08252021.total_payment_complete]
#     fill_fields: [old_funnel_before_08252021.start_date]
#     sorts: [old_funnel_before_08252021.start_date desc]
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
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_null_points: true
#     interpolation: linear
#     defaults_version: 1
#     series_types: {}
#     listen:
#       Ua Browser: old_funnel_before_08252021.ua_browser
#       Ua Version: old_funnel_before_08252021.ua_version
#     row: 2
#     col: 0
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
#       type: relative_timeframes
#       display: inline
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.start_date
#   - name: Country
#     title: Country
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.country
#   - name: UTM Medium
#     title: UTM Medium
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.UTM_medium
#   - name: UTM Source
#     title: UTM Source
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.UTM_source
#   - name: UTM Campaign
#     title: UTM Campaign
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.UTM_campaign
#   - name: UTM Content
#     title: UTM Content
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.UTM_content
#   - name: UTM Term
#     title: UTM Term
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.UTM_term
#   - name: Entrypoint Experiment
#     title: Entrypoint Experiment
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: checkboxes
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.entrypoint_experiment
#   - name: Entrypoint Variation
#     title: Entrypoint Variation
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: checkboxes
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.entrypoint_variation
#   - name: Pricing Plan
#     title: Pricing Plan
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: checkboxes
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: [Plan Name]
#     field: old_funnel_before_08252021.pricing_plan
#   - name: Plan Name
#     title: Plan Name
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.plan_name
#   - name: Ua Browser
#     title: Ua Browser
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: [Ua Version]
#     field: old_funnel_before_08252021.ua_browser
#   - name: Ua Version
#     title: Ua Version
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: mozilla_vpn
#     explore: old_funnel_before_08252021
#     listens_to_filters: []
#     field: old_funnel_before_08252021.ua_version
