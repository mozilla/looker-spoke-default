include: "//looker-hub/firefox_desktop/views/sponsored_tiles_clients_daily.view.lkml"

view: +sponsored_tiles_clients_daily {

  measure: distinct_client_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.client_id) ;;
  }

  dimension: sponsored_tiles_enabled_at_startup {
    description: "Only available for Android. Must filter to Android to avoid overinflated disable counts."
    sql:${TABLE}.sponsored_tiles_enabled_at_startup ;;
  }

  measure: sponsored_tiles_impression {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_impression_count) ;;
  }

  measure: sponsored_tiles_click {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_click_count) ;;
  }

  measure: sponsored_tiles_disable {
    type: number
    sql: SUM(${TABLE}.sponsored_tiles_disable_count) ;;
  }

  measure: sponsored_tiles_dismissal {
    type: number
    description: "Only available for desktop."
    sql: SUM(${TABLE}.sponsored_tiles_dismissal_count) ;;
  }

  dimension: sponsored_tiles_impression_count {
    hidden: yes
  }

  dimension: sponsored_tiles_click_count {
    hidden: yes
  }

  dimension: sponsored_tiles_disable_count {
    hidden: yes
  }

  dimension: sponsored_tiles_dismissal_count {
    hidden: yes
  }

}
