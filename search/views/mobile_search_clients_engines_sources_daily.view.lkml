include: "//looker-hub/search/views/mobile_search_clients_engines_sources_daily.view.lkml"

view: +mobile_search_clients_engines_sources_daily {
  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  measure: total_searches {
    label: "SAP Searches"
    type: sum
    sql: ${sap} ;;
    description: "Total searches from all Search Access Points (SAPs), not including follow-ons.
    These may or may not be tagged."
  }

  measure: total_tagged_sap_searches {
    label: "Tagged SAP Searches"
    type: sum
    sql: ${tagged_sap} ;;
    description: "Total tagged searches from all Search Access Points (SAPs)."
  }

  measure: total_tagged_searches {
    label: "Tagged Searches"
    type: sum
    sql: ${tagged_sap} + ${tagged_follow_on} ;;
    description: "Total tagged searches from all Search Access Points (SAPs) and follow-ons."
  }

  measure: total_tagged_follow_on_searches {
    label: "Tagged Follow-on Searches"
    type: sum
    sql: ${tagged_follow_on} ;;
    description: "Total follow-on searches, which occur after a search from a Search Access Point (SAP)."
  }

  measure: total_organic_searches {
    label: "Organic Searches"
    type: sum
    sql: ${organic} ;;
    description: "Total organic searches, made directly at the engine's website."
  }

  measure: total_searches_with_ads {
    label: "Searches With Ads"
    type: sum
    sql: ${search_with_ads} ;;
    description: "Total searches with ads. Does not include organic searches."
  }

  measure: total_ad_clicks {
    label: "Ad Clicks"
    type: sum
    sql: ${ad_click} ;;
    description: "Total ad clicks. Does not include ad clicks resulting from organic searches."
  }

  measure: total_organic_ad_clicks {
    label: "Organic Ad Clicks"
    type: sum
    sql: ${ad_click_organic} ;;
    description: "Total organic ad clicks."
  }
}
