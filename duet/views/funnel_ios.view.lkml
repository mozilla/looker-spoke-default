include: "//looker-hub/firefox_ios/views/app_store_funnel_table.view.lkml"

view: +app_store_funnel_table {

  dimension: views {
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  measure: views_sum {
    label: "Views"
    description: "Unique daily impressions, counted when a customer views the app on the Today, Games, Apps, or Search tabs on the App Store, or on the product page"
    type: sum
    sql: ${TABLE}.views ;;
  }

  dimension: total_downloads {
    hidden: yes
    sql: ${TABLE}.total_downloads ;;
  }

  measure: total_downloads_sum {
    label: "Total downloads"
    description: "Total downloads, including first-time downloads and redownloads"
    type: sum
    sql: ${TABLE}.total_downloads ;;
  }

  dimension: first_time_downloads {
    hidden: yes
    sql: ${TABLE}.first_time_downloads ;;
  }

  measure: first_time_downloads_sum {
    label: "First-time downloads"
    description: "First-time downloads"
    type: sum
    sql: ${TABLE}.first_time_downloads ;;
  }

  dimension: redownloads {
    hidden: yes
    sql: ${TABLE}.redownloads ;;
  }

  measure: redownloads_sum {
    label: "Redownloads"
    description: "Redownloads"
    type: sum
    sql: ${TABLE}.redownloads ;;
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  measure: new_profiles_sum {
    label: "New Profiles"
    description: "Unique Client IDs, usually generated when the app is opened for the first time"
    type: sum
    sql: ${TABLE}.new_profiles ;;
  }

  dimension: activations {
    hidden: yes
    sql: ${TABLE}.activations ;;
  }

  measure: activations_sum {
    label: "Activations"
    description: "Early indicator for LTV based on days of app open and searches on the first week"
    type: sum
    sql: ${TABLE}.activations ;;
  }

  measure: view_ctr {
    label: "View Click Through Rate"
    type: number
    value_format_name: percent_2
    sql: ${total_downloads_sum}/ NULLIF(${views_sum},0) ;;
  }

  measure: activation_rate {
    label: "Activation Rate"
    type: number
    value_format_name: percent_2
    sql: ${activations_sum}/ NULLIF(${new_profiles_sum},0) ;;
  }

}
