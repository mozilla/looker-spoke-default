include: "//looker-hub/firefox_ios/views/events_unnested.view.lkml"


view: firefox_ios_feature_usage_events_not_added {
  derived_table: {
    sql:
      WITH _events_ping_distinct_client_count AS (
  SELECT
    DATE(submission_timestamp) AS submission_date,
    COUNT(DISTINCT client_info.client_id) AS events_ping_distinct_client_count
  FROM
    `mozdata.firefox_ios.events_unnested`
  WHERE
    DATE(submission_timestamp) >= '2023-06-01'
  GROUP BY
    submission_date
),

client_product_feature_usage AS
(SELECT
client_info.client_id,
DATE(submission_timestamp) AS submission_date,
/*Credit Card*/
COUNTIF(event_category = 'credit_card' AND event_name = 'autofill_prompt_dismissed') AS cc_autofill_prompt_dismissed,
COUNTIF(event_category = 'credit_card' AND event_name = 'autofill_prompt_expanded') AS cc_autofill_prompt_expanded,
COUNTIF(event_category = 'credit_card' AND event_name = 'autofill_prompt_shown') AS cc_autofill_prompt_shown,
COUNTIF(event_category = 'credit_card' AND event_name = 'autofilled') AS cc_autofilled, --added already
COUNTIF(event_category = 'credit_card' AND event_name = 'form_detected') AS cc_form_detected, --added already
COUNTIF(event_category = 'credit_card' AND event_name = 'management_add_tapped') AS cc_management_add_tapped,
COUNTIF(event_category = 'credit_card' AND event_name = 'management_card_tapped') AS cc_management_card_tapped,
COUNTIF(event_category = 'credit_card' AND event_name = 'save_prompt_create') AS cc_save_prompt_create,
COUNTIF(event_category = 'credit_card' AND event_name = 'save_prompt_shown') AS cc_save_prompt_shown,
COUNTIF(event_category = 'credit_card' AND event_name = 'save_prompt_update') AS cc_save_prompt_update,

/*History*/
COUNTIF(event_category = 'history' AND event_name = 'opened') AS history_opened, --added already
COUNTIF(event_category = 'history' AND event_name = 'opened_item') AS history_opened_item,

/*Privacy*/
COUNTIF(event_category = 'tabs_tray' AND event_name = 'private_browsing_icon_tapped') AS private_browsing_icon_tapped, --added already
COUNTIF(event_category = 'tabs_tray' AND event_name = 'private_browsing_icon_tapped' AND extra.value = 'add') AS private_browsing_button_tapped_add,
COUNTIF(event_category = 'tabs_tray' AND event_name = 'private_browsing_icon_tapped' AND extra.value = 'close_all_tabs') AS private_browsing_button_tapped_close_all_tabs,
COUNTIF(event_category = 'tabs_tray' AND event_name = 'private_browsing_icon_tapped' AND extra.value = 'done') AS private_browsing_button_tapped_done,

/*Notification*/
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'status' AND extra.value = 'authorized') AS notification_status_authorized,
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'status' AND extra.value = 'notDetermined') AS notification_status_notDetermined,
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'status' AND extra.value = 'denied') AS notification_status_denied,
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'alert_setting' AND extra.value = 'notSupported') AS notification_alert_setting_not_supported,
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'alert_setting' AND extra.value = 'disabled') AS notification_alert_setting_disabled,
COUNTIF(event_category = 'app' AND event_name = 'notification_permission' AND extra.key = 'alert_setting' AND extra.value = 'enabled') AS notification_alert_setting_enabled
FROM `mozdata.firefox_ios.events_unnested`
LEFT JOIN
    UNNEST(event_extra) AS extra
WHERE DATE(submission_timestamp) >= '2023-06-01'
GROUP BY
    client_info.client_id,
    submission_date),


