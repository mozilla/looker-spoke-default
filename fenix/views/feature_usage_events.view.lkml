include: "//looker-hub/fenix/views/feature_usage_events.view.lkml"

view: +feature_usage_events {
  label: "Firefox Android Feature Usage"
  fields_hidden_by_default: yes

  dimension_group: ping {
    hidden: no
  }

  dimension_group: submission {
    hidden: no
  }

  dimension: channel {
    hidden: no
  }

  dimension: country {
    hidden: no
  }

  dimension: is_default_browser {
    hidden: no
  }

  dimension: distribution_id {
    hidden: no
  }

  measure: default_browser_changed_events {
    sql: ${TABLE}.default_browser_changed ;;
    type: sum
    group_label: "Default Browser Changed"
    hidden: no
  }

  measure: default_browser_changed_clients {
    sql: ${TABLE}.default_browser_changed_users ;;
    type: sum
    group_label: "Default Browser Changed"
    hidden: no
  }

  measure: sponsored_tiles_clicks {
    sql: ${TABLE}.top_sites_contile_click ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
    hidden: no
  }

  measure: sponsored_tiles_click_clients {
    sql: ${TABLE}.top_sites_contile_click_users ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
    hidden: no
  }

  measure: sponsored_tiles_impressions {
    sql: ${TABLE}.top_sites_contile_impression ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
    hidden: no
  }

  measure: sponsored_tiles_impressions_clients {
    sql: ${TABLE}.top_sites_contile_impression_users ;;
    type: sum
    group_label: "Sponsored Tiles Interactions"
    hidden: no
  }

  measure: reengagement_notification_shown {
    sql: ${TABLE}.re_engagement_notif_shown ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
    hidden: no
  }

  measure: reengagement_notification_shown_clients {
    sql: ${TABLE}.re_engagement_notif_shown_users ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
    hidden: no
  }

  measure: reengagement_notification_tapped {
    sql: ${TABLE}.re_engagement_notif_tapped ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
    hidden: no
  }

  measure: reengagement_notification_shown_tapped {
    sql: ${TABLE}.re_engagement_notif_tapped_users ;;
    type: sum
    group_label: "Re-Engagement Notification Interactions"
    hidden: no
  }

}
