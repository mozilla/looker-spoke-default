- dashboard: vpn_acquisition_funnel_view__new_funnel
  title: VPN Acquisition Funnel View - New Funnel
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  elements:
  - title: 'Total VPN Site Visits and Payment Site Visits '
    name: 'Total VPN Site Visits and Payment Site Visits '
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.overall_VPN_site_hits,
      new_funnel_from_08252021.overall_total_acquisition_process_start, new_funnel_from_08252021.overall_CTR_from_VPN_site_hits_to_enter_the_funnel]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: session counts, orientation: left, series: [{axisId: new_funnel_from_08252021.overall_VPN_site_hits,
            id: new_funnel_from_08252021.overall_VPN_site_hits, name: Overall VPN
              Site Hits}, {axisId: new_funnel_from_08252021.overall_total_acquisition_process_start,
            id: new_funnel_from_08252021.overall_total_acquisition_process_start,
            name: Overall Total Acquisition Process Start}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: CTR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.overall_CTR_from_VPN_site_hits_to_enter_the_funnel,
            id: new_funnel_from_08252021.overall_CTR_from_VPN_site_hits_to_enter_the_funnel,
            name: Overall CTR From VPN Site Hits to Enter the Funnel}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      new_funnel_from_08252021.overall_CTR_from_VPN_site_hits_to_enter_the_funnel: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Entrypoint Experiment: new_funnel_from_08252021.entrypoint_experiment
      Entrypoint Variation: new_funnel_from_08252021.entrypoint_variation
      Pricing Plan: new_funnel_from_08252021.pricing_plan
      OS Name: new_funnel_from_08252021.OS_name
      OS Version: new_funnel_from_08252021.OS_version
      Start Date: new_funnel_from_08252021.start_date
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 11
    col: 0
    width: 12
    height: 6
  - name: " VPN Product Site Visits and Users at the Top of the Acquisition Funnel"
    type: text
    title_text: " VPN Product Site Visits and Users at the Top of the Acquisition\
      \ Funnel"
    subtitle_text: ''
    body_text: |
      *  [VPN product site](www.mozilla.org/vpn) visits
      * Payment site visits
      * CTR (Click Through Rate in %)= (the payment site visits)/(VPN product site visits)*100

      **Total VPN Site Visits and Payment Site Visits**  can only be filtered by Start Date.

      **Filtered VPN Site Visits and Payment Site Visits** changes based on filters you set.
    row: 6
    col: 0
    width: 24
    height: 5
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
      \nThe **CVR From Payment Site Hits to Payment Complete** and the bar chart is\
      \ the conversion rate calculated based on filters you set. \n\nThe **Overall\
      \ CVR From Payment Site Hits to Payment Complete** is the conversion rate calculated\
      \ on daily total users without filters you set and it is to be compared with\
      \ the CVR of the group you filtered. \n"
    row: 17
    col: 0
    width: 9
    height: 7
  - title: All User Conversion Funnel Steps
    name: All User Conversion Funnel Steps
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.total_acquisition_process_start,
      new_funnel_from_08252021.total_payment_setup_engage, new_funnel_from_08252021.total_payment_setup_complete,
      new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete, new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete]
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
    show_value_labels: true
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
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 75,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete,
            id: new_funnel_from_08252021.overall_CVR_from_payment_site_hits_to_payment_complete,
            name: Overall CVR From Payment Site Hits to Payment Complete}, {axisId: new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete,
            id: new_funnel_from_08252021.CVR_from_payment_site_hits_to_payment_complete,
            name: CVR From Payment Site Hits to Payment Complete}], showLabels: true,
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
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 17
    col: 9
    width: 15
    height: 7
  - title: Last Updated Date
    name: Last Updated Date
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: single_value
    fields: [new_funnel_from_08252021.start_date]
    fill_fields: [new_funnel_from_08252021.start_date]
    filters:
      new_funnel_from_08252021.start_date: 2 days
    sorts: [new_funnel_from_08252021.start_date]
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
    refresh: 1 day
    listen:
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Daily VPN Product Site Visits
    name: Daily VPN Product Site Visits
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: single_value
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.VPN_site_hits]
    fill_fields: [new_funnel_from_08252021.start_date]
    filters:
      new_funnel_from_08252021.start_date: 2 days
    sorts: [new_funnel_from_08252021.start_date]
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
    refresh: 1 day
    listen:
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Filtered VPN Site Visits and Payment Site Visits
    name: Filtered VPN Site Visits and Payment Site Visits
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.VPN_site_hits,
      new_funnel_from_08252021.total_acquisition_process_start, new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel]
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
    show_value_labels: true
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
    y_axes: [{label: Sessions, orientation: left, series: [{axisId: new_funnel_from_08252021.VPN_site_hits,
            id: new_funnel_from_08252021.VPN_site_hits, name: VPN Site Hits}, {axisId: new_funnel_from_08252021.total_acquisition_process_start,
            id: new_funnel_from_08252021.total_acquisition_process_start, name: Total
              Acquisition Process Start}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: CTR(%),
        orientation: right, series: [{axisId: new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel,
            id: new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel,
            name: CTR From VPN Site Hits to Enter the Funnel}], showLabels: true,
        showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 5, type: linear}]
    series_types:
      new_funnel_from_08252021.CTR_from_VPN_site_hits_to_enter_the_funnel: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 11
    col: 12
    width: 12
    height: 6
  - title: New FxA users Conversion Process
    name: New FxA users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.New_FxA_user_input_emails,
      new_funnel_from_08252021.New_FxA_payment_setup_engage, new_funnel_from_08252021.New_FxA_payment_setup_complete,
      new_funnel_from_08252021.New_FxA_CVR, new_funnel_from_08252021.overall_New_FxA_CVR,
      new_funnel_from_08252021.overall_New_FxA_user_input_emails, new_funnel_from_08252021.overall_New_FxA_payment_setup_complete]
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
    show_value_labels: true
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
              FxA Payment Setup Complete}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: CVR(%),
        orientation: right, series: [{axisId: new_funnel_from_08252021.New_FxA_CVR,
            id: new_funnel_from_08252021.New_FxA_CVR, name: New FxA CVR}, {axisId: new_funnel_from_08252021.overall_New_FxA_CVR,
            id: new_funnel_from_08252021.overall_New_FxA_CVR, name: Overall New FxA
              CVR}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types:
      new_funnel_from_08252021.New_FxA_CVR: line
      new_funnel_from_08252021.overall_New_FxA_CVR: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_fields: [new_funnel_from_08252021.overall_New_FxA_user_input_emails, new_funnel_from_08252021.overall_New_FxA_payment_setup_complete]
    listen:
      Start Date: new_funnel_from_08252021.start_date
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 24
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
      \ existing FxA user group. \n\nThe **New FxA CVR** is the proportion of users\
      \ completed the payment out of new FxA users  who engaged in inputting their\
      \ emails. It is calculated based on the filters you set. \n\nThe **Overall New\
      \ FxA CVR** is the CVR calculated using all new FxA users and it is not affected\
      \ by the filters you set except the start date. \n"
    row: 24
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
      \  \n\nThe **Existing FxA SinedOff CVR** is the proportion of users who completed\
      \ the payment out of existing FxA users  who clicked the “sign in” CTA button.\
      \ It is calculated based on the filters you set. \n\nThe **Overall Existing\
      \ FxA SinedOff CVR** is the CVR calculated using all existing FxA users who\
      \ were signed off before entering the funnel and it is not affected by the filters\
      \ you set except the start date. \n"
    row: 30
    col: 0
    width: 9
    height: 6
  - title: Exsiting FxA Signed Off Users Conversion Process
    name: Exsiting FxA Signed Off Users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.Existing_FxA_SignedOff_signin_CTA_click,
      new_funnel_from_08252021.Existing_SignedOff_FxA_payment_setup_view, new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage,
      new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete, new_funnel_from_08252021.Existing_Fxa_SignedOff_CVR,
      new_funnel_from_08252021.overall_Existing_Fxa_SignedOff_CVR]
    fill_fields: [new_funnel_from_08252021.start_date]
    filters:
      new_funnel_from_08252021.start_date: 7 days ago for 7 days
    sorts: [new_funnel_from_08252021.start_date desc]
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
    show_value_labels: true
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
            name: Existing FxA SignedOff Signin CTA Click}, {axisId: new_funnel_from_08252021.Existing_SignedOff_FxA_payment_setup_view,
            id: new_funnel_from_08252021.Existing_SignedOff_FxA_payment_setup_view,
            name: Existing SignedOff FxA Payment Setup View}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_engage,
            name: Existing FxA SignedOff Payment Setup Engage}, {axisId: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete,
            id: new_funnel_from_08252021.Existing_FxA_SignedOff_payment_setup_complete,
            name: Existing FxA SignedOff Payment Setup Complete}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: CVR(%), orientation: right, series: [{axisId: new_funnel_from_08252021.Existing_Fxa_SignedOff_CVR,
            id: new_funnel_from_08252021.Existing_Fxa_SignedOff_CVR, name: Existing
              Fxa SignedOff CVR}, {axisId: new_funnel_from_08252021.overall_Existing_Fxa_SignedOff_CVR,
            id: new_funnel_from_08252021.overall_Existing_Fxa_SignedOff_CVR, name: Overall
              Existing Fxa SignedOff CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      new_funnel_from_08252021.Existing_Fxa_SignedOff_CVR: line
      new_funnel_from_08252021.overall_Existing_Fxa_SignedOff_CVR: line
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: false
    defaults_version: 1
    listen:
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 30
    col: 9
    width: 15
    height: 6
  - title: Existing FxA Signed In Users Conversion Process
    name: Existing FxA Signed In Users Conversion Process
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.start_date, new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_view,
      new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_engage, new_funnel_from_08252021.Existing_FxA_SignedIn_payment_setup_complete,
      new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR, new_funnel_from_08252021.overall_Existing_Fxa_SignedIn_CVR]
    fill_fields: [new_funnel_from_08252021.start_date]
    filters:
      new_funnel_from_08252021.start_date: 7 days ago for 7 days
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
    show_value_labels: true
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
            name: Existing FxA SignedIn Payment Setup Complete}, {axisId: new_funnel_from_08252021.overall_Existing_Fxa_SignedIn_CVR,
            id: new_funnel_from_08252021.overall_Existing_Fxa_SignedIn_CVR, name: Overall
              Existing Fxa SignedIn CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: CVR(%),
        orientation: right, series: [{axisId: new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR,
            id: new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR, name: Existing
              Fxa SignedIn CVR}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      new_funnel_from_08252021.Existing_Fxa_SignedIn_CVR: line
      new_funnel_from_08252021.overall_Existing_Fxa_SignedIn_CVR: line
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    listen:
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 36
    col: 9
    width: 15
    height: 6
  - name: Existing FxA Signed In Users Conversion Process (2)
    type: text
    title_text: Existing FxA Signed In Users Conversion Process
    subtitle_text: ''
    body_text: "The three bars in the chart represent steps that summarize the conversion\
      \ process for users who had a FxA and had already signed in before entering\
      \ the acquisition funnel. \n\n**Existing FxA User Signed In**  is the first\
      \ step for this user group and it is captured when the users hit the payment\
      \ site from the VPN product site by choosing a VPN plan. \n\nThe **Existing\
      \ FxA SinedIn CVR**  is the proportion of users who completed the payment out\
      \ of existing FxA users entered the acquisition funnel with a signed in FxA\
      \ account. It is calculated based on the filters you set. \n\nThe **Overall\
      \ Existing FxA SinedIn CVR**  is the CVR calculated in a similar way as the\
      \ **Existing FxA SinedIn CVR**  but using ALL existing FxA users signed in before\
      \ entering the funnel and it is not affected by the filters you set except the\
      \ start date. \n"
    row: 36
    col: 0
    width: 9
    height: 6
  - title: Proportion of Cumulative Visits to VPN produt site by country
    name: Proportion of Cumulative Visits to VPN produt site by country
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
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 0
    col: 6
    width: 12
    height: 6
  - title: Popularity of Pricing Plan when Users Entered the Funnel
    name: Popularity of Pricing Plan when Users Entered the Funnel
    model: mozilla_vpn
    explore: new_funnel_from_08252021
    type: looker_column
    fields: [new_funnel_from_08252021.pricing_plan, new_funnel_from_08252021.total_acquisition_process_start]
    filters: {}
    sorts: [new_funnel_from_08252021.total_acquisition_process_start desc]
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
      Country: new_funnel_from_08252021.country
      UTM Medium: new_funnel_from_08252021.UTM_medium
      UTM Source: new_funnel_from_08252021.UTM_source
      UTM Campaign: new_funnel_from_08252021.UTM_campaign
      UTM Content: new_funnel_from_08252021.UTM_content
      UTM Term: new_funnel_from_08252021.UTM_term
    row: 0
    col: 18
    width: 6
    height: 6
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
    listens_to_filters: [UTM Medium, UTM Source, Entrypoint Variation, Pricing Plan,
      UTM Campaign, UTM Content, Entrypoint Experiment]
    field: new_funnel_from_08252021.country
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
    listens_to_filters: [Country, UTM Source, UTM Campaign, UTM Content, Entrypoint
        Experiment]
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
    listens_to_filters: [Country, UTM Medium, UTM Campaign, UTM Content, Entrypoint
        Experiment]
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
    listens_to_filters: [Country, UTM Medium, UTM Source, UTM Content, Entrypoint
        Experiment]
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
    listens_to_filters: [Country, UTM Medium, UTM Source, UTM Campaign, Entrypoint
        Experiment]
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
    listens_to_filters: [UTM Medium, UTM Campaign, UTM Content, Entrypoint Experiment]
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
    listens_to_filters: [Country, UTM Medium, UTM Source, Entrypoint Variation, UTM
        Campaign, UTM Content]
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
    listens_to_filters: [Country, UTM Medium, UTM Source, UTM Campaign, UTM Content,
      Entrypoint Experiment]
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
    listens_to_filters: [Country, UTM Campaign]
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
