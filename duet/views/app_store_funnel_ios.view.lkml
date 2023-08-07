include: "//looker-hub/duet/views/app_store_funnel_ios.view"

view: +app_store_funnel_ios {

  dimension: views {
    hidden: yes
  }

  dimension: total_downloads {
    hidden: yes
  }

  dimension: first_time_downloads {
    hidden: yes
  }

  dimension: redownloads {
    hidden: yes
  }

  dimension: new_profiles {
    hidden: yes
  }

  dimension: activations {
    hidden: yes
  }

  measure: views_measure {
    label: "Views"
    description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
    type: sum
    sql: ${TABLE}.views ;;
  }

  measure: total_downloads_measure {
    label: "Total Downloads"
    description: "Total downloads, including first-time downloads and redownloads"
    type: sum
    sql: ${TABLE}.total_downloads ;;
  }

  measure: redownload_measure {
    label: "Redownloads"
    description: "Redownloads in the app store"
    type: sum
    sql: ${TABLE}.redownloads ;;
  }

  measure: first_time_downloads_measure {
    label: "First time downloads"
    description: "First time downloads in the app store"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
  }

  measure: new_profiles_measure {
    label: "New profiles"
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  measure: activations_measure {
    label: "Activations"
    description: "Early indicator for LTV based on days of app open and searches on the first week"
    type: sum
    sql: ${TABLE}.activations ;;
  }

  measure: view_ctr {
    label: "View Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_downloads_measure} / NULLIF(${views}, 0) ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations_measure} / NULLIF(${new_profiles}, 0) ;;
  }

}
