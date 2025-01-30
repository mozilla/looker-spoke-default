include: "//looker-hub/firefox_ios/views/feature_usage_metrics.view.lkml"

view: firefox_ios_feature_usage_metrics {
  derived_table: {
    sql:
      SELECT
        submission_date,
        metric_date AS ping_date,
        SUM(logins_deleted_users) AS logins_deleted_users,
        SUM(logins_deleted) AS logins_deleted,
        -- logins_modified
        SUM(logins_modified_users) AS logins_modified_users,
        SUM(logins_modified) AS logins_modified,
        -- logins_saved
        SUM(logins_saved_users) AS logins_saved_users,
        SUM(logins_saved) AS logins_saved,
        -- logins_saved_all
        SUM(logins_saved_all_users) AS logins_saved_all_users,
        SUM(logins_saved_all) AS logins_saved_all,
        /*Credit Card*/
        --credit card autofill enabled
        SUM(credit_card_autofill_enabled_users) AS credit_card_autofill_enabled_users,
        SUM(credit_card_autofill_enabled) AS credit_card_autofill_enabled,
        --credit_card_sync_enabled
        SUM(credit_card_sync_enabled_users) AS credit_card_sync_enabled_users,
        SUM(credit_card_sync_enabled) AS credit_card_sync_enabled,
        --credit_card_deleted
        SUM(credit_card_deleted_users) AS credit_card_deleted_users,
        SUM(credit_card_deleted) AS credit_card_deleted,
        --credit_card_modified
        SUM(credit_card_modified_users) AS credit_card_modified_users,
        SUM(credit_card_modified) AS credit_card_modified,
        --credit_card_saved
        SUM(credit_card_saved_users) AS credit_card_saved_users,
        SUM(credit_card_saved) AS credit_card_saved,
        --credit_card_saved_all
        SUM(credit_card_saved_all_users) AS credit_card_saved_all_users,
        SUM(credit_card_saved_all) AS credit_card_saved_all,
        /*Bookmark*/
        --bookmarks_add
        SUM(bookmarks_add_users) AS bookmarks_add_users,
        SUM(bookmarks_add) AS bookmarks_add,
        -- Bookmarks Delete
        SUM(bookmarks_delete_users) AS bookmarks_delete_users,
        SUM(bookmarks_delete) AS bookmarks_delete,
        -- Bookmarks Edit
        SUM(bookmarks_edit_users) AS bookmarks_edit_users,
        SUM(bookmarks_edit) AS bookmarks_edit,
        -- Has Mobile Bookmarks
        SUM(has_mobile_bookmarks_users) AS has_mobile_bookmarks_users,
        SUM(has_mobile_bookmarks) AS has_mobile_bookmarks,
        -- Mobile Bookmarks Count
        SUM(mobile_bookmarks_count_users) AS mobile_bookmarks_count_users,
        SUM(mobile_bookmarks_count) AS mobile_bookmarks_count,
        -- Bookmarks Open
        SUM(bookmarks_open_users) AS bookmarks_open_users,
        SUM(bookmarks_open) AS bookmarks_open,
        -- Bookmarks View List
        SUM(bookmarks_view_list_users) AS bookmarks_view_list_users,
        SUM(bookmarks_view_list) AS bookmarks_view_list,
        /*FxA*/
        --sync_create_account_pressed
        SUM(sync_create_account_pressed_users) AS sync_create_account_pressed_users,
        SUM(sync_create_account_pressed) AS sync_create_account_pressed,
        --sync_open_tab
        SUM(sync_open_tab_users) AS sync_open_tab_users,
        SUM(sync_open_tab) AS sync_open_tab,
        --sync_sign_in_sync_pressed
        SUM(sync_sign_in_sync_pressed_users) AS sync_sign_in_sync_pressed_users,
        SUM(sync_sign_in_sync_pressed) AS sync_sign_in_sync_pressed,
        /*Privacy*/
        --tabs_private_tabs_quantity
        SUM(tabs_private_tabs_quantity_users) AS tabs_private_tabs_quantity_users,
        SUM(tabs_private_tabs_quantity) AS tabs_private_tabs_quantity,
        -- Preferences Close Private Tabs
        SUM(preferences_close_private_tabs_users) AS preferences_close_private_tabs_users,
        SUM(preferences_close_private_tabs) AS preferences_close_private_tabs,
        -- Tracking Protection Enabled
        SUM(tracking_protection_enabled_users) AS tracking_protection_enabled_users,
        SUM(tracking_protection_enabled) AS tracking_protection_enabled,
        -- Tracking Protection Strict
        SUM(tracking_protection_strict_users) AS tracking_protection_strict_users,
        SUM(tracking_protection_strict) AS tracking_protection_strict,
        /*Tab Count*/
        --tabs_normal_tabs_quantity
        SUM(tabs_normal_tabs_quantity_users) AS tabs_normal_tabs_quantity_users,
        SUM(tabs_normal_tabs_quantity) AS tabs_normal_tabs_quantity,
        --tabs_inactive_tabs_count
        SUM(tabs_inactive_tabs_count_users) AS tabs_inactive_tabs_count_users,
        SUM(tabs_inactive_tabs_count) AS tabs_inactive_tabs_count,
        /*Default Browser*/
        --app_opened_as_default_browser
        SUM(app_opened_as_default_browser_users) AS app_opened_as_default_browser_users,
        SUM(app_opened_as_default_browser) AS app_opened_as_default_browser,
        -- settings_menu_set_as_default_browser_pressed
        SUM(settings_menu_set_as_default_browser_pressed_users) AS settings_menu_set_as_default_browser_pressed_users,
        SUM(settings_menu_set_as_default_browser_pressed) AS settings_menu_set_as_default_browser_pressed,
        /*Notification*/
        --preferences_sync_notifs
        SUM(preferences_sync_notifs_users) AS preferences_sync_notifs_users,
        SUM(preferences_sync_notifs) AS preferences_sync_notifs,
        -- preferences_tips_and_features_notifs
        SUM(preferences_tips_and_features_notifs_users) AS preferences_tips_and_features_notifs_users,
        SUM(preferences_tips_and_features_notifs) AS preferences_tips_and_features_notifs,
        /*Customize Home*/
        --preferences_jump_back_in
        SUM(preferences_jump_back_in_users) AS preferences_jump_back_in_users,
        SUM(preferences_jump_back_in) AS preferences_jump_back_in,
        -- Preferences Recently Visited
        SUM(preferences_recently_visited_users) AS preferences_recently_visited_users,
        SUM(preferences_recently_visited) AS preferences_recently_visited,
        -- Preferences Recently Saved
        SUM(preferences_recently_saved_users) AS preferences_recently_saved_users,
        SUM(preferences_recently_saved) AS preferences_recently_saved,
        -- Preferences Pocket
        SUM(preferences_pocket_users) AS preferences_pocket_users,
        SUM(preferences_pocket) AS preferences_pocket,
        -- App Menu Customize Homepage
        SUM(app_menu_customize_homepage_users) AS app_menu_customize_homepage_users,
        SUM(app_menu_customize_homepage) AS app_menu_customize_homepage,
        -- Firefox Home Page Customize Homepage Button
        SUM(firefox_home_page_customize_homepage_button_users) AS firefox_home_page_customize_homepage_button_users,
        SUM(firefox_home_page_customize_homepage_button) AS firefox_home_page_customize_homepage_button,
        /*Address*/
         --addresses_saved_all_users
        SUM(addresses_saved_all_users) AS addresses_saved_all_users,
        SUM(addresses_saved_all) AS addresses_saved_all

      FROM `moz-fx-data-shared-prod.firefox_ios.feature_usage_metrics`
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

  measure: sum_logins_deleted_users {
    type: sum
    sql: ${TABLE}.logins_deleted_users ;;
  }
  measure: sum_logins_deleted {
    type: sum
    sql: ${TABLE}.logins_deleted ;;
  }

  measure: sum_logins_modified_users {
    type: sum
    sql: ${TABLE}.logins_modified_users ;;
  }
  measure: sum_logins_modified {
    type: sum
    sql: ${TABLE}.logins_modified ;;
  }

  measure: sum_logins_saved_users {
    type: sum
    sql: ${TABLE}.logins_saved_users ;;
  }
  measure: sum_logins_saved {
    type: sum
    sql: ${TABLE}.logins_saved ;;
  }

  measure: sum_logins_saved_all_users {
    type: sum
    sql: ${TABLE}.logins_saved_all_users ;;
  }
  measure: sum_logins_saved_all {
    type: sum
    sql: ${TABLE}.logins_saved_all ;;
  }

  measure: sum_credit_card_autofill_enabled_users {
    type: sum
    sql: ${TABLE}.credit_card_autofill_enabled_users ;;
  }
  measure: sum_credit_card_autofill_enabled {
    type: sum
    sql: ${TABLE}.credit_card_autofill_enabled ;;
  }

  measure: sum_credit_card_sync_enabled_users {
    type: sum
    sql: ${TABLE}.credit_card_sync_enabled_users ;;
  }
  measure: sum_credit_card_sync_enabled {
    type: sum
    sql: ${TABLE}.credit_card_sync_enabled ;;
  }

  measure: sum_credit_card_deleted_users {
    type: sum
    sql: ${TABLE}.credit_card_deleted_users ;;
  }
  measure: sum_credit_card_deleted {
    type: sum
    sql: ${TABLE}.credit_card_deleted ;;
  }

  measure: sum_credit_card_modified_users {
    type: sum
    sql: ${TABLE}.credit_card_modified_users ;;
  }
  measure: sum_credit_card_modified {
    type: sum
    sql: ${TABLE}.credit_card_modified ;;
  }

  measure: sum_credit_card_saved_users {
    type: sum
    sql: ${TABLE}.credit_card_saved_users ;;
  }
  measure: sum_credit_card_saved {
    type: sum
    sql: ${TABLE}.credit_card_saved ;;
  }

  measure: sum_credit_card_saved_all_users {
    type: sum
    sql: ${TABLE}.credit_card_saved_all_users ;;
  }
  measure: sum_credit_card_saved_all {
    type: sum
    sql: ${TABLE}.credit_card_saved_all ;;
  }

  measure: sum_bookmarks_add_users {
    type: sum
    sql: ${TABLE}.bookmarks_add_users ;;
  }
  measure: sum_bookmarks_add {
    type: sum
    sql: ${TABLE}.bookmarks_add ;;
  }

  measure: sum_bookmarks_delete_users {
    type: sum
    sql: ${TABLE}.bookmarks_delete_users ;;
  }
  measure: sum_bookmarks_delete {
    type: sum
    sql: ${TABLE}.bookmarks_delete ;;
  }

  measure: sum_bookmarks_edit_users {
    type: sum
    sql: ${TABLE}.bookmarks_edit_users ;;
  }
  measure: sum_bookmarks_edit {
    type: sum
    sql: ${TABLE}.bookmarks_edit ;;
  }

  measure: sum_has_mobile_bookmarks_users {
    type: sum
    sql: ${TABLE}.has_mobile_bookmarks_users ;;
  }
  measure: sum_has_mobile_bookmarks {
    type: sum
    sql: ${TABLE}.has_mobile_bookmarks ;;
  }

  measure: sum_mobile_bookmarks_count_users {
    type: sum
    sql: ${TABLE}.mobile_bookmarks_count_users ;;
  }
  measure: sum_mobile_bookmarks_count {
    type: sum
    sql: ${TABLE}.mobile_bookmarks_count ;;
  }

  measure: sum_bookmarks_open_users {
    type: sum
    sql: ${TABLE}.bookmarks_open_users ;;
  }
  measure: sum_bookmarks_open {
    type: sum
    sql: ${TABLE}.bookmarks_open ;;
  }

  measure: sum_bookmarks_view_list_users {
    type: sum
    sql: ${TABLE}.bookmarks_view_list_users ;;
  }
  measure: sum_bookmarks_view_list {
    type: sum
    sql: ${TABLE}.bookmarks_view_list ;;
  }

  measure: sum_sync_create_account_pressed_users {
    type: sum
    sql: ${TABLE}.sync_create_account_pressed_users ;;
  }
  measure: sum_sync_create_account_pressed {
    type: sum
    sql: ${TABLE}.sync_create_account_pressed ;;
  }

  measure: sum_sync_open_tab_users {
    type: sum
    sql: ${TABLE}.sync_open_tab_users ;;
  }
  measure: sum_sync_open_tab {
    type: sum
    sql: ${TABLE}.sync_open_tab ;;
  }

  measure: sum_sync_sign_in_sync_pressed_users {
    type: sum
    sql: ${TABLE}.sync_sign_in_sync_pressed_users ;;
  }
  measure: sum_sync_sign_in_sync_pressed {
    type: sum
    sql: ${TABLE}.sync_sign_in_sync_pressed ;;
  }

  measure: sum_tabs_private_tabs_quantity_users {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity_users ;;
  }
  measure: sum_tabs_private_tabs_quantity {
    type: sum
    sql: ${TABLE}.tabs_private_tabs_quantity ;;
  }

  measure: sum_preferences_close_private_tabs_users {
    type: sum
    sql: ${TABLE}.preferences_close_private_tabs_users ;;
  }
  measure: sum_preferences_close_private_tabs {
    type: sum
    sql: ${TABLE}.preferences_close_private_tabs ;;
  }

  measure: sum_tracking_protection_enabled_users {
    type: sum
    sql: ${TABLE}.tracking_protection_enabled_users ;;
  }
  measure: sum_tracking_protection_enabled {
    type: sum
    sql: ${TABLE}.tracking_protection_enabled ;;
  }

  measure: sum_tracking_protection_strict_users {
    type: sum
    sql: ${TABLE}.tracking_protection_strict_users ;;
  }
  measure: sum_tracking_protection_strict_enabled {
    type: sum
    sql: ${TABLE}.tracking_protection_strict_enabled ;;
  }

  measure: sum_tabs_normal_tabs_quantity_users {
    type: sum
    sql: ${TABLE}.tabs_normal_tabs_quantity_users ;;
  }
  measure: sum_tabs_normal_tabs_quantity {
    type: sum
    sql: ${TABLE}.tabs_normal_tabs_quantity ;;
  }

  measure: sum_tabs_inactive_tabs_count_users {
    type: sum
    sql: ${TABLE}.tabs_inactive_tabs_count_users ;;
  }
  measure: sum_tabs_inactive_tabs_count {
    type: sum
    sql: ${TABLE}.tabs_inactive_tabs_count ;;
  }

  measure: sum_app_opened_as_default_browser_users {
    type: sum
    sql: ${TABLE}.app_opened_as_default_browser_users ;;
  }
  measure: sum_app_opened_as_default_browser {
    type: sum
    sql: ${TABLE}.app_opened_as_default_browser ;;
  }

  measure: sum_settings_menu_set_as_default_browser_pressed_users {
    type: sum
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed_users ;;
  }
  measure: sum_settings_menu_set_as_default_browser_pressed {
    type: sum
    sql: ${TABLE}.settings_menu_set_as_default_browser_pressed ;;
  }

  measure: sum_preferences_sync_notifs_users {
    type: sum
    sql: ${TABLE}.preferences_sync_notifs_users ;;
  }
  measure: sum_preferences_sync_notifs {
    type: sum
    sql: ${TABLE}.preferences_sync_notifs ;;
  }

  measure: sum_preferences_tips_and_features_notifs_users {
    type: sum
    sql: ${TABLE}.preferences_tips_and_features_notifs_users ;;
  }
  measure: sum_preferences_tips_and_features_notifs {
    type: sum
    sql: ${TABLE}.preferences_tips_and_features_notifs ;;
  }

  measure: sum_preferences_jump_back_in_users {
    type: sum
    sql: ${TABLE}.preferences_jump_back_in_users ;;
  }
  measure: sum_preferences_jump_back_in {
    type: sum
    sql: ${TABLE}.preferences_jump_back_in ;;
  }

  measure: sum_preferences_recently_visited_users {
    type: sum
    sql: ${TABLE}.preferences_recently_visited_users ;;
  }
  measure: sum_preferences_recently_visited {
    type: sum
    sql: ${TABLE}.preferences_recently_visited ;;
  }

  measure: sum_preferences_recently_saved_users {
    type: sum
    sql: ${TABLE}.preferences_recently_saved_users ;;
  }
  measure: sum_preferences_recently_saved {
    type: sum
    sql: ${TABLE}.preferences_recently_saved ;;
  }

  measure: sum_preferences_pocket_users {
    type: sum
    sql: ${TABLE}.preferences_pocket_users ;;
  }
  measure: sum_preferences_pocket {
    type: sum
    sql: ${TABLE}.preferences_pocket ;;
  }

  measure: sum_app_menu_customize_homepage_users {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage_users ;;
  }
  measure: sum_app_menu_customize_homepage {
    type: sum
    sql: ${TABLE}.app_menu_customize_homepage ;;
  }

  measure: sum_firefox_home_page_customize_homepage_button_users {
    type: sum
    sql: ${TABLE}.firefox_home_page_customize_homepage_button_users ;;
  }
  measure: sum_firefox_home_page_customize_homepage_button {
    type: sum
    sql: ${TABLE}.firefox_home_page_customize_homepage_button ;;
  }

  measure: sum_addresses_saved_all_users {
    type: sum
    sql: ${TABLE}.addresses_saved_all_users ;;
    }
  measure: sum_addresses_saved_all {
    type: sum
    sql: ${TABLE}.addresses_saved_all ;;
    }

}
