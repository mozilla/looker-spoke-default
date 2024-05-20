view: newtab_clients_daily {

  sql_table_name: `mozdata.telemetry.newtab_clients_daily` ;;

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: legacy_telemetry_id {
    hidden: yes
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
    sql: ${TABLE}.sponsored_enabled ;;
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

  dimension: country_code {
    sql: ${TABLE}.country_code ;;
    type: string
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: default_search_engine {
    sql: ${TABLE}.default_search_engine ;;
    type: string
  }

  dimension: default_private_search_engine {
    sql: ${TABLE}.default_private_search_engine ;;
    type: string
  }

  dimension: normalized_os {
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: activity_segment {
    sql: ${TABLE}.activity_segment ;;
    type: string
  }

  dimension: is_new_profile {
    sql: ${TABLE}.is_new_profile ;;
    type: yesno
  }

  dimension: major_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.browser_version).major_version ;;
    description: "The major version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: minor_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.browser_version).minor_version ;;
    description: "The minor version of the application, as a number."
    group_label: "Browser Version"
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
    approximate: yes
  }

  measure: newtab_visit_count {
    sql: ${TABLE}.newtab_visit_count ;;
    type: sum
  }

  measure: visits_with_non_impression_engagement {
    sql: ${TABLE}.visits_with_non_impression_engagement ;;
    type: sum
  }

  measure: visits_with_non_search_engagement {
    sql: ${TABLE}.visits_with_non_search_engagement ;;
    type: sum
  }

  measure: non_search_engagement {
    sql: ${TABLE}.topsite_tile_clicks + ${TABLE}.pocket_clicks + ${TABLE}.pocket_saves;;
  }

  measure: searches {
    sql: ${TABLE}.searches ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_search_ad_clicks {
    sql: ${TABLE}.tagged_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_search_ad_impressions {
    sql: ${TABLE}.tagged_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: follow_on_search_ad_clicks {
    sql: ${TABLE}.follow_on_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: follow_on_search_ad_impressions {
    sql: ${TABLE}.follow_on_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_follow_on_search_ad_clicks {
    sql: ${TABLE}.tagged_follow_on_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_follow_on_search_ad_impressions {
    sql: ${TABLE}.tagged_follow_on_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: topsite_tile_clicks {
    sql: ${TABLE}.topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_clicks {
    sql: ${TABLE}.sponsored_topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_clicks {
    sql: ${TABLE}.organic_topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: topsite_tile_impressions {
    sql: ${TABLE}.topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_impressions {
    sql: ${TABLE}.sponsored_topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_impressions {
    sql: ${TABLE}.organic_topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: topsite_tile_dismissals {
    sql: ${TABLE}.topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_dismissals {
    sql: ${TABLE}.sponsored_topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_dismissals {
    sql: ${TABLE}.organic_topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: pocket_impressions {
    sql: ${TABLE}.pocket_impressions ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: sponsored_pocket_impressions {
    sql: ${TABLE}.sponsored_pocket_impressions ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: organic_pocket_impressions {
    sql: ${TABLE}.organic_pocket_impressions ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: pocket_clicks {
    sql: ${TABLE}.pocket_clicks ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: sponsored_pocket_clicks {
    sql: ${TABLE}.sponsored_pocket_clicks ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: organic_pocket_clicks {
    sql: ${TABLE}.organic_pocket_clicks ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: pocket_saves {
    sql: ${TABLE}.pocket_saves ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: sponsored_pocket_saves {
    sql: ${TABLE}.sponsored_pocket_saves ;;
    type: sum
    group_label: "Pocket Interactions"
  }

  measure: organic_pocket_saves {
    sql: ${TABLE}.organic_pocket_saves ;;
    type: sum
    group_label: "Pocket Interactions"
  }

}
