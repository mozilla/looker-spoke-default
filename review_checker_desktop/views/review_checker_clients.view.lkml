#include: "//looker-hub//review_checker_desktop/views/clients.view.lkml"
include: "//looker-hub/review_checker_desktop/views/clients.view"

view: +clients {

  dimension: client_id {
    primary_key: yes
    sql: ${TABLE}.client_id ;;
  }

  #dimension
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

  dimension: legacy_client_id {
    sql: ${TABLE}.legacy_client_id ;;
    type: string
    hidden: yes
  }

  dimension: sap {
    sql: ${TABLE}.sap ;;
    type: number
    hidden: yes
  }

  dimension: is_exposed_event {
    type: number
    sql: ${events.is_surface_displayed} ;;
  }

  dimension: is_engaged_with_sidebar {
    type: number
    sql: ${events.is_engaged_with_sidebar} ;;
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
    sql: 100 * ${fx_dau}/${client_count} ;;
    value_format: "0\%"
    description: "percentage of clients who meet defintion of fx daily active users"
  }

  measure: search {
    type: sum
    sql: ${sap};;
    label: "sap"
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

  measure: is_exposed_event_count {
    type: sum
    sql: ${is_exposed_event} ;;
  }

  measure: opt_in_rate {
    type: number
    sql: 100 * (${client_count})/NULLIF(${is_exposed_event_count}, 0) ;;

  }

  measure: opt_out_rate {
    type: number
    sql: 100 * ${is_opt_out_count}/NULLIF(${is_opt_in_count},0) ;;
    value_format: "0\%"
  }

  measure: engaged_with_sidebar_count {
    type: sum
    sql: ${is_engaged_with_sidebar} ;;
  }

}
