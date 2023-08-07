view: +app_store_funnel_ios {

  measure: view_ctr {
    label: "View Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_downloads}/ NULLIF(${views},0) ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations}/ NULLIF(${new_profiles},0) ;;
  }

}
