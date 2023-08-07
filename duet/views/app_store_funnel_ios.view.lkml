include: "//looker-hub/duet/views/app_store_funnel_ios.view"

view: +app_store_funnel_ios {

  # TODO: figure out if there's a way to extend a measure and add description, then we can add them here:
  # measure: views {
  #   description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
  # }
  #
  # measure: total_downloads {
  #   description: "Total downloads, including first-time downloads and redownloads"
  # }
  #
  # measure: new_profiles {
  #   description: "Unique Client IDs, usually generated when the app is opened for the first time"
  # }
  #
  # measure: activations {
  #   description: "Early indicator for LTV based on days of app open and searches on the first week"
  # }

  measure: view_ctr {
    label: "View Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_downloads} / NULLIF(${views}, 0) ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations} / NULLIF(${new_profiles}, 0) ;;
  }

}
