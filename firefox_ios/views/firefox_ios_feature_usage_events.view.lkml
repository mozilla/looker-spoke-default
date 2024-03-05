include: "//looker-hub/firefox_ios/views/feature_usage_events.view.lkml"

view: +feature_usage_events {

  extends: [feature_usage_events]

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

  measure: sum_cc_save_prompt_create {
    sql: ${TABLE}.cc_save_prompt_create ;;
    type: sum
  }

  measure: sum_cc_save_prompt_create_users {
    sql: ${TABLE}.cc_save_prompt_create_users ;;
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

  measure: sum_events_ping_distinct_client_count {
    sql: ${TABLE}.events_ping_distinct_client_count ;;
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

  measure: sum_notification_alert_setting_enabled {
    sql: ${TABLE}.notification_alert_setting_enabled ;;
    type: sum
  }

  measure: sum_notification_alert_setting_not_supported {
    sql: ${TABLE}.notification_alert_setting_not_supported ;;
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

  measure: sum_notification_status_notDetermined {
    sql: ${TABLE}.notification_status_notDetermined ;;
    type: sum
  }

  measure: sum_private_browsing_button_tapped {
    sql: ${TABLE}.private_browsing_button_tapped ;;
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
  }}
