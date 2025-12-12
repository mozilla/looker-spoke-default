datagroup: daily_active_users_by_product_category_last_updated {
  label: "events_table Last Updated"
  sql_trigger: SELECT MAX(storage_last_modified_time)
    FROM (

    SELECT MAX(storage_last_modified_time) AS storage_last_modified_time
    FROM `moz-fx-data-shared-prod`.`region-us`.INFORMATION_SCHEMA.TABLE_STORAGE
    WHERE (table_schema = 'telemetry_derived' AND table_name = 'daily_active_users_by_product_category_v1')

    ) ;;
  description: "Updates for daily_active_users_by_product_category_v1 when referenced tables are modified."
  max_cache_age: "24 hours"
}
