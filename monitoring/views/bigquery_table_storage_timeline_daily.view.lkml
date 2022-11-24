include: "//looker-hub/monitoring/views/bigquery_table_storage_timeline_daily.view.lkml"

view: +bigquery_table_storage_timeline_daily {

  measure: count{
    type: count
  }

}
