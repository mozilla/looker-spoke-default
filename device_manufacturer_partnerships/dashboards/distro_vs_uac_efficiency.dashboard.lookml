---
- dashboard: distro_vs_uac_efficiency
  title: BD Mobile Distro vs Marketing UAC Efficiency
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Quarterly new profiles and week 4 retention for mobile distribution deals, compared with Google Ads UAC spend, new profiles and retention in the same countries. Covers 2025-01-01 through the end of the last complete quarter."
  elements:
  - title: "Mobile Distro: New Profiles"
    name: "Mobile Distro: New Profiles"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.distro_new_profiles]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 0
    width: 4
    height: 4
  - title: "Mobile Distro: New Profile Retention"
    name: "Mobile Distro: New Profile Retention"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.distro_new_profile_retention]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 4
    width: 4
    height: 4
  - title: "Mobile Distro: Retained Users"
    name: "Mobile Distro: Retained Users"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.distro_retained_users]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 8
    width: 4
    height: 4
  - title: "UAC: Total Spend"
    name: "UAC: Total Spend"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.uac_total_spend]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 12
    width: 4
    height: 4
  - title: "UAC: New Profile Retention"
    name: "UAC: New Profile Retention"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.uac_new_profile_retention]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 16
    width: 4
    height: 4
  - title: "UAC: Cost Per Retained User"
    name: "UAC: Cost Per Retained User"
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: single_value
    fields: [distro_vs_uac_efficiency.uac_cost_per_retained_user]
    limit: 500
    show_single_value_title: true
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Mobile Distro New Profiles by Quarter
    name: Mobile Distro New Profiles by Quarter
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: looker_column
    fields: [distro_vs_uac_efficiency.quarter_quarter, distro_vs_uac_efficiency.distribution_id,
      distro_vs_uac_efficiency.distro_new_profiles]
    pivots: [distro_vs_uac_efficiency.distribution_id]
    fill_fields: [distro_vs_uac_efficiency.quarter_quarter]
    sorts: [distro_vs_uac_efficiency.quarter_quarter, distro_vs_uac_efficiency.distribution_id]
    limit: 500
    stacking: normal
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_x_axis_label: false
    show_y_axis_labels: true
    legend_position: center
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 4
    col: 0
    width: 12
    height: 8
  - title: New Profile Retention by Quarter
    name: New Profile Retention by Quarter
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: looker_line
    fields: [distro_vs_uac_efficiency.quarter_quarter, distro_vs_uac_efficiency.distro_new_profile_retention,
      distro_vs_uac_efficiency.uac_new_profile_retention]
    fill_fields: [distro_vs_uac_efficiency.quarter_quarter]
    sorts: [distro_vs_uac_efficiency.quarter_quarter]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_x_axis_label: false
    show_y_axis_labels: true
    point_style: circle
    legend_position: center
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 4
    col: 12
    width: 12
    height: 8
  - title: New Profile Retention by Country (Top 20 by Mobile Distro New Profiles)
    name: New Profile Retention by Country (Top 20 by Mobile Distro New Profiles)
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: looker_bar
    fields: [distro_vs_uac_efficiency.country_code, distro_vs_uac_efficiency.distro_new_profile_retention,
      distro_vs_uac_efficiency.uac_new_profile_retention, distro_vs_uac_efficiency.distro_new_profiles]
    sorts: [distro_vs_uac_efficiency.distro_new_profiles desc]
    limit: 20
    hidden_fields: [distro_vs_uac_efficiency.distro_new_profiles]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_x_axis_label: false
    show_y_axis_labels: true
    legend_position: center
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 12
    col: 0
    width: 24
    height: 9
  - title: Detail by Quarter, Country and Distribution ID
    name: Detail by Quarter, Country and Distribution ID
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    type: looker_grid
    fields: [distro_vs_uac_efficiency.quarter_quarter, distro_vs_uac_efficiency.country_code,
      distro_vs_uac_efficiency.distribution_id, distro_vs_uac_efficiency.distro_new_profiles,
      distro_vs_uac_efficiency.distro_new_profile_retention, distro_vs_uac_efficiency.distro_retained_users,
      distro_vs_uac_efficiency.uac_total_spend, distro_vs_uac_efficiency.uac_new_profiles,
      distro_vs_uac_efficiency.uac_cost_per_new_profile, distro_vs_uac_efficiency.uac_new_profile_retention,
      distro_vs_uac_efficiency.uac_retained_users, distro_vs_uac_efficiency.uac_cost_per_retained_user,
      distro_vs_uac_efficiency.retention_difference]
    sorts: [distro_vs_uac_efficiency.quarter_quarter desc, distro_vs_uac_efficiency.distribution_id,
      distro_vs_uac_efficiency.distro_new_profiles desc]
    limit: 5000
    show_view_names: false
    show_row_numbers: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    listen:
      Quarter: distro_vs_uac_efficiency.quarter_quarter
      Country Code: distro_vs_uac_efficiency.country_code
      Distribution ID: distro_vs_uac_efficiency.distribution_id
    row: 21
    col: 0
    width: 24
    height: 12
  filters:
  - name: Quarter
    title: Quarter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    listens_to_filters: []
    field: distro_vs_uac_efficiency.quarter_quarter
  - name: Country Code
    title: Country Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    listens_to_filters: []
    field: distro_vs_uac_efficiency.country_code
  - name: Distribution ID
    title: Distribution ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: device_manufacturer_partnerships
    explore: distro_vs_uac_efficiency
    listens_to_filters: []
    field: distro_vs_uac_efficiency.distribution_id