product_features_agg AS (
  SELECT
    submission_date,
    /*Credit Card*/
    SUM(cc_autofill_prompt_dismissed) AS cc_autofill_prompt_dismissed,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_autofill_prompt_dismissed > 0
          THEN client_id
      END
    ) AS cc_autofill_prompt_dismissed_users,
    SUM(cc_autofill_prompt_expanded) AS cc_autofill_prompt_expanded,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_autofill_prompt_expanded > 0
          THEN client_id
      END
    ) AS cc_autofill_prompt_expanded_users,
    SUM(cc_autofill_prompt_shown) AS cc_autofill_prompt_shown,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_autofill_prompt_shown > 0
          THEN client_id
      END
    ) AS cc_autofill_prompt_shown_users,
    SUM(cc_autofilled) AS cc_autofilled,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_autofilled > 0
          THEN client_id
      END
    ) AS cc_autofilled_users,
    SUM(cc_form_detected) AS cc_form_detected,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_form_detected > 0
          THEN client_id
      END
    ) AS cc_form_detected_users,
    SUM(cc_management_add_tapped) AS cc_management_add_tapped,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_management_add_tapped > 0
          THEN client_id
      END
    ) AS cc_management_add_tapped_users,
    SUM(cc_management_card_tapped) AS cc_management_card_tapped,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_management_card_tapped > 0
          THEN client_id
      END
    ) AS cc_management_card_tapped_users,
    SUM(cc_save_prompt_create) AS cc_save_prompt_create,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_save_prompt_create > 0
          THEN client_id
      END
    ) AS cc_save_prompt_create_users,
    SUM(cc_save_prompt_shown) AS cc_save_prompt_shown,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_save_prompt_shown > 0
          THEN client_id
      END
    ) AS cc_save_prompt_shown_users,
    SUM(cc_save_prompt_update) AS cc_save_prompt_update,
    COUNT(
      DISTINCT
      CASE
        WHEN cc_save_prompt_update > 0
          THEN client_id
      END
    ) AS cc_save_prompt_update_users,

    /*History*/
    SUM(history_opened) AS history_opened,
    COUNT(
      DISTINCT
      CASE
        WHEN history_opened > 0
          THEN client_id
      END
    ) AS history_opened_users,
    SUM(history_opened_item) AS history_opened_item,
    COUNT(
      DISTINCT
      CASE
        WHEN history_opened_item > 0
          THEN client_id
      END
    ) AS history_opened_item_users,

    /*Privacy*/
    SUM(private_browsing_icon_tapped) AS private_browsing_icon_tapped,
    COUNT(
      DISTINCT
      CASE
        WHEN private_browsing_icon_tapped > 0
          THEN client_id
      END
    ) AS private_browsing_icon_tapped_users,
    SUM(private_browsing_button_tapped_add) AS private_browsing_button_tapped_add,
    COUNT(
      DISTINCT
      CASE
        WHEN private_browsing_button_tapped_add > 0
          THEN client_id
      END
    ) AS private_browsing_button_tapped_add_users,
    SUM(private_browsing_button_tapped_close_all_tabs) AS private_browsing_button_tapped_close_all_tabs,
    COUNT(
      DISTINCT
      CASE
        WHEN private_browsing_button_tapped_close_all_tabs > 0
          THEN client_id
      END
    ) AS private_browsing_button_tapped_close_all_tabs_users,
    SUM(private_browsing_button_tapped_done) AS private_browsing_button_tapped_done,
    COUNT(
      DISTINCT
      CASE
        WHEN private_browsing_button_tapped_done > 0
          THEN client_id
      END
    ) AS private_browsing_button_tapped_done_users,


    /*Notification*/
    SUM(notification_status_authorized) AS notification_status_authorized,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_status_authorized > 0
          THEN client_id
      END
    ) AS notification_status_authorized_users,
    SUM(notification_status_notDetermined) AS notification_status_notDetermined,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_status_notDetermined > 0
          THEN client_id
      END
    ) AS notification_status_notDetermined_users,
    SUM(notification_status_denied) AS notification_status_denied,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_status_denied > 0
          THEN client_id
      END
    ) AS notification_status_denied_users,
    SUM(notification_alert_setting_not_supported) AS notification_alert_setting_not_supported,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_alert_setting_not_supported > 0
          THEN client_id
      END
    ) AS notification_alert_setting_not_supported_users,
    SUM(notification_alert_setting_disabled) AS notification_alert_setting_disabled,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_alert_setting_disabled > 0
          THEN client_id
      END
    ) AS notification_alert_setting_disabled_users,
    SUM(notification_alert_setting_enabled) AS notification_alert_setting_enabled,
    COUNT(
      DISTINCT
      CASE
        WHEN notification_alert_setting_enabled > 0
          THEN client_id
      END
    ) AS notification_alert_setting_enabled_users
  FROM
    client_product_feature_usage
  GROUP BY
    submission_date
)

