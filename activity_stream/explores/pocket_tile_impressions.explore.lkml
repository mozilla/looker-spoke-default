include: "//looker-hub/activity_stream/explores/*"
include: "../views/impression_stats_flat.view.lkml"

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

}
