include: "//looker-hub/fenix/views/feature_usage_metrics.view.lkml"

view: +feature_usage_metrics {

  extends: [feature_usage_metrics]

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

  measure: sum_metrics_ping_distinct_client_count {
    sql: ${TABLE}.metrics_ping_distinct_client_count ;;
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
