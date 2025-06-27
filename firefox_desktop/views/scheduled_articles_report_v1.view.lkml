view: scheduled_articles_report_v1 {
  sql_table_name: `moz-fx-data-shared-prod.snowflake_migration_derived.scheduled_articles_report_v1` ;;

  dimension: approved_total {
    type: number
    description: "The number of items approved on this day"
    sql: ${TABLE}.approved_total ;;
  }
  dimension: manual_outside_rate {
    type: number
    description: "The percentage of items added manually outside of the tool on this day."
    sql: ${TABLE}.manual_outside_rate ;;
  }
  dimension: manual_outside_tool_total {
    type: number
    description: "The number of items added manually outside of the tool on this day"
    sql: ${TABLE}.manual_outside_tool_total ;;
  }
  dimension: manual_within_tool_total {
    type: number
    description: "The number of items added manually in the tool on this day"
    sql: ${TABLE}.manual_within_tool_total ;;
  }
  dimension: rejected_total {
    type: number
    description: "The number of items rejected on this day"
    sql: ${TABLE}.rejected_total ;;
  }
  dimension: rejection_rate {
    type: number
    description: "The percentage of items rejected on this day."
    sql: ${TABLE}.rejection_rate ;;
  }
  dimension: removal_rate {
    type: number
    description: "The percentage of items removed on this day."
    sql: ${TABLE}.removal_rate ;;
  }
  dimension: removed_total {
    type: number
    description: "The number of items removed on this day"
    sql: ${TABLE}.removed_total ;;
  }
  dimension: schedule_failure_rate {
    type: number
    description: "The percentage of total items rejected, removed, or added manually outside of the tool on this day."
    sql: ${TABLE}.schedule_failure_rate ;;
  }
  dimension_group: scheduled {
    type: time
    description: "The date of the schedule"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.scheduled_date ;;
  }
  dimension: scheduled_surface_id {
    type: string
    description: "The curated rec destination where the corpus item is expected to appear (NEW_TAB_EN_INTL, NEW_TAB_EN_US, NEW_TAB_DE_DE, NEW_TAB_EN_GB)."
    sql: ${TABLE}.scheduled_surface_id ;;
  }
  measure: count {
    type: count
  }
}
