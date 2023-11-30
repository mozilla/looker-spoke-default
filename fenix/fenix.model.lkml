connection: "telemetry"
label: "Firefox for Android"
include: "//looker-hub/fenix/explores/*"
include: "explores/*.explore.lkml"


explore: +topsites_impression {
  hidden: yes
}

# temporary workaround until fields are accessible
# https://bugzilla.mozilla.org/show_bug.cgi?id=1764332

include: "//looker-hub/fenix/views/metrics.view.lkml"
include: "/fenix/views/test_mobile_feature.view.lkml"
include: "/fenix/views/android_credential_management_metrics.view.lkml"
include: "/fenix/views/android_credential_management_events.view.lkml"
include: "/fenix/views/android_bookmark_events.view.lkml"
include: "/fenix/views/android_bookmark_metrics.view.lkml"
include: "/fenix/views/android_history_events.view.lkml"
include: "/fenix/views/android_fxa_events.view.lkml"
include: "/fenix/views/android_privacy_metrics_cat.view.lkml"
include: "/fenix/views/android_tab_count_metrics.view.lkml"
include: "/fenix/views/android_default_browser_metrics.view.lkml"
include: "/fenix/views/android_default_browser_events.view.lkml"
include: "/fenix/views/android_privacy_events.view.lkml"
include: "/fenix/views/android_awesomebar_location_metrics.view.lkml"
include: "/fenix/views/android_notification_metrics.view.lkml"
include: "/fenix/views/android_notification_events.view.lkml"
include: "/fenix/views/android_customize_home_metrics.view.lkml"
include: "/fenix/views/android_customize_home_events.view.lkml"
include: "/fenix/views/android_store_performance.view.lkml"
include: "/fenix/views/funnel_retention_week_4.view.lkml"



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

explore: funnel_retention_week_4 {
  sql_always_where: ${period_filtered_measures} in ("this", "last")
                    AND ${install_source} = "com.android.vending";;
}
