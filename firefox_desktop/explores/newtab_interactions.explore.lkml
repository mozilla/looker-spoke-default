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

  aggregate_table: rollup__organic_pocket_ctr__percent_of_newtab_interactions_clients_pocket_disabled__percent_of_newtab_interactions_clients_sponsored_stories_disabled__sum_organic_pocket_clicks__sum_organic_pocket_impressions__sum_sponsored_pocket_imp {
    query: {
      measures: [organic_pocket_ctr, percent_of_newtab_interactions_clients_pocket_disabled, percent_of_newtab_interactions_clients_sponsored_stories_disabled, sum_organic_pocket_clicks, sum_organic_pocket_impressions, sum_sponsored_pocket_impressions]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__pocket_sponsored_ctr__sponsored_tiles_ctr__sum_sponsored_pocket_clicks__visits_with_sponsored_topsite_click__visits_with_sponsored_topsite_impression {
    query: {
      measures: [pocket_sponsored_ctr, sponsored_tiles_ctr, sum_sponsored_pocket_clicks, visits_with_sponsored_topsite_click, visits_with_sponsored_topsite_impression]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__topsites_enabled {
    query: {
      dimensions: [topsites_enabled]
      measures: [clients]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week",
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__percent_of_clients_with_search__percent_of_searches_with_ads__percent_of_visits_with_search__sum_all_search_ad_clicks__sum_all_search_ad_impressions__sum_searches {
    query: {
      measures: [percent_of_clients_with_search, percent_of_searches_with_ads, percent_of_visits_with_search, sum_all_search_ad_clicks, sum_all_search_ad_impressions, sum_searches]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__sum_all_search_ad_clicks__sum_all_search_ad_impressions__sum_searches {
    query: {
      measures: [sum_all_search_ad_clicks, sum_all_search_ad_impressions, sum_searches]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__percent_of_client_with_non_default_new_tab__percent_of_clients_with_non_default_homepage__percent_of_newtab_visits_default_ui {
    query: {
      measures: [percent_of_client_with_non_default_new_tab, percent_of_clients_with_non_default_homepage, percent_of_newtab_visits_default_ui]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__submission_date {
    query: {
      dimensions: [submission_date]
      measures: [clients, visits]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__submission_date__homepage_category{
    query: {
      dimensions: [submission_date]
      measures: [clients, visits]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__country_code {
    query: {
      dimensions: [country_code]
      measures: [visits]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__newtab_newtab_category {
    query: {
      dimensions: [newtab_newtab_category]
      measures: [clients]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.newtab_newtab_category: "-NULL",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
  }

  aggregate_table: rollup__newtab_open_source {
    query: {
      dimensions: [newtab_open_source]
      measures: [visits]
      filters: [
        newtab_interactions.channel: "release",
        newtab_interactions.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_interactions_table_last_updated
    }
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
