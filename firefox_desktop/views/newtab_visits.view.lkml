include: "//looker-hub/firefox_desktop/views/newtab_visits_table.view.lkml"

view: newtab_visits {
  extends: [newtab_visits_table]

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: newtab_visit_id {
    hidden: yes
    primary_key: yes
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: legacy_telemetry_id {
    hidden: yes
  }

  dimension: topsites_sponsored_enabled {
    hidden: yes
  }

  dimension: pocket_story_position {
    sql: ${TABLE}.pocket_story_position ;;
    type: number
  }

  dimension: pocket_enabled {
    sql: ${TABLE}.pocket_enabled ;;
    type: yesno
  }

  dimension: pocket_is_signed_in {
    sql: ${TABLE}.pocket_is_signed_in ;;
    type: yesno
  }

  dimension: pocket_sponsored_stories_enabled {
    sql: ${TABLE}.pocket_sponsored_stories_enabled ;;
    type: yesno
  }

  dimension: topsites_enabled {
    sql: ${TABLE}.topsites_enabled ;;
    type: yesno
  }

  dimension: sponsored_topsites_enabled {
    sql: ${TABLE}.topsites_sponsored_enabled ;;
    type: yesno
  }

  dimension: newtab_homepage_category {
    sql: ${TABLE}.newtab_homepage_category ;;
    type: string
  }

  dimension: newtab_newtab_category {
    sql: ${TABLE}.newtab_newtab_category ;;
    type: string
  }

  dimension: newtab_search_enabled {
    sql: ${TABLE}.newtab_search_enabled ;;
    type: yesno
  }

  dimension: topsites_rows {
    sql: ${TABLE}.topsites_rows ;;
    type: number
  }

  measure: visits {
    type: count
  }

  measure: clients {
    type: count_distinct
    sql: ${client_id} ;;
    approximate: yes
  }

}

view: +newtab_visits_table__topsite_tile_interactions {

  dimension: primary_key {
    sql: CONCAT(${topsite_tile_position}, ${topsite_tile_advertiser_name}, ${topsite_tile_id}) ;;
    hidden: yes
    primary_key: yes
  }

  dimension: organic_topsite_tile_clicks {
    hidden: yes
  }

  measure: sum_organic_topsite_tile_clicks {
    sql: ${TABLE}.organic_topsite_tile_clicks ;;
    type: sum
  }

  dimension: organic_topsite_tile_impressions {
    hidden: yes
  }

  measure: sum_organic_topsite_tile_impressions {
    sql: ${TABLE}.organic_topsite_tile_impressions ;;
    type: sum
  }

  dimension: organic_topsite_tile_dismissals {
    hidden: yes
  }

  measure: sum_organic_topsite_tile_dismissals {
    sql: ${TABLE}.organic_topsite_tile_dismissals ;;
    type: sum
  }

  dimension: sponsored_topsite_tile_clicks {
    hidden: yes
  }

  measure: sum_sponsored_topsite_tile_clicks {
    sql: ${TABLE}.sponsored_topsite_tile_clicks ;;
    type: sum
  }

  dimension: sponsored_topsite_tile_impressions {
    hidden: yes
  }

  measure: sum_sponsored_topsite_tile_impressions {
    sql: ${TABLE}.sponsored_topsite_tile_impressions ;;
    type: sum
  }

  dimension: sponsored_topsite_tile_dismissals {
    hidden: yes
  }

  measure: sum_sponsored_topsite_tile_dismissals {
    sql: ${TABLE}.sponsored_topsite_tile_dismissals ;;
    type: sum
  }

  dimension: topsite_tile_clicks {
    hidden: yes
  }

  measure: sum_topsite_tile_clicks {
    sql: ${TABLE}.topsite_tile_clicks ;;
    type: sum
  }

  dimension: topsite_tile_impressions {
    hidden: yes
  }

  measure: sum_topsite_tile_impressions {
    sql: ${TABLE}.topsite_tile_impressions ;;
    type: sum
  }

  dimension: topsite_tile_dismissals {
    hidden: yes
  }

  measure: sum_topsite_tile_dismissals {
    sql: ${TABLE}.topsite_tile_dismissals ;;
    type: sum
  }
}

view: +newtab_visits_table__pocket_interactions {

  dimension: primary_key {
    sql: CONCAT(${pocket_story_position}) ;;
    hidden: yes
    primary_key: yes
  }

  dimension: pocket_impressions {
    hidden: yes
  }

  measure: sum_pocket_impressions {
    sql: ${TABLE}.pocket_impressions ;;
    type: sum
  }

  dimension: sponsored_pocket_impressions {
    hidden: yes
  }

  measure: sum_sponsored_pocket_impressions {
    sql: ${TABLE}.sponsored_pocket_impressions ;;
    type: sum
  }

  dimension: organic_pocket_impressions {
    hidden: yes
  }

  measure: sum_organic_pocket_impressions {
    sql: ${TABLE}.sponsored_pocket_impressions ;;
    type: sum
  }

  dimension: pocket_clicks {
    hidden: yes
  }

  measure: sum_pocket_clicks {
    sql: ${TABLE}.pocket_clicks ;;
    type: sum
  }

  dimension: organic_pocket_clicks {
    hidden: yes
  }

  measure: sum_organic_pocket_clicks {
    sql: ${TABLE}.sponsored_pocket_clicks ;;
    type: sum
  }

  dimension: pocket_saves {
    hidden: yes
  }

  measure: sum_pocket_saves {
    sql: ${TABLE}.pocket_saves ;;
    type: sum
  }

  dimension: sponsored_pocket_saves {
    hidden: yes
  }

  measure: sum_sponsored_pocket_saves {
    sql: ${TABLE}.sponsored_pocket_saves ;;
    type: sum
  }

  dimension: organic_pocket_saves {
    hidden: yes
  }

  measure: sum_organic_pocket_saves {
    sql: ${TABLE}.organic_pocket_saves ;;
    type: sum
  }
}

view: +newtab_visits_table__search_interactions {

  dimension: primary_key {
    sql: CONCAT(${search_engine}, ${search_access_point}) ;;
    hidden: yes
    primary_key: yes
  }

  dimension: searches {
    hidden: yes
  }

  measure: sum_searches {
    sql: ${TABLE}.searches ;;
    type: sum
  }

  dimension: tagged_search_ad_clicks {
    hidden: yes
  }

  measure: sum_tagged_search_ad_clicks {
    sql: ${TABLE}.tagged_search_ad_clicks ;;
    type: sum
  }

  dimension: tagged_search_ad_impressions {
    hidden: yes
  }

  measure: sum_tagged_search_ad_impressions {
    sql: ${TABLE}.tagged_search_ad_impressions ;;
    type: sum
  }

  dimension: follow_on_search_ad_clicks {
    hidden: yes
  }

  measure: sum_follow_on_search_ad_clicks {
    sql: ${TABLE}.follow_on_search_ad_clicks ;;
    type: sum
  }

  dimension: follow_on_search_ad_impressions {
    hidden: yes
  }

  measure: sum_follow_on_search_ad_impressions {
    sql: ${TABLE}.follow_on_search_ad_impressions ;;
    type: sum
  }

  dimension: tagged_follow_on_search_ad_clicks {
    hidden: yes
  }

  measure: sum_tagged_follow_on_search_ad_clicks {
    sql: ${TABLE}.tagged_follow_on_search_ad_clicks ;;
    type: sum
  }

  dimension: tagged_follow_on_search_ad_impressions {
    hidden: yes
  }

  measure: sum_tagged_follow_on_search_ad_impressions {
    sql: ${TABLE}.tagged_follow_on_search_ad_impressions ;;
    type: sum
  }
}
