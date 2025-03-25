include: "../views/newtab_interactions.view.lkml"
include: "../../shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/newtab_interactions_table_last_updated.datagroup"
include: "/firefox_desktop/views/key_tentpole_dates.view.lkml"

explore: newtab_interactions {
  persist_with: newtab_interactions_table_last_updated
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

  ## Additive Rollups

  aggregate_table: rollup__newtab_interactions_pocket_per_day {
    query: {
      dimensions: [
        newtab_interactions.submission_date,
        newtab_interactions.channel,
        newtab_interactions.country_code,
        newtab_interactions.pocket_story_position,
        countries.tier,
        countries.name,
        countries.pocket_available_on_newtab,
      ]
      measures: [
        newtab_interactions.sum_pocket_impressions,
        newtab_interactions.sum_pocket_saves,
        newtab_interactions.sum_pocket_clicks,
        newtab_interactions.sum_organic_pocket_impressions,
        newtab_interactions.sum_organic_pocket_saves,
        newtab_interactions.sum_organic_pocket_clicks,
        newtab_interactions.sum_sponsored_pocket_impressions,
        newtab_interactions.sum_sponsored_pocket_saves,
        newtab_interactions.sum_sponsored_pocket_clicks,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
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
        countries.name,
        countries.pocket_available_on_newtab,
      ]
      measures: [
        newtab_interactions.sum_searches,
        newtab_interactions.sum_tagged_search_ad_impressions,
        newtab_interactions.sum_tagged_search_ad_clicks,
        newtab_interactions.sum_tagged_follow_on_search_ad_impressions,
        newtab_interactions.sum_tagged_follow_on_search_ad_clicks,
        newtab_interactions.sum_all_search_ad_clicks,
        newtab_interactions.sum_all_search_ad_impressions,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
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
        newtab_interactions.topsites_rows,
        countries.tier,
        countries.name,
        countries.pocket_available_on_newtab,
      ]
      measures: [
        newtab_interactions.sum_topsite_clicks,
        newtab_interactions.sum_topsite_impressions,
        newtab_interactions.sum_sponsored_topsite_clicks,
        newtab_interactions.sum_organic_topsite_clicks,
        newtab_interactions.sum_sponsored_topsite_impressions,
        newtab_interactions.sum_organic_topsite_impressions,
      ]
      filters: [newtab_interactions.submission_date: "after 2022-07-01"]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
      increment_key: newtab_interactions.submission_date
      increment_offset: 1
    }
  }

}
