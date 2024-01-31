include: "//looker-hub/review_checker/views/android_clients.view.lkml"

view: +android_clients {

  dimension: client_id {
    #primary_key: yes
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: client_id_date {
    primary_key: yes
    sql: CONCAT(${TABLE}.client_id, ${TABLE}.submission_date) ;;
    type: string
    hidden: yes
  }

  dimension: active_hours_sum {
    sql: ${TABLE}.active_hours_sum ;;
    type: number
    hidden: yes
  }

  dimension: ad_click {
    sql: ${TABLE}.ad_click ;;
    type: number
    hidden: yes
  }

  dimension: is_fx_dau {
    sql: ${TABLE}.is_fx_dau ;;
    type: number
    hidden: yes
  }

  dimension: sap {
    sql: ${TABLE}.sap ;;
    type: number
    hidden: yes
  }

  #measures
  measure: active_hours {
    type: sum
    sql:  ${active_hours_sum};;
    value_format: "0.##"
  }

  measure: active_hours_per_client {
    type: number
    sql: ${active_hours}/${client_count} ;;
    value_format: "0.##"
  }

  measure: ad_clicks {
    type: sum
    sql: ${ad_click} ;;
  }

  measure: ad_clicks_rate {
    type: number
    sql: ${ad_clicks}/${client_count} ;;
    value_format: "0.##"
  }

  measure: fx_dau {
    type: sum
    sql: ${is_fx_dau} ;;
  }

  measure: fx_dau_percentage {
    type: number
    sql: ${fx_dau}/${client_count} ;;
    value_format_name: percent_2
    description: "percentage of RC clients who meet defintion of fx daily active users"
  }

  measure: search {
    type: sum
    sql: ${sap};;
    label: "SAP"
  }

  measure: sap_per_client {
    type: number
    sql: ${search}/${client_count};;
  }

  measure: product_page_visits {
    type: sum
    sql: ${shopping_product_page_visits} ;;
  }

  measure: median_product_page_visits {
    type: median
    sql: ${shopping_product_page_visits} ;;
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: is_opt_in_count {
    type: sum
    sql: ${is_opt_in} ;;
  }

  measure: is_opt_out_count {
    type: sum
    sql: ${is_opt_out} ;;
  }

  # measure: is_surface_onboarding_displayed_count {
  #   type: sum
  #   sql: ${is_surface_onboarding_displayed} ;;
  # }

  # measure: opt_in_rate {
  #   type: number
  #   sql: 100 * (${is_opt_in_count})/NULLIF(${is_surface_onboarding_displayed_count}, 0) ;;

  # }

  measure: opt_out_rate {
    type: number
    sql:  SAFE_DIVIDE(${is_opt_out_count}, ${is_opt_in_count}) ;;
    value_format_name: percent_2
  }


}