SELECT
  submission_date,
  events_ping_distinct_client_count,
  /*Credit Card*/
  cc_autofill_prompt_dismissed,
  cc_autofill_prompt_dismissed_users,
  cc_autofill_prompt_expanded,
  cc_autofill_prompt_expanded_users,
  cc_autofill_prompt_shown,
  cc_autofill_prompt_shown_users,
  cc_autofilled,
  cc_autofilled_users,
  cc_form_detected,
  cc_form_detected_users,
  cc_management_add_tapped,
  cc_management_add_tapped_users,
  cc_management_card_tapped,
  cc_management_card_tapped_users,
  cc_save_prompt_create,
  cc_save_prompt_create_users,
  cc_save_prompt_shown,
  cc_save_prompt_shown_users,
  cc_save_prompt_update,
  cc_save_prompt_update_users,
  /*History*/
  history_opened,
  history_opened_users,
  history_opened_item,
  history_opened_item_users,
  /*Privacy*/
  private_browsing_icon_tapped,
  private_browsing_icon_tapped_users,
  private_browsing_button_tapped_add,
  private_browsing_button_tapped_add_users,
  private_browsing_button_tapped_close_all_tabs,
  private_browsing_button_tapped_close_all_tabs_users,
  private_browsing_button_tapped_done,
  private_browsing_button_tapped_done_users,
  /*Notification*/
  notification_status_authorized,
  notification_status_authorized_users,
  notification_status_notDetermined,
  notification_status_notDetermined_users,
  notification_status_denied,
  notification_status_denied_users,
  notification_alert_setting_not_supported,
  notification_alert_setting_not_supported_users,
  notification_alert_setting_disabled,
  notification_alert_setting_disabled_users,
  notification_alert_setting_enabled,
  notification_alert_setting_enabled_users
FROM
  _events_ping_distinct_client_count
JOIN
  product_features_agg
