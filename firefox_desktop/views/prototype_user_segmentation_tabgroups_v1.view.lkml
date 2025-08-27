view: prototype_user_segmentation_tabgroups {
  sql_table_name: `moz-fx-data-shared-prod.firefox_desktop.prototype_user_segmentation_tabgroups_v1` ;;

  dimension: legacy_client_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.legacy_client_id ;;
  }
  dimension: first_tab_group_date {
      type: date
      sql: ${TABLE}.first_tab_group_date ;;
  }
  dimension: os {
      type: string
      sql: ${TABLE}.os ;;
  }
  dimension: os_version {
      type: string
      sql: ${TABLE}.os_version ;;
  }
  dimension: branch {
      type: string
      sql: ${TABLE}.branch ;;
  }
  dimension: selection {
      type: string
      sql: ${TABLE}.selection ;;
  }
  dimension: tabgroup_open_group_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_open_group_event_sum ;;
  }
  dimension: tabgroup_create_group_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_create_group_event_sum ;;
  }
  dimension: tabgroup_ungroup_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_ungroup_event_sum ;;
  }
  dimension: tabgroup_delete_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_delete_event_sum ;;
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
  dimension: tabgroup_smart_tab_suggest_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_smart_tab_suggest_event_sum ;;
  }
  dimension: tabgroup_smart_tab_optin_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_smart_tab_optin_event_sum ;;
  }
  dimension: tabgroup_smart_tab_topic_event_sum {
      type: number
      sql: ${TABLE}.tabgroup_smart_tab_topic_event_sum ;;
  }
}
