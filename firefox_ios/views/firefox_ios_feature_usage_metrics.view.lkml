include: "//looker-hub/firefox_ios/views/feature_usage_metrics.view.lkml"

view: +feature_usage_metrics {

  extends: [feature_usage_metrics]

  measure: sum_app_menu_customize_homepage {
    sql: ${TABLE}.app_menu_customize_homepage ;;
    type: sum
  }

  measure: sum_app_menu_customize_homepage_users {
    sql: ${TABLE}.app_menu_customize_homepage_users ;;
    type: sum
  }

  measure: sum_app_opened_as_default_browser {
    sql: ${TABLE}.app_opened_as_default_browser ;;
    type: sum
  }

  measure: sum_app_opened_as_default_browser_users {
    sql: ${TABLE}.app_opened_as_default_browser_users ;;
    type: sum
  }

  measure: sum_bookmarks_add {
    sql: ${TABLE}.bookmarks_add ;;
    type: sum
  }

  measure: sum_bookmarks_add_users {
    sql: ${TABLE}.bookmarks_add_users ;;
    type: sum
  }

  measure: sum_bookmarks_delete {
    sql: ${TABLE}.bookmarks_delete ;;
    type: sum
  }

  measure: sum_bookmarks_delete_users {
    sql: ${TABLE}.bookmarks_delete_users ;;
    type: sum
  }

  measure: sum_bookmarks_edit {
    sql: ${TABLE}.bookmarks_edit ;;
    type: sum
  }

  measure: sum_bookmarks_edit_users {
    sql: ${TABLE}.bookmarks_edit_users ;;
    type: sum
  }

  measure: sum_bookmarks_open {
    sql: ${TABLE}.bookmarks_open ;;
    type: sum
  }

  measure: sum_bookmarks_open_users {
    sql: ${TABLE}.bookmarks_open_users ;;
    type: sum
  }

  measure: sum_bookmarks_view_list {
    sql: ${TABLE}.bookmarks_view_list ;;
    type: sum
  }

  measure: sum_bookmarks_view_list_users {
    sql: ${TABLE}.bookmarks_view_list_users ;;
    type: sum
  }

  measure: sum_credit_card_autofill_enabled {
    sql: ${TABLE}.credit_card_autofill_enabled ;;
    type: sum
  }

  measure: sum_credit_card_autofill_enabled_users {
    sql: ${TABLE}.credit_card_autofill_enabled_users ;;
    type: sum
  }

  measure: sum_credit_card_sync_enabled {
    sql: ${TABLE}.credit_card_sync_enabled ;;
    type: sum
  }

  measure: sum_credit_card_sync_enabled_users {
    sql: ${TABLE}.credit_card_sync_enabled_users ;;
    type: sum
  }

  measure: sum_firefox_home_page_customize_homepage_button {
    sql: ${TABLE}.firefox_home_page_customize_homepage_button ;;
    type: sum
  }

  measure: sum_firefox_home_page_customize_homepage_button_users {
    sql: ${TABLE}.firefox_home_page_customize_homepage_button_users ;;
    type: sum
  }

  measure: sum_has_mobile_bookmarks {
    sql: ${TABLE}.has_mobile_bookmarks ;;
    type: sum
  }

  measure: sum_has_mobile_bookmarks_users {
    sql: ${TABLE}.has_mobile_bookmarks_users ;;
    type: sum
  }

  measure: sum_logins_deleted {
    sql: ${TABLE}.logins_deleted ;;
    type: sum
  }

  measure: sum_logins_deleted_users {
    sql: ${TABLE}.logins_deleted_users ;;
    type: sum
  }

  measure: sum_logins_modified {
    sql: ${TABLE}.logins_modified ;;
    type: sum
  }

  measure: sum_logins_modified_users {
    sql: ${TABLE}.logins_modified_users ;;
    type: sum
  }

  measure: sum_logins_saved {
    sql: ${TABLE}.logins_saved ;;
    type: sum
  }

  measure: sum_logins_saved_all {
    sql: ${TABLE}.logins_saved_all ;;
    type: sum
  }

  measure: sum_logins_saved_all_users {
    sql: ${TABLE}.logins_saved_all_users ;;
    type: sum
  }

  measure: sum_logins_saved_users {
    sql: ${TABLE}.logins_saved_users ;;
    type: sum
  }

  measure: sum_metrics_ping_distinct_client_count {
    sql: ${TABLE}.metrics_ping_distinct_client_count ;;
    type: sum
  }

  measure: sum_mobile_bookmarks_count {
    sql: ${TABLE}.mobile_bookmarks_count ;;
    type: sum
  }

  measure: sum_mobile_bookmarks_count_users {
    sql: ${TABLE}.mobile_bookmarks_count_users ;;
    type: sum
  }

  measure: sum_preferences_close_private_tabs {
    sql: ${TABLE}.preferences_close_private_tabs ;;
    type: sum
  }

  measure: sum_preferences_close_private_tabs_users {
    sql: ${TABLE}.preferences_close_private_tabs_users ;;
    type: sum
  }

  measure: sum_preferences_jump_back_in {
    sql: ${TABLE}.preferences_jump_back_in ;;
    type: sum
  }

  measure: sum_preferences_jump_back_in_users {
    sql: ${TABLE}.preferences_jump_back_in_users ;;
    type: sum
  }

  measure: sum_preferences_pocket {
    sql: ${TABLE}.preferences_pocket ;;
    type: sum
  }

  measure: sum_preferences_pocket_users {
    sql: ${TABLE}.preferences_pocket_users ;;
    type: sum
  }

  measure: sum_preferences_recently_saved {
    sql: ${TABLE}.preferences_recently_saved ;;
    type: sum
  }

  measure: sum_preferences_recently_saved_users {
    sql: ${TABLE}.preferences_recently_saved_users ;;
    type: sum
  }

  measure: sum_preferences_recently_visited {
    sql: ${TABLE}.preferences_recently_visited ;;
    type: sum
  }

  measure: sum_preferences_recently_visited_users {
    sql: ${TABLE}.preferences_recently_visited_users ;;
    type: sum
  }

  measure: sum_preferences_sync_notifs {
    sql: ${TABLE}.preferences_sync_notifs ;;
    type: sum
  }

  measure: sum_preferences_sync_notifs_users {
    sql: ${TABLE}.preferences_sync_notifs_users ;;
    type: sum
  }

  measure: sum_preferences_tips_and_features_notifs {
    sql: ${TABLE}.preferences_tips_and_features_notifs ;;
    type: sum
  }

  measure: sum_preferences_tips_and_features_notifs_users {
    sql: ${TABLE}.preferences_tips_and_features_notifs_users ;;
    type: sum
  }

  measure: sum_settings_menu_set_as_default_browser_pressed {
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed ;;
    type: sum
  }

  measure: sum_settings_menu_set_as_default_browser_pressed_users {
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed_users ;;
    type: sum
  }

  measure: sum_sync_create_account_pressed {
    sql: ${TABLE}.sync_create_account_pressed ;;
    type: sum
  }

  measure: sum_sync_create_account_pressed_users {
    sql: ${TABLE}.sync_create_account_pressed_users ;;
    type: sum
  }

  measure: sum_sync_open_tab {
    sql: ${TABLE}.sync_open_tab ;;
    type: sum
  }

  measure: sum_sync_open_tab_users {
    sql: ${TABLE}.sync_open_tab_users ;;
    type: sum
  }

  measure: sum_sync_sign_in_sync_pressed {
    sql: ${TABLE}.sync_sign_in_sync_pressed ;;
    type: sum
  }

  measure: sum_sync_sign_in_sync_pressed_users {
    sql: ${TABLE}.sync_sign_in_sync_pressed_users ;;
    type: sum
  }

  measure: sum_tabs_inactive_tabs_count {
    sql: ${TABLE}.tabs_inactive_tabs_count ;;
    type: sum
  }

  measure: sum_tabs_inactive_tabs_count_users {
    sql: ${TABLE}.tabs_inactive_tabs_count_users ;;
    type: sum
  }

  measure: sum_tabs_normal_tabs_quantity {
    sql: ${TABLE}.tabs_normal_tabs_quantity ;;
    type: sum
  }

  measure: sum_tabs_normal_tabs_quantity_users {
    sql: ${TABLE}.tabs_normal_tabs_quantity_users ;;
    type: sum
  }

  measure: sum_tabs_private_tabs_quantity {
    sql: ${TABLE}.tabs_private_tabs_quantity ;;
    type: sum
  }

  measure: sum_tabs_private_tabs_quantity_users {
    sql: ${TABLE}.tabs_private_tabs_quantity_users ;;
    type: sum
  }

  measure: sum_tracking_protection_enabled {
    sql: ${TABLE}.tracking_protection_enabled ;;
    type: sum
  }

  measure: sum_tracking_protection_enabled_users {
    sql: ${TABLE}.tracking_protection_enabled_users ;;
    type: sum
  }

  measure: sum_tracking_protection_strict {
    sql: ${TABLE}.tracking_protection_strict ;;
    type: sum
  }

  measure: sum_tracking_protection_strict_users {
    sql: ${TABLE}.tracking_protection_strict_users ;;
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
