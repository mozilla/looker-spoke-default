include: "//looker-hub/firefox_desktop/views/*"

view: +urlbar_events_temp_v2 {
  dimension: annoyance_signal_type {
    group_label: "Urlbar-specific filters"
    description: "The type of annoyance: help, inaccurate_location, not_interested, not_relevant, show_less_frequently"
  }

  dimension: engaged_result_type {
    hidden: yes
  }

  dimension: engagement_type {
    hidden: yes
  }

  dimension: event_action {
    group_label: "Urlbar-specific filters"
    description: "The type of urlbar event: engagement, abandonment or annoyance."
  }

  dimension: event_id {
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

  dimension: glean_client_id {
    hidden:  yes
  }

  dimension: interaction {
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

  dimension: normalized_engine {
    sql: ${TABLE}.normalized_engine ;;
    type: string
  }

  dimension: num_chars_typed {
    hidden:  yes
  }

  measure: average_characters_typed {
    type: number
    sql: AVG(${TABLE}.num_chars_typed) ;;
  }

  dimension: num_total_results {
    hidden:  yes
  }

  dimension: pref_data_collection {
    hidden: yes
  }

  dimension: data_collection_enabled {
    sql: ${TABLE}.pref_data_collection ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for sharing search terms data is checked in about:preferences"
  }

  dimension: pref_fx_suggestions {
    hidden: yes
  }

  dimension: firefox_suggest_enabled {
    sql: ${TABLE}.pref_fx_suggestions ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for showing Firefox Suggestions is checked in about:preferences"
  }

  dimension: pref_sponsored_suggestions {
    hidden: yes
  }

  dimension: sponsored_suggestions_enabled {
    sql: ${TABLE}.pref_sponsored_suggestions ;;
    type: yesno
    group_label: "User Preferences"
    description: "Whether or not the checkbox for showing sponsored suggestions is checked in about:preferences"
  }

  dimension: product_engaged_result_type {
    hidden:  yes
  }

  dimension: product_selected_result {
    hidden:  yes
  }

  dimension: sample_id {
    group_label: "Filters to speed up Looker"
    description: "Filter on this Dimension to speed up Looker while prototyping a dashboard. For example, filtering `sample_id < 10` will select a random 10% sample of the data, instead of all the data. DO NOT use this filter in a production dashboard for metrics with rare events (e.g., when click counts on a result type are low)."
  }

  dimension: selected_position {
    hidden:  yes
  }

  dimension: selected_result {
    hidden:  yes
  }

  dimension: seq {
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
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: urlbar_impressions {
    group_label: "Urlbar Metrics"
    description: "The number of times a user exits the urlbar dropdown menu, either by abandoning the urlbar, engaging with a urlbar result, or selecting an annoyance signal that closes the urlbar dropdown menu"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: DPSS_clicks {
    group_label: "Default Partner Search Suggestion"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "default_partner_search_suggestion" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: DPSS_impressions {
    group_label: "Default Partner Search Suggestion"
    description: "The number of times a user exits the urlbar dropdown menu while an addon result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ARRAY_LENGTH(ARRAY( SELECT 1 FROM UNNEST(${results}) AS e WHERE e.product_result_type = "default_partner_search_suggestion")) > 0 THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: DPSS_CTR {
    group_label: "Default Partner Search Suggestion"
    description: "Clicks / Impressions"
    sql: safe_divide(${DPSS_clicks}, ${DPSS_impressions});;
    type: number
  }

  measure: DPSS_annoyances {
    group_label: "Default Partner Search Suggestion"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "default_partner_search_suggestion" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }
}
