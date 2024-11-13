include: "../views/bigquery_usage.view.lkml"
include: "../views/bigquery_tables_inventory.view.lkml"

explore: bigquery_usage {
  from: bigquery_usage

  join: bigquery_tables_inventory {
    view_label: "Table Inventory (reference tables)"
    fields: [bigquery_tables_inventory.table_type, bigquery_tables_inventory.creation_date]
    sql_on: ${bigquery_usage.reference_project_id} = ${bigquery_tables_inventory.project_id}
          AND ${bigquery_usage.reference_dataset_id} = ${bigquery_tables_inventory.dataset_id}
          AND ${bigquery_usage.reference_table_id} = ${bigquery_tables_inventory.table_id}
          ;;
    relationship: one_to_one
  }
}
