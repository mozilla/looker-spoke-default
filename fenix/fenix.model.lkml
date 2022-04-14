connection: "telemetry"
label: "Firefox for Android"
include: "//looker-hub/fenix/explores/*"

explore: +topsites_impression {
  hidden: yes
}

# temporary workaround until fields are accessible
# https://bugzilla.mozilla.org/show_bug.cgi?id=1764332

include: "//looker-hub/fenix/views/metrics.view.lkml"

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
}
