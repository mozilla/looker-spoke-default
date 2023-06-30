include: "//looker-hub/contextual_services/views/sponsored_tiles_ad_request_fill.view.lkml"

view: +sponsored_tiles_ad_request_fill {

  dimension: adm_empty_response_sum {
    hidden: yes
  }

  measure: adm_empty_response_sum_measure {
    sql: ${TABLE}.adm_empty_response_sum ;;
    type: sum
  }

  dimension: adm_request_sum {
    hidden: yes
  }

  measure: adm_request_sum_measure {
    sql: ${TABLE}.adm_request_sum ;;
    type: sum
  }

  dimension: adm_response_rate {
    hidden:  yes
  }

  measure: adm_response_rate_measure {
    sql: ${TABLE}.adm_response_rate ;;
    type: sum
  }

  dimension: adm_response_tiles_min {
    hidden:  yes
  }

  measure: adm_response_tiles_min_measure {
    sql: ${TABLE}.adm_response_tiles_min ;;
    type: min
  }

}
