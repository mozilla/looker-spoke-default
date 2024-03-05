include: "//looker-hub/fenix/views/feature_usage_events.view.lkml"

view: +feature_usage_events {

  extends: [feature_usage_events]

  measure: sum_app_icon_private_tab_tapped {
    sql: ${TABLE}.app_icon_private_tab_tapped ;;
    type: sum
  }

  measure: sum_app_icon_private_tab_tapped_users {
    sql: ${TABLE}.app_icon_private_tab_tapped_users ;;
    type: sum
  }

  measure: sum_app_menu_customize_homepage {
    sql: ${TABLE}.app_menu_customize_homepage ;;
    type: sum
  }

  measure: sum_app_menu_customize_homepage_users {
    sql: ${TABLE}.app_menu_customize_homepage_users ;;
    type: sum
  }

  measure: sum_autofill_password_detected_logins {
    sql: ${TABLE}.autofill_password_detected_logins ;;
    type: sum
  }

  measure: sum_autofill_password_detected_users_logins {
    sql: ${TABLE}.autofill_password_detected_users_logins ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_sum_address {
    sql: ${TABLE}.autofill_prompt_dismissed_sum_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_sum_cc {
    sql: ${TABLE}.autofill_prompt_dismissed_sum_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_sum_logins {
    sql: ${TABLE}.autofill_prompt_dismissed_sum_logins ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_users_address {
    sql: ${TABLE}.autofill_prompt_dismissed_users_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_users_cc {
    sql: ${TABLE}.autofill_prompt_dismissed_users_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_dismissed_users_logins {
    sql: ${TABLE}.autofill_prompt_dismissed_users_logins ;;
    type: sum
  }

  measure: sum_autofill_prompt_expanded_sum_address {
    sql: ${TABLE}.autofill_prompt_expanded_sum_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_expanded_sum_cc {
    sql: ${TABLE}.autofill_prompt_expanded_sum_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_expanded_users_address {
    sql: ${TABLE}.autofill_prompt_expanded_users_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_expanded_users_cc {
    sql: ${TABLE}.autofill_prompt_expanded_users_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_sum_address {
    sql: ${TABLE}.autofill_prompt_shown_sum_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_sum_cc {
    sql: ${TABLE}.autofill_prompt_shown_sum_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_sum_logins {
    sql: ${TABLE}.autofill_prompt_shown_sum_logins ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_users_address {
    sql: ${TABLE}.autofill_prompt_shown_users_address ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_users_cc {
    sql: ${TABLE}.autofill_prompt_shown_users_cc ;;
    type: sum
  }

  measure: sum_autofill_prompt_shown_users_logins {
    sql: ${TABLE}.autofill_prompt_shown_users_logins ;;
    type: sum
  }

  measure: sum_autofilled_sum_address {
    sql: ${TABLE}.autofilled_sum_address ;;
    type: sum
  }

  measure: sum_autofilled_sum_cc {
    sql: ${TABLE}.autofilled_sum_cc ;;
    type: sum
  }

  measure: sum_autofilled_sum_logins {
    sql: ${TABLE}.autofilled_sum_logins ;;
    type: sum
  }

  measure: sum_autofilled_users_address {
    sql: ${TABLE}.autofilled_users_address ;;
    type: sum
  }

  measure: sum_autofilled_users_cc {
    sql: ${TABLE}.autofilled_users_cc ;;
    type: sum
  }

  measure: sum_autofilled_users_logins {
    sql: ${TABLE}.autofilled_users_logins ;;
    type: sum
  }

  measure: sum_bookmark_copied {
    sql: ${TABLE}.bookmark_copied ;;
    type: sum
  }

  measure: sum_bookmark_copied_users {
    sql: ${TABLE}.bookmark_copied_users ;;
    type: sum
  }

  measure: sum_bookmark_edited {
    sql: ${TABLE}.bookmark_edited ;;
    type: sum
  }

  measure: sum_bookmark_edited_users {
    sql: ${TABLE}.bookmark_edited_users ;;
    type: sum
  }

  measure: sum_bookmark_folder_add {
    sql: ${TABLE}.bookmark_folder_add ;;
    type: sum
  }

  measure: sum_bookmark_folder_add_users {
    sql: ${TABLE}.bookmark_folder_add_users ;;
    type: sum
  }

  measure: sum_bookmark_open {
    sql: ${TABLE}.bookmark_open ;;
    type: sum
  }

  measure: sum_bookmark_open_all_in_new_tabs {
    sql: ${TABLE}.bookmark_open_all_in_new_tabs ;;
    type: sum
  }

  measure: sum_bookmark_open_all_in_new_tabs_users {
    sql: ${TABLE}.bookmark_open_all_in_new_tabs_users ;;
    type: sum
  }

  measure: sum_bookmark_open_all_in_private_tabs {
    sql: ${TABLE}.bookmark_open_all_in_private_tabs ;;
    type: sum
  }

  measure: sum_bookmark_open_all_in_private_tabs_users {
    sql: ${TABLE}.bookmark_open_all_in_private_tabs_users ;;
    type: sum
  }

  measure: sum_bookmark_open_in_new_tab {
    sql: ${TABLE}.bookmark_open_in_new_tab ;;
    type: sum
  }

  measure: sum_bookmark_open_in_new_tab_users {
    sql: ${TABLE}.bookmark_open_in_new_tab_users ;;
    type: sum
  }

  measure: sum_bookmark_open_in_new_tabs {
    sql: ${TABLE}.bookmark_open_in_new_tabs ;;
    type: sum
  }

  measure: sum_bookmark_open_in_new_tabs_users {
    sql: ${TABLE}.bookmark_open_in_new_tabs_users ;;
    type: sum
  }

  measure: sum_bookmark_open_in_private_tab {
    sql: ${TABLE}.bookmark_open_in_private_tab ;;
    type: sum
  }

  measure: sum_bookmark_open_in_private_tab_users {
    sql: ${TABLE}.bookmark_open_in_private_tab_users ;;
    type: sum
  }

  measure: sum_bookmark_open_in_private_tabs {
    sql: ${TABLE}.bookmark_open_in_private_tabs ;;
    type: sum
  }

  measure: sum_bookmark_open_in_private_tabs_users {
    sql: ${TABLE}.bookmark_open_in_private_tabs_users ;;
    type: sum
  }

  measure: sum_bookmark_open_users {
    sql: ${TABLE}.bookmark_open_users ;;
    type: sum
  }

  measure: sum_bookmark_removed {
    sql: ${TABLE}.bookmark_removed ;;
    type: sum
  }

  measure: sum_bookmark_removed_users {
    sql: ${TABLE}.bookmark_removed_users ;;
    type: sum
  }

  measure: sum_bookmark_search_icon_tapped {
    sql: ${TABLE}.bookmark_search_icon_tapped ;;
    type: sum
  }

  measure: sum_bookmark_search_icon_tapped_users {
    sql: ${TABLE}.bookmark_search_icon_tapped_users ;;
    type: sum
  }

  measure: sum_bookmark_search_result_tapped {
    sql: ${TABLE}.bookmark_search_result_tapped ;;
    type: sum
  }

  measure: sum_bookmark_search_result_tapped_users {
    sql: ${TABLE}.bookmark_search_result_tapped_users ;;
    type: sum
  }

  measure: sum_bookmark_shared {
    sql: ${TABLE}.bookmark_shared ;;
    type: sum
  }

  measure: sum_bookmark_shared_users {
    sql: ${TABLE}.bookmark_shared_users ;;
    type: sum
  }

  measure: sum_default_browser_changed {
    sql: ${TABLE}.default_browser_changed ;;
    type: sum
  }

  measure: sum_default_browser_changed_users {
    sql: ${TABLE}.default_browser_changed_users ;;
    type: sum
  }

  measure: sum_etp_setting_changed {
    sql: ${TABLE}.etp_setting_changed ;;
    type: sum
  }

  measure: sum_etp_setting_changed_users {
    sql: ${TABLE}.etp_setting_changed_users ;;
    type: sum
  }

  measure: sum_etp_settings {
    sql: ${TABLE}.etp_settings ;;
    type: sum
  }

  measure: sum_etp_settings_users {
    sql: ${TABLE}.etp_settings_users ;;
    type: sum
  }

  measure: sum_etp_shield {
    sql: ${TABLE}.etp_shield ;;
    type: sum
  }

  measure: sum_etp_shield_users {
    sql: ${TABLE}.etp_shield_users ;;
    type: sum
  }

  measure: sum_etp_tracker_list {
    sql: ${TABLE}.etp_tracker_list ;;
    type: sum
  }

  measure: sum_etp_tracker_list_users {
    sql: ${TABLE}.etp_tracker_list_users ;;
    type: sum
  }

  measure: sum_events_ping_distinct_client_count {
    sql: ${TABLE}.events_ping_distinct_client_count ;;
    type: sum
  }

  measure: sum_form_detected_sum_address {
    sql: ${TABLE}.form_detected_sum_address ;;
    type: sum
  }

  measure: sum_form_detected_sum_cc {
    sql: ${TABLE}.form_detected_sum_cc ;;
    type: sum
  }

  measure: sum_form_detected_users_address {
    sql: ${TABLE}.form_detected_users_address ;;
    type: sum
  }

  measure: sum_form_detected_users_cc {
    sql: ${TABLE}.form_detected_users_cc ;;
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

  measure: sum_history_opened_items_in_new_tabs {
    sql: ${TABLE}.history_opened_items_in_new_tabs ;;
    type: sum
  }

  measure: sum_history_opened_items_in_new_tabs_users {
    sql: ${TABLE}.history_opened_items_in_new_tabs_users ;;
    type: sum
  }

  measure: sum_history_opened_items_in_private_tabs {
    sql: ${TABLE}.history_opened_items_in_private_tabs ;;
    type: sum
  }

  measure: sum_history_opened_items_in_private_tabs_users {
    sql: ${TABLE}.history_opened_items_in_private_tabs_users ;;
    type: sum
  }

  measure: sum_history_opened_users {
    sql: ${TABLE}.history_opened_users ;;
    type: sum
  }

  measure: sum_history_recent_searches_tapped {
    sql: ${TABLE}.history_recent_searches_tapped ;;
    type: sum
  }

  measure: sum_history_recent_searches_tapped_users {
    sql: ${TABLE}.history_recent_searches_tapped_users ;;
    type: sum
  }

  measure: sum_history_remove_prompt_cancelled {
    sql: ${TABLE}.history_remove_prompt_cancelled ;;
    type: sum
  }

  measure: sum_history_remove_prompt_cancelled_users {
    sql: ${TABLE}.history_remove_prompt_cancelled_users ;;
    type: sum
  }

  measure: sum_history_remove_prompt_opened {
    sql: ${TABLE}.history_remove_prompt_opened ;;
    type: sum
  }

  measure: sum_history_remove_prompt_opened_users {
    sql: ${TABLE}.history_remove_prompt_opened_users ;;
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

  measure: sum_history_removed_last_hour {
    sql: ${TABLE}.history_removed_last_hour ;;
    type: sum
  }

  measure: sum_history_removed_last_hour_users {
    sql: ${TABLE}.history_removed_last_hour_users ;;
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

  measure: sum_history_removed_users {
    sql: ${TABLE}.history_removed_users ;;
    type: sum
  }

  measure: sum_history_search_icon_tapped {
    sql: ${TABLE}.history_search_icon_tapped ;;
    type: sum
  }

  measure: sum_history_search_icon_tapped_users {
    sql: ${TABLE}.history_search_icon_tapped_users ;;
    type: sum
  }

  measure: sum_history_search_term_group_open_tab {
    sql: ${TABLE}.history_search_term_group_open_tab ;;
    type: sum
  }

  measure: sum_history_search_term_group_open_tab_users {
    sql: ${TABLE}.history_search_term_group_open_tab_users ;;
    type: sum
  }

  measure: sum_history_search_term_group_remove_all {
    sql: ${TABLE}.history_search_term_group_remove_all ;;
    type: sum
  }

  measure: sum_history_search_term_group_remove_all_users {
    sql: ${TABLE}.history_search_term_group_remove_all_users ;;
    type: sum
  }

  measure: sum_history_search_term_group_remove_tab {
    sql: ${TABLE}.history_search_term_group_remove_tab ;;
    type: sum
  }

  measure: sum_history_search_term_group_remove_tab_users {
    sql: ${TABLE}.history_search_term_group_remove_tab_users ;;
    type: sum
  }

  measure: sum_history_search_term_group_tapped {
    sql: ${TABLE}.history_search_term_group_tapped ;;
    type: sum
  }

  measure: sum_history_search_term_group_tapped_users {
    sql: ${TABLE}.history_search_term_group_tapped_users ;;
    type: sum
  }

  measure: sum_history_shared {
    sql: ${TABLE}.history_shared ;;
    type: sum
  }

  measure: sum_history_shared_users {
    sql: ${TABLE}.history_shared_users ;;
    type: sum
  }

  measure: sum_home_page_customize_home_clicked {
    sql: ${TABLE}.home_page_customize_home_clicked ;;
    type: sum
  }

  measure: sum_home_page_customize_home_clicked_users {
    sql: ${TABLE}.home_page_customize_home_clicked_users ;;
    type: sum
  }

  measure: sum_hp_private_mode_tapped {
    sql: ${TABLE}.hp_private_mode_tapped ;;
    type: sum
  }

  measure: sum_hp_private_mode_tapped_users {
    sql: ${TABLE}.hp_private_mode_tapped_users ;;
    type: sum
  }

  measure: sum_management_add_tapped_sum_address {
    sql: ${TABLE}.management_add_tapped_sum_address ;;
    type: sum
  }

  measure: sum_management_add_tapped_sum_cc {
    sql: ${TABLE}.management_add_tapped_sum_cc ;;
    type: sum
  }

  measure: sum_management_add_tapped_sum_logins {
    sql: ${TABLE}.management_add_tapped_sum_logins ;;
    type: sum
  }

  measure: sum_management_add_tapped_users_address {
    sql: ${TABLE}.management_add_tapped_users_address ;;
    type: sum
  }

  measure: sum_management_add_tapped_users_cc {
    sql: ${TABLE}.management_add_tapped_users_cc ;;
    type: sum
  }

  measure: sum_management_add_tapped_users_logins {
    sql: ${TABLE}.management_add_tapped_users_logins ;;
    type: sum
  }

  measure: sum_management_tapped_sum_address {
    sql: ${TABLE}.management_tapped_sum_address ;;
    type: sum
  }

  measure: sum_management_tapped_sum_cc {
    sql: ${TABLE}.management_tapped_sum_cc ;;
    type: sum
  }

  measure: sum_management_tapped_sum_logins {
    sql: ${TABLE}.management_tapped_sum_logins ;;
    type: sum
  }

  measure: sum_management_tapped_users_address {
    sql: ${TABLE}.management_tapped_users_address ;;
    type: sum
  }

  measure: sum_management_tapped_users_cc {
    sql: ${TABLE}.management_tapped_users_cc ;;
    type: sum
  }

  measure: sum_management_tapped_users_logins {
    sql: ${TABLE}.management_tapped_users_logins ;;
    type: sum
  }

  measure: sum_re_engagement_notif_shown {
    sql: ${TABLE}.re_engagement_notif_shown ;;
    type: sum
  }

  measure: sum_re_engagement_notif_shown_users {
    sql: ${TABLE}.re_engagement_notif_shown_users ;;
    type: sum
  }

  measure: sum_re_engagement_notif_tapped {
    sql: ${TABLE}.re_engagement_notif_tapped ;;
    type: sum
  }

  measure: sum_re_engagement_notif_tapped_users {
    sql: ${TABLE}.re_engagement_notif_tapped_users ;;
    type: sum
  }

  measure: sum_save_prompt_create_sum_cc {
    sql: ${TABLE}.save_prompt_create_sum_cc ;;
    type: sum
  }

  measure: sum_save_prompt_create_users_cc {
    sql: ${TABLE}.save_prompt_create_users_cc ;;
    type: sum
  }

  measure: sum_save_prompt_shown_sum_cc {
    sql: ${TABLE}.save_prompt_shown_sum_cc ;;
    type: sum
  }

  measure: sum_save_prompt_shown_users_cc {
    sql: ${TABLE}.save_prompt_shown_users_cc ;;
    type: sum
  }

  measure: sum_save_prompt_update_sum_cc {
    sql: ${TABLE}.save_prompt_update_sum_cc ;;
    type: sum
  }

  measure: sum_save_prompt_update_users_cc {
    sql: ${TABLE}.save_prompt_update_users_cc ;;
    type: sum
  }

  measure: sum_sync_account_opened {
    sql: ${TABLE}.sync_account_opened ;;
    type: sum
  }

  measure: sum_sync_account_opened_users {
    sql: ${TABLE}.sync_account_opened_users ;;
    type: sum
  }

  measure: sum_sync_account_send_tab {
    sql: ${TABLE}.sync_account_send_tab ;;
    type: sum
  }

  measure: sum_sync_account_send_tab_users {
    sql: ${TABLE}.sync_account_send_tab_users ;;
    type: sum
  }

  measure: sum_sync_account_sign_in_to_send_tab {
    sql: ${TABLE}.sync_account_sign_in_to_send_tab ;;
    type: sum
  }

  measure: sum_sync_account_sign_in_to_send_tab_users {
    sql: ${TABLE}.sync_account_sign_in_to_send_tab_users ;;
    type: sum
  }

  measure: sum_sync_account_sync_now {
    sql: ${TABLE}.sync_account_sync_now ;;
    type: sum
  }

  measure: sum_sync_account_sync_now_users {
    sql: ${TABLE}.sync_account_sync_now_users ;;
    type: sum
  }

  measure: sum_sync_auth_closed {
    sql: ${TABLE}.sync_auth_closed ;;
    type: sum
  }

  measure: sum_sync_auth_closed_users {
    sql: ${TABLE}.sync_auth_closed_users ;;
    type: sum
  }

  measure: sum_sync_auth_opened {
    sql: ${TABLE}.sync_auth_opened ;;
    type: sum
  }

  measure: sum_sync_auth_opened_users {
    sql: ${TABLE}.sync_auth_opened_users ;;
    type: sum
  }

  measure: sum_sync_auth_other_external {
    sql: ${TABLE}.sync_auth_other_external ;;
    type: sum
  }

  measure: sum_sync_auth_other_external_users {
    sql: ${TABLE}.sync_auth_other_external_users ;;
    type: sum
  }

  measure: sum_sync_auth_paired {
    sql: ${TABLE}.sync_auth_paired ;;
    type: sum
  }

  measure: sum_sync_auth_paired_users {
    sql: ${TABLE}.sync_auth_paired_users ;;
    type: sum
  }

  measure: sum_sync_auth_recovered {
    sql: ${TABLE}.sync_auth_recovered ;;
    type: sum
  }

  measure: sum_sync_auth_recovered_users {
    sql: ${TABLE}.sync_auth_recovered_users ;;
    type: sum
  }

  measure: sum_sync_auth_scan_pairing {
    sql: ${TABLE}.sync_auth_scan_pairing ;;
    type: sum
  }

  measure: sum_sync_auth_scan_pairing_users {
    sql: ${TABLE}.sync_auth_scan_pairing_users ;;
    type: sum
  }

  measure: sum_sync_auth_sign_in {
    sql: ${TABLE}.sync_auth_sign_in ;;
    type: sum
  }

  measure: sum_sync_auth_sign_in_users {
    sql: ${TABLE}.sync_auth_sign_in_users ;;
    type: sum
  }

  measure: sum_sync_auth_sign_out {
    sql: ${TABLE}.sync_auth_sign_out ;;
    type: sum
  }

  measure: sum_sync_auth_sign_out_users {
    sql: ${TABLE}.sync_auth_sign_out_users ;;
    type: sum
  }

  measure: sum_sync_auth_sign_up {
    sql: ${TABLE}.sync_auth_sign_up ;;
    type: sum
  }

  measure: sum_sync_auth_sign_up_users {
    sql: ${TABLE}.sync_auth_sign_up_users ;;
    type: sum
  }

  measure: sum_sync_auth_use_email {
    sql: ${TABLE}.sync_auth_use_email ;;
    type: sum
  }

  measure: sum_sync_auth_use_email_problem {
    sql: ${TABLE}.sync_auth_use_email_problem ;;
    type: sum
  }

  measure: sum_sync_auth_use_email_problem_users {
    sql: ${TABLE}.sync_auth_use_email_problem_users ;;
    type: sum
  }

  measure: sum_sync_auth_use_email_users {
    sql: ${TABLE}.sync_auth_use_email_users ;;
    type: sum
  }

  measure: sum_sync_failed {
    sql: ${TABLE}.sync_failed ;;
    type: sum
  }

  measure: sum_sync_failed_users {
    sql: ${TABLE}.sync_failed_users ;;
    type: sum
  }

  measure: sum_tab_tray_private_mode_switched {
    sql: ${TABLE}.tab_tray_private_mode_switched ;;
    type: sum
  }

  measure: sum_tab_tray_private_mode_switched_users {
    sql: ${TABLE}.tab_tray_private_mode_switched_users ;;
    type: sum
  }

  measure: sum_tab_tray_private_mode_tapped {
    sql: ${TABLE}.tab_tray_private_mode_tapped ;;
    type: sum
  }

  measure: sum_tab_tray_private_mode_tapped_users {
    sql: ${TABLE}.tab_tray_private_mode_tapped_users ;;
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
  }
}
