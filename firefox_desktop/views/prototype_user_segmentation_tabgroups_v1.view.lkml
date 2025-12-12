view: prototype_user_segmentation_tabgroups_v1 {
  sql_table_name: `moz-fx-data-shared-prod.firefox_desktop.prototype_user_segmentation_tabgroups_v1` ;;

  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension_group: first_tab_group {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_tab_group_date ;;
  }
  dimension: legacy_client_id {
    type: string
    sql: ${TABLE}.legacy_client_id ;;
  }
  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }
  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }
  dimension: selection {
    type: string
    sql: ${TABLE}.selection ;;
  }
  dimension: tabgroup_create_group_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_create_group_event_sum ;;
  }
  dimension: tabgroup_delete_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_delete_event_sum ;;
  }
  dimension: tabgroup_open_group_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_open_group_event_sum ;;
  }
  dimension: tabgroup_reopen_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_reopen_event_sum ;;
  }
  dimension: tabgroup_save_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_save_event_sum ;;
  }
  dimension: tabgroup_smart_tab_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_smart_tab_event_sum ;;
  }
  dimension: tabgroup_smart_tab_optin_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_smart_tab_optin_event_sum ;;
  }
  dimension: tabgroup_smart_tab_suggest_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_smart_tab_suggest_event_sum ;;
  }
  dimension: tabgroup_smart_tab_topic_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_smart_tab_topic_event_sum ;;
  }
  dimension: tabgroup_ungroup_event_sum {
    type: number
    sql: ${TABLE}.tabgroup_ungroup_event_sum ;;
  }
  measure: count {
    type: count
  }
}
