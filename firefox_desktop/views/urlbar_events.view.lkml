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
  sql: sum(case when ${is_terminal} and ${session_action_type} = "engaged" then 1 else 0 end);;
  type: number
}

measure: urlbar_impressions {
  group_label: "Urlbar Metrics"
    sql: sum(case when ${is_terminal} then 1 else 0 end);;
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
    sql: sum(case when ${session_action_type} = "annoyance" then 1 else 0 end);;
    type: number
}

  measure: DPSS_clicks {
    group_label: "Default Partner Search Suggestion"
    sql: sum(case when product_engaged_result_type = "default_partner_search_suggestion" and ${is_terminal} and ${session_action_type} = "engaged" then 1 else 0 end);;
    type: number
  }

  measure: DPSS_impressions {
    group_label: "Default Partner Search Suggestion"
    sql: sum(case when ${num_default_partner_search_suggestion_impressions} > 0 and ${is_terminal} then 1 else 0 end);;
    type: number
  }

  measure: DPSS_CTR {
    group_label: "Default Partner Search Suggestion"
    description: "Clicks /Impressions"
    sql: safe_divide(${urlbar_clicks}, ${urlbar_impressions});;
    type: number
  }

  measure: DPSS_annoyances {
    group_label: "Default Partner Search Suggestion"
    sql: sum(case when product_engaged_result_type = "default_partner_search_suggestion" and ${session_action_type} = "annoyance" then 1 else 0 end);;
    type: number
  }

}
