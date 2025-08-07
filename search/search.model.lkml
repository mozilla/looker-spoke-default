connection: "telemetry"
label: "Search"
include: "//looker-hub/search/explores/*"
include: "views/bizdev_search_core_users.view.lkml"
include: "views/mobile_search_aggregates.view.lkml"
include: "views/mobile_search_clients_engines_sources_daily.view.lkml"
include: "views/search_aggregates.view.lkml"
include: "views/search_clients_engine_sources_daily.view.lkml"
include: "explores/*"
include: "/shared/views/countries.view.lkml"
include: "//looker-hub/search/datagroups/search_clients_engines_sources_daily_last_updated.datagroup.lkml"

explore: search_aggregates {
  description: " Includes aggregated search metrics per day "
 join: countries {
  type: left_outer
  relationship: one_to_one
  sql_on: ${search_aggregates.country} = ${countries.code} ;;
}

  always_filter: {
    filters: [submission_date: "3 months"]
  }
}

explore: mobile_search_aggregates {
  description: " Includes aggregated search metrics per day "
  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${mobile_search_aggregates.country} = ${countries.code} ;;
  }

  always_filter: {
    filters: [submission_date: "3 months"]
  }
}

explore: +desktop_search_counts {
  description: "Desktop search counts and ad clicks.
  Includes searches from ways to search in the browser (called Search Access Points or SAPs),
  like the URL bar and newtab page. Follow-on searches are those that are after entry from a
  SAP, and organic searches are those that occur directly on a search webpage (e.g. www.google.com)."

  persist_with: search_clients_engines_sources_daily_last_updated
}

explore: business_development_core_search_users_monthly {
  view_name: bizdev_search_core_users

  aggregate_table: rollup__bizdev_search_core_users_last_month {
    query: {
      dimensions: [bizdev_search_core_users.days_of_use_bucket, bizdev_search_core_users.ad_click_bucket, bizdev_search_core_users.country, bizdev_search_core_users.normalized_engine, bizdev_search_core_users.submission_month]
      measures: [bizdev_search_core_users.ad_clicks, bizdev_search_core_users.approx_clients, bizdev_search_core_users.searches]
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
      measures: [bizdev_search_core_users.approx_clients]
      filters: [
        bizdev_search_core_users.country: "US",
        bizdev_search_core_users.normalized_engine: "Google",
        bizdev_search_core_users.submission_month: "1 months ago for 1 months"
      ]
    }

    materialization: {
      sql_trigger_value: SELECT DATE_TRUNC(CURRENT_DATE(), MONTH) ;;
    }
  }

  aggregate_table: rollup__bizdev_search_core_users_ad_click_bucket {
    query: {
      dimensions: [bizdev_search_core_users.submission_month, bizdev_search_core_users.ad_click_bucket]
      measures: [bizdev_search_core_users.approx_clients]
      filters: [
        bizdev_search_core_users.country: "US",
        bizdev_search_core_users.normalized_engine: "Google",
        bizdev_search_core_users.submission_month: "1 months ago for 1 months"
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

}
