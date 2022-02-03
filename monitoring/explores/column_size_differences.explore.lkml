include: "//looker-hub/monitoring/views/column_size.view.lkml"

explore: column_size_differences{
  hidden: no
  view_name: column_size

  join: column_size_last_week {
    type: inner
    from:  column_size
    sql_on:
      ${column_size.submission_date} = DATE_ADD(${column_size_last_week.submission_date}, INTERVAL 7 DAY)
      AND ${column_size.dataset_id} = ${column_size_last_week.dataset_id}
      AND ${column_size.table_id} = ${column_size_last_week.table_id}
      AND ${column_size.column_name} = ${column_size_last_week.column_name}
      AND (${column_size.byte_size} - ${column_size_last_week.byte_size})  / 1024 / 1024 / 1024 > 100;;
      relationship: one_to_one
  }

}
