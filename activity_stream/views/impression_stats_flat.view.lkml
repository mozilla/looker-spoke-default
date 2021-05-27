include: "//looker-hub/activity_stream/views/impression_stats_flat.view.lkml"

view: +impression_stats_flat {
  measure: block_count {
    type: sum
    sql: ${blocked} ;;
    description: "The number of blocks of a tile."
  }

  measure: click_count {
    type: sum
    sql: ${clicks} ;;
    description: "The number of clicks on a tile."
  }

  measure: impression_count {
    type: sum
    sql: ${impressions} ;;
    description: "The number of impressions of a tile."
  }

  measure: loaded_count {
    type: sum
    sql: ${loaded} ;;
    description: "The number of loads of a tile."
  }

  measure: pocketed_count {
    type: sum
    sql: ${pocketed} ;;
    description: "The number of times pocketed."
  }
}
