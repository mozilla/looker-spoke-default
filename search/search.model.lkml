connection: "telemetry"
label: "Search"
include: "//looker-hub/search/explores/*"
include: "//looker-hub/search/views/desktop_search_alert_latest_daily.view.lkml"
include: "views/*"
include: "/shared/views/*"

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

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_search_clients_engines_sources_daily.country} = ${countries.code} ;;
  }

}

explore: desktop_search_alert_latest_daily {}

explore: business_development_core_search_users_monthly {
  view_name: bizdev_search_core_users

  aggregate_table: rollup__bizdev_search_core_users_last_month {
    query: {
      dimensions: [bizdev_search_core_users.days_of_use_bucket, bizdev_search_core_users.ad_click_bucket, bizdev_search_core_users.country, bizdev_search_core_users.normalized_engine, bizdev_search_core_users.submission_month]
      measures: [bizdev_search_core_users.ad_clicks, bizdev_search_core_users.clients, bizdev_search_core_users.searches]
      filters: [
        bizdev_search_core_users.submission_month: "1 months ago for 1 months"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    }

  }

  aggregate_table: rollup__bizdev_search_core_users_clients {
    query: {
      dimensions: [bizdev_search_core_users.submission_month, bizdev_search_core_users.days_of_use_bucket]
      measures: [bizdev_search_core_users.clients]
      filters: [
        bizdev_search_core_users.country: "US",
        bizdev_search_core_users.normalized_engine: "Google"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    }
  }

  aggregate_table: rollup__bizdev_search_core_users_ad_click_bucket {
    query: {
      dimensions: [bizdev_search_core_users.submission_month, bizdev_search_core_users.ad_click_bucket]
      measures: [bizdev_search_core_users.clients]
      filters: [
        bizdev_search_core_users.country: "US",
        bizdev_search_core_users.normalized_engine: "Google"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    }
  }

  always_filter: {
    filters: [submission_month: "3 months"]
  }
}

explore: +desktop_search_counts {

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${search_clients_engines_sources_daily.country} = ${countries.code} ;;
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_submission_date_0 {
    query: {
      dimensions: [search_clients_engines_sources_daily.submission_date]
      measures: [search_clients_engines_sources_daily.clients, search_clients_engines_sources_daily.total_searches]
      filters: [
        search_clients_engines_sources_daily.source: "%newtab%",
      ]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE() ;;
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
      sql_trigger_value: SELECT CURRENT_DATE() ;;
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
      sql_trigger_value: SELECT CURRENT_DATE() ;;
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
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_per_day {
    query: {
      dimensions: [
        search_clients_engines_sources_daily.submission_date,
        search_clients_engines_sources_daily.normalized_engine,
        search_clients_engines_sources_daily.country,
        search_clients_engines_sources_daily.os,
        search_clients_engines_sources_daily.source
      ]
      measures: [
        search_clients_engines_sources_daily.clients,
        search_clients_engines_sources_daily.total_searches,
        search_clients_engines_sources_daily.total_tagged_sap_searches,
        search_clients_engines_sources_daily.total_tagged_searches,
        search_clients_engines_sources_daily.total_tagged_follow_on_searches,
        search_clients_engines_sources_daily.total_organic_searches,
        search_clients_engines_sources_daily.total_searches_with_ads,
        search_clients_engines_sources_daily.total_organic_searches_with_ads,
        search_clients_engines_sources_daily.total_ad_clicks,
        search_clients_engines_sources_daily.total_organic_ad_clicks
      ]
      filters: [search_clients_engines_sources_daily.submission_year: "after 2019-01-01"]
    }

    materialization: {
      sql_trigger_value:SELECT CURRENT_DATE() ;;
      increment_key: search_clients_engines_sources_daily.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__search_clients_engines_sources_daily_per_month {
    query: {
      dimensions: [
        search_clients_engines_sources_daily.submission_month,
        search_clients_engines_sources_daily.normalized_engine,
        search_clients_engines_sources_daily.country,
        search_clients_engines_sources_daily.os,
        search_clients_engines_sources_daily.source
      ]
      measures: [
        search_clients_engines_sources_daily.clients,
        search_clients_engines_sources_daily.total_searches,
        search_clients_engines_sources_daily.total_tagged_sap_searches,
        search_clients_engines_sources_daily.total_tagged_searches,
        search_clients_engines_sources_daily.total_tagged_follow_on_searches,
        search_clients_engines_sources_daily.total_organic_searches,
        search_clients_engines_sources_daily.total_searches_with_ads,
        search_clients_engines_sources_daily.total_organic_searches_with_ads,
        search_clients_engines_sources_daily.total_ad_clicks,
        search_clients_engines_sources_daily.total_organic_ad_clicks
      ]
      filters: [search_clients_engines_sources_daily.submission_year: "after 2019-01-01"]
    }

    materialization: {
      sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
      increment_key: search_clients_engines_sources_daily.submission_month
      increment_offset: 1
    }
  }

}
