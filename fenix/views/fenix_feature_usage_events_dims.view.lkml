include: "//looker-hub/fenix/views/feature_usage_events.view.lkml"

view: fenix_feature_usage_events_dims {
  label: "Firefox Android Feature Usage with Dimensions"
  extends: [feature_usage_events]

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

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
  }

  dimension: is_default_browser {
    sql: ${TABLE}.is_default_browser ;;
    type: yesno
  }

  dimension: distribution_id {
    sql: ${TABLE}.distribution_id ;;
    type: string
  }

  measure: default_browser_changed_events {
    sql: ${TABLE}.default_browser_changed ;;
    type: sum
    group_label: "Default Browser Changed"
  }

  measure: default_browser_changed_clients {
    sql: ${TABLE}.default_browser_changed_users ;;
    type: sum
    group_label: "Default Browser Changed"
  }

  measure: sponsored_tiles_clicks {
    sql: ${TABLE}.top_sites_contile_click ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
  }

  measure: sponsored_tiles_click_clients {
    sql: ${TABLE}.top_sites_contile_click_users ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
  }

  measure: sponsored_tiles_impressions {
    sql: ${TABLE}.top_sites_contile_impression ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
  }

  measure: sponsored_tiles_impressions_clients {
    sql: ${TABLE}.top_sites_contile_impression_users ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
  }

  measure: reengagement_notification_shown {
    sql: ${TABLE}.re_engagement_notif_shown ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
  }

  measure: reengagement_notification_shown_clients {
    sql: ${TABLE}.re_engagement_notif_shown_users ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
  }

  measure: reengagement_notification_tapped {
    sql: ${TABLE}.re_engagement_notif_tapped ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
  }

  measure: reengagement_notification_shown_tapped {
    sql: ${TABLE}.re_engagement_notif_tapped_users ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
  }

}
