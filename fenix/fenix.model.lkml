connection: "telemetry"
label: "Firefox for Android"
include: "//looker-hub/fenix/explores/*"
include: "explores/*"
include: "datagroups/*"

include: "//looker-hub/fenix/views/health.view.lkml"
include: "//looker-hub/fenix/views/metrics.view.lkml"
include: "/fenix/views/android_store_performance.view.lkml"



# temporary workaround until fields are accessible
# https://bugzilla.mozilla.org/show_bug.cgi?id=1764332

view: +health {
  dimension: client_info__build_date_ts {
    label: "Build Date (Timestamp)"
    description: "The date & time the application was built as a timestamp"
    group_label: "Client Info"
    group_item_label: "Build Date (Timestamp)"
    sql:  SAFE.PARSE_TIMESTAMP('%FT%H:%M:%S%Ez', ${TABLE}.client_info.build_date) ;;
    type: date_time
  }
}

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

# temporary datagroup until this gets generated
explore: +events_unnested {
  persist_with: events_unnested_v1_last_updated
}

datagroup: baseline_agg_daily_tou {
  # changes once per day → triggers a rebuild once per day
  sql_trigger: SELECT CURRENT_DATE() ;;
  max_cache_age: "24 hours"
}
