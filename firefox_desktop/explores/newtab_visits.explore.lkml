include: "../views/newtab_visits.view.lkml"
include: "../../shared/views/countries.view.lkml"
include: "//looker-hub/firefox_desktop/datagroups/newtab_visits_table_last_updated.datagroup"
include: "/firefox_desktop/views/key_tentpole_dates.view.lkml"

explore: newtab_visits {
  persist_with: newtab_visits_table_last_updated
  sql_always_where: ${newtab_visits.submission_date} >= '2022-07-01' ;;
  label: "New Tab Visits"
  from: newtab_visits

  always_filter: {
    filters: [
      submission_date: "28 days",
    ]
  }

  join: countries {
    type: left_outer
    relationship: one_to_one
    sql_on: ${newtab_visits.country_code} = ${countries.code} ;;
  }

  join: newtab_visits_table__topsite_tile_interactions {
    relationship: one_to_many
    view_label: "Topsite Interactions"
    sql: LEFT JOIN UNNEST(${newtab_visits.topsite_tile_interactions}) AS newtab_visits_table__topsite_tile_interactions ;;
  }

  aggregate_table: rollup__newtab_visits_table__topsite_tile_interactions_sum_organic_topsite_tile_clicks__newtab_visits_table__topsite_tile_interactions_sum_organic_topsite_tile_impressions {
    query: {
      measures: [newtab_visits_table__topsite_tile_interactions.sum_organic_topsite_tile_clicks, newtab_visits_table__topsite_tile_interactions.sum_organic_topsite_tile_impressions]
      filters: [
        newtab_visits.channel: "release",
        newtab_visits.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_visits_table_last_updated
    }
  }

  aggregate_table: rollup__percent_of_non_impression_engagment_clients__percent_of_non_impressions_engagement_visits {
    query: {
      measures: [percent_of_non_impression_engagment_clients, percent_of_non_impressions_engagement_visits]
      filters: [
        newtab_visits.channel: "release",
        newtab_visits.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_visits_table_last_updated
    }
  }

  aggregate_table: rollup__had_non_impression_engagement__submission_date {
    query: {
      dimensions: [had_non_impression_engagement, submission_date]
      measures: [clients, visits]
      filters: [
        newtab_visits.channel: "release",
        newtab_visits.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_visits_table_last_updated
    }
  }

  aggregate_table: rollup__activity_segment__had_non_impression_engagement {
    query: {
      dimensions: [activity_segment, had_non_impression_engagement]
      measures: [clients]
      filters: [
        newtab_visits.channel: "release",
        newtab_visits.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_visits_table_last_updated
    }
  }

  aggregate_table: rollup__had_non_impression_engagement__is_new_profile {
    query: {
      dimensions: [had_non_impression_engagement, is_new_profile]
      measures: [clients]
      filters: [
        newtab_visits.channel: "release",
        newtab_visits.submission_date: "1 week ago for 1 week"
      ]
    }

    materialization: {
      datagroup_trigger: newtab_visits_table_last_updated
    }
  }


  aggregate_table: rollup__newtab_visits_sponsored_tiles_per_day {
    query: {
      dimensions: [
        newtab_visits.submission_date,
        newtab_visits.country_code,
        newtab_visits_table__topsite_tile_interactions.topsite_tile_position,
        newtab_visits_table__topsite_tile_interactions.topsite_tile_assigned_sov_branch,
        newtab_visits_table__topsite_tile_interactions.topsite_tile_displayed_sov_branch,
      ]
      measures: [
        newtab_visits_table__topsite_tile_interactions.sum_sponsored_topsite_tile_impressions,
        newtab_visits_table__topsite_tile_interactions.sum_sponsored_topsite_tile_dismissals,
        newtab_visits_table__topsite_tile_interactions.sum_sponsored_topsite_tile_clicks,
        newtab_visits.clients
      ]
      filters: [newtab_visits.submission_date: "after 2023-01-01"]
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE();;
    }
  }

}
