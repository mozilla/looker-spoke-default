include: "../views/newtab_interactions.view.lkml"
include: "../../shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/newtab_interactions_v1_last_updated.datagroup"

explore: newtab_interactions {
  persist_with: newtab_interactions_v1_last_updated
  sql_always_where: ${newtab_interactions.submission_date} >= '2022-07-01' ;;
  label: "New Tab Interactions"
  from: newtab_interactions

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_interactions.country_code} = ${countries.code} ;;
  }

  aggregate_table: rollup__newtab_interactions_general_per_day {
    query: {
      dimensions: [
        newtab_interactions.submission_date,
        newtab_interactions.channel,
        newtab_interactions.country_code,
        newtab_interactions.activity_segment,
        newtab_interactions.pocket_enabled,
        newtab_interactions.pocket_is_signed_in,
        newtab_interactions.pocket_sponsored_stories_enabled,
        newtab_interactions.topsites_enabled,
        countries.tier,
      ]
      measures: [
        newtab_interactions.visits,
        newtab_interactions.clients,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      sql_trigger_value:
      SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "newtab_interactions_v1";;
      increment_key: newtab_interactions.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__newtab_interactions_pocket_per_day {
    query: {
      dimensions: [
        newtab_interactions.submission_date,
        newtab_interactions.channel,
        newtab_interactions.country_code,
        newtab_interactions.pocket_story_position,
        countries.tier,
      ]
      measures: [
        newtab_interactions.visits_with_pocket_impressions,
        newtab_interactions.visits_with_pocket_saves,
        newtab_interactions.visits_with_pocket_clicks,
        newtab_interactions.visits_with_organic_pocket_impressions,
        newtab_interactions.visits_with_organic_pocket_saves,
        newtab_interactions.visits_with_organic_pocket_clicks,
        newtab_interactions.visits_with_sponsored_pocket_impressions,
        newtab_interactions.visits_with_sponsored_pocket_saves,
        newtab_interactions.visits_with_sponsored_pocket_clicks,

        newtab_interactions.sum_pocket_impressions,
        newtab_interactions.sum_pocket_saves,
        newtab_interactions.sum_pocket_clicks,
        newtab_interactions.sum_organic_pocket_impressions,
        newtab_interactions.sum_organic_pocket_saves,
        newtab_interactions.sum_organic_pocket_clicks,
        newtab_interactions.sum_sponsored_pocket_impressions,
        newtab_interactions.sum_sponsored_pocket_saves,
        newtab_interactions.sum_sponsored_pocket_clicks,

        newtab_interactions.clients_with_pocket_impressions,
        newtab_interactions.clients_with_pocket_saves,
        newtab_interactions.clients_with_pocket_clicks,
        newtab_interactions.clients_with_organic_pocket_impressions,
        newtab_interactions.clients_with_organic_pocket_saves,
        newtab_interactions.clients_with_organic_pocket_clicks,
        newtab_interactions.clients_with_sponsored_pocket_impressions,
        newtab_interactions.clients_with_sponsored_pocket_saves,
        newtab_interactions.clients_with_sponsored_pocket_clicks,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      sql_trigger_value:
      SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "newtab_interactions_v1";;
      increment_key: newtab_interactions.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__newtab_interactions_search_per_day {
    query: {
      dimensions: [
        newtab_interactions.submission_date,
        newtab_interactions.channel,
        newtab_interactions.country_code,
        newtab_interactions.search_engine,
        countries.tier,
      ]
      measures: [
        newtab_interactions.visits_with_search,
        newtab_interactions.visits_with_tagged_search_ad_impression,
        newtab_interactions.visits_with_tagged_search_ad_click,
        newtab_interactions.visits_with_tagged_follow_on_search_ad_impression,
        newtab_interactions.visits_with_tagged_follow_on_search_ad_click,
        newtab_interactions.visits_with_any_ad_click,
        newtab_interactions.visits_with_any_ad_impression,

        newtab_interactions.sum_searches,
        newtab_interactions.sum_tagged_search_ad_impressions,
        newtab_interactions.sum_tagged_search_ad_clicks,
        newtab_interactions.sum_tagged_follow_on_search_ad_impressions,
        newtab_interactions.sum_tagged_follow_on_search_ad_clicks,
        newtab_interactions.sum_all_search_ad_clicks,
        newtab_interactions.sum_all_search_ad_impressions,

        newtab_interactions.clients_with_search,
        newtab_interactions.clients_with_tagged_search_ad_impression,
        newtab_interactions.clients_with_tagged_search_ad_click,
        newtab_interactions.clients_with_tagged_follow_on_search_ad_impression,
        newtab_interactions.clients_with_tagged_follow_on_search_ad_click,
        newtab_interactions.clients_with_any_ad_click,
        newtab_interactions.clients_with_any_ad_impression,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      sql_trigger_value:
      SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "newtab_interactions_v1";;
      increment_key: newtab_interactions.submission_date
      increment_offset: 1
    }
  }

  aggregate_table: rollup__newtab_interactions_topsites_per_day {
    query: {
      dimensions: [
        newtab_interactions.submission_date,
        newtab_interactions.channel,
        newtab_interactions.country_code,
        countries.tier,
      ]
      measures: [
        newtab_interactions.visits_with_topsite_click,
        newtab_interactions.visits_with_topsite_impression,
        newtab_interactions.visits_with_sponsored_topsite_click,
        newtab_interactions.visits_with_sponsored_topsite_impression,
        newtab_interactions.sum_topsite_clicks,
        newtab_interactions.sum_topsite_impressions,
        newtab_interactions.sum_sponsored_topsite_clicks,
        newtab_interactions.sum_sponsored_topsite_impressions,
        newtab_interactions.clients_with_topsite_click,
        newtab_interactions.clients_with_topsite_impression,
        newtab_interactions.clients_with_sponsored_topsite_click,
        newtab_interactions.clients_with_sponsored_topsite_impression,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      sql_trigger_value:
      SELECT
        MAX(last_modified_time)
      FROM
        moz-fx-data-shared-prod.telemetry_derived.INFORMATION_SCHEMA.PARTITIONS
      WHERE
        table_name = "newtab_interactions_v1";;
      increment_key: newtab_interactions.submission_date
      increment_offset: 1
    }
  }

}
