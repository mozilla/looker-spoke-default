include: "//looker-hub/firefox_desktop/views/newtab_visits_table.view.lkml"

view: newtab_visits {
  extends: [newtab_visits_table]

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
}
