include: "../views/bigquery_table_storage.view.lkml"
include: "../views/bigquery_tables_inventory.view.lkml"

explore: bigquery_table_storage {

  join: bigquery_tables_inventory {
    view_label: "Table Inventory"
    fields: [bigquery_tables_inventory.table_type]
    sql_on: ${bigquery_table_storage.project_id} = ${bigquery_tables_inventory.project_id}
          AND ${bigquery_table_storage.dataset_id} = ${bigquery_tables_inventory.dataset_id}
          AND ${bigquery_table_storage.table_id} = ${bigquery_tables_inventory.table_id}
          ;;
    relationship: one_to_one
  }
}
