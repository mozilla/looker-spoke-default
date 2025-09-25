include: "//looker-hub/device_manufacturer_partnerships/views/fenix_preload_and_open.view.lkml"

view: +fenix_preload_and_open {
  dimension: preloaded {
    hidden: yes
  }
  measure: sum_preloaded {
    type: sum
    sql: ${TABLE}.preloaded ;;
  }
}
