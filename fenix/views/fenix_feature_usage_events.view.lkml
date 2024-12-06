include: "//looker-hub/fenix/views/feature_usage_events.view.lkml"

view: fenix_feature_usage_events {
  derived_table: {
    sql:
      SELECT
        submission_date,
        ping_date,
        SUM(app_icon_private_tab_tapped) AS app_icon_private_tab_tapped,
        SUM(app_icon_private_tab_tapped_users) AS app_icon_private_tab_tapped_users,
        SUM(app_menu_customize_homepage) AS app_menu_customize_homepage,
        SUM(app_menu_customize_homepage_users) AS app_menu_customize_homepage_users,
        SUM(autofill_password_detected_logins) AS autofill_password_detected_logins,
        SUM(autofill_password_detected_users_logins) AS autofill_password_detected_users_logins,
        SUM(autofill_prompt_dismissed_sum_address) AS autofill_prompt_dismissed_sum_address,
        SUM(autofill_prompt_dismissed_sum_cc) AS autofill_prompt_dismissed_sum_cc,
        SUM(autofill_prompt_dismissed_sum_logins) AS autofill_prompt_dismissed_sum_logins,
        SUM(autofill_prompt_dismissed_users_address) AS autofill_prompt_dismissed_users_address,
        SUM(autofill_prompt_dismissed_users_cc) AS autofill_prompt_dismissed_users_cc,
        SUM(autofill_prompt_dismissed_users_logins) AS autofill_prompt_dismissed_users_logins,
        SUM(autofill_prompt_expanded_sum_address) AS autofill_prompt_expanded_sum_address,
        SUM(autofill_prompt_expanded_sum_cc) AS autofill_prompt_expanded_sum_cc,
        SUM(autofill_prompt_expanded_users_address) AS autofill_prompt_expanded_users_address,
        SUM(autofill_prompt_expanded_users_cc) AS autofill_prompt_expanded_users_cc,
        SUM(autofill_prompt_shown_sum_address) AS autofill_prompt_shown_sum_address,
        SUM(autofill_prompt_shown_sum_cc) AS autofill_prompt_shown_sum_cc,
        SUM(autofill_prompt_shown_sum_logins) AS autofill_prompt_shown_sum_logins,
        SUM(autofill_prompt_shown_users_address) AS autofill_prompt_shown_users_address,
        SUM(autofill_prompt_shown_users_cc) AS autofill_prompt_shown_users_cc,
        SUM(autofill_prompt_shown_users_logins) AS autofill_prompt_shown_users_logins,
        SUM(autofilled_sum_address) AS autofilled_sum_address,
        SUM(autofilled_sum_cc) AS autofilled_sum_cc,
        SUM(autofilled_sum_logins) AS autofilled_sum_logins,
        SUM(autofilled_users_address) AS autofilled_users_address,
        SUM(autofilled_users_cc) AS autofilled_users_cc,
        SUM(autofilled_users_logins) AS autofilled_users_logins,
        SUM(bookmark_copied) AS bookmark_copied,
        SUM(bookmark_copied_users) AS bookmark_copied_users,
        SUM(bookmark_edited) AS bookmark_edited,
        SUM(bookmark_edited_users) AS bookmark_edited_users,
        SUM(bookmark_folder_add) AS bookmark_folder_add,
        SUM(bookmark_folder_add_users) AS bookmark_folder_add_users,
        SUM(bookmark_open) AS bookmark_open,
        SUM(bookmark_open_all_in_new_tabs) AS bookmark_open_all_in_new_tabs,
        SUM(bookmark_open_all_in_new_tabs_users) AS bookmark_open_all_in_new_tabs_users,
        SUM(bookmark_open_all_in_private_tabs) AS bookmark_open_all_in_private_tabs,
        SUM(bookmark_open_all_in_private_tabs_users) AS bookmark_open_all_in_private_tabs_users,
        SUM(bookmark_open_in_new_tab) AS bookmark_open_in_new_tab,
        SUM(bookmark_open_in_new_tab_users) AS bookmark_open_in_new_tab_users,
        SUM(bookmark_open_in_new_tabs) AS bookmark_open_in_new_tabs,
        SUM(bookmark_open_in_new_tabs_users) AS bookmark_open_in_new_tabs_users,
        SUM(bookmark_open_in_private_tab) AS bookmark_open_in_private_tab,
        SUM(bookmark_open_in_private_tab_users) AS bookmark_open_in_private_tab_users,
        SUM(bookmark_open_in_private_tabs) AS bookmark_open_in_private_tabs,
        SUM(bookmark_open_in_private_tabs_users) AS bookmark_open_in_private_tabs_users,
        SUM(bookmark_open_users) AS bookmark_open_users,
        SUM(bookmark_removed) AS bookmark_removed,
        SUM(bookmark_removed_users) AS bookmark_removed_users,
        SUM(bookmark_search_icon_tapped) AS bookmark_search_icon_tapped,
        SUM(bookmark_search_icon_tapped_users) AS bookmark_search_icon_tapped_users,
        SUM(bookmark_search_result_tapped) AS bookmark_search_result_tapped,
        SUM(bookmark_search_result_tapped_users) AS bookmark_search_result_tapped_users,
        SUM(bookmark_shared) AS bookmark_shared,
        SUM(bookmark_shared_users) AS bookmark_shared_users,
        SUM(default_browser_changed) AS default_browser_changed,
        SUM(default_browser_changed_users) AS default_browser_changed_users,
        SUM(etp_setting_changed) AS etp_setting_changed,
        SUM(etp_setting_changed_users) AS etp_setting_changed_users,
        SUM(etp_settings) AS etp_settings,
        SUM(etp_settings_users) AS etp_settings_users,
        SUM(etp_shield) AS etp_shield,
        SUM(etp_shield_users) AS etp_shield_users,
        SUM(etp_tracker_list) AS etp_tracker_list,
        SUM(etp_tracker_list_users) AS etp_tracker_list_users,
        SUM(form_detected_sum_address) AS form_detected_sum_address,
        SUM(form_detected_sum_cc) AS form_detected_sum_cc,
        SUM(form_detected_users_address) AS form_detected_users_address,
        SUM(form_detected_users_cc) AS form_detected_users_cc,
        SUM(history_opened) AS history_opened,
        SUM(history_opened_item) AS history_opened_item,
        SUM(history_opened_item_users) AS history_opened_item_users,
        SUM(history_opened_items_in_new_tabs) AS history_opened_items_in_new_tabs,
        SUM(history_opened_items_in_new_tabs_users) AS history_opened_items_in_new_tabs_users,
        SUM(history_opened_items_in_private_tabs) AS history_opened_items_in_private_tabs,
        SUM(history_opened_items_in_private_tabs_users) AS history_opened_items_in_private_tabs_users,
        SUM(history_opened_users) AS history_opened_users,
        SUM(history_recent_searches_tapped) AS history_recent_searches_tapped,
        SUM(history_recent_searches_tapped_users) AS history_recent_searches_tapped_users,
        SUM(history_remove_prompt_cancelled) AS history_remove_prompt_cancelled,
        SUM(history_remove_prompt_cancelled_users) AS history_remove_prompt_cancelled_users,
        SUM(history_remove_prompt_opened) AS history_remove_prompt_opened,
        SUM(history_remove_prompt_opened_users) AS history_remove_prompt_opened_users,
        SUM(history_removed) AS history_removed,
        SUM(history_removed_all) AS history_removed_all,
        SUM(history_removed_all_users) AS history_removed_all_users,
        SUM(history_removed_last_hour) AS history_removed_last_hour,
        SUM(history_removed_last_hour_users) AS history_removed_last_hour_users,
        SUM(history_removed_today_and_yesterday) AS history_removed_today_and_yesterday,
        SUM(history_removed_today_and_yesterday_users) AS history_removed_today_and_yesterday_users,
        SUM(history_removed_users) AS history_removed_users,
        SUM(history_search_icon_tapped) AS history_search_icon_tapped,
        SUM(history_search_icon_tapped_users) AS history_search_icon_tapped_users,
        SUM(history_search_term_group_open_tab) AS history_search_term_group_open_tab,
        SUM(history_search_term_group_open_tab_users) AS history_search_term_group_open_tab_users,
        SUM(history_search_term_group_remove_all) AS history_search_term_group_remove_all,
        SUM(history_search_term_group_remove_all_users) AS history_search_term_group_remove_all_users,
        SUM(history_search_term_group_remove_tab) AS history_search_term_group_remove_tab,
        SUM(history_search_term_group_remove_tab_users) AS history_search_term_group_remove_tab_users,
        SUM(history_search_term_group_tapped) AS history_search_term_group_tapped,
        SUM(history_search_term_group_tapped_users) AS history_search_term_group_tapped_users,
        SUM(history_shared) AS history_shared,
        SUM(history_shared_users) AS history_shared_users,
        SUM(home_page_customize_home_clicked) AS home_page_customize_home_clicked,
        SUM(home_page_customize_home_clicked_users) AS home_page_customize_home_clicked_users,
        SUM(hp_private_mode_tapped) AS hp_private_mode_tapped,
        SUM(hp_private_mode_tapped_users) AS hp_private_mode_tapped_users,
        SUM(management_add_tapped_sum_address) AS management_add_tapped_sum_address,
        SUM(management_add_tapped_sum_cc) AS management_add_tapped_sum_cc,
        SUM(management_add_tapped_sum_logins) AS management_add_tapped_sum_logins,
        SUM(management_add_tapped_users_address) AS management_add_tapped_users_address,
        SUM(management_add_tapped_users_cc) AS management_add_tapped_users_cc,
        SUM(management_add_tapped_users_logins) AS management_add_tapped_users_logins,
        SUM(management_tapped_sum_address) AS management_tapped_sum_address,
        SUM(management_tapped_sum_cc) AS management_tapped_sum_cc,
        SUM(management_tapped_sum_logins) AS management_tapped_sum_logins,
        SUM(management_tapped_users_address) AS management_tapped_users_address,
        SUM(management_tapped_users_cc) AS management_tapped_users_cc,
        SUM(management_tapped_users_logins) AS management_tapped_users_logins,
        SUM(modified_sum_cc) AS modified_sum_cc,
        SUM(modified_users_cc) AS modified_users_cc,
        SUM(re_engagement_notif_shown) AS re_engagement_notif_shown,
        SUM(re_engagement_notif_shown_users) AS re_engagement_notif_shown_users,
        SUM(re_engagement_notif_tapped) AS re_engagement_notif_tapped,
        SUM(re_engagement_notif_tapped_users) AS re_engagement_notif_tapped_users,
        SUM(save_prompt_create_sum_cc) AS save_prompt_create_sum_cc,
        SUM(save_prompt_create_users_cc) AS save_prompt_create_users_cc,
        SUM(save_prompt_shown_sum_cc) AS save_prompt_shown_sum_cc,
        SUM(save_prompt_shown_users_cc) AS save_prompt_shown_users_cc,
        SUM(save_prompt_update_sum_cc) AS save_prompt_update_sum_cc,
        SUM(save_prompt_update_users_cc) AS save_prompt_update_users_cc,
        SUM(sync_account_opened) AS sync_account_opened,
        SUM(sync_account_opened_users) AS sync_account_opened_users,
        SUM(sync_account_send_tab) AS sync_account_send_tab,
        SUM(sync_account_send_tab_users) AS sync_account_send_tab_users,
        SUM(sync_account_sign_in_to_send_tab) AS sync_account_sign_in_to_send_tab,
        SUM(sync_account_sign_in_to_send_tab_users) AS sync_account_sign_in_to_send_tab_users,
        SUM(sync_account_sync_now) AS sync_account_sync_now,
        SUM(sync_account_sync_now_users) AS sync_account_sync_now_users,
        SUM(sync_auth_closed) AS sync_auth_closed,
        SUM(sync_auth_closed_users) AS sync_auth_closed_users,
        SUM(sync_auth_opened) AS sync_auth_opened,
        SUM(sync_auth_opened_users) AS sync_auth_opened_users,
        SUM(sync_auth_other_external) AS sync_auth_other_external,
        SUM(sync_auth_other_external_users) AS sync_auth_other_external_users,
        SUM(sync_auth_paired) AS sync_auth_paired,
        SUM(sync_auth_paired_users) AS sync_auth_paired_users,
        SUM(sync_auth_recovered) AS sync_auth_recovered,
        SUM(sync_auth_recovered_users) AS sync_auth_recovered_users,
        SUM(sync_auth_scan_pairing) AS sync_auth_scan_pairing,
        SUM(sync_auth_scan_pairing_users) AS sync_auth_scan_pairing_users,
        SUM(sync_auth_sign_in) AS sync_auth_sign_in,
        SUM(sync_auth_sign_in_users) AS sync_auth_sign_in_users,
        SUM(sync_auth_sign_out) AS sync_auth_sign_out,
        SUM(sync_auth_sign_out_users) AS sync_auth_sign_out_users,
        SUM(sync_auth_sign_up) AS sync_auth_sign_up,
        SUM(sync_auth_sign_up_users) AS sync_auth_sign_up_users,
        SUM(sync_auth_use_email) AS sync_auth_use_email,
        SUM(sync_auth_use_email_problem) AS sync_auth_use_email_problem,
        SUM(sync_auth_use_email_problem_users) AS sync_auth_use_email_problem_users,
        SUM(sync_auth_use_email_users) AS sync_auth_use_email_users,
        SUM(sync_failed) AS sync_failed,
        SUM(sync_failed_users) AS sync_failed_users,
        SUM(tab_tray_private_mode_switched) AS tab_tray_private_mode_switched,
        SUM(tab_tray_private_mode_switched_users) AS tab_tray_private_mode_switched_users,
        SUM(tab_tray_private_mode_tapped) AS tab_tray_private_mode_tapped,
        SUM(tab_tray_private_mode_tapped_users) AS tab_tray_private_mode_tapped_users
      FROM `moz-fx-data-shared-prod.fenix.feature_usage_events`
      WHERE submission_date >= '2021-01-01'
      GROUP BY 1,2 ;;}

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

  measure: sum_modified_sum_cc {
    sql: ${TABLE}.modified_sum_cc ;;
    type: sum
  }

  measure: sum_modified_users_cc {
    sql: ${TABLE}.modified_users_cc ;;
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
}
