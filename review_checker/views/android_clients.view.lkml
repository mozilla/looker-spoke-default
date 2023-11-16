include: "//looker-hub/review_checker/views/android_clients.view.lkml"

view: +android_clients {

  dimension: client_id {
    primary_key: yes
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: client_id_date {
    #primary_key: yes
    sql: CONCAT(${TABLE}.client_id, ${TABLE}.submission_date) ;;
    type: string
  }

  #measures
  measure: active_hours {
    type: sum_distinct
    sql_distinct_key: ${client_id} ;;
    sql:  ${active_hours_sum};;
    value_format: "0.##"
  }

  measure: active_hours_per_client {
    type: number
    sql: ${active_hours}/${client_count} ;;
    value_format: "0.##"
  }

  measure: ad_clicks {
    type: sum_distinct
    sql_distinct_key: ${client_id} ;;
    sql: ${ad_click} ;;
  }

  measure: ad_clicks_raw {
    type: sum
    sql: ${ad_click} ;;
  }

  measure: ad_clicks_rate {
    type: number
    sql: ${ad_clicks}/${client_count} ;;
    value_format: "0.##"
  }

  measure: fx_dau {
    type: sum_distinct
    sql_distinct_key: ${client_id} ;;
    sql: ${is_fx_dau} ;;
  }

  measure: fx_dau_percentage {
    type: number
    sql: 100 * ${fx_dau}/${client_count} ;;
    value_format: "0\%"
    description: "percentage of RC clients who meet defintion of fx daily active users"
  }

  measure: search {
    type: sum_distinct
    sql_distinct_key: ${client_id};;
    sql: ${sap};;
    label: "SAP"
  }

  measure: sap_per_client {
    type: number
    sql: ${search}/${client_count};;
  }

  measure: product_page_visits {
    type: sum_distinct
    sql_distinct_key: ${client_id_date} ;;
    sql: ${shopping_product_page_visits} ;;
  }

  measure: median_product_page_visits {
    type: median_distinct
    sql_distinct_key: ${client_id_date} ;;
    sql: ${shopping_product_page_visits} ;;
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
  }

  measure: is_opt_in_count {
    type: sum_distinct
    sql_distinct_key: ${client_id_date} ;;
    sql: ${is_opt_in} ;;
  }

  measure: is_opt_out_count {
    type: sum_distinct
    sql_distinct_key: ${client_id_date} ;;
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
    sql:  SAFE_DIVIDE(${is_opt_out_count},(${is_opt_in_count}) * 100 ;;
    value_format: "0\%"
  }


  # ###dimensions from looker-hub
  # measure: active_hours_sum {
  #   type: sum
  #   sql: ${TABLE}.active_hours_sum ;;

  # }

  # dimension: ad_click {
  #   sql: ${TABLE}.ad_click ;;
  #   type: number
  # }

  # dimension: experiments {
  #   sql: ${TABLE}.experiments ;;
  #   hidden: yes
  # }

  # dimension: is_opt_in {
  #   sql: ${TABLE}.is_opt_in ;;
  #   type: number
  # }

  # dimension: is_opt_out {
  #   sql: ${TABLE}.is_opt_out ;;
  #   type: number
  # }

  # dimension: normalized_channel {
  #   sql: ${TABLE}.normalized_channel ;;
  #   type: string
  # }

  # dimension: normalized_country_code {
  #   sql: ${TABLE}.normalized_country_code ;;
  #   type: string
  # }

  # dimension: sample_id {
  #   sql: ${TABLE}.sample_id ;;
  #   type: number
  # }

  # dimension: sap {
  #   sql: ${TABLE}.sap ;;
  #   type: number
  # }

  # dimension: shopping_product_page_visits {
  #   sql: ${TABLE}.shopping_product_page_visits ;;
  #   type: number
  # }
}
