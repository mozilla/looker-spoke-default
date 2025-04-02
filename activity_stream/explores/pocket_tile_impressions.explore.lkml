include: "//looker-hub/activity_stream/explores/pocket_tile_impressions.explore.lkml"
include: "../views/impression_stats_flat.view.lkml"
include: "//looker-hub/activity_stream/datagroups/impression_stats_flat_last_updated.datagroup.lkml"

explore: +pocket_tile_impressions {

  aggregate_table: rollup__impression_stats_flat_daily {
    query: {
      dimensions: [impression_stats_flat.submission_date, impression_stats_flat.tile_type]
      measures: [impression_stats_flat.click_count, impression_stats_flat.impression_count, impression_stats_flat.loaded_count, impression_stats_flat.pocketed_count]
      filters: [impression_stats_flat.submission_date: "after 2019-01-01"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: impression_stats_flat.submission_date
      increment_offset: 1
    }
  }

  persist_with: impression_stats_flat_last_updated

}
