include: "//looker-hub/search/views/mobile_search_clients_engines_sources_daily.view.lkml"

view: +mobile_search_clients_engines_sources_daily {
  measure: total_searches {
    type: sum
    sql: ${sap} ;;
    description: "Total searches from all Search Access Points (SAPs), not including follow-ons.
    These may or may not be tagged."
  }

  measure: total_tagged_sap_searches {
    type: sum
    sql: ${tagged_sap} ;;
    description: "Total tagged searches from all Search Access Points (SAPs)."
  }

  measure: total_tagged_searches {
    type: sum
    sql: ${tagged_sap} + ${tagged_follow_on} ;;
    description: "Total tagged searches from all Search Access Points (SAPs) and follow-ons."
  }

  measure: total_tagged_follow_on_searches {
    type: sum
    sql: ${tagged_follow_on} ;;
    description: "Total follow-on searches, which occur after a search from a Search Access Point (SAP)."
  }

  measure: total_organic_searches {
    type: sum
    sql: ${organic} ;;
    description: "Total organic searches, made directly at the engine's website."
  }

  measure: total_searches_with_ads {
    type: sum
    sql: ${search_with_ads} ;;
    description: "Total searches with ads. Does not include organic searches."
  }

  measure: total_ad_clicks {
    type: sum
    sql: ${ad_click} ;;
    description: "Total ad clicks. Does not include ad clicks resulting from organic searches."
  }

  measure: total_organic_ad_clicks {
    type: sum
    sql: ${ad_click_organic} ;;
    description: "Total organic ad clicks."
  }
}
