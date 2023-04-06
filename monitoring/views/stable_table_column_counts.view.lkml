include: "//looker-hub/monitoring/views/stable_table_column_counts.view.lkml"

view: +stable_table_column_counts {

  # dimensions
  dimension: total_columns {
    hidden: yes
  }

  # measures
  measure: max_total_columns_this_week {
    label: "Max Total Columns (7 days ago - yesterday)"
    type: max
    sql: ${total_columns} ;;
    filters: [submission_date: "7 days ago for 7 days"]
  }

  measure: max_total_columns_last_week {
    label: "Max Total Columns (14 - 7 days ago)"
    type: max
    sql: ${total_columns} ;;
    filters: [submission_date: "14 days ago for 7 days"]
  }

  measure: total_columns_change {
    label: "Change of Total Columns"
    type: number
    sql: ${max_total_columns_this_week} - ${max_total_columns_last_week} ;;
  }
}
