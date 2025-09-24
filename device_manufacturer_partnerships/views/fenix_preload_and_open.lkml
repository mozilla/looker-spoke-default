view: +fenix_preload_and_open {
  dimension: preloaded {
    hidden: yes
  }
  measure: preloaded {
    type: sum
    sql: ${TABLE}.preloaded ;;
  }
}
