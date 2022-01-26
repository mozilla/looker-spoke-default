- dashboard: vpn_acquisition_funnel_view
  title: VPN Acquisition Funnel View
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  refresh: 1 day
  elements:
  - title: VPN Product Site Visit Trend
    name: VPN Product Site Visit Trend
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_line
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.VPN_site_hits]
    sorts: [new_funnel_from_08252021.start_date]
    total: true
    dynamic_fields: [{category: measure, expression: !!null '', label: VPN Site Hits,
        value_format: !!null '', value_format_name: !!null '', based_on: new_funnel_from_08252021.VPN_site_hits,
        _kind_hint: measure, measure: vpn_site_hits, type: sum, _type_hint: number},
      {category: table_calculation, description: Current row’s value divided by the
          value of the row below., label: "% Change VPN Site Hits", value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: change_vpn_site_hits, args: [vpn_site_hits], _kind_hint: dimension,
        _type_hint: number, is_disabled: true}, {category: table_calculation, description: Cumulative
          sum of this row and all previous rows in the column, label: Running Total
          VPN Site Hits, value_format: !!null '', value_format_name: Default formatting,
        calculation_type: running_total, table_calculation: running_total_vpn_site_hits,
        args: [new_funnel_from_08252021.VPN_site_hits], _kind_hint: measure, _type_hint: number,
        is_disabled: true}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: [{label: session counts, orientation: left, series: [{axisId: new_funnel_from_08252021.VPN_site_hits,
            id: new_funnel_from_08252021.VPN_site_hits, name: VPN Site Hits}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 99,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 6
    col: 11
    width: 13
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Top of the Acquisition Funnel\n"
    row: 33
    col: 0
    width: 24
    height: 2
  - name: All Users Conversion Funnel Steps
    type: text
    title_text: All Users Conversion Funnel Steps
    subtitle_text: ''
    body_text: "This plot displays the overall user journey through the acquisition\
      \ funnel. Depending on the FxA status(New FxA users, Existing FxA users signed\
      \ off, Existing FxA users signed in), there are different mid-steps to get to\
      \ each step shown in the plot. For example, existing FxA users who were signed\
      \ off before entering the funnel have sign-in steps between the acquisition\
      \ process start step and the payment setup engagement step. For more information\
      \ about the funnel steps for each user group, refer to [this board](https://miro.com/app/board/o9J_lq1HHTg=/?invite_link_id=97426737166).\n\
      \n* The **CVR From Payment Site Hits to Payment Complete** is the conversion\
      \ rate of people completed the payment over people who started the acquisition\
      \ process.\n\n* Click the three dots on the top right of the plot to compare\
      \ the CVRs for different groups on one plot.  \n\n\n"
    row: 74
    col: 0
    width: 9
    height: 7
  - title: All User Conversion Process
    name: All User Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.total_acquisition_process_start,
      new_funnel_from_08252021.total_payment_setup_engage, new_funnel_from_08252021.total_payment_setup_complete,
      new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete]
    fill_fields: [new_funnel_from_08252021.start_date]
    filters: {}
    sorts: [new_funnel_from_08252021.start_date]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: new_funnel_from_08252021.total_acquisition_process_start, name: Total
              Acquisition Process Start}, {axisId: new_funnel_from_08252021.total_payment_setup_engage,
            id: new_funnel_from_08252021.total_payment_setup_engage, name: Total Payment
              Setup Engage}, {axisId: new_funnel_from_08252021.total_payment_setup_complete,
            id: new_funnel_from_08252021.total_payment_setup_complete, name: Total
              Payment Setup Complete}], showLabels: true, showValues: true, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: custom, tickDensityCustom: 75,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete,
            id: new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete,
            name: CVR From Payment Site Hits to Payment Complete}, {axisId: new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete,
            id: new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete,
            name: Overall CVR From Payment Site Hits to Payment Complete}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 60, type: linear}]
    series_types:
      new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete: line
      new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete: line
    reference_lines: []
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 74
    col: 9
    width: 15
    height: 7
  - title: Last Updated Date
    name: Last Updated Date
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: single_value
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.VPN_site_hits]
    sorts: [new_funnel_from_08252021.start_date desc]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: [new_funnel_from_08252021.VPN_site_hits]
    refresh: 1 day
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 4
  - title: VPN Product Site Visits on the Last Updated Date
    name: VPN Product Site Visits on the Last Updated Date
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: single_value
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.VPN_site_hits,
      vpn_site_hits]
    sorts: [new_funnel_from_08252021.start_date desc]
    limit: 2
    dynamic_fields: [{category: measure, expression: !!null '', label: VPN Site Hits,
        value_format: !!null '', value_format_name: !!null '', based_on: new_funnel_from_08252021.VPN_site_hits,
        _kind_hint: measure, measure: vpn_site_hits, type: sum, _type_hint: number},
      {category: table_calculation, description: 'Difference between the current row’s
          value and value of the row below, divided by the value of the row below.',
        label: "% Change VPN Site Hits", value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_difference_from_previous, table_calculation: change_vpn_site_hits,
        args: [vpn_site_hits], _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: since the previous day
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3FE1B0",
        font_color: !!null '', color_application: {collection_id: mozilla, palette_id: mozilla-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    series_types: {}
    hidden_fields: [vpn_site_hits]
    refresh: 1 day
    listen:
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 0
    col: 7
    width: 9
    height: 4
  - title: CTR from the VPN product Site to Enter the Funnel
    name: CTR from the VPN product Site to Enter the Funnel
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel,
      new_funnel_from_08252021.VPN_site_hits, new_funnel_from_08252021.total_acquisition_process_start,
      new_funnel_from_08252021.start_date]
    sorts: [new_funnel_from_08252021.start_date]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Acquisition
          Process Start, value_format: !!null '', value_format_name: !!null '', based_on: new_funnel_from_08252021.total_acquisition_process_start,
        _kind_hint: measure, measure: total_acquisition_process_start, type: sum,
        _type_hint: number}, {category: table_calculation, label: "% Change Total\
          \ Acquisition Process Start", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_difference_from_previous, table_calculation: change_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}, {category: table_calculation, description: Cumulative
          sum of this row and all previous rows in the column, label: Running Total
          Total Acquisition Process Start, value_format: !!null '', value_format_name: Default
          formatting, calculation_type: running_total, table_calculation: running_total_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: mozilla
      palette_id: mozilla-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: new_funnel_from_08252021.total_acquisition_process_start, name: Total
              Acquisition Process Start}], showLabels: true, showValues: true, maxValue: !!null '',
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 92, type: linear},
      {label: CTR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel,
            id: new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel,
            name: CTR From VPN Site Hits to Enter the Funnel}], showLabels: true,
        showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 92, type: linear}]
    series_types:
      new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: [new_funnel_from_08252021.VPN_site_hits]
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 39
    col: 4
    width: 17
    height: 6
  - title: New FxA users Conversion Process
    name: New FxA users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.New_FxA_user_input_emails,
      new_funnel_from_08252021.New_FxA_payment_setup_engage, new_funnel_from_08252021.New_FxA_payment_setup_complete,
      new_funnel_from_08252021.New_FxA_CVR]
    sorts: [new_funnel_from_08252021.start_date]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: session counts, orientation: left, series: [{axisId: new_funnel_from_08252021.New_FxA_user_input_emails,
            id: new_funnel_from_08252021.New_FxA_user_input_emails, name: New FxA
              User Input Emails}, {axisId: new_funnel_from_08252021.New_FxA_payment_setup_engage,
            id: new_funnel_from_08252021.New_FxA_payment_setup_engage, name: New FxA
              Payment Setup Engage}, {axisId: new_funnel_from_08252021.New_FxA_payment_setup_complete,
            id: new_funnel_from_08252021.New_FxA_payment_setup_complete, name: New
              FxA Payment Setup Complete}, {axisId: new_funnel_from_08252021.overall_New_FxA_user_input_emails,
            id: new_funnel_from_08252021.overall_New_FxA_user_input_emails, name: Overall
              New FxA User Input Emails}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 63, type: linear}, {label: '', orientation: left,
        series: [{axisId: new_funnel_from_08252021.overall_New_FxA_payment_setup_complete,
            id: new_funnel_from_08252021.overall_New_FxA_payment_setup_complete, name: Overall
              New FxA Payment Setup Complete}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: CVR(%), orientation: right,
        series: [{axisId: new_funnel_from_08252021.New_FxA_CVR, id: new_funnel_from_08252021.New_FxA_CVR,
            name: New FxA CVR}, {axisId: new_funnel_from_08252021.overall_New_FxA_CVR,
            id: new_funnel_from_08252021.overall_New_FxA_CVR, name: Overall New FxA
              CVR}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 72, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      new_funnel_from_08252021.New_FxA_CVR: line
      new_funnel_from_08252021.overall_New_FxA_CVR: line
    show_dropoff: false
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 81
    col: 9
    width: 15
    height: 6
  - name: New FxA Users Conversion Process
    type: text
    title_text: New FxA Users Conversion Process
    subtitle_text: ''
    body_text: "The three bars in the chart represent steps that summarize the conversion\
      \ process for users who did not have a FxA. **New FxA User Input Emails** is\
      \ the first step for the new FxA user group that is distinguishable from the\
      \ existing FxA user group. \n\n* The **New FxA CVR** is the rate of users completed\
      \ the payment out of new FxA users  who engaged in inputting their emails. \n\
      \n* Click the three dots on the top right of the plot to compare the CVRs for\
      \ different groups on one plot.\n"
    row: 81
    col: 0
    width: 9
    height: 6
  - name: Existing FxA Signed Off Users Conversion Process
    type: text
    title_text: Existing FxA Signed Off Users Conversion Process
    subtitle_text: ''
    body_text: "The four bars in the chart represent steps that summarize the conversion\
      \ process for users who had a FxA but had not signed off before entering the\
      \ acquisition funnel. **Existing FxA User SignedOff Signin CTA Click** is the\
      \ first step for this user group that is distinguishable from the new FxA user\
      \ group. This step is captured when the users click the “sign in” CTA button.\
      \  \n\n* The **Existing FxA SinedOff CVR** is the proportion of users who completed\
      \ the payment out of existing FxA users  who clicked the “sign in” CTA button.\
      \ It is calculated based on the filters you set. \n\n* Click the three dots\
      \ on the top right of the plot to compare the CVRs for different groups on one\
      \ plot.\n\n"
    row: 87
    col: 0
    width: 9
    height: 7
  - title: Exsiting FxA Signed Off Users Conversion Process
    name: Exsiting FxA Signed Off Users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.Existing_FxA_SignedOff_CVR,
      new_funnel_from_08252021.Existing_FxA_SignedOff_signin_CTA_click, new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_view,
      new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage, new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete]
    sorts: [new_funnel_from_08252021.start_date]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_signin_CTA_click,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_signin_CTA_click,
            name: Existing FxA SignedOff Signin CTA Click}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_view,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_view,
            name: Existing FxA SignedOff Payment Setup View}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage,
            name: Existing FxA SignedOff Payment Setup Engage}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete,
            name: Existing FxA SignedOff Payment Setup Complete}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 99,
        type: linear}, {label: '', orientation: right, series: [{axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_CVR,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_CVR, name: Existing
              FxA SignedOff CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    hidden_series: []
    series_types:
      new_funnel_from_08252021.Existing_FxA_SignedOff_CVR: line
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: false
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 87
    col: 9
    width: 15
    height: 7
  - title: Existing FxA Signed In Users Conversion Process
    name: Existing FxA Signed In Users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_view,
      new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_engage, new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_complete,
      new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR]
    sorts: [new_funnel_from_08252021.start_date]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Session Counts, orientation: left, series: [{axisId: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_view,
            id: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_view,
            name: Existing FxA SignedIn Payment Setup View}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_engage,
            id: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_engage,
            name: Existing FxA SignedIn Payment Setup Engage}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_complete,
            id: new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_complete,
            name: Existing FxA SignedIn Payment Setup Complete}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 97,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR,
            id: new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR, name: Existing
              Fxa SignedIn CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 70, type: linear}]
    hide_legend: false
    series_types:
      new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR: line
      new_funnel_from_08252021.overall_Existing_Fxa_SignedIn_CVR: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 94
    col: 9
    width: 15
    height: 7
  - name: Existing FxA Signed In Users Conversion Process (2)
    type: text
    title_text: Existing FxA Signed In Users Conversion Process
    subtitle_text: ''
    body_text: "The three bars in the chart represent steps that summarize the conversion\
      \ process for users who had a FxA and had already signed in before entering\
      \ the acquisition funnel. \n\n**Existing FxA User Signed In**  is the first\
      \ step for this user group and it is captured when the users hit the payment\
      \ site from the VPN product site by choosing a VPN plan. \n\n* The **Existing\
      \ FxA SinedIn CVR**  is the proportion of users who completed the payment out\
      \ of existing FxA users entered the acquisition funnel with a signed in FxA\
      \ account. It is calculated based on the filters you set. \n\n* Click the three\
      \ dots on the top right of the plot to compare the CVRs for different groups\
      \ on one plot.\n\n"
    row: 94
    col: 0
    width: 9
    height: 7
  - title: VPN Product Site Visits by Country
    name: VPN Product Site Visits by Country
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_pie
    fields: [new_funnel_from_08252021.VPN_site_hits, new_funnel_from_08252021.country]
    filters: {}
    sorts: [new_funnel_from_08252021.VPN_site_hits desc]
    limit: 20
    value_labels: labels
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
    series_types: {}
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
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 6
    col: 0
    width: 11
    height: 6
  - title: Chosen Pricing Plan on the Top of the Funnel
    name: Chosen Pricing Plan on the Top of the Funnel
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_grid
    fields: [new_funnel_from_08252021.pricing_plan, new_funnel_from_08252021.total_acquisition_process_start]
    filters: {}
    sorts: [new_funnel_from_08252021.total_acquisition_process_start desc]
    limit: 500
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
    y_axes: [{label: Session Count, orientation: left, series: [{axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: new_funnel_from_08252021.total_acquisition_process_start, name: Total
              Acquisition Process Start}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 47
    col: 4
    width: 17
    height: 6
  - title: VPN Product Site Visits by Channel Group
    name: VPN Product Site Visits by Channel Group
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_line
    fields: [new_funnel_from_08252021.VPN_site_hits, new_funnel_from_08252021.start_date,
      new_funnel_from_08252021.Channel_group]
    pivots: [new_funnel_from_08252021.Channel_group]
    sorts: [new_funnel_from_08252021.VPN_site_hits desc 0, new_funnel_from_08252021.Channel_group]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: VPN Site Hits,
        value_format: !!null '', value_format_name: !!null '', based_on: new_funnel_from_08252021.VPN_site_hits,
        _kind_hint: measure, measure: vpn_site_hits, type: sum, _type_hint: number},
      {category: table_calculation, description: 'Difference between the current row’s
          value and value of the row below, divided by the value of the row below.',
        label: "% Change VPN Site Hits", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_difference_from_previous, table_calculation: change_vpn_site_hits,
        args: [vpn_site_hits], _kind_hint: dimension, _type_hint: number, is_disabled: true},
      {category: table_calculation, description: Cumulative sum of this row and all
          previous rows in the column, label: Running Total VPN Site Hits, value_format: !!null '',
        value_format_name: Default formatting, calculation_type: running_total, table_calculation: running_total_vpn_site_hits,
        args: [new_funnel_from_08252021.VPN_site_hits], _kind_hint: measure, _type_hint: number,
        is_disabled: true}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: new_funnel_from_08252021.VPN_site_hits,
            id: direct - new_funnel_from_08252021.VPN_site_hits, name: direct}, {
            axisId: new_funnel_from_08252021.VPN_site_hits, id: marketing_owned -
              new_funnel_from_08252021.VPN_site_hits, name: marketing_owned}, {axisId: new_funnel_from_08252021.VPN_site_hits,
            id: marketing_paid - new_funnel_from_08252021.VPN_site_hits, name: marketing_paid},
          {axisId: new_funnel_from_08252021.VPN_site_hits, id: miscellaneous - new_funnel_from_08252021.VPN_site_hits,
            name: miscellaneous}, {axisId: new_funnel_from_08252021.VPN_site_hits,
            id: organic - new_funnel_from_08252021.VPN_site_hits, name: organic},
          {axisId: new_funnel_from_08252021.VPN_site_hits, id: product_owned - new_funnel_from_08252021.VPN_site_hits,
            name: product_owned}, {axisId: new_funnel_from_08252021.VPN_site_hits,
            id: unattributed - new_funnel_from_08252021.VPN_site_hits, name: unattributed}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 97, type: linear}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 20
    col: 4
    width: 17
    height: 7
  - title: Top of the Funnel by Channel Group
    name: Top of the Funnel by Channel Group
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_line
    fields: [new_funnel_from_08252021.total_acquisition_process_start, new_funnel_from_08252021.start_date,
      new_funnel_from_08252021.Channel_group]
    pivots: [new_funnel_from_08252021.Channel_group]
    sorts: [new_funnel_from_08252021.start_date desc, new_funnel_from_08252021.Channel_group]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Total Acquisition
          Process Start, value_format: !!null '', value_format_name: !!null '', based_on: new_funnel_from_08252021.total_acquisition_process_start,
        _kind_hint: measure, measure: total_acquisition_process_start, type: sum,
        _type_hint: number}, {category: table_calculation, description: Current row’s
          value divided by the value of the row below., label: "% Change Total Acquisition\
          \ Process Start", value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_of_previous, table_calculation: change_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: dimension, _type_hint: number,
        is_disabled: true}, {category: table_calculation, label: Running Total Total
          Acquisition Process Start, value_format: !!null '', value_format_name: Default
          formatting, calculation_type: running_row_total, table_calculation: running_total_total_acquisition_process_start,
        args: [total_acquisition_process_start], _kind_hint: measure, _type_hint: number,
        is_disabled: true}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Session Count, orientation: left, series: [{axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: direct - new_funnel_from_08252021.total_acquisition_process_start,
            name: direct}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: marketing_owned - new_funnel_from_08252021.total_acquisition_process_start,
            name: marketing_owned}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: marketing_paid - new_funnel_from_08252021.total_acquisition_process_start,
            name: marketing_paid}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: miscellaneous - new_funnel_from_08252021.total_acquisition_process_start,
            name: miscellaneous}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: organic - new_funnel_from_08252021.total_acquisition_process_start,
            name: organic}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: product_owned - new_funnel_from_08252021.total_acquisition_process_start,
            name: product_owned}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: unattributed - new_funnel_from_08252021.total_acquisition_process_start,
            name: unattributed}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 100, type: linear}]
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
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 56
    col: 4
    width: 17
    height: 6
  - name: Product Site Visits by Channel Group
    type: text
    title_text: Product Site Visits by Channel Group
    subtitle_text: ''
    body_text: "The channel groups are categorized using the UTM attributions ( medium,\
      \ source, campaign, content). The categorization rule was based on the Marketing\
      \ UTM Parameters - 2021 H2 spreadsheet.\n\n* Direct: direct traffic led by putting\
      \ the product site address on a url bar. For direct traffic, the default set\
      \ of utm parameters are passed from Bedrock. \nThe default set of utm parameters\
      \ are\n**medium = `referral` , source = `www.mozilla.org-vpn-product-page` ,\
      \ campaign = `vpn-product-page`**. \n\n* Organic: traffic led by finding the\
      \ site through a search engine (ex. google). The **organic traffic is identified\
      \ by the medium parameter values being `organic` or `organic-search`.**\n\n\
      * Marketing_owned: traffic led by the marketing owned media campaigns (ex. Blog.mozilla.org,\
      \ whatsnew)\n\n* Marketing_paid: traffic led by the paid campaign(ex. SEM)\n\
      \n* Product_owned: traffic led by the product owned media campaigns (ex. Firefox\
      \ browser)\n\n* Unattributed: traffic led with no attribution\n\n* Miscellaneous:\
      \ traffic led with some attributions that could not be categorized. It could\
      \ be that some of the attribution parameters got lost or attributions that were\
      \ not well documented.\n\n* For more detailed explanation for the categorization\
      \ of the channel groups, please refer to [this documentation](https://docs.google.com/document/d/1ojf1XHb3Iu5GNzMfozDcxWhEw6d9A4QuiaoAm-gDIrk/edit?usp=sharing). "
    row: 12
    col: 0
    width: 24
    height: 8
  - title: Top 10 Attributions that Led the Most Site Visits
    name: Top 10 Attributions that Led the Most Site Visits
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_grid
    fields: [new_funnel_from_08252021.VPN_site_hits, new_funnel_from_08252021.Channel_group,
      new_funnel_from_08252021.UTM_medium, new_funnel_from_08252021.UTM_source, new_funnel_from_08252021.UTM_campaign,
      new_funnel_from_08252021.UTM_content]
    sorts: [new_funnel_from_08252021.VPN_site_hits desc]
    limit: 10
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
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 27
    col: 4
    width: 17
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# [VPN Product Site](www.mozilla.org/vpn) Traffic "
    row: 4
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Conversion Funnel Steps\n\nDepending on users status with FxA, the\
      \ conversion funnel varies. For all users, there are three common steps between\
      \ groups are plotted to monitor overall trend. Then there are three plots for\n\
      \n*  New FxA users: people how did not have a FxA before entering the funnel\
      \ \n\n* Existing FxA Signed Off users: people who had a FxA but did not log\
      \ in before entering the funnel, existing FxA users how was signed in before\
      \ entering the funnel. \n\n* Existing FxA Signed In users: people who had a\
      \ FxA and already signed in before entering the funnel.\n\nFor more information\
      \ about each funnel, refer to [this board](https://miro.com/app/board/o9J_lq1HHTg=/?invite_link_id=97426737166) "
    row: 68
    col: 0
    width: 24
    height: 6
  - name: Click Through Rate (CTR)  from choosing a pricing plan to start the acquisition
      process
    type: text
    title_text: Click Through Rate (CTR)  from choosing a pricing plan to start the
      acquisition process
    subtitle_text: ''
    body_text: "CTR is calculated as a rate of the number of people on the top of\
      \ funnel by click a pricing plan in [the VPN product site](www.mozilla.org/vpn).\
      \ \n\n* **CTR (Click Through Rate in %)= (the payment site visits)/(VPN product\
      \ site visits)*100**\n\n* Using filters on the top, you can get the CTR for\
      \ a specific group. \n\n* Click the three dots on the top right of the plot\
      \ to compare the CTRs for different groups on one plot.  \n"
    row: 35
    col: 0
    width: 24
    height: 4
  - name: Pricing Plans Chosen while Entering the Funnel
    type: text
    title_text: Pricing Plans Chosen while Entering the Funnel
    subtitle_text: ''
    body_text: 'Users choose one of the three price plans (monthly, 6 months, 12 months)
      to enter the acquisition funnel. This plot represent the popularity of each
      plan. '
    row: 45
    col: 0
    width: 24
    height: 2
  - name: Top of the Funnel traffic by Channel Group
    type: text
    title_text: Top of the Funnel traffic by Channel Group
    subtitle_text: ''
    body_text: 'This plot shows how many people from each channel group entered the
      acquisition funnel after landing on the product site. The conversion rate for
      each group from the product site to the top of the funnel can be found in **CTR
      from the VPN product Site to Enter the Funnel** above using the channel group
      filter on the top.  '
    row: 53
    col: 0
    width: 24
    height: 3
  - title: Top 10 Attributions that Led to the Top of the Funnel
    name: Top 10 Attributions that Led to the Top of the Funnel
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_grid
    fields: [new_funnel_from_08252021.Channel_group, new_funnel_from_08252021.UTM_medium,
      new_funnel_from_08252021.UTM_source, new_funnel_from_08252021.UTM_campaign,
      new_funnel_from_08252021.UTM_content, new_funnel_from_08252021.VPN_site_hits]
    sorts: [new_funnel_from_08252021.VPN_site_hits desc]
    limit: 10
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
    series_types: {}
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 62
    col: 4
    width: 17
    height: 6
  - title: Total VPN Site Visits
    name: Total VPN Site Visits
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: single_value
    fields: [new_funnel_from_08252021.VPN_site_hits]
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
    defaults_version: 1
    series_types: {}
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Channel Group: new_funnel_from_08252021.Channel_group
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Country: new_funnel_from_08252021.country
    row: 0
    col: 16
    width: 8
    height: 4
  filters:
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 28 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: []
    field: new_funnel_from_08252021.start_date
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Channel Group, Entrypoint Variation, Entrypoint Experiment,
      Pricing Plan, UTM Medium, UTM Source, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.country
  - name: Channel Group
    title: Channel Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Entrypoint Variation, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.Channel_group
  - name: UTM Medium
    title: UTM Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Source, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.UTM_medium
  - name: UTM Source
    title: UTM Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Medium, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.UTM_source
  - name: UTM Campaign
    title: UTM Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Entrypoint
        Experiment, Pricing Plan, UTM Medium, UTM Source, UTM Content]
    field: new_funnel_from_08252021.UTM_campaign
  - name: UTM Content
    title: UTM Content
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign]
    field: new_funnel_from_08252021.UTM_content
  - name: UTM Term
    title: UTM Term
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Channel Group, Entrypoint Variation, Entrypoint Experiment,
      Pricing Plan, UTM Medium, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.UTM_term
  - name: Entrypoint Experiment
    title: Entrypoint Experiment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Variation, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.entrypoint_experiment
  - name: Entrypoint Variation
    title: Entrypoint Variation
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, Entrypoint Experiment, Pricing Plan,
      UTM Medium, UTM Source, UTM Campaign, UTM Content]
    field: new_funnel_from_08252021.entrypoint_variation
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
    explore: new_funnel_from_08252021
    listens_to_filters: [Country, Channel Group, UTM Campaign]
    field: new_funnel_from_08252021.pricing_plan
  - name: OS Name
    title: OS Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: []
    field: new_funnel_from_08252021.OS_name
  - name: OS Version
    title: OS Version
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    listens_to_filters: [OS Name]
    field: new_funnel_from_08252021.OS_version
