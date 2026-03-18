include: "//looker-hub/fenix/views/feature_usage_metrics.view.lkml"

view: fenix_feature_usage_metrics {
  derived_table: {
    sql:
      SELECT
        submission_date,
        metric_date AS ping_date,
        SUM(logins_deleted_users) AS logins_deleted_users,
        SUM(logins_deleted) AS logins_deleted,
        --logins modified
        SUM(logins_modified_users) AS logins_modified_users,
        SUM(logins_modified) AS logins_modified,
        --logins currently stored
        SUM(currently_stored_logins_users) AS currently_stored_logins_users,
        SUM(currently_stored_logins) AS currently_stored_logins,
        /*Credit Card*/
        --credit card deleted
        SUM(credit_cards_deleted_users) AS credit_cards_deleted_users,
        SUM(credit_cards_deleted) AS credit_cards_deleted,
        --credit card currently stored
        SUM(currently_stored_credit_cards_users) AS currently_stored_credit_cards_users,
        SUM(currently_stored_credit_cards) AS currently_stored_credit_cards,
        /*Address*/
        --address deleted
        SUM(addresses_deleted_users) AS addresses_deleted_users,
        SUM(addresses_deleted) AS addresses_deleted,
        --address modified
        SUM(addresses_modified_users) AS addresses_modified_users,
        SUM(addresses_modified) AS addresses_modified,
        -- addresses currently stored
        SUM(currently_stored_addresses_users) AS currently_stored_addresses_users,
        SUM(currently_stored_addresses) AS currently_stored_addresses,
        /*Bookmark*/
        --bookmarks_add
        SUM(bookmarks_add_users) AS bookmarks_add_users,
        SUM(bookmarks_add) AS bookmarks_add,
        --bookmarks_delete
        SUM(bookmarks_delete_users) AS bookmarks_delete_users,
        SUM(bookmarks_delete) AS bookmarks_delete,
        --bookmarks_edit
        SUM(bookmarks_edit_users) AS bookmarks_edit_users,
        SUM(bookmarks_edit) AS bookmarks_edit,
        --bookmarks_open
        SUM(bookmarks_open_users) AS bookmarks_open_users,
        SUM(bookmarks_open) AS bookmarks_open,
        --metrics_desktop_bookmarks_count
        SUM(metrics_desktop_bookmarks_count_users) AS metrics_desktop_bookmarks_count_users,
        SUM(metrics_desktop_bookmarks_count) AS metrics_desktop_bookmarks_count,
        --metrics_mobile_bookmarks_count
        SUM(metrics_mobile_bookmarks_count_users) AS metrics_mobile_bookmarks_count_users,
        SUM(metrics_mobile_bookmarks_count) AS metrics_mobile_bookmarks_count,
        --metrics_has_desktop_bookmarks
        SUM(metrics_has_desktop_bookmarks_users) AS metrics_has_desktop_bookmarks_users,
        SUM(metrics_has_desktop_bookmarks) AS metrics_has_desktop_bookmarks,
        --metrics_has_mobile_bookmarks
        SUM(metrics_has_mobile_bookmarks_users) AS metrics_has_mobile_bookmarks_users,
        SUM(metrics_has_mobile_bookmarks) AS metrics_has_mobile_bookmarks,
        /*Privacy*/
        --etp_standard
        SUM(etp_standard_users) AS etp_standard_users,
        SUM(etp_standard) AS etp_standard,
        --etp_strict
        SUM(etp_strict_users) AS etp_strict_users,
        SUM(etp_strict) AS etp_strict,
        --etp_custom
        SUM(etp_custom_users) AS etp_custom_users,
        SUM(etp_custom) AS etp_custom,
        --etp_disabled
        SUM(etp_disabled_users) AS etp_disabled_users,
        SUM(etp_disabled) AS etp_disabled,
        /*Tab Count*/
        --metrics_private_tabs_open_count
        SUM(metrics_private_tabs_open_count_users) AS metrics_private_tabs_open_count_users,
        SUM(metrics_private_tabs_open_count) AS metrics_private_tabs_open_count,
        --metrics_tabs_open_count
        SUM(metrics_tabs_open_count_users) AS metrics_tabs_open_count_users,
        SUM(metrics_tabs_open_count) AS metrics_tabs_open_count,
        /*Default Browser*/
        --metrics_default_browser
        SUM(metrics_default_browser_users) AS metrics_default_browser_users,
        SUM(metrics_default_browser) AS metrics_default_browser,
        /*Awesomebar Location*/
        --awesomebar_top
        SUM(awesomebar_top_users) AS awesomebar_top_users,
        --awesomebar_bottom
        SUM(awesomebar_bottom_users) AS awesomebar_bottom_users,
        --awesomebar_null
        SUM(awesomebar_null_users) AS awesomebar_null_users,
        /*Notification*/
        --metrics_notifications_allowed
        SUM(metrics_notifications_allowed_users) AS metrics_notifications_allowed_users,
        SUM(metrics_notifications_allowed) AS metrics_notifications_allowed,
        --events_marketing_notification_allowed
        SUM(events_marketing_notification_allowed_users) AS events_marketing_notification_allowed_users,
        SUM(events_marketing_notification_allowed) AS events_marketing_notification_allowed,
        /*Customize Homepage*/
        --customize_home_contile
        SUM(customize_home_contile_users) AS customize_home_contile_users,
        SUM(customize_home_contile) AS customize_home_contile,
        --customize_home_jump_back_in
        SUM(customize_home_jump_back_in_users) AS customize_home_jump_back_in_users,
        SUM(customize_home_jump_back_in) AS customize_home_jump_back_in,
        --customize_home_most_visited_sites
        SUM(customize_home_most_visited_sites_users) AS customize_home_most_visited_sites_users,
        SUM(customize_home_most_visited_sites) AS customize_home_most_visited_sites,
        --customize_home_pocket
        SUM(customize_home_pocket_users) AS customize_home_pocket_users,
        SUM(customize_home_pocket) AS customize_home_pocket,
        --customize_home_recently_saved
        SUM(customize_home_recently_saved_users) AS customize_home_recently_saved_users,
        SUM(customize_home_recently_saved) AS customize_home_recently_saved,
        --customize_home_recently_visited
        SUM(customize_home_recently_visited_users) AS customize_home_recently_visited_users,
        SUM(customize_home_recently_visited) AS customize_home_recently_visited
      FROM `moz-fx-data-shared-prod.fenix.feature_usage_metrics`
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

  measure: sum_addresses_deleted {
    sql: ${TABLE}.addresses_deleted ;;
    type: sum
  }

  measure: sum_addresses_deleted_users {
    sql: ${TABLE}.addresses_deleted_users ;;
    type: sum
  }

  measure: sum_addresses_modified {
    sql: ${TABLE}.addresses_modified ;;
    type: sum
  }

  measure: sum_addresses_modified_users {
    sql: ${TABLE}.addresses_modified_users ;;
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

  measure: sum_credit_cards_deleted {
    sql: ${TABLE}.credit_cards_deleted ;;
    type: sum
  }

  measure: sum_credit_cards_deleted_users {
    sql: ${TABLE}.credit_cards_deleted_users ;;
    type: sum
  }

  measure: sum_currently_stored_addresses {
    sql: ${TABLE}.currently_stored_addresses ;;
    type: sum
  }

  measure: sum_currently_stored_addresses_users {
    sql: ${TABLE}.currently_stored_addresses_users ;;
    type: sum
  }

  measure: sum_currently_stored_credit_cards {
    sql: ${TABLE}.currently_stored_credit_cards ;;
    type: sum
  }

  measure: sum_currently_stored_credit_cards_users {
    sql: ${TABLE}.currently_stored_credit_cards_users ;;
    type: sum
  }

  measure: sum_currently_stored_logins {
    sql: ${TABLE}.currently_stored_logins ;;
    type: sum
  }

  measure: sum_currently_stored_logins_users {
    sql: ${TABLE}.currently_stored_logins_users ;;
    type: sum
  }

  measure: sum_customize_home_contile {
    sql: ${TABLE}.customize_home_contile ;;
    type: sum
  }

  measure: sum_customize_home_contile_users {
    sql: ${TABLE}.customize_home_contile_users ;;
    type: sum
  }

  measure: sum_customize_home_jump_back_in {
    sql: ${TABLE}.customize_home_jump_back_in ;;
    type: sum
  }

  measure: sum_customize_home_jump_back_in_users {
    sql: ${TABLE}.customize_home_jump_back_in_users ;;
    type: sum
  }

  measure: sum_customize_home_most_visited_sites {
    sql: ${TABLE}.customize_home_most_visited_sites ;;
    type: sum
  }

  measure: sum_customize_home_most_visited_sites_users {
    sql: ${TABLE}.customize_home_most_visited_sites_users ;;
    type: sum
  }

  measure: sum_customize_home_pocket {
    sql: ${TABLE}.customize_home_pocket ;;
    type: sum
  }

  measure: sum_customize_home_pocket_users {
    sql: ${TABLE}.customize_home_pocket_users ;;
    type: sum
  }

  measure: sum_customize_home_recently_saved {
    sql: ${TABLE}.customize_home_recently_saved ;;
    type: sum
  }

  measure: sum_customize_home_recently_saved_users {
    sql: ${TABLE}.customize_home_recently_saved_users ;;
    type: sum
  }

  measure: sum_customize_home_recently_visited {
    sql: ${TABLE}.customize_home_recently_visited ;;
    type: sum
  }

  measure: sum_customize_home_recently_visited_users {
    sql: ${TABLE}.customize_home_recently_visited_users ;;
    type: sum
  }

  measure: sum_etp_custom {
    sql: ${TABLE}.etp_custom ;;
    type: sum
  }

  measure: sum_etp_custom_users {
    sql: ${TABLE}.etp_custom_users ;;
    type: sum
  }

  measure: sum_etp_disabled {
    sql: ${TABLE}.etp_disabled ;;
    type: sum
  }

  measure: sum_etp_disabled_users {
    sql: ${TABLE}.etp_disabled_users ;;
    type: sum
  }

  measure: sum_etp_standard {
    sql: ${TABLE}.etp_standard ;;
    type: sum
  }

  measure: sum_etp_standard_users {
    sql: ${TABLE}.etp_standard_users ;;
    type: sum
  }

  measure: sum_etp_strict {
    sql: ${TABLE}.etp_strict ;;
    type: sum
  }

  measure: sum_etp_strict_users {
    sql: ${TABLE}.etp_strict_users ;;
    type: sum
  }

  measure: sum_events_marketing_notification_allowed {
    sql: ${TABLE}.events_marketing_notification_allowed ;;
    type: sum
  }

  measure: sum_events_marketing_notification_allowed_users {
    sql: ${TABLE}.events_marketing_notification_allowed_users ;;
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

  measure: sum_metrics_default_browser {
    sql: ${TABLE}.metrics_default_browser ;;
    type: sum
  }

  measure: sum_metrics_default_browser_users {
    sql: ${TABLE}.metrics_default_browser_users ;;
    type: sum
  }

  measure: sum_metrics_desktop_bookmarks_count {
    sql: ${TABLE}.metrics_desktop_bookmarks_count ;;
    type: sum
  }

  measure: sum_metrics_desktop_bookmarks_count_users {
    sql: ${TABLE}.metrics_desktop_bookmarks_count_users ;;
    type: sum
  }

  measure: sum_metrics_has_desktop_bookmarks {
    sql: ${TABLE}.metrics_has_desktop_bookmarks ;;
    type: sum
  }

  measure: sum_metrics_has_desktop_bookmarks_users {
    sql: ${TABLE}.metrics_has_desktop_bookmarks_users ;;
    type: sum
  }

  measure: sum_metrics_has_mobile_bookmarks {
    sql: ${TABLE}.metrics_has_mobile_bookmarks ;;
    type: sum
  }

  measure: sum_metrics_has_mobile_bookmarks_users {
    sql: ${TABLE}.metrics_has_mobile_bookmarks_users ;;
    type: sum
  }

  measure: sum_metrics_mobile_bookmarks_count {
    sql: ${TABLE}.metrics_mobile_bookmarks_count ;;
    type: sum
  }

  measure: sum_metrics_mobile_bookmarks_count_users {
    sql: ${TABLE}.metrics_mobile_bookmarks_count_users ;;
    type: sum
  }

  measure: sum_metrics_notifications_allowed {
    sql: ${TABLE}.metrics_notifications_allowed ;;
    type: sum
  }

  measure: sum_metrics_notifications_allowed_users {
    sql: ${TABLE}.metrics_notifications_allowed_users ;;
    type: sum
  }

  measure: sum_metrics_private_tabs_open_count {
    sql: ${TABLE}.metrics_private_tabs_open_count ;;
    type: sum
  }

  measure: sum_metrics_private_tabs_open_count_users {
    sql: ${TABLE}.metrics_private_tabs_open_count_users ;;
    type: sum
  }

  measure: sum_metrics_tabs_open_count {
    sql: ${TABLE}.metrics_tabs_open_count ;;
    type: sum
  }

  measure: sum_metrics_tabs_open_count_users {
    sql: ${TABLE}.metrics_tabs_open_count_users ;;
    type: sum
  }

  measure: sum_awesomebar_top_users {
    sql: ${TABLE}.awesomebar_top_users ;;
    type: sum
  }

  measure: sum_awesomebar_bottom_users {
    sql: ${TABLE}.awesomebar_bottom_users ;;
    type: sum
  }

  measure: sum_awesomebar_null_users {
    sql: ${TABLE}.awesomebar_null_users ;;
    type: sum
  }
}
