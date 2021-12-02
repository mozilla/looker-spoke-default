connection: "telemetry"
label: "Search"
include: "//looker-hub/search/explores/*"
include: "views/*"

explore: +desktop_search_counts {
  description: "Desktop search counts and ad clicks.
    Includes searches from ways to search in the browser (called Search Access Points or SAPs),
    like the URL bar and newtab page. Follow-on searches are those that are after entry from a
    SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com)."
}

explore: +mobile_search_counts {
  description: "Mobile search counts and ad clicks.
    Includes searches from ways to search in the browser (called Search Access Points or SAPs),
    like the URL bar and newtab page. Follow-on searches are those that are after entry from a
    SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com).
    Warning: Firefox iOS is not able to implement all metrics, like ad clicks."
}

explore: +desktop_search_counts {
  aggregate_table: rollup__search_clients_engines_sources_daily_submission_date_0 {
    query: {
      dimensions: [search_clients_engines_sources_daily.submission_date]
      measures: [search_clients_engines_sources_daily.clients, search_clients_engines_sources_daily.total_searches]
      filters: [
        search_clients_engines_sources_daily.source: "%newtab%",
      ]
    }

    materialization: {
      sql_trigger_value: "SELECT CURRENT_DATE()" ;;
    }
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_submission_date_1 {
    query: {
      dimensions: [search_clients_engines_sources_daily.submission_date]
      measures: [search_clients_engines_sources_daily.total_searches]
      filters: [
        search_clients_engines_sources_daily.source: "newtab",
      ]
    }

    materialization: {
      sql_trigger_value: "SELECT CURRENT_DATE()" ;;
    }
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_normalized_engine__search_clients_engines_sources_daily_submission_date {
    query: {
      dimensions: [search_clients_engines_sources_daily.normalized_engine, search_clients_engines_sources_daily.submission_date]
      measures: [search_clients_engines_sources_daily.total_searches]
      filters: [
        search_clients_engines_sources_daily.source: "%newtab%",
      ]
    }

    materialization: {
      sql_trigger_value: "SELECT CURRENT_DATE()" ;;
    }
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_total_searches__2 {
    query: {
      measures: [search_clients_engines_sources_daily.total_searches]
      filters: [
        search_clients_engines_sources_daily.source: "%newtab%",
      ]
    }

    materialization: {
      sql_trigger_value: "SELECT CURRENT_DATE()" ;;
    }
  }
}
