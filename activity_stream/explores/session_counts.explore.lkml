include: "//looker-hub/activity_stream/explores/session_counts.explore.lkml"
include: "../views/sessions.view.lkml"
include: "//looker-hub/activity_stream/datagroups/sessions_last_updated.datagroup.lkml"

explore: +session_counts {

  aggregate_table: rollup__sessions_daily {
    query: {
      dimensions: [sessions.submission_date]
      measures: [sessions.clients, sessions.session_count]
      filters: [sessions.submission_date: "after 2019-01-01"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
      increment_key: sessions.submission_date
      increment_offset: 1
    }
  }

  persist_with: sessions_last_updated
}