USING
  (submission_date)
 ;;}


  dimension: submission_date {
    type: date
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }

  measure: events_ping_distinct_client_count {
    type: sum
    sql: ${TABLE}.events_ping_distinct_client_count ;;
  }

  measure: cc_autofill_prompt_dismissed {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_dismissed ;;
  }

  measure: cc_autofill_prompt_dismissed_users {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_dismissed_users ;;
  }

  measure: cc_autofill_prompt_expanded {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_expanded ;;
  }

  measure: cc_autofill_prompt_expanded_users {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_expanded_users ;;
  }

  measure: cc_autofill_prompt_shown {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_shown ;;
  }

  measure: cc_autofill_prompt_shown_users {
    type: sum
    sql: ${TABLE}.cc_autofill_prompt_shown_users ;;
  }

  measure: cc_autofilled {
    type: sum
    sql: ${TABLE}.cc_autofilled ;;
  }

  measure: cc_autofilled_users {
    type: sum
    sql: ${TABLE}.cc_autofilled_users ;;
  }

  measure: cc_form_detected {
    type: sum
    sql: ${TABLE}.cc_form_detected ;;
  }

  measure: cc_form_detected_users {
    type: sum
    sql: ${TABLE}.cc_form_detected_users ;;
  }

  measure: cc_management_add_tapped {
    type: sum
    sql: ${TABLE}.cc_management_add_tapped ;;
  }

  measure: cc_management_add_tapped_users {
    type: sum
    sql: ${TABLE}.cc_management_add_tapped_users ;;
  }

  measure: cc_management_card_tapped {
    type: sum
    sql: ${TABLE}.cc_management_card_tapped ;;
  }

  measure: cc_management_card_tapped_users {
    type: sum
    sql: ${TABLE}.cc_management_card_tapped_users ;;
  }

  measure: cc_save_prompt_create {
    type: sum
    sql: ${TABLE}.cc_save_prompt_create ;;
  }

  measure: cc_save_prompt_create_users {
    type: sum
    sql: ${TABLE}.cc_save_prompt_create_users ;;
  }

  measure: cc_save_prompt_shown {
    type: sum
    sql: ${TABLE}.cc_save_prompt_shown ;;
  }

  measure: cc_save_prompt_shown_users {
    type: sum
    sql: ${TABLE}.cc_save_prompt_shown_users ;;
  }

  measure: cc_save_prompt_update {
    type: sum
    sql: ${TABLE}.cc_save_prompt_update ;;
  }

  measure: cc_save_prompt_update_users {
    type: sum
    sql: ${TABLE}.cc_save_prompt_update_users ;;
  }

  measure: history_opened {
    type: sum
    sql: ${TABLE}.history_opened ;;
  }

  measure: history_opened_users {
    type: sum
    sql: ${TABLE}.history_opened_users ;;
  }

  measure: history_opened_item {
    type: sum
    sql: ${TABLE}.history_opened_item ;;
  }

  measure: history_opened_item_users {
    type: sum
    sql: ${TABLE}.history_opened_item_users ;;
  }

  measure: private_browsing_icon_tapped {
    type: sum
    sql: ${TABLE}.private_browsing_icon_tapped ;;
  }

  measure: private_browsing_icon_tapped_users {
    type: sum
    sql: ${TABLE}.private_browsing_icon_tapped_users ;;
  }

  measure: private_browsing_button_tapped_add {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_add ;;
  }

  measure: private_browsing_button_tapped_add_users {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_add_users ;;
  }

  measure: private_browsing_button_tapped_close_all_tabs {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_close_all_tabs ;;
  }

  measure: private_browsing_button_tapped_close_all_tabs_users {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_close_all_tabs_users ;;
  }

  measure: private_browsing_button_tapped_done {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_done ;;
  }

  measure: private_browsing_button_tapped_done_users {
    type: sum
    sql: ${TABLE}.private_browsing_button_tapped_done_users ;;
  }

  measure: notification_status_authorized {
    type: sum
    sql: ${TABLE}.notification_status_authorized ;;
  }

  measure: notification_status_authorized_users {
    type: sum
    sql: ${TABLE}.notification_status_authorized_users ;;
  }

  measure: notification_status_notDetermined {
    type: sum
    sql: ${TABLE}.notification_status_notDetermined ;;
  }

  measure: notification_status_notDetermined_users {
    type: sum
    sql: ${TABLE}.notification_status_notDetermined_users ;;
  }

  measure: notification_status_denied {
    type: sum
    sql: ${TABLE}.notification_status_denied ;;
  }

  measure: notification_status_denied_users {
    type: sum
    sql: ${TABLE}.notification_status_denied_users ;;
  }

  measure: notification_alert_setting_not_supported {
    type: sum
    sql: ${TABLE}.notification_alert_setting_not_supported ;;
  }

  measure: notification_alert_setting_not_supported_users {
    type: sum
    sql: ${TABLE}.notification_alert_setting_not_supported_users ;;
  }

  measure: notification_alert_setting_disabled {
    type: sum
    sql: ${TABLE}.notification_alert_setting_disabled ;;
  }

  measure: notification_alert_setting_disabled_users {
    type: sum
    sql: ${TABLE}.notification_alert_setting_disabled_users ;;
  }

  measure: notification_alert_setting_enabled {
    type: sum
    sql: ${TABLE}.notification_alert_setting_enabled ;;
  }

  measure: notification_alert_setting_enabled_users {
    type: sum
    sql: ${TABLE}.notification_alert_setting_enabled_users ;;
  }

}
