include: "//looker-hub/firefox_desktop/views/*"

view: +urlbar_events {
dimension: annoyance_signal_type {
  hidden: yes
}

dimension: engaged_result_type {
  hidden: yes
}

dimension: event_name {
  hidden:  yes
}

dimension: event_timestamp {
  hidden:  yes
}

dimension: experiments {
  hidden:  yes
}

dimension: first_result_type {
  hidden:  yes
}

dimension: glean_client_id {
  hidden:  yes
}

dimension: is_terminal {
  hidden:  yes
}

dimension: legacy_telemetry_client_id {
  hidden:  yes
}

dimension: normalized_channel {
  sql: ${TABLE}.normalized_channel ;;
  type: string
}

dimension: normalized_country_code {
  sql: ${TABLE}.normalized_country_code ;;
  type: string
}

dimension: num_add_on_impressions {
  hidden:  yes
}

dimension: num_admarketplace_sponsored_impressions {
  hidden:  yes
}

dimension: num_bookmark_impressions {
  hidden:  yes
}

dimension: num_chars_typed {
  hidden:  yes
}

measure: average_characters_typed {
    type: number
    sql: AVG(${TABLE}.num_chars_typed) ;;
  }

dimension: num_default_partner_search_suggestion_impressions {
  hidden:  yes
}

dimension: num_history_impressions {
  hidden:  yes
}

dimension: num_navigational_impressions {
  hidden:  yes
}

dimension: num_open_tab_impressions {
  hidden:  yes
}

dimension: num_pocket_collection_impressions {
  hidden:  yes
}

dimension: num_quick_action_impressions {
  hidden:  yes
}

dimension: num_search_engine_impressions {
  hidden:  yes
}

dimension: num_total_results {
  hidden:  yes
}

dimension: num_trending_suggestion_impressions {
  hidden:  yes
}

dimension: num_weather_impressions {
  hidden:  yes
}

dimension: num_wikipedia_dynamic_impressions {
  hidden:  yes
}

dimension: num_wikipedia_enhanced_impressions {
  hidden:  yes
}

dimension: product_engaged_result_type {
  hidden:  yes
}

dimension: product_first_result_type {
  hidden:  yes
}

dimension: sample_id {
  hidden:  yes
}

dimension: session_action_type {
  hidden:  yes
}

dimension_group: submission {
  sql: ${TABLE}.submission_date ;;
  type: time
  timeframes: [
    raw,
    date,
    week,
    month,
    quarter,
    year,
  ]
  convert_tz: no
  datatype: date
}

  measure: event_count {
    hidden: yes
  }

measure: urlbar_clicks {
  group_label: "Urlbar Metrics"
  description: "Count of clicks on any result shown in the urlbar dropdown menu"
  sql: COUNTIF(${is_terminal} and ${session_action_type} = "engaged");;
  type: number
}

measure: urlbar_impressions {
  group_label: "Urlbar Metrics"
  description: "The number of times a user exits the urlbar dropdown menu, either by abandoning the urlbar, engaging with a urlbar result, or selecting an annoyance signal that closes the urlbar dropdown menu"
    sql: COUNTIF(${is_terminal});;
    type: number
}

measure: urlbar_CTR {
  group_label: "Urlbar Metrics"
  description: "Clicks / Impressions"
    sql: safe_divide(${urlbar_clicks}, ${urlbar_impressions});;
    type: number
}

measure: urlbar_annoyances {
  group_label: "Urlbar Metrics"
  description: "Count of clicks on annoyance signals across all results shown in the urlbar dropdown menu"
    sql: COUNTIF(${session_action_type} = "annoyance");;
    type: number
}

  measure: addon_clicks {
    group_label: "Addon"
    sql: COUNTIF(product_engaged_result_type = "add_on" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: addon_impressions {
    group_label: "Addon"
    description: "The number of times a user exits the urlbar dropdown menu while an addon result was visible"
    sql: COUNTIF(${num_add_on_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: addon_CTR {
    group_label: "Addon"
    description: "Clicks / Impressions"
    sql: safe_divide(${addon_clicks}, ${addon_impressions});;
    type: number
  }

  measure: addon_annoyances {
    group_label: "Addon"
    sql: COUNTIF(product_engaged_result_type = "add_on" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: amp_spons_clicks {
    group_label: "AdMarketplace Sponsored"
    sql: COUNTIF(product_engaged_result_type = "admarketplace_sponsored" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: amp_spons_impressions {
    group_label: "AdMarketplace Sponsored"
    description: "The number of times a user exits the urlbar dropdown menu while an AdMarketplace Sponsored result was visible"
    sql: COUNTIF(${num_admarketplace_sponsored_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: amp_spons_CTR {
    group_label: "AdMarketplace Sponsored"
    description: "Clicks / Impressions"
    sql: safe_divide(${amp_spons_clicks}, ${amp_spons_impressions});;
    type: number
  }

  measure: amp_spons_annoyances {
    group_label: "AdMarketplace Sponsored"
    sql: COUNTIF(product_engaged_result_type = "admarketplace_sponsored" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: bookmark_clicks {
    group_label: "Bookmark"
    sql: COUNTIF(product_engaged_result_type = "bookmark" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: bookmark_impressions {
    group_label: "Bookmark"
    description: "The number of times a user exits the urlbar dropdown menu while a bookmark result was visible"
    sql: COUNTIF(${num_bookmark_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: bookmark_CTR {
    group_label: "Bookmark"
    description: "Clicks / Impressions"
    sql: safe_divide(${bookmark_clicks}, ${bookmark_impressions});;
    type: number
  }

  measure: bookmark_annoyances {
    group_label: "Bookmark"
    sql: COUNTIF(product_engaged_result_type = "bookmark" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: DPSS_clicks {
    group_label: "Default Partner Search Suggestion"
    sql: COUNTIF(product_engaged_result_type = "default_partner_search_suggestion" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: DPSS_impressions {
    group_label: "Default Partner Search Suggestion"
    description: "The number of times a user exits the urlbar dropdown menu while a Default Partner Search Suggestion result was visible"
    sql: COUNTIF(${num_default_partner_search_suggestion_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: DPSS_CTR {
    group_label: "Default Partner Search Suggestion"
    description: "Clicks /Impressions"
    sql: safe_divide(${DPSS_clicks}, ${DPSS_impressions});;
    type: number
  }

  measure: DPSS_annoyances {
    group_label: "Default Partner Search Suggestion"
    sql: COUNTIF(product_engaged_result_type = "default_partner_search_suggestion" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: history_clicks {
    group_label: "History"
    sql: COUNTIF(product_engaged_result_type = "history" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: history_impressions {
    group_label: "History"
    description: "The number of times a user exits the urlbar dropdown menu while a history result was visible"
    sql: COUNTIF(${num_history_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: history_CTR {
    group_label: "History"
    description: "Clicks / Impressions"
    sql: safe_divide(${history_clicks}, ${history_impressions});;
    type: number
  }

  measure: history_annoyances {
    group_label: "History"
    sql: COUNTIF(product_engaged_result_type = "history" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: navigational_clicks {
    group_label: "Navigational"
    sql: COUNTIF(product_engaged_result_type = "navigational" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: navigational_impressions {
    group_label: "Navigational"
    description: "The number of times a user exits the urlbar dropdown menu while a navigational result was visible"
    sql: COUNTIF(${num_navigational_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: navigational_CTR {
    group_label: "Navigational"
    description: "Clicks / Impressions"
    sql: safe_divide(${navigational_clicks}, ${navigational_impressions});;
    type: number
  }

  measure: navigational_annoyances {
    group_label: "Navigational"
    sql: COUNTIF(product_engaged_result_type = "navigational" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: open_tab_clicks {
    group_label: "Open Tab"
    sql: COUNTIF(product_engaged_result_type = "open_tab" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: open_tab_impressions {
    group_label: "Open Tab"
    description: "The number of times a user exits the urlbar dropdown menu while a open tab result was visible"
    sql: COUNTIF(${num_open_tab_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: open_tab_CTR {
    group_label: "Open Tab"
    description: "Clicks / Impressions"
    sql: safe_divide(${open_tab_clicks}, ${open_tab_impressions});;
    type: number
  }

  measure: open_tab_annoyances {
    group_label: "Open Tab"
    sql: COUNTIF(product_engaged_result_type = "open_tab" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: pocket_collection_clicks {
    group_label: "Pocket Collection"
    sql: COUNTIF(product_engaged_result_type = "pocket_collection" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: pocket_collection_impressions {
    group_label: "Pocket Collection"
    description: "The number of times a user exits the urlbar dropdown menu while a Pocket Collection result was visible"
    sql: COUNTIF(${num_pocket_collection_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: pocket_collection_CTR {
    group_label: "Pocket Collection"
    description: "Clicks / Impressions"
    sql: safe_divide(${pocket_collection_clicks}, ${pocket_collection_impressions});;
    type: number
  }

  measure: pocket_collection_annoyances {
    group_label: "Pocket Collection"
    sql: COUNTIF(product_engaged_result_type = "pocket_collection" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: quick_action_clicks {
    group_label: "Quick Action"
    sql: COUNTIF(product_engaged_result_type = "quick_action" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: quick_action_impressions {
    group_label: "Quick Action"
    description: "The number of times a user exits the urlbar dropdown menu while a quick action result was visible"
    sql: COUNTIF(${num_quick_action_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: quick_action_CTR {
    group_label: "Quick Action"
    description: "Clicks / Impressions"
    sql: safe_divide(${quick_action_clicks}, ${quick_action_impressions});;
    type: number
  }

  measure: quick_action_annoyances {
    group_label: "Quick Action"
    sql: COUNTIF(product_engaged_result_type = "quick_action" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: search_engine_clicks {
    group_label: "Search Engine"
    sql: COUNTIF(product_engaged_result_type = "search_engine" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: search_engine_impressions {
    group_label: "Search Engine"
    description: "The number of times a user exits the urlbar dropdown menu while a search engine result was visible"
    sql: COUNTIF(${num_search_engine_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: search_engine_CTR {
    group_label: "Search Engine"
    description: "Clicks / Impressions"
    sql: safe_divide(${search_engine_clicks}, ${search_engine_impressions});;
    type: number
  }

  measure: search_engine_annoyances {
    group_label: "Search Engine"
    sql: COUNTIF(product_engaged_result_type = "search_engine" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: weather_clicks {
    group_label: "Weather"
    sql: COUNTIF(product_engaged_result_type = "weather" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: weather_impressions {
    group_label: "Weather"
    description: "The number of times a user exits the urlbar dropdown menu while a weather result was visible"
    sql: COUNTIF(${num_weather_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: weather_CTR {
    group_label: "Weather"
    description: "Clicks / Impressions"
    sql: safe_divide(${weather_clicks}, ${weather_impressions});;
    type: number
  }

  measure: weather_annoyances {
    group_label: "Weather"
    sql: COUNTIF(product_engaged_result_type = "weather" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: wikipedia_dynamic_clicks {
    group_label: "Wikipedia Dynamic"
    sql: COUNTIF(product_engaged_result_type = "wikipedia_dynamic" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: wikipedia_dynamic_impressions {
    group_label: "Wikipedia Dynamic"
    description: "The number of times a user exits the urlbar dropdown menu while a Wikipedia Dynamic result was visible"
    sql: COUNTIF(${num_wikipedia_dynamic_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: wikipedia_dynamic_CTR {
    group_label: "Wikipedia Dynamic"
    description: "Clicks / Impressions"
    sql: safe_divide(${wikipedia_dynamic_clicks}, ${wikipedia_dynamic_impressions});;
    type: number
  }

  measure: wikipedia_dynamic_annoyances {
    group_label: "Wikipedia Dynamic"
    sql: COUNTIF(product_engaged_result_type = "wikipedia_dynamic" and ${session_action_type} = "annoyance");;
    type: number
  }

  measure: wikipedia_enhanced_clicks {
    group_label: "Wikipedia Enhanced"
    sql: COUNTIF(product_engaged_result_type = "wikipedia_enhanced" and ${is_terminal} and ${session_action_type} = "engaged");;
    type: number
  }

  measure: wikipedia_enhanced_impressions {
    group_label: "Wikipedia Enhanced"
    description: "The number of times a user exits the urlbar dropdown menu while a Wikipedia Enhanced result was visible"
    sql: COUNTIF(${num_wikipedia_enhanced_impressions} > 0 and ${is_terminal});;
    type: number
  }

  measure: wikipedia_enhanced_CTR {
    group_label: "Wikipedia Enhanced"
    description: "Clicks / Impressions"
    sql: safe_divide(${wikipedia_enhanced_clicks}, ${wikipedia_enhanced_impressions});;
    type: number
  }

  measure: wikipedia_enhanced_annoyances {
    group_label: "Wikipedia Enhanced"
    sql: COUNTIF(product_engaged_result_type = "wikipedia_enhanced" and ${session_action_type} = "annoyance");;
    type: number
  }
}
