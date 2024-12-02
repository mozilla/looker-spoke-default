include: "//looker-hub/firefox_ios/views/feature_usage_events.view.lkml"

view: firefox_ios_feature_usage_events {
  derived_table: {
    sql:
      SELECT
        submission_date,
        ping_date,
        --autofill_failed
        SUM(logins_autofill_failed_users) AS logins_autofill_failed_users,
        SUM(logins_autofill_failed) AS logins_autofill_failed,
        --logins_autofilled
        SUM(logins_autofilled_users) AS logins_autofilled_users,
        SUM(logins_autofilled) AS logins_autofilled,
        --logins_management_add_tapped
        SUM(logins_management_add_tapped_users) AS logins_management_add_tapped_users,
        SUM(logins_management_add_tapped) AS logins_management_add_tapped,
        --logins_management_logins_tapped
        SUM(logins_management_logins_tapped_users) AS logins_management_logins_tapped_users,
        SUM(logins_management_logins_tapped) AS logins_management_logins_tapped,
        /*Credit Card*/
        --cc_autofill_failed
        SUM(cc_autofill_failed_users) AS cc_autofill_failed_users,
        SUM(cc_autofill_failed) AS cc_autofill_failed,
        --cc_autofill_settings_tapped
        SUM(cc_autofill_settings_tapped_users) AS cc_autofill_settings_tapped_users,
        SUM(cc_autofill_settings_tapped) AS cc_autofill_settings_tapped,
        --cc_autofill_toggle
        SUM(cc_autofill_toggle_users) AS cc_autofill_toggle_users,
        SUM(cc_autofill_toggle) AS cc_autofill_toggle,
        --cc_autofilled
        SUM(cc_autofilled_users) AS cc_autofilled_users,
        SUM(cc_autofilled) AS cc_autofilled,
        --cc_form_detected
        SUM(cc_form_detected_users) AS cc_form_detected_users,
        SUM(cc_form_detected) AS cc_form_detected,
        --cc_sync_toggle
        SUM(cc_sync_toggle_users) AS cc_sync_toggle_users,
        SUM(cc_sync_toggle) AS cc_sync_toggle,
        --cc_autofill_prompt_dismissed
        SUM(cc_autofill_prompt_dismissed_users) AS cc_autofill_prompt_dismissed_users,
        SUM(cc_autofill_prompt_dismissed) AS cc_autofill_prompt_dismissed,
        --cc_autofill_prompt_expanded
        SUM(cc_autofill_prompt_expanded_users) AS cc_autofill_prompt_expanded_users,
        SUM(cc_autofill_prompt_expanded) AS cc_autofill_prompt_expanded,
        --cc_autofill_prompt_shown
        SUM(cc_autofill_prompt_shown_users) AS cc_autofill_prompt_shown_users,
        SUM(cc_autofill_prompt_shown) AS cc_autofill_prompt_shown,
        --cc_management_add_tapped
        SUM(cc_management_add_tapped_users) AS cc_management_add_tapped_users,
        SUM(cc_management_add_tapped) AS cc_management_add_tapped,
        --cc_management_card_tapped
        SUM(cc_management_card_tapped_users) AS cc_management_card_tapped_users,
        SUM(cc_management_card_tapped) AS cc_management_card_tapped,
        --cc_save_prompt_create
        SUM(cc_save_prompt_create_users) AS cc_save_prompt_create_users,
        SUM(cc_save_prompt_create) AS cc_save_prompt_create,
        --cc_save_prompt_shown
        SUM(cc_save_prompt_shown_users) AS cc_save_prompt_shown_users,
        SUM(cc_save_prompt_shown) AS cc_save_prompt_shown,
        --cc_save_prompt_update
        SUM(cc_save_prompt_update_users) AS cc_save_prompt_update_users,
        SUM(cc_save_prompt_update) AS cc_save_prompt_update,
        /*History*/
        --delete_tap
        SUM(history_delete_tap_users) AS history_delete_tap_users,
        SUM(history_delete_tap) AS history_delete_tap,
        --opened
        SUM(history_opened_users) AS history_opened_users,
        SUM(history_opened) AS history_opened,
        --removed
        SUM(history_removed_users) AS history_removed_users,
        SUM(history_removed) AS history_removed,
        --removed_all
        SUM(history_removed_all_users) AS history_removed_all_users,
        SUM(history_removed_all) AS history_removed_all,
        --removed_today
        SUM(history_removed_today_users) AS history_removed_today_users,
        SUM(history_removed_today) AS history_removed_today,
        --removed_today_and_yesterday
        SUM(history_removed_today_and_yesterday_users) AS history_removed_today_and_yesterday_users,
        SUM(history_removed_today_and_yesterday) AS history_removed_today_and_yesterday,
        --search_tap
        SUM(history_search_tap_users) AS history_search_tap_users,
        SUM(history_search_tap) AS history_search_tap,
        --history_opened_item
        SUM(history_opened_item_users) AS history_opened_item_users,
        SUM(history_opened_item) AS history_opened_item,
        /*FxA*/
        --disconnect
        SUM(fxa_disconnect_users) AS fxa_disconnect_users,
        SUM(fxa_disconnect) AS fxa_disconnect,
        --login_completed_view
        SUM(fxa_login_completed_view_users) AS fxa_login_completed_view_users,
        SUM(fxa_login_completed_view) AS fxa_login_completed_view,
        --login_token_view
        SUM(fxa_login_token_view_users) AS fxa_login_token_view_users,
        SUM(fxa_login_token_view) AS fxa_login_token_view,
        --login_view
        SUM(fxa_login_view_users) AS fxa_login_view_users,
        SUM(fxa_login_view) AS fxa_login_view,
        --paired
        SUM(fxa_paired_users) AS fxa_paired_users,
        SUM(fxa_paired) AS fxa_paired,
        --registration_code_view
        SUM(fxa_registration_code_view_users) AS fxa_registration_code_view_users,
        SUM(fxa_registration_code_view) AS fxa_registration_code_view,
        --registration_completed_view
        SUM(fxa_registration_completed_view_users) AS fxa_registration_completed_view_users,
        SUM(fxa_registration_completed_view) AS fxa_registration_completed_view,
        --registration_view
        SUM(fxa_registration_view_users) AS fxa_registration_view_users,
        SUM(fxa_registration_view) AS fxa_registration_view,
        --use_email
        SUM(fxa_use_email_users) AS fxa_use_email_users,
        SUM(fxa_use_email) AS fxa_use_email,
        /*Privacy*/
        --private_browsing_button_tapped
        SUM(private_browsing_button_tapped_users) AS private_browsing_button_tapped_users,
        SUM(private_browsing_button_tapped) AS private_browsing_button_tapped,
        --private_browsing_button_tapped_enter_private_mode
        SUM(private_browsing_button_tapped_enter_private_mode_users) AS private_browsing_button_tapped_enter_private_mode_users,
        SUM(private_browsing_button_tapped_enter_private_mode) AS private_browsing_button_tapped_enter_private_mode,
        --private_browsing_icon_tapped
        SUM(private_browsing_icon_tapped_users) AS private_browsing_icon_tapped_users,
        SUM(private_browsing_icon_tapped) AS private_browsing_icon_tapped,
        --app_icon_new_private_tab_tapped
        SUM(app_icon_new_private_tab_tapped_users) AS app_icon_new_private_tab_tapped_users,
        SUM(app_icon_new_private_tab_tapped) AS app_icon_new_private_tab_tapped,
        --tabs_tray_new_private_tab_tapped
        SUM(tabs_tray_new_private_tab_tapped_users) AS tabs_tray_new_private_tab_tapped_users,
        SUM(tabs_tray_new_private_tab_tapped) AS tabs_tray_new_private_tab_tapped,
        --private_browsing_button_tapped_add
        SUM(private_browsing_button_tapped_add_users) AS private_browsing_button_tapped_add_users,
        SUM(private_browsing_button_tapped_add) AS private_browsing_button_tapped_add,
        --private_browsing_button_tapped_close_all_tabs
        SUM(private_browsing_button_tapped_close_all_tabs_users) AS private_browsing_button_tapped_close_all_tabs_users,
        SUM(private_browsing_button_tapped_close_all_tabs) AS private_browsing_button_tapped_close_all_tabs,
        --private_browsing_button_tapped_done
        SUM(private_browsing_button_tapped_done_users) AS private_browsing_button_tapped_done_users,
        SUM(private_browsing_button_tapped_done) AS private_browsing_button_tapped_done,
        /*Awesomebar Location*/
        --drag_location_bar
        SUM(drag_location_bar_users) AS drag_location_bar_users,
        SUM(drag_location_bar) AS drag_location_bar,
        --location_top
        SUM(location_top_users) AS location_top_users,
        SUM(location_top) AS location_top,
        --location_bottom
        SUM(location_bottom_users) AS location_bottom_users,
        SUM(location_bottom) AS location_bottom,
        /*Notification*/
        --notification_status_authorized
        SUM(notification_status_authorized_users) AS notification_status_authorized_users,
        SUM(notification_status_authorized) AS notification_status_authorized,
        --notification_status_notDetermined
        SUM(notification_status_notDetermined_users) AS notification_status_notDetermined_users,
        SUM(notification_status_notDetermined) AS notification_status_notDetermined,
        --notification_status_denied
        SUM(notification_status_denied_users) AS notification_status_denied_users,
        SUM(notification_status_denied) AS notification_status_denied,
        --notification_alert_setting_not_supported
        SUM(notification_alert_setting_not_supported_users) AS notification_alert_setting_not_supported_users,
        SUM(notification_alert_setting_not_supported) AS notification_alert_setting_not_supported,
        --notification_alert_setting_disabled
        SUM(notification_alert_setting_disabled_users) AS notification_alert_setting_disabled_users,
        SUM(notification_alert_setting_disabled) AS notification_alert_setting_disabled,
        --notification_alert_setting_enabled
        SUM(notification_alert_setting_enabled_users) AS notification_alert_setting_enabled_users,
        SUM(notification_alert_setting_enabled) AS notification_alert_setting_enabled,
        /*address*/
        --address_autofill_prompt_dismissed
        SUM(address_autofill_prompt_dismissed_users) AS address_autofill_prompt_dismissed_users,
        SUM(address_autofill_prompt_dismissed) AS address_autofill_prompt_dismissed,
        --address_autofill_prompt_expanded
        SUM(address_autofill_prompt_expanded_users) AS address_autofill_prompt_expanded_users,
        SUM(address_autofill_prompt_expanded) AS address_autofill_prompt_expanded,
        --address_autofill_prompt_shown
        SUM(address_autofill_prompt_shown_users) AS address_autofill_prompt_shown_users,
        SUM(address_autofill_prompt_shown) AS address_autofill_prompt_shown,
        --address_autofilled
        SUM(address_autofilled_users) AS address_autofilled_users,
        SUM(address_autofilled) AS address_autofilled,
        --address_form_detected
        SUM(address_form_detected_users) AS address_form_detected_users,
        SUM(address_form_detected) AS address_form_detected,
        --address_modified
        SUM(address_modified_users) AS address_modified_users,
        SUM(address_modified) AS address_modified,
        --address_settings_autofill
        SUM(address_settings_autofill_users) AS address_settings_autofill_users,
        SUM(address_settings_autofill) AS address_settings_autofill
      FROM `moz-fx-data-shared-prod.firefox_ios.feature_usage_events`
      WHERE submission_date >= '2018-01-01'
      GROUP BY 1,2 ;;}

  measure: sum_app_icon_new_private_tab_tapped {
    sql: ${TABLE}.app_icon_new_private_tab_tapped ;;
    type: sum
  }

  measure: sum_app_icon_new_private_tab_tapped_users {
    sql: ${TABLE}.app_icon_new_private_tab_tapped_users ;;
    type: sum
  }

  measure: sum_cc_autofill_failed {
    sql: ${TABLE}.cc_autofill_failed ;;
    type: sum
  }

  measure: sum_cc_autofill_failed_users {
    sql: ${TABLE}.cc_autofill_failed_users ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_dismissed {
    sql: ${TABLE}.cc_autofill_prompt_dismissed ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_dismissed_users {
    sql: ${TABLE}.cc_autofill_prompt_dismissed_users ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_expanded {
    sql: ${TABLE}.cc_autofill_prompt_expanded ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_expanded_users {
    sql: ${TABLE}.cc_autofill_prompt_expanded_users ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_shown {
    sql: ${TABLE}.cc_autofill_prompt_shown ;;
    type: sum
  }

  measure: sum_cc_autofill_prompt_shown_users {
    sql: ${TABLE}.cc_autofill_prompt_shown_users ;;
    type: sum
  }

  measure: sum_cc_autofill_settings_tapped {
    sql: ${TABLE}.cc_autofill_settings_tapped ;;
    type: sum
  }

  measure: sum_cc_autofill_settings_tapped_users {
    sql: ${TABLE}.cc_autofill_settings_tapped_users ;;
    type: sum
  }

  measure: sum_cc_autofill_toggle {
    sql: ${TABLE}.cc_autofill_toggle ;;
    type: sum
  }

  measure: sum_cc_autofill_toggle_users {
    sql: ${TABLE}.cc_autofill_toggle_users ;;
    type: sum
  }

  measure: sum_cc_autofilled {
    sql: ${TABLE}.cc_autofilled ;;
    type: sum
  }

  measure: sum_cc_autofilled_users {
    sql: ${TABLE}.cc_autofilled_users ;;
    type: sum
  }

  measure: sum_cc_form_detected {
    sql: ${TABLE}.cc_form_detected ;;
    type: sum
  }

  measure: sum_cc_form_detected_users {
    sql: ${TABLE}.cc_form_detected_users ;;
    type: sum
  }

  measure: sum_cc_management_add_tapped {
    sql: ${TABLE}.cc_management_add_tapped ;;
    type: sum
  }

  measure: sum_cc_management_add_tapped_users {
    sql: ${TABLE}.cc_management_add_tapped_users ;;
    type: sum
  }

  measure: sum_cc_management_card_tapped {
    sql: ${TABLE}.cc_management_card_tapped ;;
    type: sum
  }

  measure: sum_cc_management_card_tapped_users {
    sql: ${TABLE}.cc_management_card_tapped_users ;;
    type: sum
  }

  measure: sum_cc_save_prompt_create {
    sql: ${TABLE}.cc_save_prompt_create ;;
    type: sum
  }

  measure: sum_cc_save_prompt_create_users {
    sql: ${TABLE}.cc_save_prompt_create_users ;;
    type: sum
  }

  measure: sum_cc_save_prompt_shown {
    sql: ${TABLE}.cc_save_prompt_shown ;;
    type: sum
  }

  measure: sum_cc_save_prompt_shown_users {
    sql: ${TABLE}.cc_save_prompt_shown_users ;;
    type: sum
  }

  measure: sum_cc_save_prompt_update {
    sql: ${TABLE}.cc_save_prompt_update ;;
    type: sum
  }

  measure: sum_cc_save_prompt_update_users {
    sql: ${TABLE}.cc_save_prompt_update_users ;;
    type: sum
  }

  measure: sum_cc_sync_toggle {
    sql: ${TABLE}.cc_sync_toggle ;;
    type: sum
  }

  measure: sum_cc_sync_toggle_users {
    sql: ${TABLE}.cc_sync_toggle_users ;;
    type: sum
  }


  measure: sum_drag_location_bar {
    sql: ${TABLE}.drag_location_bar ;;
    type: sum
  }

  measure: sum_drag_location_bar_users {
    sql: ${TABLE}.drag_location_bar_users ;;
    type: sum
  }

  measure: sum_fxa_disconnect {
    sql: ${TABLE}.fxa_disconnect ;;
    type: sum
  }

  measure: sum_fxa_disconnect_users {
    sql: ${TABLE}.fxa_disconnect_users ;;
    type: sum
  }

  measure: sum_fxa_login_completed_view {
    sql: ${TABLE}.fxa_login_completed_view ;;
    type: sum
  }

  measure: sum_fxa_login_completed_view_users {
    sql: ${TABLE}.fxa_login_completed_view_users ;;
    type: sum
  }

  measure: sum_fxa_login_token_view {
    sql: ${TABLE}.fxa_login_token_view ;;
    type: sum
  }

  measure: sum_fxa_login_token_view_users {
    sql: ${TABLE}.fxa_login_token_view_users ;;
    type: sum
  }

  measure: sum_fxa_login_view {
    sql: ${TABLE}.fxa_login_view ;;
    type: sum
  }

  measure: sum_fxa_login_view_users {
    sql: ${TABLE}.fxa_login_view_users ;;
    type: sum
  }

  measure: sum_fxa_paired {
    sql: ${TABLE}.fxa_paired ;;
    type: sum
  }

  measure: sum_fxa_paired_users {
    sql: ${TABLE}.fxa_paired_users ;;
    type: sum
  }

  measure: sum_fxa_registration_code_view {
    sql: ${TABLE}.fxa_registration_code_view ;;
    type: sum
  }

  measure: sum_fxa_registration_code_view_users {
    sql: ${TABLE}.fxa_registration_code_view_users ;;
    type: sum
  }

  measure: sum_fxa_registration_completed_view {
    sql: ${TABLE}.fxa_registration_completed_view ;;
    type: sum
  }

  measure: sum_fxa_registration_completed_view_users {
    sql: ${TABLE}.fxa_registration_completed_view_users ;;
    type: sum
  }

  measure: sum_fxa_registration_view {
    sql: ${TABLE}.fxa_registration_view ;;
    type: sum
  }

  measure: sum_fxa_registration_view_users {
    sql: ${TABLE}.fxa_registration_view_users ;;
    type: sum
  }

  measure: sum_fxa_use_email {
    sql: ${TABLE}.fxa_use_email ;;
    type: sum
  }

  measure: sum_fxa_use_email_users {
    sql: ${TABLE}.fxa_use_email_users ;;
    type: sum
  }

  measure: sum_history_delete_tap {
    sql: ${TABLE}.history_delete_tap ;;
    type: sum
  }

  measure: sum_history_delete_tap_users {
    sql: ${TABLE}.history_delete_tap_users ;;
    type: sum
  }

  measure: sum_history_opened {
    sql: ${TABLE}.history_opened ;;
    type: sum
  }

  measure: sum_history_opened_item {
    sql: ${TABLE}.history_opened_item ;;
    type: sum
  }

  measure: sum_history_opened_item_users {
    sql: ${TABLE}.history_opened_item_users ;;
    type: sum
  }

  measure: sum_history_opened_users {
    sql: ${TABLE}.history_opened_users ;;
    type: sum
  }

  measure: sum_history_removed {
    sql: ${TABLE}.history_removed ;;
    type: sum
  }

  measure: sum_history_removed_all {
    sql: ${TABLE}.history_removed_all ;;
    type: sum
  }

  measure: sum_history_removed_all_users {
    sql: ${TABLE}.history_removed_all_users ;;
    type: sum
  }

  measure: sum_history_removed_today {
    sql: ${TABLE}.history_removed_today ;;
    type: sum
  }

  measure: sum_history_removed_today_and_yesterday {
    sql: ${TABLE}.history_removed_today_and_yesterday ;;
    type: sum
  }

  measure: sum_history_removed_today_and_yesterday_users {
    sql: ${TABLE}.history_removed_today_and_yesterday_users ;;
    type: sum
  }

  measure: sum_history_removed_today_users {
    sql: ${TABLE}.history_removed_today_users ;;
    type: sum
  }

  measure: sum_history_removed_users {
    sql: ${TABLE}.history_removed_users ;;
    type: sum
  }

  measure: sum_history_search_tap {
    sql: ${TABLE}.history_search_tap ;;
    type: sum
  }

  measure: sum_history_search_tap_users {
    sql: ${TABLE}.history_search_tap_users ;;
    type: sum
  }

  measure: sum_location_bottom {
    sql: ${TABLE}.location_bottom ;;
    type: sum
  }

  measure: sum_location_bottom_users {
    sql: ${TABLE}.location_bottom_users ;;
    type: sum
  }

  measure: sum_location_top {
    sql: ${TABLE}.location_top ;;
    type: sum
  }

  measure: sum_location_top_users {
    sql: ${TABLE}.location_top_users ;;
    type: sum
  }

  measure: sum_logins_autofill_failed {
    sql: ${TABLE}.logins_autofill_failed ;;
    type: sum
  }

  measure: sum_logins_autofill_failed_users {
    sql: ${TABLE}.logins_autofill_failed_users ;;
    type: sum
  }

  measure: sum_logins_autofilled {
    sql: ${TABLE}.logins_autofilled ;;
    type: sum
  }

  measure: sum_logins_autofilled_users {
    sql: ${TABLE}.logins_autofilled_users ;;
    type: sum
  }

  measure: sum_logins_management_add_tapped {
    sql: ${TABLE}.logins_management_add_tapped ;;
    type: sum
  }

  measure: sum_logins_management_add_tapped_users {
    sql: ${TABLE}.logins_management_add_tapped_users ;;
    type: sum
  }

  measure: sum_logins_management_logins_tapped {
    sql: ${TABLE}.logins_management_logins_tapped ;;
    type: sum
  }

  measure: sum_logins_management_logins_tapped_users {
    sql: ${TABLE}.logins_management_logins_tapped_users ;;
    type: sum
  }

  measure: sum_notification_alert_setting_disabled {
    sql: ${TABLE}.notification_alert_setting_disabled ;;
    type: sum
  }

  measure: sum_notification_alert_setting_disabled_users {
    sql: ${TABLE}.notification_alert_setting_disabled_users ;;
    type: sum
  }

  measure: sum_notification_alert_setting_enabled {
    sql: ${TABLE}.notification_alert_setting_enabled ;;
    type: sum
  }

  measure: sum_notification_alert_setting_enabled_users {
    sql: ${TABLE}.notification_alert_setting_enabled_users ;;
    type: sum
  }

  measure: sum_notification_alert_setting_not_supported {
    sql: ${TABLE}.notification_alert_setting_not_supported ;;
    type: sum
  }

  measure: sum_notification_alert_setting_not_supported_users {
    sql: ${TABLE}.notification_alert_setting_not_supported_users ;;
    type: sum
  }

  measure: sum_notification_status_authorized {
    sql: ${TABLE}.notification_status_authorized ;;
    type: sum
  }

  measure: sum_notification_status_authorized_users {
    sql: ${TABLE}.notification_status_authorized_users ;;
    type: sum
  }

  measure: sum_notification_status_denied {
    sql: ${TABLE}.notification_status_denied ;;
    type: sum
  }

  measure: sum_notification_status_denied_users {
    sql: ${TABLE}.notification_status_denied_users ;;
    type: sum
  }

  measure: sum_notification_status_notDetermined {
    sql: ${TABLE}.notification_status_notDetermined ;;
    type: sum
  }

  measure: sum_notification_status_notDetermined_users {
    sql: ${TABLE}.notification_status_notDetermined_users ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped {
    sql: ${TABLE}.private_browsing_button_tapped ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_add {
    sql: ${TABLE}.private_browsing_button_tapped_add ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_add_users {
    sql: ${TABLE}.private_browsing_button_tapped_add_users ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_close_all_tabs {
    sql: ${TABLE}.private_browsing_button_tapped_close_all_tabs ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_close_all_tabs_users {
    sql: ${TABLE}.private_browsing_button_tapped_close_all_tabs_users ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_done {
    sql: ${TABLE}.private_browsing_button_tapped_done ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_done_users {
    sql: ${TABLE}.private_browsing_button_tapped_done_users ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_enter_private_mode {
    sql: ${TABLE}.private_browsing_button_tapped_enter_private_mode ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_enter_private_mode_users {
    sql: ${TABLE}.private_browsing_button_tapped_enter_private_mode_users ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped_users {
    sql: ${TABLE}.private_browsing_button_tapped_users ;;
    type: sum
  }

  measure: sum_private_browsing_icon_tapped {
    sql: ${TABLE}.private_browsing_icon_tapped ;;
    type: sum
  }

  measure: sum_private_browsing_icon_tapped_users {
    sql: ${TABLE}.private_browsing_icon_tapped_users ;;
    type: sum
  }

  measure: sum_tabs_tray_new_private_tab_tapped {
    sql: ${TABLE}.tabs_tray_new_private_tab_tapped ;;
    type: sum
  }

  measure: sum_tabs_tray_new_private_tab_tapped_users {
    sql: ${TABLE}.tabs_tray_new_private_tab_tapped_users ;;
    type: sum
  }

  measure: sum_address_autofill_prompt_dismissed {
    sql: ${TABLE}.address_autofill_prompt_dismissed ;;
    type: sum
    }

  measure: sum_address_autofill_prompt_dismissed_users {
    sql: ${TABLE}.address_autofill_prompt_dismissed_users ;;
    type: sum
    }
  measure: sum_address_autofill_prompt_expanded {
    sql: ${TABLE}.address_autofill_prompt_expanded ;;
    type: sum
    }
  measure: sum_address_autofill_prompt_expanded_users {
    sql: ${TABLE}.address_autofill_prompt_expanded_users ;;
    type: sum
    }
  measure: sum_address_autofill_prompt_shown {
    sql: ${TABLE}.address_autofill_prompt_shown ;;
    type: sum
    }
  measure: sum_address_autofill_prompt_shown_users {
    sql: ${TABLE}.address_autofill_prompt_shown_users ;;
    type: sum
    }
  measure: sum_address_autofilled {
    sql: ${TABLE}.address_autofilled ;;
    type: sum
    }
  measure: sum_address_autofilled_users {
    sql: ${TABLE}.address_autofilled_users ;;
    type: sum
    }
  measure: sum_address_form_detected {
    sql: ${TABLE}.address_form_detected ;;
    type: sum
    }
  measure: sum_address_form_detected_users {
    sql: ${TABLE}.address_form_detected_users ;;
    type: sum
    }
  measure: sum_address_modified {
    sql: ${TABLE}.address_modified ;;
    type: sum
    }
  measure: sum_address_modified_users {
    sql: ${TABLE}.address_modified_users ;;
    type: sum
    }
  measure: sum_address_settings_autofill {
    sql: ${TABLE}.address_settings_autofill ;;
    type: sum
    }
  measure: sum_address_settings_autofill_users {
    sql: ${TABLE}.address_settings_autofill_users ;;
    type: sum
    }

  dimension_group: ping {
    sql: ${TABLE}.ping_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

}
