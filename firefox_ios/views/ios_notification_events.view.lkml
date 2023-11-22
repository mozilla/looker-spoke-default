
view: ios_notification_events {
  derived_table: {
    sql: WITH dau_segments AS
                (SELECT DATE(submission_timestamp) as submission_date, 100*count(distinct client_info.client_id) as dau
                FROM `mozdata.firefox_ios.events_unnested`
                --AND channel = 'release'
                WHERE DATE(submission_timestamp) >= '2023-01-26'
                AND sample_id = 0
                GROUP BY 1),

            product_features AS
            (SELECT
                client_info.client_id,
                DATE(submission_timestamp) as submission_date,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'status' AND extra.value = 'authorized' THEN 1 ELSE 0 END as notification_status_authorized,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'status' AND extra.value = 'notDetermined' THEN 1 ELSE 0 END as notification_status_notDetermined,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'status' AND extra.value = 'denied' THEN 1 ELSE 0 END as notification_status_denied,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'alert_setting' AND extra.value = 'notSupported' THEN 1 ELSE 0 END as notification_alert_setting_notSupported,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'alert_setting' AND extra.value = 'disabled' THEN 1 ELSE 0 END as notification_alert_setting_disabled,
                CASE WHEN event_category = 'app' AND event_name = 'notification_permission'
                AND extra.key = 'alert_setting' AND extra.value = 'enabled' THEN 1 ELSE 0 END as notification_alert_setting_enabled

                FROM `mozdata.firefox_ios.events_unnested`
                LEFT JOIN UNNEST(event_extra) as extra
                WHERE DATE(submission_timestamp) >= '2023-01-26'
                AND sample_id = 0),


            product_features_agg AS
            (SELECT submission_date,
                100*SUM(notification_status_authorized) as notification_status_authorized,
                100*COUNT(DISTINCT CASE WHEN notification_status_authorized > 0 THEN client_id END) AS notification_status_authorized_users,
                100*SUM(notification_status_notDetermined) as notification_status_notDetermined,
                100*COUNT(DISTINCT CASE WHEN notification_status_notDetermined > 0 THEN client_id END) AS notification_status_notDetermined_users,
                100*SUM(notification_status_denied) as notification_status_denied,
                100*COUNT(DISTINCT CASE WHEN notification_status_denied > 0 THEN client_id END) AS notification_status_denied_users,
                100*SUM(notification_alert_setting_notSupported) as notification_alert_setting_notSupported,
                100*COUNT(DISTINCT CASE WHEN notification_alert_setting_notSupported > 0 THEN client_id END) AS notification_alert_setting_notSupported_users,
                100*SUM(notification_alert_setting_disabled) as notification_alert_setting_disabled,
                100*COUNT(DISTINCT CASE WHEN notification_alert_setting_disabled > 0 THEN client_id END) AS notification_alert_setting_disabled_users,
                100*SUM(notification_alert_setting_enabled) as notification_alert_setting_enabled,
                100*COUNT(DISTINCT CASE WHEN notification_alert_setting_enabled > 0 THEN client_id END) AS notification_alert_setting_enabled_users
            FROM product_features
            WHERE submission_date >= '2023-01-26'
            GROUP BY 1
            )

            -- Continue with your main query here, adding columns from dau_segments and product_features_agg as needed.
            -- Make sure to join the tables appropriately and order the results as required.
            SELECT d.submission_date,
                dau,
                notification_status_authorized,
                notification_status_authorized_users,
                notification_status_notDetermined,
                notification_status_notDetermined_users,
                notification_status_denied,
                notification_status_denied_users,
                notification_alert_setting_notSupported,
                notification_alert_setting_notSupported_users,
                notification_alert_setting_disabled,
                notification_alert_setting_disabled_users,
                notification_alert_setting_enabled,
                notification_alert_setting_enabled_users
            FROM dau_segments d
            LEFT JOIN product_features_agg p
            ON d.submission_date = p.submission_date
            ORDER BY d.submission_date ;;
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

  measure: notification_status_authorized {
    type: sum
    sql: ${TABLE}.notification_status_authorized ;;
  }

  measure: notification_status_authorized_users {
    type: sum
    sql: ${TABLE}.notification_status_authorized_users ;;
  }

  measure: notification_status_not_determined {
    type: sum
    sql: ${TABLE}.notification_status_notDetermined ;;
  }

  measure: notification_status_not_determined_users {
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
    sql: ${TABLE}.notification_alert_setting_notSupported ;;
  }

  measure: notification_alert_setting_not_supported_users {
    type: sum
    sql: ${TABLE}.notification_alert_setting_notSupported_users ;;
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

  set: detail {
    fields: [
      submission_date,
      dau,
      notification_status_authorized,
      notification_status_authorized_users,
      notification_status_not_determined,
      notification_status_not_determined_users,
      notification_status_denied,
      notification_status_denied_users,
      notification_alert_setting_not_supported,
      notification_alert_setting_not_supported_users,
      notification_alert_setting_disabled,
      notification_alert_setting_disabled_users,
      notification_alert_setting_enabled,
      notification_alert_setting_enabled_users
    ]
  }
}
