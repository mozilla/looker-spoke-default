datagroup: events_unnested_v1_last_updated {
  label: "Events Unnested Last Updated"
  # stable tables get populated around the same time (copy_deduplicate), so checking the release channel table for changes should be enough.
  sql_trigger: SELECT MAX(storage_last_modified_time)
    FROM `moz-fx-data-shared-prod`.`region-us`.INFORMATION_SCHEMA.TABLE_STORAGE
    WHERE table_schema = 'org_mozilla_firefox_stable'
    AND table_name = 'events_v1' ;;
  description: "Updates when moz-fx-data-shared-prod.org_mozilla_firefox_stable.events_v1 is modified."
  max_cache_age: "24 hours"
}
