connection: "telemetry"
label: "Activity Stream"
include: "//looker-hub/activity_stream/explores/*"
include: "views/*"
include: "dashboards/*"

explore: +session_counts {
  aggregate_table: rollup__sessions_submission_date {
    query: {
      dimensions: [sessions.submission_date]
      measures: [sessions.clients]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__sessions_submission_date__0 {
    query: {
      dimensions: [sessions.submission_date]
      measures: [sessions.clients]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__sessions_submission_date__1 {
    query: {
      dimensions: [sessions.submission_date]
      measures: [sessions.session_count]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__sessions_session_count__2 {
    query: {
      measures: [sessions.session_count]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }
}

explore: +pocket_tile_impressions {
  aggregate_table: rollup__impression_stats_flat_submission_date__a {
    query: {
      dimensions: [impression_stats_flat.submission_date]
      measures: [impression_stats_flat.impression_count]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__impression_stats_flat_submission_date__b {
    query: {
      dimensions: [impression_stats_flat.submission_date]
      measures: [impression_stats_flat.click_count]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__impression_stats_flat_submission_date__c {
    query: {
      dimensions: [impression_stats_flat.submission_date]
      measures: [impression_stats_flat.click_count, impression_stats_flat.impression_count, impression_stats_flat.loaded_count, impression_stats_flat.pocketed_count]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__impression_stats_flat_submission_date__d {
    query: {
      dimensions: [impression_stats_flat.submission_date]
      measures: [impression_stats_flat.click_count]
      filters: [
        impression_stats_flat.tile_type: "spoc"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__impression_stats_flat_submission_date__e {
    query: {
      dimensions: [impression_stats_flat.submission_date]
      measures: [impression_stats_flat.impression_count]
      filters: [
        impression_stats_flat.tile_type: "spoc"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }
}
