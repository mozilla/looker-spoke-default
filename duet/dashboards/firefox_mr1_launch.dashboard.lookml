- dashboard: firefox_mr1_launch
  title: Firefox MR1 Launch
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  refresh: 1 day
  elements:
  - title: Uplift Desktop
    name: Uplift Desktop
    model: duet
    explore: version_uplift
    type: looker_column
    fields: [version_uplift.submission_date, version_uplift.Updated, version_uplift.Non_updated]
    fill_fields: [version_uplift.submission_date]
    sorts: [version_uplift.submission_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: version_uplift.uplift,
            id: version_uplift.uplift, name: Uplift}], showLabels: true, showValues: true,
        maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: ''
    series_types: {}
    series_colors:
      version_uplift.Updated: "#1A73E8"
      version_uplift.Non_updated: "#12B5CB"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: version_uplift.desktop_OS
      Country: version_uplift.country
    row: 6
    col: 0
    width: 8
    height: 8
  - title: Desktop
    name: Desktop
    model: duet
    explore: version_uplift
    type: single_value
    fields: [version_uplift.submission_date, version_uplift.uplift]
    fill_fields: [version_uplift.submission_date]
    sorts: [version_uplift.submission_date desc]
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
    value_format: "#.##"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    hidden_fields: [version_uplift.submission_date]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: version_uplift.desktop_OS
      Country: version_uplift.country
    row: 4
    col: 0
    width: 8
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ----------------------

      # Upgrade Adoption

      Percentage of population updated to MR1 version. [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.cb6b0bv77uwm)

      5/28: iOS Release, 6/1: Desktop and Fenix (Android) Release
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Surveys Engaged
    name: Surveys Engaged
    model: duet
    explore: surveys
    type: single_value
    fields: [surveys.engaged]
    sorts: [surveys.engaged]
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 50
    col: 9
    width: 8
    height: 5
  - title: Surveys Offered
    name: Surveys Offered
    model: duet
    explore: surveys
    type: single_value
    fields: [surveys.offered]
    sorts: [surveys.offered]
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
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 50
    col: 0
    width: 9
    height: 5
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---------------------------------------------------------------------------------\n\
      \n# Happiness Survey\n\nTo measure user feedback to the changes in MR1, we are\
      \ launching a series of surveys in our Desktop user population. \n\nA baseline\
      \ survey was run previously to peg user sentiment previous to the release (link\
      \ below), and our first MR1 survey runs June 4th. [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.dv3dmnq8mwfg)\n\
      \nNote - the below metrics track how many survey prompts were served and accepted,\
      \ however, doesn't include how many were finished (which is done in a 3rd party\
      \ platform)\n"
    row: 45
    col: 0
    width: 24
    height: 5
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "#### Baseline Happiness Survey Report\n* [Early baseline happiness\
      \ metrics for Proton](https://docs.google.com/presentation/d/1H_Ml_E6-v8P00FMJ5xux7kmvzSx7Z-9NKEPKhnHGGP8/edit#slide=id.gbd50516360_0_140)\n\
      \n#### Proton Happiness Survey: \n* data collection for FX 89 June 4- June 10\n\
      \n#### Proton Happiness Survey \n* data collection for FX 90 July 2- July 8"
    row: 50
    col: 17
    width: 7
    height: 5
  - title: cDOU (Desktop) Difference from Target
    name: cDOU (Desktop) Difference from Target
    model: kpi
    explore: firefox_desktop_usage_2021
    type: looker_line
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast_count]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Difference From Forecast, orientation: left, series: [{axisId: firefox_desktop_usage_2021.delta_from_forecast_count,
            id: firefox_desktop_usage_2021.delta_from_forecast_count, name: 'Cdou:
              Absolute Delta from Forecast'}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 23
    col: 0
    width: 24
    height: 7
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "-----------------------------\n\n# KPI - Desktop cDOU\n\nCumulative\
      \ Days of Use, the sum of all DAU from January 1st. Our goal is to meet or beat\
      \ our forecast projections based on last years data. [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.gx5hos203hgb)\n\
      \nThe various charts below track how we are doing against our forecast target. "
    row: 14
    col: 0
    width: 24
    height: 5
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "-------------------------------\n\n# Desktop Comparisons\nComparisons for\
      \ DAU, New Profiles, and Downloads against previous year as well as the recent trend\
      \ (up till release date). [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.ipqlsjd7z3ds)"
    row: 55
    col: 0
    width: 24
    height: 4
  - title: Default Rate (Overall)
    name: Default Rate (Overall)
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_default, feature_usage.browser_not_default]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
    sorts: [feature_usage.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: default_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_default}\
          \ / ${feature_usage.cc})", label: Default Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_default,
            id: feature_usage.browser_default, name: Browser Default}, {axisId: feature_usage.browser_not_default,
            id: feature_usage.browser_not_default, name: Browser Not Default}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: feature_usage.Desktop_OS
      Country: feature_usage.country
    row: 162
    col: 8
    width: 8
    height: 7
  - title: Pinned Rate (Overall)
    name: Pinned Rate (Overall)
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_pinned, feature_usage.browser_not_pinned]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
    sorts: [feature_usage.browser_pinned]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pinned_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_pinned}\
          \ / ${feature_usage.cc})", label: Pinned Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_pinned,
            id: feature_usage.browser_pinned, name: Browser Pinned}, {axisId: feature_usage.browser_not_pinned,
            id: feature_usage.browser_not_pinned, name: Browser Not Pinned}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: feature_usage.Desktop_OS
      Country: feature_usage.country
    row: 162
    col: 0
    width: 8
    height: 7
  - title: mozillaorg Desktop Traffic
    name: mozillaorg Desktop Traffic
    model: duet
    explore: mozorg_ga
    type: looker_grid
    fields: [mozorg_ga.non_fx_sessions, mozorg_ga.non_fx_downloads, mozorg_ga.traffic_type]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.non_fx_sessions desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0}]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser'
    listen:
      Visiting Browser: mozorg_ga.browser
      Country: mozorg_ga.country
    row: 101
    col: 0
    width: 12
    height: 6
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---------------------------------\n\n# Marketing\n\nOur marketing\
      \ effort for this release is focusing on earned media through a series of blog\
      \ posts and activating journalists and influencers. [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.3527yucn8c8y)\n\
      \nWe can evaluate the impact by looking at: \n\n* 3rd party publications writing\
      \ about Mozilla\n* Traffic to our blogs\n* Traffic to our website"
    row: 83
    col: 0
    width: 24
    height: 5
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "# Earned media\n\n#### What They're Saying!\n\n2021-06-01:\t[Chip\
      \ (Germany)](https://www.chip.de/news/Fertig-zum-Download-Firefox-89-mit-komplett-neuem-Design_183260455.html)\n\
      \n2021-05-31:\t[Deskmodder (Germany)](https://www.deskmodder.de/blog/2021/05/31/firefox-89-steht-schon-zum-download-bereit-78-11-esr-folgt/)\n\
      \n2021-05-31:\t[Bulgarisches (Germany)](Wirtschaftsblatt\thttps://www.wirtschaftsblatt-bg.com/technik/mozilla-stimmt-sich-auf-den-neuen-look-ein/)\n\
      \n2021-05-31:\t[Sören Hentzschel (Germany)](https://www.soeren-hentzschel.at/firefox/proton-design-vorstellung/)\n\
      \n2021-05-28:\t[Next INpact (France)](https://www.nextinpact.com/lebrief/47248/mozilla-tease-larrivee-nouveau-firefox-pour-1er-juin)\n\
      \n2021-05-28:\t[Numerama (France)](https://www.numerama.com/tech/715012-pourquoi-vous-navez-pas-encore-pu-recuperer-la-nouvelle-version-de-firefox.html)\n\
      \n2021-05-27:\t[Buffed (Germany)](https://www.buffed.de/Internet-Thema-34041/Videos/Hinter-dem-Design-Firefox-neuer-Look-1372680/)\n\
      \n2021-05-26:\t[Too Linux (France)](https://www.toolinux.com/?le-tout-nouveau-firefox-arrivera-le-1er-juin)\n\
      \n2021-05-26:\t[PC Games Hardware (Germany)](https://www.pcgameshardware.de/Internet-Thema-34041/News/Firefox-Mozilla-stellt-die-Aenderungen-im-Video-vor-1372677/)\n\
      \n2021-05-26:\t[PC Games Hardware (Germany)](https://www.pcgameshardware.de/Internet-Thema-34041/Videos/Hinter-dem-Design-Firefox-neuer-Look-1372680/)\n\
      \n2021-05-26:\t[Klaus Ahrens (Germany)](https://www.allofus.de/naechste-woche-kommt-der-neue-firefox/68769)\n\
      \n2021-05-26:\t[Chip (Germany)](https://www.chip.de/news/Firefox-Browser-kommt-mit-komplett-neuem-Design_183260455.html)\n\
      \n2021-05-26:\t[tsecurity.de (Germany)](https://tsecurity.de/de/1484138/Downloads/Firefox-Browser-kommt-mit-komplett-neuem-Design-So-k%C3%B6nnen-Sie-es-schon-jetzt-ausprobieren/)\n\
      \n2021-05-26:\t[tweakpc (Germany)](https://www.tweakpc.de/news/47703/mozilla-stellt-neues-design-des-firefox-vor/)\n\
      \n2021-05-26:\t[Swiss (Switzerland)](IT Magazine\thttps://www.itmagazine.ch/Artikel/74708/Mozilla_verpasst_Firefox_eine_neue_Optik.html)\n\
      \n2021-05-25:\t[PC Welt (Germany)](https://www.pcwelt.de/news/Firefox-mit-neuem-Look-ab-1.-Juni-erster-Blick-11033659.html)\n\
      \n2021-05-25:\t[Golem (Germany)](https://www.golem.de/news/browser-mozilla-firefox-wird-optisch-ueberarbeitet-und-aufpoliert-2105-156737.html)\n\
      \n2021-05-25:\t[Caschys Blog (Germany)](https://stadt-bremerhaven.de/firefox-mozilla-stimmt-auf-das-neuen-design-ein/)\n\
      \n2021-05-25:\t[WinFuture (Germany)](https://winfuture.de/videos/Software/Mozilla-Naechste-Woche-zeigt-sich-Firefox-in-erneuertem-Design-22720.html)\n\
      \n2021-05-25:\t[MSN Deutschland (Germany)](https://www.msn.com/de-de/nachrichten/digital/newssplitter-einige-wichtige-firefox-news-der-vergangenen-tage-im-%C3%BCberblick/ar-AAKkbnE)\n\
      \n2021-05-24:\t[Dr. Windows (Germany)](https://www.drwindows.de/news/newssplitter-einige-wichtige-firefox-news-der-vergangenen-tage-im-ueberblick)\n\
      \n2021-05-20:\t[India Today (US)](https://www.indiatoday.in/technology/news/story/mozilla-set-to-launch-all-new-firefox-in-june-1804362-2021-05-19)\n\
      \n2021-05-19:\t[Clubic (France)](https://www.clubic.com/navigateur-internet/mozilla-firefox/actualite-371912-mozilla-tease-une-toute-nouvelle-version-de-firefox-pour-le-1er-juin.html)\n\
      \n2021-05-11:\t[TechRadar (US)](https://www.techradar.com/news/firefoxs-proton-redesign-waves-goodbye-to-some-ui-elements)\n\
      \n2021-05-03:\t[laptopmagazine (US)](https://www.laptopmag.com/news/mozilla-firefox-update-is-making-me-abandon-chrome-heres-why)\n"
    row: 88
    col: 0
    width: 8
    height: 13
  - title: blogmozilla Visits (By Blog)
    name: blogmozilla Visits (By Blog)
    model: duet
    explore: mozblogs_ga
    type: looker_grid
    fields: [mozblogs_ga.sessions, mozblogs_ga.blog, mozblogs_ga.mobile_sessions,
      mozblogs_ga.desktop_sessions]
    filters:
      mozblogs_ga.date: after 2021/05/18
    sorts: [mozblogs_ga.sessions desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozblogs_ga.sessions:
        is_active: true
      mozblogs_ga.mobile_sessions:
        is_active: true
      mozblogs_ga.desktop_sessions:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser, Traffic Type'
    listen:
      Traffic Type: mozblogs_ga.traffic_type
      Visiting Browser: mozblogs_ga.browser
      Country: mozblogs_ga.country
    row: 88
    col: 8
    width: 16
    height: 7
  - title: DAU vs Recent Trend
    name: DAU vs Recent Trend
    model: duet
    explore: forecast_desktopDAU
    type: looker_line
    fields: [forecast_desktopDAU.submission_date, forecast_desktopDAU.upper_bound,
      forecast_desktopDAU.dau, forecast_desktopDAU.lower_bound]
    fill_fields: [forecast_desktopDAU.submission_date]
    filters:
      forecast_desktopDAU.submission_date: after 2021/05/18
    sorts: [forecast_desktopDAU.upper_bound desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_desktopDAU.yhat_lower,
            id: forecast_desktopDAU.yhat_lower, name: Yhat Lower}, {axisId: forecast_desktopDAU.dau,
            id: forecast_desktopDAU.dau, name: Dau}, {axisId: forecast_desktopDAU.yhat_upper,
            id: forecast_desktopDAU.yhat_upper, name: Yhat Upper}], showLabels: true,
        showValues: true, minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      forecast_desktopDAU.yhat_lower: "#e2e8e5"
      forecast_desktopDAU.yhat_upper: "#e2e8e5"
      forecast_desktopDAU.upper_bound: "#cdcfe6"
      forecast_desktopDAU.lower_bound: "#cdcfe6"
      forecast_desktopDAU.dau: "#1A73E8"
    series_point_styles:
      forecast_desktopDAU.upper_bound: diamond
      forecast_desktopDAU.lower_bound: diamond
    reference_lines: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 59
    col: 12
    width: 12
    height: 6
  - title: Status
    name: Status
    model: duet
    explore: forecast_desktopDAU
    type: single_value
    fields: [forecast_desktopDAU.submission_date, forecast_desktopDAU.lower_diff_pct,
      forecast_desktopDAU.upper_diff_pct, forecast_desktopDAU.status]
    filters:
      forecast_desktopDAU.submission_date: after 2021/05/18
    sorts: [forecast_desktopDAU.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: deltarange, _type_hint: string,
        category: table_calculation, expression: 'concat(to_string(round(${forecast_desktopDAU.upper_diff_pct},
          2)), "% to ", to_string(round(${forecast_desktopDAU.lower_diff_pct}, 2)),
          "%")

          ', label: deltarange, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles: {}
    reference_lines: []
    defaults_version: 1
    hidden_fields: [forecast_desktopDAU.lower_diff_pct, forecast_desktopDAU.upper_diff_pct,
      forecast_desktopDAU.submission_date, deltarange]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 65
    col: 12
    width: 12
    height: 2
  - title: New Profiles vs Recent Trend
    name: New Profiles vs Recent Trend
    model: duet
    explore: forecast_desktopNP
    type: looker_line
    fields: [forecast_desktopNP.submission_date, forecast_desktopNP.upper_bound, forecast_desktopNP.new_profiles,
      forecast_desktopNP.lower_bound]
    fill_fields: [forecast_desktopNP.submission_date]
    filters:
      forecast_desktopNP.submission_date: after 2021/05/18
    sorts: [forecast_desktopNP.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_colors:
      forecast_desktopNP.upper_bound: "#cdcfe6"
      forecast_desktopNP.lower_bound: "#cdcfe6"
      forecast_desktopNP.new_profiles: "#9334E6"
    series_point_styles:
      forecast_desktopNP.upper_bound: diamond
      forecast_desktopNP.lower_bound: diamond
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 67
    col: 12
    width: 12
    height: 6
  - title: Uplift iOS
    name: Uplift iOS
    model: duet
    explore: version_uplift_mobile
    type: looker_column
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.Updated,
      version_uplift_mobile.Non_updated]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for iOS
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      version_uplift_mobile.Updated: "#1A73E8"
      version_uplift_mobile.Non_updated: "#12B5CB"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: version_uplift_mobile.country
    row: 6
    col: 16
    width: 8
    height: 8
  - title: iOS
    name: iOS
    model: duet
    explore: version_uplift_mobile
    type: single_value
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.uplift]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for iOS
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
    value_format: "#.##"
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
    series_types: {}
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: version_uplift_mobile.country
    row: 4
    col: 16
    width: 8
    height: 2
  - title: Android
    name: Android
    model: duet
    explore: version_uplift_mobile
    type: single_value
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.uplift]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for Android (Fenix),Firefox for
        Android (Fennec)
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
    value_format: "#.##"
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
    series_types: {}
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: version_uplift_mobile.country
    row: 4
    col: 8
    width: 8
    height: 2
  - title: Uplift Android
    name: Uplift Android
    model: duet
    explore: version_uplift_mobile
    type: looker_column
    fields: [version_uplift_mobile.submission_date, version_uplift_mobile.Updated,
      version_uplift_mobile.Non_updated]
    fill_fields: [version_uplift_mobile.submission_date]
    filters:
      version_uplift_mobile.canonical_name: Firefox for Android (Fenix),Firefox for
        Android (Fennec)
      version_uplift_mobile.submission_date: after 2021/05/18
    sorts: [version_uplift_mobile.submission_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      version_uplift_mobile.Non_updated: "#12B5CB"
      version_uplift_mobile.Updated: "#1A73E8"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: version_uplift_mobile.country
    row: 6
    col: 8
    width: 8
    height: 8
  - title: cDOU (Mobile) Difference from Target
    name: cDOU (Mobile) Difference from Target
    model: kpi
    explore: mobile_usage_2021
    type: looker_line
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast_count]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#1A73E8"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 38
    col: 0
    width: 24
    height: 7
  - title: cDOU (Actual)
    name: cDOU (Actual)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.cdou]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
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
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 19
    col: 0
    width: 8
    height: 4
  - title: cDOU (Target)
    name: cDOU (Target)
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, prediction.cdou_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
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
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 19
    col: 8
    width: 8
    height: 4
  - title: Delta upon Release
    name: Delta upon Release
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: 2021/06/01
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 21
    col: 16
    width: 8
    height: 2
  - title: Delta Today
    name: Delta Today
    model: kpi
    explore: firefox_desktop_usage_2021
    type: single_value
    fields: [firefox_desktop_usage_2021.date, firefox_desktop_usage_2021.delta_from_forecast]
    fill_fields: [firefox_desktop_usage_2021.date]
    filters:
      firefox_desktop_usage_2021.date: after 2021/05/18
    sorts: [firefox_desktop_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      firefox_desktop_usage_2021.cdou:
        is_active: false
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
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 19
    col: 16
    width: 8
    height: 2
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "-----------------------------\n\n# KPI - Mobile cDOU\n\nCumulative\
      \ Days of Use, the sum of all DAU from January 1st. Our goal is to meet or beat\
      \ our forecast projections based on last years data. [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.gx5hos203hgb)\n\
      \nThe various charts below track how we are doing against our forecast target. "
    row: 30
    col: 0
    width: 24
    height: 4
  - title: Delta Today
    name: Delta Today (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 34
    col: 16
    width: 8
    height: 2
  - title: Delta Upon Release
    name: Delta Upon Release
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.delta_from_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: 2021/06/01
    sorts: [mobile_usage_2021.date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: '', font_color: "#079c98", color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 36
    col: 16
    width: 8
    height: 2
  - title: cDOU (Actual)
    name: cDOU (Actual) (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_usage_2021.cdou]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 34
    col: 0
    width: 8
    height: 4
  - title: cDOU (Target)
    name: cDOU (Target) (2)
    model: kpi
    explore: mobile_usage_2021
    type: single_value
    fields: [mobile_usage_2021.date, mobile_prediction.cdou_forecast]
    fill_fields: [mobile_usage_2021.date]
    filters:
      mobile_usage_2021.date: after 2021/05/18
    sorts: [mobile_usage_2021.date desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: mobile_usage_2021.delta_from_forecast_count,
            id: mobile_usage_2021.delta_from_forecast_count, name: Delta From Forecast
              Count}], showLabels: true, showValues: true, minValue: -10000000, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      mobile_usage_2021.delta_from_forecast_count: "#079c98"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#7CB342",
        line_value: '0', label: At Forecast}]
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: No filters
    listen: {}
    row: 34
    col: 8
    width: 8
    height: 4
  - title: Status
    name: Status (2)
    model: duet
    explore: forecast_desktopNP
    type: single_value
    fields: [forecast_desktopNP.submission_date, forecast_desktopNP.status]
    filters:
      forecast_desktopNP.submission_date: after 2021/05/18
    sorts: [forecast_desktopNP.submission_date desc]
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
    hidden_fields: [forecast_desktopNP.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 73
    col: 12
    width: 12
    height: 2
  - title: New Profiles vs 2020
    name: New Profiles vs 2020
    model: duet
    explore: dau_desktop
    type: looker_line
    fields: [dau_desktop.submission_date, dau_desktop.new_profiles_2021, dau_desktop.new_profiles_2020]
    fill_fields: [dau_desktop.submission_date]
    filters:
      dau_desktop.submission_date: after 2021/05/18
    sorts: [dau_desktop.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      dau_desktop.new_profiles_2021: "#9334E6"
      dau_desktop.new_profiles_2020: "#12B5CB"
    series_point_styles:
      dau_desktop.new_profiles_2020: diamond
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: dau_desktop.desktop_OS
      Country: dau_desktop.country
    row: 67
    col: 0
    width: 12
    height: 8
  - title: DAU vs 2020
    name: DAU vs 2020
    model: duet
    explore: dau_desktop
    type: looker_line
    fields: [dau_desktop.submission_date, dau_desktop.DAU_2021, dau_desktop.DAU_2020]
    fill_fields: [dau_desktop.submission_date]
    filters:
      dau_desktop.submission_date: after 2021/05/18
    sorts: [dau_desktop.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      dau_desktop.DAU_2020: "#12B5CB"
      dau_desktop.DAU_2021: "#1A73E8"
    series_point_styles:
      dau_desktop.DAU_2020: diamond
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: dau_desktop.desktop_OS
      Country: dau_desktop.country
    row: 59
    col: 0
    width: 12
    height: 8
  - title: mozillaorg Downloads vs 2020
    name: mozillaorg Downloads vs 2020
    model: duet
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.non_fx_downloads_2021, mozorg_ga.non_fx_downloads_2020, mozorg_ga.date]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      mozorg_ga.non_fx_downloads_2020: "#12B5CB"
      mozorg_ga.non_fx_downloads_2021: "#F9AB00"
    series_point_styles:
      mozorg_ga.non_fx_downloads_2020: diamond
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country, Traffic Type'
    listen:
      Traffic Type: mozorg_ga.traffic_type
      Visiting Browser: mozorg_ga.browser
      Desktop OS: mozorg_ga.Desktop_OS
      Country: mozorg_ga.country
    row: 75
    col: 0
    width: 12
    height: 8
  - title: mozillaorg Downloads vs Recent Trend
    name: mozillaorg Downloads vs Recent Trend
    model: duet
    explore: forecast_dls
    type: looker_line
    fields: [forecast_dls.upper_bound, forecast_dls.non_fx_downloads, forecast_dls.lower_bound,
      forecast_dls.submission_date]
    fill_fields: [forecast_dls.submission_date]
    filters:
      forecast_dls.submission_date: after 2021/05/18
    sorts: [forecast_dls.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_dls.non_fx_downloads: "#F9AB00"
      forecast_dls.upper_bound: "#cdcfe6"
      forecast_dls.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_dls.upper_bound: diamond
      forecast_dls.lower_bound: diamond
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 75
    col: 12
    width: 12
    height: 6
  - title: Status
    name: Status (3)
    model: duet
    explore: forecast_dls
    type: single_value
    fields: [forecast_dls.submission_date, forecast_dls.status]
    filters:
      forecast_dls.submission_date: after 2021/05/18
    sorts: [forecast_dls.submission_date desc]
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
    series_types: {}
    point_style: circle_outline
    series_colors:
      forecast_dls.non_fx_downloads: "#F9AB00"
      forecast_dls.upper_bound: "#cdcfe6"
      forecast_dls.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_dls.upper_bound: diamond
      forecast_dls.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_dls.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 81
    col: 12
    width: 12
    height: 2
  - title: blogmozilla Visits (By Traffic Type)
    name: blogmozilla Visits (By Traffic Type)
    model: duet
    explore: mozblogs_ga
    type: looker_grid
    fields: [mozblogs_ga.sessions, mozblogs_ga.mobile_sessions, mozblogs_ga.desktop_sessions,
      mozblogs_ga.traffic_type]
    filters:
      mozblogs_ga.date: after 2021/05/18
    sorts: [mozblogs_ga.sessions desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozblogs_ga.sessions:
        is_active: true
      mozblogs_ga.mobile_sessions:
        is_active: true
      mozblogs_ga.desktop_sessions:
        is_active: true
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser'
    listen:
      Visiting Browser: mozblogs_ga.browser
      Country: mozblogs_ga.country
    row: 95
    col: 8
    width: 16
    height: 6
  - title: mozillaorg Mobile Traffic
    name: mozillaorg Mobile Traffic
    model: duet
    explore: mozorg_ga
    type: looker_grid
    fields: [mozorg_ga.non_fx_sessions, mozorg_ga.non_fx_downloads, mozorg_ga.traffic_type]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: mobile,tablet
    sorts: [mozorg_ga.non_fx_sessions desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0}]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
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
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser'
    listen:
      Visiting Browser: mozorg_ga.browser
      Country: mozorg_ga.country
    row: 101
    col: 12
    width: 12
    height: 6
  - title: mozillaorg Mobile Visits (By Traffic Type)
    name: mozillaorg Mobile Visits (By Traffic Type)
    model: duet
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.date, mozorg_ga.traffic_type, mozorg_ga.non_fx_sessions]
    pivots: [mozorg_ga.traffic_type]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: mobile,tablet
    sorts: [mozorg_ga.date desc, mozorg_ga.traffic_type]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0,
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser'
    listen:
      Visiting Browser: mozorg_ga.browser
      Country: mozorg_ga.country
    row: 107
    col: 12
    width: 12
    height: 7
  - title: mozillaorg Desktop Visits (By Traffic Type)
    name: mozillaorg Desktop Visits (By Traffic Type)
    model: duet
    explore: mozorg_ga
    type: looker_line
    fields: [mozorg_ga.date, mozorg_ga.traffic_type, mozorg_ga.non_fx_sessions]
    pivots: [mozorg_ga.traffic_type]
    fill_fields: [mozorg_ga.date]
    filters:
      mozorg_ga.date: after 2021/05/18
      mozorg_ga.device_category: desktop
    sorts: [mozorg_ga.date desc, mozorg_ga.traffic_type]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: download_rate, _type_hint: number,
        category: table_calculation, expression: "${mozorg_ga.non_fx_downloads}/${mozorg_ga.non_fx_sessions}",
        label: Download Rate, value_format: !!null '', value_format_name: percent_0,
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      mozorg_ga.non_fx_sessions:
        is_active: true
      mozorg_ga.non_fx_downloads:
        is_active: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country, Visiting Browser'
    listen:
      Visiting Browser: mozorg_ga.browser
      Country: mozorg_ga.country
    row: 107
    col: 0
    width: 12
    height: 7
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---------------------------------\n\n# Mobile Comparisons\n\nComparisons\
      \ for DAU, and Installs against previous year as well as the recent trend (up\
      \ till release date). [Read more here](https://docs.google.com/document/d/1pQv5dB28AZOkkR2DZGGPNK93cwPoOnOQHjPH94f4518/edit#heading=h.ipqlsjd7z3ds)\n\
      \nNote: install data might be a bit delayed. "
    row: 114
    col: 0
    width: 24
    height: 4
  - title: Android DAU vs 2020
    name: Android DAU vs 2020
    model: duet
    explore: dau_mobile
    type: looker_line
    fields: [dau_mobile.submission_date, dau_mobile.DAU_2021, dau_mobile.DAU_2020]
    fill_fields: [dau_mobile.submission_date]
    filters:
      dau_mobile.canonical_app_name: Firefox for Android (Fennec),Firefox for Android
        (Fenix)
      dau_mobile.submission_date: after 2021/05/18
    sorts: [dau_mobile.DAU_2021 desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles:
      dau_mobile.DAU_2020: diamond
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: dau_mobile.country
    row: 118
    col: 0
    width: 12
    height: 9
  - title: iOS DAU vs 2020
    name: iOS DAU vs 2020
    model: duet
    explore: dau_mobile
    type: looker_line
    fields: [dau_mobile.submission_date, dau_mobile.DAU_2021, dau_mobile.DAU_2020]
    fill_fields: [dau_mobile.submission_date]
    filters:
      dau_mobile.canonical_app_name: Firefox for iOS
      dau_mobile.submission_date: after 2021/05/18
    sorts: [dau_mobile.DAU_2021 desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    series_point_styles:
      dau_mobile.DAU_2020: diamond
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: dau_mobile.country
    row: 118
    col: 12
    width: 12
    height: 9
  - title: Android DAU vs Recent Trend
    name: Android DAU vs Recent Trend
    model: duet
    explore: forecast_mobile_dau
    type: looker_line
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.upper_bound,
      forecast_mobile_dau.dau, forecast_mobile_dau.lower_bound]
    fill_fields: [forecast_mobile_dau.submission_date]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for Android (Fennec + Fenix)
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_mobile_dau.upper_bound,
            id: forecast_mobile_dau.upper_bound, name: Upper Bound}, {axisId: forecast_mobile_dau.dau,
            id: forecast_mobile_dau.dau, name: Dau}, {axisId: forecast_mobile_dau.lower_bound,
            id: forecast_mobile_dau.lower_bound, name: Lower Bound}], showLabels: true,
        showValues: true, minValue: 6000000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 127
    col: 0
    width: 12
    height: 8
  - title: Status
    name: Status (4)
    model: duet
    explore: forecast_mobile_dau
    type: single_value
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.status]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for Android (Fennec + Fenix)
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    series_types: {}
    point_style: circle_outline
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_mobile_dau.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 135
    col: 0
    width: 12
    height: 2
  - title: iOS DAU vs Recent Trend
    name: iOS DAU vs Recent Trend
    model: duet
    explore: forecast_mobile_dau
    type: looker_line
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.upper_bound,
      forecast_mobile_dau.dau, forecast_mobile_dau.lower_bound]
    fill_fields: [forecast_mobile_dau.submission_date]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for iOS
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: forecast_mobile_dau.upper_bound,
            id: forecast_mobile_dau.upper_bound, name: Upper Bound}, {axisId: forecast_mobile_dau.dau,
            id: forecast_mobile_dau.dau, name: Dau}, {axisId: forecast_mobile_dau.lower_bound,
            id: forecast_mobile_dau.lower_bound, name: Lower Bound}], showLabels: true,
        showValues: true, minValue: 1500000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 127
    col: 12
    width: 12
    height: 8
  - title: Status
    name: Status (5)
    model: duet
    explore: forecast_mobile_dau
    type: single_value
    fields: [forecast_mobile_dau.submission_date, forecast_mobile_dau.status]
    filters:
      forecast_mobile_dau.canonical_app_name: Firefox for iOS
      forecast_mobile_dau.submission_date: after 2021/05/18
    sorts: [forecast_mobile_dau.submission_date desc]
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
    series_types: {}
    point_style: circle_outline
    series_colors:
      forecast_mobile_dau.dau: "#1A73E8"
      forecast_mobile_dau.upper_bound: "#cdcfe6"
      forecast_mobile_dau.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_mobile_dau.upper_bound: diamond
      forecast_mobile_dau.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_mobile_dau.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 135
    col: 12
    width: 12
    height: 2
  - title: Android Installs vs 2020
    name: Android Installs vs 2020
    model: duet
    explore: install_android
    type: looker_line
    fields: [install_android.submission_date, install_android.device_installs_2021,
      install_android.device_installs_2020]
    fill_fields: [install_android.submission_date]
    filters:
      install_android.submission_date: after 2021/05/18
    sorts: [install_android.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      install_android.device_installs_2021: "#12B5CB"
      install_android.device_installs_2020: "#F9AB00"
    series_point_styles:
      install_android.device_installs_2020: diamond
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: install_android.country
    row: 137
    col: 0
    width: 12
    height: 8
  - title: Android Installs vs Recent Trend
    name: Android Installs vs Recent Trend
    model: duet
    explore: forecast_android_installs
    type: looker_line
    fields: [forecast_android_installs.submission_date, forecast_android_installs.upper_bound,
      forecast_android_installs.device_installs, forecast_android_installs.lower_bound]
    fill_fields: [forecast_android_installs.submission_date]
    filters:
      forecast_android_installs.submission_date: after 2021/05/18
    sorts: [forecast_android_installs.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_android_installs.upper_bound: "#cdcfe6"
      forecast_android_installs.device_installs: "#F9AB00"
      forecast_android_installs.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_android_installs.upper_bound: diamond
      forecast_android_installs.lower_bound: diamond
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 145
    col: 0
    width: 12
    height: 9
  - title: Status
    name: Status (6)
    model: duet
    explore: forecast_android_installs
    type: single_value
    fields: [forecast_android_installs.submission_date, forecast_android_installs.status]
    filters:
      forecast_android_installs.submission_date: after 2021/05/18
    sorts: [forecast_android_installs.submission_date desc]
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
    series_types: {}
    point_style: circle_outline
    series_colors:
      forecast_android_installs.upper_bound: "#cdcfe6"
      forecast_android_installs.device_installs: "#F9AB00"
      forecast_android_installs.lower_bound: "#cdcfe6"
    series_point_styles:
      forecast_android_installs.upper_bound: diamond
      forecast_android_installs.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_android_installs.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 154
    col: 0
    width: 12
    height: 2
  - title: iOS Installs vs 2020
    name: iOS Installs vs 2020
    model: duet
    explore: install_ios
    type: looker_line
    fields: [install_ios.submission_date, install_ios.installations_opt_in_2021, install_ios.installations_opt_in_2020]
    fill_fields: [install_ios.submission_date]
    filters:
      install_ios.submission_date: after 2021/05/18
    sorts: [install_ios.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      install_ios.installations_opt_in_2021: "#F9AB00"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: install_ios.country
    row: 137
    col: 12
    width: 12
    height: 8
  - title: iOS Installs vs Recent Trend
    name: iOS Installs vs Recent Trend
    model: duet
    explore: forecast_ios_installs
    type: looker_line
    fields: [forecast_ios_installs.submission_date, forecast_ios_installs.upper_bound,
      forecast_ios_installs.installations_opt_in, forecast_ios_installs.lower_bound]
    fill_fields: [forecast_ios_installs.submission_date]
    filters:
      forecast_ios_installs.submission_date: after 2021/05/18
    sorts: [forecast_ios_installs.submission_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      forecast_ios_installs.upper_bound: "#cdcfe6"
      forecast_ios_installs.lower_bound: "#cdcfe6"
      forecast_ios_installs.installations_opt_in: "#F9AB00"
    series_point_styles:
      forecast_ios_installs.upper_bound: diamond
      forecast_ios_installs.lower_bound: diamond
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 145
    col: 12
    width: 12
    height: 9
  - title: Status
    name: Status (7)
    model: duet
    explore: forecast_ios_installs
    type: single_value
    fields: [forecast_ios_installs.submission_date, forecast_ios_installs.status]
    filters:
      forecast_ios_installs.submission_date: after 2021/05/18
    sorts: [forecast_ios_installs.submission_date desc]
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
    series_types: {}
    point_style: circle_outline
    series_colors:
      forecast_ios_installs.upper_bound: "#cdcfe6"
      forecast_ios_installs.lower_bound: "#cdcfe6"
      forecast_ios_installs.installations_opt_in: "#F9AB00"
    series_point_styles:
      forecast_ios_installs.upper_bound: diamond
      forecast_ios_installs.lower_bound: diamond
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [forecast_ios_installs.submission_date]
    note_state: collapsed
    note_display: hover
    note_text: No Filters
    listen: {}
    row: 154
    col: 12
    width: 12
    height: 2
  - title: Pinned Rate (New Profile)
    name: Pinned Rate (New Profile)
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_pinned, feature_usage.browser_not_pinned]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
      feature_usage.is_new: new
    sorts: [feature_usage.browser_pinned]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: pinned_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_pinned}\
          \ / ${feature_usage.cc})", label: Pinned Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_pinned,
            id: feature_usage.browser_pinned, name: Browser Pinned}, {axisId: feature_usage.browser_not_pinned,
            id: feature_usage.browser_not_pinned, name: Browser Not Pinned}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: feature_usage.Desktop_OS
      Country: feature_usage.country
    row: 169
    col: 0
    width: 8
    height: 7
  - title: Default Rate (New Profile)
    name: Default Rate (New Profile)
    model: duet
    explore: feature_usage
    type: looker_column
    fields: [feature_usage.submission_date, feature_usage.browser_default, feature_usage.browser_not_default]
    fill_fields: [feature_usage.submission_date]
    filters:
      feature_usage.submission_date: after 2021/05/18
      feature_usage.is_new: new
    sorts: [feature_usage.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: default_rate, _type_hint: number,
        category: table_calculation, expression: "(${feature_usage.browser_default}\
          \ / ${feature_usage.cc})", label: Default Rate, value_format: !!null '',
        value_format_name: !!null '', is_disabled: true}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage.browser_default,
            id: feature_usage.browser_default, name: Browser Default}, {axisId: feature_usage.browser_not_default,
            id: feature_usage.browser_not_default, name: Browser Not Default}], showLabels: true,
        showValues: true, maxValue: 100, minValue: 0, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: true
    label_value_format: ''
    series_types: {}
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: feature_usage.Desktop_OS
      Country: feature_usage.country
    row: 169
    col: 8
    width: 8
    height: 7
  - name: " (10)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      ------------------------------------------------------------------------------------------

      # Feature Usage (Mobile)


      Tracking adoption and usage of features that are updated in MR1. Changes to Android (Fenix) were minimal, but there were a number of significant changes to iOS, roughly:

      * Changes to behavior and layout of tabstray
      * Changes to search / urlbar UI
      * Changes to Synced Tabs accessing
    row: 176
    col: 0
    width: 24
    height: 4
  - name: " (11)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---------------------------------------------------------------------------------------------\n\
      \n# Feature Usage (Desktop)\n\nTracking adoption and usage of features that\
      \ are being promoted in the new onboarding for new users, as well as the update\
      \ prompt being shown to all existing users: \n\n* Pin to OS taskbar (measured\
      \ in Windows only) \n* Browser set as default \n* Non-standard theme adoption\
      \ (data might lag a day behind) \n\nMeasure are tracked for total release population,\
      \ and in new users (within first day of activity). "
    row: 156
    col: 0
    width: 24
    height: 6
  - title: Themes (Overall)
    name: Themes (Overall)
    model: duet
    explore: feature_usage_themes
    type: looker_column
    fields: [feature_usage_themes.alpenglow_theme, feature_usage_themes.dark_theme,
      feature_usage_themes.light_theme, feature_usage_themes.non_customized, feature_usage_themes.submission_date]
    fill_fields: [feature_usage_themes.submission_date]
    filters:
      feature_usage_themes.submission_date: after 2021/05/18
    sorts: [feature_usage_themes.submission_date desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: feature_usage_themes.alpenglow_theme,
            id: feature_usage_themes.alpenglow_theme, name: Alpenglow Theme}, {axisId: feature_usage_themes.dark_theme,
            id: feature_usage_themes.dark_theme, name: Dark Theme}, {axisId: feature_usage_themes.light_theme,
            id: feature_usage_themes.light_theme, name: Light Theme}, {axisId: feature_usage_themes.non_customized,
            id: feature_usage_themes.non_customized, name: Non Customized}], showLabels: true,
        showValues: true, maxValue: 15, minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      feature_usage_themes.non_customized: "#12B5CB"
      feature_usage_themes.light_theme: "#FF8168"
      feature_usage_themes.dark_theme: "#9334E6"
      feature_usage_themes.alpenglow_theme: "#F9AB00"
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Desktop OS, Country'
    listen:
      Desktop OS: feature_usage_themes.Desktop_OS
      Country: feature_usage_themes.country
    row: 162
    col: 16
    width: 8
    height: 8
  - name: " (12)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 170
    col: 16
    width: 8
    height: 6
  - title: Actions from Tabtray (Android)
    name: Actions from Tabtray (Android)
    model: duet
    explore: tabtray_android
    type: looker_column
    fields: [tabtray_android.submission_date, tabtray_android.dau, tabtray_android.tabtray_opened_privatetab_cc,
      tabtray_android.tabtray_opened_newtab_cc]
    fill_fields: [tabtray_android.submission_date]
    filters:
      tabtray_android.submission_date: after 2021/05/18
    sorts: [tabtray_android.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: opened_newtab_from_tabtray,
        _type_hint: number, category: table_calculation, expression: "\n\n${tabtray_android.tabtray_opened_newtab_cc}\
          \ / ${tabtray_android.dau} * 100", label: Opened Newtab (From Tabtray),
        value_format: "#.##", value_format_name: !!null ''}, {_kind_hint: measure,
        table_calculation: opened_private_tab_from_tabtray, _type_hint: number, category: table_calculation,
        expression: "\n\n${tabtray_android.tabtray_opened_privatetab_cc} / ${tabtray_android.dau}\
          \ * 100", label: Opened Private Tab (From Tabtray), value_format: "#.##",
        value_format_name: !!null ''}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: opened_newtab_from_tabtray,
            id: opened_newtab_from_tabtray, name: Opened Newtab (From Tabtray)}, {
            axisId: opened_private_tab_from_tabtray, id: opened_private_tab_from_tabtray,
            name: Opened Private Tab (From Tabtray)}], showLabels: true, showValues: true,
        maxValue: 20, minValue: 0, valueFormat: '##.#"%"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      opened_newtab_from_tabtray: "#E52592"
      opened_private_tab_from_tabtray: "#9334E6"
    x_axis_datetime_label: "%m-%d"
    show_dropoff: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [tabtray_android.dau, tabtray_android.tabtray_opened_privatetab_cc,
      tabtray_android.tabtray_opened_newtab_cc]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: tabtray_android.country
    row: 187
    col: 0
    width: 12
    height: 7
  - title: Tabtray Opens (Android)
    name: Tabtray Opens (Android)
    model: duet
    explore: tabtray_android
    type: looker_column
    fields: [tabtray_android.submission_date, tabtray_android.tabtray_opened_cc, tabtray_android.dau]
    fill_fields: [tabtray_android.submission_date]
    filters:
      tabtray_android.submission_date: after 2021/05/18
    sorts: [opened_tabtray desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: opened_tabtray, _type_hint: number,
        category: table_calculation, expression: "\n\n${tabtray_android.tabtray_opened_cc}",
        label: Opened Tabtray, value_format: !!null '', value_format_name: !!null ''},
      {_kind_hint: measure, table_calculation: didnt_open_tabtray, _type_hint: number,
        category: table_calculation, expression: "${tabtray_android.dau} - ${tabtray_android.tabtray_opened_cc}",
        label: Didn't Open Tabtray, value_format: !!null '', value_format_name: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types:
      opened_tabtray: scatter
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [tabtray_android.dau, tabtray_android.tabtray_opened_cc]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: tabtray_android.country
    row: 180
    col: 0
    width: 12
    height: 7
  - title: Tabtray Opens (iOS)
    name: Tabtray Opens (iOS)
    model: duet
    explore: tabtray_ios
    type: looker_column
    fields: [tabtray_ios.submission_date, tabtray_ios.tabtray_opened_cc, tabtray_ios.dau]
    fill_fields: [tabtray_ios.submission_date]
    filters:
      tabtray_ios.submission_date: after 2021/05/18
    sorts: [opened_tabtray desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: opened_tabtray, _type_hint: number,
        category: table_calculation, expression: "${tabtray_ios.tabtray_opened_cc}",
        label: Opened Tabtray, value_format: !!null '', value_format_name: !!null ''},
      {_kind_hint: measure, table_calculation: didnt_open_tabtray, _type_hint: number,
        category: table_calculation, expression: "${tabtray_ios.dau} - ${tabtray_ios.tabtray_opened_cc}",
        label: Didn't Open Tabtray, value_format: !!null '', value_format_name: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [tabtray_ios.tabtray_opened_cc, tabtray_ios.dau]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: tabtray_ios.country
    row: 180
    col: 12
    width: 12
    height: 7
  - name: Actions from Tabtray (iOS)
    type: text
    title_text: Actions from Tabtray (iOS)
    subtitle_text: 'Unavailable: No Telemetry '
    body_text: ''
    row: 187
    col: 12
    width: 12
    height: 7
  - name: Tabs Opened Per User - All Methods (Android)
    type: text
    title_text: Tabs Opened Per User - All Methods (Android)
    subtitle_text: 'Unavailable: No Telemetry'
    body_text: ''
    row: 194
    col: 0
    width: 12
    height: 7
  - title: Tabs Opened Per User - All Methods (iOS)
    name: Tabs Opened Per User - All Methods (iOS)
    model: duet
    explore: tabs_overall_ios
    type: looker_line
    fields: [tabs_overall_ios.submission_date, tabs_overall_ios.dau, tabs_overall_ios.normal_tabcount_total,
      tabs_overall_ios.private_tabcount_total, tabs_overall_ios.tabcount_total]
    fill_fields: [tabs_overall_ios.submission_date]
    filters:
      tabs_overall_ios.submission_date: after 2021/05/18
    sorts: [tabs_overall_ios.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: avg_tabs_total, _type_hint: number,
        category: table_calculation, expression: "\n\n${tabs_overall_ios.tabcount_total}\
          \ / ${tabs_overall_ios.dau}", label: Avg Tabs (Total), value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: measure, table_calculation: avg_tabs_non_private,
        _type_hint: number, category: table_calculation, expression: "\n\n${tabs_overall_ios.normal_tabcount_total}/\
          \ ${tabs_overall_ios.dau}", label: Avg Tabs (Non-private), value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: measure, table_calculation: avg_tabs_private,
        _type_hint: number, category: table_calculation, expression: "\n\n ${tabs_overall_ios.private_tabcount_total}/\
          \ ${tabs_overall_ios.dau}", label: Avg Tabs (Private), value_format: !!null '',
        value_format_name: !!null ''}]
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
    defaults_version: 1
    hidden_fields: [tabs_overall_ios.dau, tabs_overall_ios.normal_tabcount_total,
      tabs_overall_ios.private_tabcount_total, tabs_overall_ios.tabcount_total]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: tabs_overall_ios.country
    row: 194
    col: 12
    width: 12
    height: 7
  - title: Searches Per User - SAP (Android)
    name: Searches Per User - SAP (Android)
    model: duet
    explore: search_mobile
    type: looker_line
    fields: [search_mobile.submission_date, search_mobile.dau, search_mobile.SAP_clients,
      search_mobile.SAP_total]
    fill_fields: [search_mobile.submission_date]
    filters:
      search_mobile.canonical_name: Firefox for Android (Fenix)
      search_mobile.submission_date: after 2021/05/18
    sorts: [search_mobile.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: avg_sap_searches, _type_hint: number,
        category: table_calculation, expression: "\n\n${search_mobile.SAP_total}/${search_mobile.dau}",
        label: Avg SAP Searches, value_format: !!null '', value_format_name: !!null ''}]
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
    hidden_fields: [search_mobile.dau, search_mobile.SAP_clients, search_mobile.SAP_total]
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: search_mobile.country
    row: 215
    col: 0
    width: 12
    height: 7
  - title: Searches Per User - SAP (iOS)
    name: Searches Per User - SAP (iOS)
    model: duet
    explore: search_mobile
    type: looker_line
    fields: [search_mobile.submission_date, search_mobile.dau, search_mobile.SAP_clients,
      search_mobile.SAP_total]
    fill_fields: [search_mobile.submission_date]
    filters:
      search_mobile.canonical_name: Firefox for iOS
      search_mobile.submission_date: after 2021/05/18
    sorts: [search_mobile.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: avg_sap_searches, _type_hint: number,
        category: table_calculation, expression: "\n\n${search_mobile.SAP_total}/${search_mobile.dau}",
        label: Avg SAP Searches, value_format: !!null '', value_format_name: !!null ''}]
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
    hidden_fields: [search_mobile.dau, search_mobile.SAP_clients, search_mobile.SAP_total]
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: search_mobile.country
    row: 215
    col: 12
    width: 12
    height: 7
  - name: Synced Tab Opens (iOS)
    type: text
    title_text: Synced Tab Opens (iOS)
    subtitle_text: 'Unavailable: Telemetry Expired'
    body_text: ''
    row: 201
    col: 0
    width: 12
    height: 7
  - title: Searches - SAP (Android)
    name: Searches - SAP (Android)
    model: duet
    explore: search_mobile
    type: looker_column
    fields: [search_mobile.submission_date, search_mobile.dau, search_mobile.SAP_clients]
    fill_fields: [search_mobile.submission_date]
    filters:
      search_mobile.canonical_name: Firefox for Android (Fenix)
      search_mobile.submission_date: after 2021/05/18
    sorts: [search_mobile.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: non_sap_search_clients,
        _type_hint: number, category: table_calculation, expression: "${search_mobile.dau}\
          \ - ${search_mobile.SAP_clients}", label: Non (SAP) Search Clients, value_format: !!null '',
        value_format_name: !!null ''}]
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: [search_mobile.dau]
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: search_mobile.country
    row: 208
    col: 0
    width: 12
    height: 7
  - title: Synced Tab Opens (iOS)
    name: Synced Tab Opens (iOS) (2)
    model: duet
    explore: synced_tabs_ios
    type: looker_column
    fields: [synced_tabs_ios.submission_date, synced_tabs_ios.dau, synced_tabs_ios.sync_tab_opened_cc]
    fill_fields: [synced_tabs_ios.submission_date]
    filters:
      synced_tabs_ios.submission_date: after 2021/05/18
    sorts: [opened_synced_tab desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: opened_synced_tab, _type_hint: number,
        category: table_calculation, expression: "\n\n${synced_tabs_ios.sync_tab_opened_cc}",
        label: Opened Synced Tab, value_format: !!null '', value_format_name: !!null ''},
      {_kind_hint: measure, table_calculation: didnt_open_synced_tab, _type_hint: number,
        category: table_calculation, expression: "\n\n${synced_tabs_ios.dau} - ${synced_tabs_ios.sync_tab_opened_cc}",
        label: Didn't Open Synced Tab, value_format: !!null '', value_format_name: !!null ''}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [synced_tabs_ios.dau, synced_tabs_ios.sync_tab_opened_cc]
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: synced_tabs_ios.country
    row: 201
    col: 12
    width: 12
    height: 7
  - title: Searches - SAP (iOS)
    name: Searches - SAP (iOS)
    model: duet
    explore: search_mobile
    type: looker_column
    fields: [search_mobile.submission_date, search_mobile.dau, search_mobile.SAP_clients]
    fill_fields: [search_mobile.submission_date]
    filters:
      search_mobile.canonical_name: Firefox for iOS
      search_mobile.submission_date: after 2021/05/18
    sorts: [search_mobile.submission_date desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: non_sap_search_clients,
        _type_hint: number, category: table_calculation, expression: "${search_mobile.dau}\
          \ - ${search_mobile.SAP_clients}", label: Non (SAP) Search Clients, value_format: !!null '',
        value_format_name: !!null ''}]
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: [search_mobile.dau]
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: 'Filter Options: Country'
    listen:
      Country: search_mobile.country
    row: 208
    col: 12
    width: 12
    height: 7
  filters:
  - name: Desktop OS
    title: Desktop OS
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: duet
    explore: version_uplift
    listens_to_filters: []
    field: version_uplift.desktop_OS
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
    model: duet
    explore: version_uplift
    listens_to_filters: []
    field: version_uplift.country
  - name: Visiting Browser
    title: Visiting Browser
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: duet
    explore: mozorg_ga
    listens_to_filters: []
    field: mozorg_ga.browser
  - name: Traffic Type
    title: Traffic Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: duet
    explore: mozorg_ga
    listens_to_filters: []
    field: mozorg_ga.traffic_type
