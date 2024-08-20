connection: "telemetry"
label: "Firefox for Android"
include: "//looker-hub/fenix/explores/*"
include: "explores/android_awesomebar_location_metrics.explore.lkml"
include: "explores/android_bookmark_events.explore.lkml"
include: "explores/android_bookmark_metrics.explore.lkml"
include: "explores/android_credential_management_events.explore.lkml"
include: "explores/android_credential_management_metric.explore.lkml"
include: "explores/android_customize_home_events.explore.lkml"
include: "explores/android_customize_home_metrics.explore.lkml"
include: "explores/android_default_browser_events.explore.lkml"
include: "explores/android_default_browser_metrics.explore.lkml"
include: "explores/android_fxa_events.explore.lkml"
include: "explores/android_history_events.explore.lkml"
include: "explores/android_notification_events.explore.lkml"
include: "explores/android_notification_metrics.explore.lkml"
include: "explores/android_onboarding.explore.lkml"
include: "explores/android_privacy_events.explore.lkml"
include: "explores/android_privcay_metrics_cat.explore.lkml"
include: "explores/android_tab_count_metrics.explore.lkml"
include: "explores/fenix_feature_usage_events.explore.lkml"
include: "explores/fenix_feature_usage_metrics.explore.lkml"
include: "explores/firefox_android_clients.explore.lkml"
include: "explores/funnel_retention_week_4.explore.lkml"
include: "explores/new_profile_activation.explore.lkml"
include: "explores/test_mobile_feature.explore.lkml"

include: "//looker-hub/fenix/views/metrics.view.lkml"
include: "/fenix/views/android_store_performance.view.lkml"


explore: +topsites_impression {
  hidden: yes
}

# temporary workaround until fields are accessible
# https://bugzilla.mozilla.org/show_bug.cgi?id=1764332



view: +metrics {
  dimension: metrics__labeled_counter__recent_synced_tabs_recent_synced_tab_opened {
    label: "Recent synced tabs opened"
    hidden: yes
    sql: NULL ;;
    group_label: "Metrics"
    group_item_label: "Recent synced tabs"
  }

  dimension: metrics__labeled_counter__recent_synced_tabs_recent_synced_tab_shown {
    label: "Recent synced tabs shown"
    hidden: yes
    sql: NULL ;;
    group_label: "Metrics"
    group_item_label: "Recent synced tabs"
  }

  dimension: metrics__labeled_counter__tabs_tray_access_point {
    label: "Tabs tray access point"
    hidden: yes
    sql: NULL ;;
    group_label: "Metrics"
    group_item_label: "Recent synced tabs"
  }

  dimension: client_info__build_date_ts {
    label: "Build Date (Timestamp)"
    description: "The date & time the application was built as a timestamp"
    group_label: "Client Info"
    group_item_label: "Build Date (Timestamp)"
    sql:  SAFE.PARSE_TIMESTAMP('%FT%H:%M:%S%Ez', ${TABLE}.client_info.build_date) ;;
    type: date_time
  }
}

explore: android_store_performance {
  sql_always_where: ${period_filtered_measures} in ("this", "last");;
}
