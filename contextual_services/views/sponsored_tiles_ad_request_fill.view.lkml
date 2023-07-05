include: "//looker-hub/contextual_services/views/sponsored_tiles_ad_request_fill.view.lkml"

view: +sponsored_tiles_ad_request_fill {

  dimension: device {
    hidden: yes
  }

  dimension: normalized_os {
    hidden: yes
  }

  dimension: adm_empty_response_sum {
    hidden: yes
  }


  measure: adm_empty_response_sum_measure {
    label: "Empty Response Count"
    sql: ${TABLE}.adm_empty_response_sum ;;
    type: sum
  }

  dimension: adm_request_sum {
    hidden: yes
  }


  measure: adm_request_sum_measure {
    label: "Total Requests Sent to Partner"
    sql: ${TABLE}.adm_request_sum ;;
    type: sum
  }

  dimension: adm_response_rate {
    hidden:  yes
  }


  measure: adm_response_rate_measure {
    label: "Request Response Rate"
    sql: (${adm_request_sum_measure} - ${adm_empty_response_sum_measure}) / ${adm_request_sum_measure} ;;
    type: number
  }

  dimension: adm_response_tiles_min {
    hidden:  yes
  }


  measure: adm_response_tiles_min_measure {
    label: "Minimum Advertisers in Response"
    sql: ${TABLE}.adm_response_tiles_min ;;
    type: min
  }

}
