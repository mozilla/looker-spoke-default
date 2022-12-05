include: "//looker-hub/monitoring/views/bigquery_tables_inventory.view.lkml"

view: +bigquery_tables_inventory {

  measure: count{
    type: count
  }
}
