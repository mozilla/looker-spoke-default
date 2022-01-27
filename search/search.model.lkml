connection: "telemetry"
label: "Search"
include: "//looker-hub/search/explores/*"
include: "//looker-hub/search/views/desktop_search_alert_latest_daily.view.lkml"
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

explore: desktop_search_alert_latest_daily {}

explore: business_development_core_search_users_monthly {
  view_name: bizdev_search_core_users

  # TODO: Add aggregate table once dashboard is built and queries are known:
  # aggregate_table: rollup__bizdev_core_search_users_monthly {
  #   query: {
  #     dimensions: [bizdev_search_core_users.submission_month, bizdev_search_core_users.ad_click_bucket...]
  #   }

  #   materialization: {
  #     sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
  #   }
  # }

  always_filter: {
    filters: [submission_month: "3 months"]
  }
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
