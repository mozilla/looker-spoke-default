
view: android_privacy_events {
  derived_table: {
    sql: WITH dau_segments AS
          (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
          FROM `mozdata.fenix.events_unnested`
          --AND channel = 'release'
          WHERE DATE(submission_timestamp) >= '2021-01-01'
          AND sample_id = 0
          GROUP BY 1),

      product_features AS
      (SELECT
      client_info.client_id,
      DATE(submission_timestamp) as submission_date,
      --private browsing
      CASE WHEN event_category = 'private_browsing_shortcut_cfr' AND event_name = 'add_shortcut' THEN 1 ELSE 0 END as add_shortcut,
      CASE WHEN event_category = 'private_browsing_shortcut_cfr' AND event_name = 'cancel' THEN 1 ELSE 0 END as cancel,
      CASE WHEN event_category = 'homepage' AND event_name = 'private_mode_icon_tapped' THEN 1 ELSE 0 END as hp_private_mode_tapped,
      CASE WHEN event_category = 'tabs_tray' AND event_name = 'private_mode_tapped' THEN 1 ELSE 0 END as tab_tray_private_mode_switched,
      CASE WHEN event_category = 'app_icon' AND event_name = 'new_private_tab_tapped' THEN 1 ELSE 0 END as app_icon_private_tab_tapped,
      CASE WHEN event_category = 'tabs_tray' AND event_name = 'new_private_tab_tapped' THEN 1 ELSE 0 END as tab_tray_private_mode_tapped,
      CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_private_tab' THEN 1 ELSE 0 END as bookmark_open_in_private_tab,
      CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_in_private_tabs' THEN 1 ELSE 0 END as bookmark_open_in_private_tabs,
      CASE WHEN event_category = 'history' AND event_name = 'opened_items_in_private_tabs' THEN 1 ELSE 0 END as history_opened_items_in_private_tabs,
      CASE WHEN event_category = 'top_sites' AND event_name = 'open_in_private_tab' THEN 1 ELSE 0 END as top_sites_open_in_private_tab,
      CASE WHEN event_category = 'bookmarks_management' AND event_name = 'open_all_in_private_tabs' THEN 1 ELSE 0 END as bookmark_open_all_in_private_tabs,
      CASE WHEN event_category = 'top_sites' AND event_name = 'open_contile_in_private_tab' THEN 1 ELSE 0 END as topsites_open_contile_in_private_tab,
      CASE WHEN event_category = 'recently_closed_tabs' AND event_name = 'menu_open_in_private_tab' THEN 1 ELSE 0 END as recently_closed_tabs_menu_open_in_private_tab,
      --etp
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'etp_setting_changed' THEN 1 ELSE 0 END as etp_setting_changed,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'etp_settings' THEN 1 ELSE 0 END as etp_settings,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'etp_shield' THEN 1 ELSE 0 END as etp_shield,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'etp_tracker_list' THEN 1 ELSE 0 END as etp_tracker_list,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'exception_added' THEN 1 ELSE 0 END as exception_added,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'panel_settings' THEN 1 ELSE 0 END as panel_settings,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'tcp_cfr_explicit_dismissal' THEN 1 ELSE 0 END as tcp_cfr_explicit_dismissal,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'tcp_cfr_implicit_dismissal' THEN 1 ELSE 0 END as tcp_cfr_implicit_dismissal,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'tcp_cfr_shown' THEN 1 ELSE 0 END as tcp_cfr_shown,
      CASE WHEN event_category = 'tracking_protection' AND event_name = 'tcp_sumo_link_clicked' THEN 1 ELSE 0 END as tcp_sumo_link_clicked


      FROM `mozdata.fenix.events_unnested`
      where DATE(submission_timestamp) >= '2021-01-01'
      AND sample_id = 0),


      product_features_agg AS
      (SELECT submission_date

      --add_shortcut
      , 100*SUM(add_shortcut) as add_shortcut
      , 100*COUNT(DISTINCT CASE WHEN add_shortcut > 0 THEN client_id END) AS add_shortcut_users
      --cancel
      , 100*SUM(cancel) as cancel
      , 100*COUNT(DISTINCT CASE WHEN cancel > 0 THEN client_id END) AS cancel_users
      --hp_private_mode_tapped
      , 100*SUM(hp_private_mode_tapped) as hp_private_mode_tapped
      , 100*COUNT(DISTINCT CASE WHEN hp_private_mode_tapped > 0 THEN client_id END) AS hp_private_mode_tapped_users
      --tab_tray_private_mode_switched
      , 100*SUM(tab_tray_private_mode_switched) as tab_tray_private_mode_switched
      , 100*COUNT(DISTINCT CASE WHEN tab_tray_private_mode_switched > 0 THEN client_id END) AS tab_tray_private_mode_switched_users
      --app_icon_private_tab_tapped
      , 100*SUM(app_icon_private_tab_tapped) as app_icon_private_tab_tapped
      , 100*COUNT(DISTINCT CASE WHEN app_icon_private_tab_tapped > 0 THEN client_id END) AS app_icon_private_tab_tapped_users
      --tab_tray_private_mode_tapped
      , 100*SUM(tab_tray_private_mode_tapped) as tab_tray_private_mode_tapped
      , 100*COUNT(DISTINCT CASE WHEN tab_tray_private_mode_tapped > 0 THEN client_id END) AS tab_tray_private_mode_tapped_users
      --bookmark_open_in_private_tab
      , 100*SUM(bookmark_open_in_private_tab) as bookmark_open_in_private_tab
      , 100*COUNT(DISTINCT CASE WHEN bookmark_open_in_private_tab > 0 THEN client_id END) AS bookmark_open_in_private_tab_users
      --bookmark_open_in_private_tabs
      , 100*SUM(bookmark_open_in_private_tabs) as bookmark_open_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN bookmark_open_in_private_tabs > 0 THEN client_id END) AS bookmark_open_in_private_tabs_users
      --history_opened_items_in_private_tabs
      , 100*SUM(history_opened_items_in_private_tabs) as history_opened_items_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN history_opened_items_in_private_tabs > 0 THEN client_id END) AS history_opened_items_in_private_tabs_users
      --top_sites_open_in_private_tab
      , 100*SUM(top_sites_open_in_private_tab) as top_sites_open_in_private_tab
      , 100*COUNT(DISTINCT CASE WHEN top_sites_open_in_private_tab > 0 THEN client_id END) AS top_sites_open_in_private_tab_users
      --bookmark_open_all_in_private_tabs
      , 100*SUM(bookmark_open_all_in_private_tabs) as bookmark_open_all_in_private_tabs
      , 100*COUNT(DISTINCT CASE WHEN bookmark_open_all_in_private_tabs > 0 THEN client_id END) AS bookmark_open_all_in_private_tabs_users
      --topsites_open_contile_in_private_tab
      , 100*SUM(topsites_open_contile_in_private_tab) as topsites_open_contile_in_private_tab
      , 100*COUNT(DISTINCT CASE WHEN topsites_open_contile_in_private_tab > 0 THEN client_id END) AS topsites_open_contile_in_private_tab_users
      --recently_closed_tabs_menu_open_in_private_tab
      , 100*SUM(recently_closed_tabs_menu_open_in_private_tab) as recently_closed_tabs_menu_open_in_private_tab
      , 100*COUNT(DISTINCT CASE WHEN recently_closed_tabs_menu_open_in_private_tab > 0 THEN client_id END) AS recently_closed_tabs_menu_open_in_private_tab_users
      --etp_setting_changed
      , 100*SUM(etp_setting_changed) as etp_setting_changed
      , 100*COUNT(DISTINCT CASE WHEN etp_setting_changed > 0 THEN client_id END) AS etp_setting_changed_users
      --etp_settings
      , 100*SUM(etp_settings) as etp_settings
      , 100*COUNT(DISTINCT CASE WHEN etp_settings > 0 THEN client_id END) AS etp_settings_users
      --etp_shield
      , 100*SUM(etp_shield) as etp_shield
      , 100*COUNT(DISTINCT CASE WHEN etp_shield > 0 THEN client_id END) AS etp_shield_users
      --etp_tracker_list
      , 100*SUM(etp_tracker_list) as etp_tracker_list
      , 100*COUNT(DISTINCT CASE WHEN etp_tracker_list > 0 THEN client_id END) AS etp_tracker_list_users
      --exception_added
      , 100*SUM(exception_added) as exception_added
      , 100*COUNT(DISTINCT CASE WHEN exception_added > 0 THEN client_id END) AS exception_added_users
      --panel_settings
      , 100*SUM(panel_settings) as panel_settings
      , 100*COUNT(DISTINCT CASE WHEN panel_settings > 0 THEN client_id END) AS panel_settings_users
      --tcp_cfr_explicit_dismissal
      , 100*SUM(tcp_cfr_explicit_dismissal) as tcp_cfr_explicit_dismissal
      , 100*COUNT(DISTINCT CASE WHEN tcp_cfr_explicit_dismissal > 0 THEN client_id END) AS tcp_cfr_explicit_dismissal_users
      --tcp_cfr_implicit_dismissal
      , 100*SUM(tcp_cfr_implicit_dismissal) as tcp_cfr_implicit_dismissal
      , 100*COUNT(DISTINCT CASE WHEN tcp_cfr_implicit_dismissal > 0 THEN client_id END) AS tcp_cfr_implicit_dismissal_users
      --tcp_cfr_shown
      , 100*SUM(tcp_cfr_shown) as tcp_cfr_shown
      , 100*COUNT(DISTINCT CASE WHEN tcp_cfr_shown > 0 THEN client_id END) AS tcp_cfr_shown_users
      --tcp_sumo_link_clicked
      , 100*SUM(tcp_sumo_link_clicked) as tcp_sumo_link_clicked
      , 100*COUNT(DISTINCT CASE WHEN tcp_sumo_link_clicked > 0 THEN client_id END) AS tcp_sumo_link_clicked_users

      FROM product_features
      where submission_date >= '2021-01-01'
      group by 1
      )

      select d.submission_date,
      dau,
      add_shortcut,
      add_shortcut_users,
      cancel,
      cancel_users,
      hp_private_mode_tapped,
      hp_private_mode_tapped_users,
      tab_tray_private_mode_switched,
      tab_tray_private_mode_switched_users,
      app_icon_private_tab_tapped,
      app_icon_private_tab_tapped_users,
      tab_tray_private_mode_tapped,
      tab_tray_private_mode_tapped_users,
      bookmark_open_in_private_tab,
      bookmark_open_in_private_tab_users,
      bookmark_open_in_private_tabs,
      bookmark_open_in_private_tabs_users,
      history_opened_items_in_private_tabs,
      history_opened_items_in_private_tabs_users,
      top_sites_open_in_private_tab,
      top_sites_open_in_private_tab_users,
      bookmark_open_all_in_private_tabs,
      bookmark_open_all_in_private_tabs_users,
      topsites_open_contile_in_private_tab,
      topsites_open_contile_in_private_tab_users,
      recently_closed_tabs_menu_open_in_private_tab,
      recently_closed_tabs_menu_open_in_private_tab_users,
      etp_setting_changed,
      etp_setting_changed_users,
      etp_settings,
      etp_settings_users,
      etp_shield,
      etp_shield_users,
      etp_tracker_list,
      etp_tracker_list_users,
      exception_added,
      exception_added_users,
      panel_settings,
      panel_settings_users,
      tcp_cfr_explicit_dismissal,
      tcp_cfr_explicit_dismissal_users,
      tcp_cfr_implicit_dismissal,
      tcp_cfr_implicit_dismissal_users,
      tcp_cfr_shown,
      tcp_cfr_shown_users,
      tcp_sumo_link_clicked,
      tcp_sumo_link_clicked_users

      from dau_segments d
      LEFT JOIN product_features_agg p
      ON d.submission_date = p.submission_date ;;
  }


  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: dau {
    type: sum
    sql: ${TABLE}.dau ;;
  }

  measure: add_shortcut {
    type: sum
    sql: ${TABLE}.add_shortcut ;;
  }

  measure: add_shortcut_users {
    type: sum
    sql: ${TABLE}.add_shortcut_users ;;
  }

  measure: cancel {
    type: sum
    sql: ${TABLE}.cancel ;;
  }

  measure: cancel_users {
    type: sum
    sql: ${TABLE}.cancel_users ;;
  }

  measure: hp_private_mode_tapped {
    type: sum
    sql: ${TABLE}.hp_private_mode_tapped ;;
  }

  measure: hp_private_mode_tapped_users {
    type: sum
    sql: ${TABLE}.hp_private_mode_tapped_users ;;
  }

  measure: tab_tray_private_mode_switched {
    type: sum
    sql: ${TABLE}.tab_tray_private_mode_switched ;;
  }

  measure: tab_tray_private_mode_switched_users {
    type: sum
    sql: ${TABLE}.tab_tray_private_mode_switched_users ;;
  }

  measure: app_icon_private_tab_tapped {
    type: sum
    sql: ${TABLE}.app_icon_private_tab_tapped ;;
  }

  measure: app_icon_private_tab_tapped_users {
    type: sum
    sql: ${TABLE}.app_icon_private_tab_tapped_users ;;
  }

  measure: tab_tray_private_mode_tapped {
    type: sum
    sql: ${TABLE}.tab_tray_private_mode_tapped ;;
  }

  measure: tab_tray_private_mode_tapped_users {
    type: sum
    sql: ${TABLE}.tab_tray_private_mode_tapped_users ;;
  }

  measure: bookmark_open_in_private_tab {
    type: sum
    sql: ${TABLE}.bookmark_open_in_private_tab ;;
  }

  measure: bookmark_open_in_private_tab_users {
    type: sum
    sql: ${TABLE}.bookmark_open_in_private_tab_users ;;
  }

  measure: bookmark_open_in_private_tabs {
    type: sum
    sql: ${TABLE}.bookmark_open_in_private_tabs ;;
  }

  measure: bookmark_open_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.bookmark_open_in_private_tabs_users ;;
  }

  measure: history_opened_items_in_private_tabs {
    type: sum
    sql: ${TABLE}.history_opened_items_in_private_tabs ;;
  }

  measure: history_opened_items_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.history_opened_items_in_private_tabs_users ;;
  }

  measure: top_sites_open_in_private_tab {
    type: sum
    sql: ${TABLE}.top_sites_open_in_private_tab ;;
  }

  measure: top_sites_open_in_private_tab_users {
    type: sum
    sql: ${TABLE}.top_sites_open_in_private_tab_users ;;
  }

  measure: bookmark_open_all_in_private_tabs {
    type: sum
    sql: ${TABLE}.bookmark_open_all_in_private_tabs ;;
  }

  measure: bookmark_open_all_in_private_tabs_users {
    type: sum
    sql: ${TABLE}.bookmark_open_all_in_private_tabs_users ;;
  }

  measure: topsites_open_contile_in_private_tab {
    type: sum
    sql: ${TABLE}.topsites_open_contile_in_private_tab ;;
  }

  measure: topsites_open_contile_in_private_tab_users {
    type: sum
    sql: ${TABLE}.topsites_open_contile_in_private_tab_users ;;
  }

  measure: recently_closed_tabs_menu_open_in_private_tab {
    type: sum
    sql: ${TABLE}.recently_closed_tabs_menu_open_in_private_tab ;;
  }

  measure: recently_closed_tabs_menu_open_in_private_tab_users {
    type: sum
    sql: ${TABLE}.recently_closed_tabs_menu_open_in_private_tab_users ;;
  }

  measure: etp_setting_changed {
    type: sum
    sql: ${TABLE}.etp_setting_changed ;;
  }

  measure: etp_setting_changed_users {
    type: sum
    sql: ${TABLE}.etp_setting_changed_users ;;
  }

  measure: etp_settings {
    type: sum
    sql: ${TABLE}.etp_settings ;;
  }

  measure: etp_settings_users {
    type: sum
    sql: ${TABLE}.etp_settings_users ;;
  }

  measure: etp_shield {
    type: sum
    sql: ${TABLE}.etp_shield ;;
  }

  measure: etp_shield_users {
    type: sum
    sql: ${TABLE}.etp_shield_users ;;
  }

  measure: etp_tracker_list {
    type: sum
    sql: ${TABLE}.etp_tracker_list ;;
  }

  measure: etp_tracker_list_users {
    type: sum
    sql: ${TABLE}.etp_tracker_list_users ;;
  }

  measure: exception_added {
    type: sum
    sql: ${TABLE}.exception_added ;;
  }

  measure: exception_added_users {
    type: sum
    sql: ${TABLE}.exception_added_users ;;
  }

  measure: panel_settings {
    type: sum
    sql: ${TABLE}.panel_settings ;;
  }

  measure: panel_settings_users {
    type: sum
    sql: ${TABLE}.panel_settings_users ;;
  }

  measure: tcp_cfr_explicit_dismissal {
    type: sum
    sql: ${TABLE}.tcp_cfr_explicit_dismissal ;;
  }

  measure: tcp_cfr_explicit_dismissal_users {
    type: sum
    sql: ${TABLE}.tcp_cfr_explicit_dismissal_users ;;
  }

  measure: tcp_cfr_implicit_dismissal {
    type: sum
    sql: ${TABLE}.tcp_cfr_implicit_dismissal ;;
  }

  measure: tcp_cfr_implicit_dismissal_users {
    type: sum
    sql: ${TABLE}.tcp_cfr_implicit_dismissal_users ;;
  }

  measure: tcp_cfr_shown {
    type: sum
    sql: ${TABLE}.tcp_cfr_shown ;;
  }

  measure: tcp_cfr_shown_users {
    type: sum
    sql: ${TABLE}.tcp_cfr_shown_users ;;
  }

  measure: tcp_sumo_link_clicked {
    type: sum
    sql: ${TABLE}.tcp_sumo_link_clicked ;;
  }

  measure: tcp_sumo_link_clicked_users {
    type: sum
    sql: ${TABLE}.tcp_sumo_link_clicked_users ;;
  }

  set: detail {
    fields: [
      dau,
      add_shortcut,
      add_shortcut_users,
      cancel,
      cancel_users,
      hp_private_mode_tapped,
      hp_private_mode_tapped_users,
      tab_tray_private_mode_switched,
      tab_tray_private_mode_switched_users,
      app_icon_private_tab_tapped,
      app_icon_private_tab_tapped_users,
      tab_tray_private_mode_tapped,
      tab_tray_private_mode_tapped_users,
      bookmark_open_in_private_tab,
      bookmark_open_in_private_tab_users,
      bookmark_open_in_private_tabs,
      bookmark_open_in_private_tabs_users,
      history_opened_items_in_private_tabs,
      history_opened_items_in_private_tabs_users,
      top_sites_open_in_private_tab,
      top_sites_open_in_private_tab_users,
      bookmark_open_all_in_private_tabs,
      bookmark_open_all_in_private_tabs_users,
      topsites_open_contile_in_private_tab,
      topsites_open_contile_in_private_tab_users,
      recently_closed_tabs_menu_open_in_private_tab,
      recently_closed_tabs_menu_open_in_private_tab_users,
      etp_setting_changed,
      etp_setting_changed_users,
      etp_settings,
      etp_settings_users,
      etp_shield,
      etp_shield_users,
      etp_tracker_list,
      etp_tracker_list_users,
      exception_added,
      exception_added_users,
      panel_settings,
      panel_settings_users,
      tcp_cfr_explicit_dismissal,
      tcp_cfr_explicit_dismissal_users,
      tcp_cfr_implicit_dismissal,
      tcp_cfr_implicit_dismissal_users,
      tcp_cfr_shown,
      tcp_cfr_shown_users,
      tcp_sumo_link_clicked,
      tcp_sumo_link_clicked_users
    ]
  }
}
