include: "//looker-hub/firefox_desktop/views/urlbar_events.view.lkml"

view: +urlbar_events {
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

  dimension: session_action_type {
    sql: ${TABLE}.event_action ;;
    group_label: "Urlbar-specific filters"
    description: "Don't use this field. It's the same as `Event Action`. It is included only for backwards compatibility on some older dashboards."
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

  dimension: first_result_type {
    # looker-hub erroneously generates this Dimension that should not exist.
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

  dimension: num_characters_typed {
    sql: ${TABLE}.num_chars_typed ;;
    type: number
    description: "Number of characters entered in the urlbar at the end of the session"
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
    description: "Whether or not the checkbox for sharing search terms data is checked in about:preferences. If yes, then this event came from Suggest Online."
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

  dimension: product_first_result_type {
    sql: ARRAY(SELECT r.product_result_type FROM UNNEST(results) AS r WHERE r.position = 1)[SAFE_OFFSET(0)] ;;
    type: string
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

  dimension: num_add_on_impressions {
    # looker-hub erroneously generates this Dimension that should not exist.
    hidden:  yes
  }

  dimension: num_autofill_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "autofill") from unnest(results) as r);;
    type: number
  }

  dimension: num_admarketplace_sponsored_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "admarketplace_sponsored") from unnest(results) as r);;
    type: number
  }

  dimension: num_bookmark_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "bookmark") from unnest(results) as r);;
    type: number
  }

  dimension: num_default_partner_search_suggestion_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "default_partner_search_suggestion") from unnest(results) as r);;
    type: number
  }

  dimension: num_history_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "history") from unnest(results) as r);;
    type: number
  }

  dimension: num_mdn_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "mdn") from unnest(results) as r);;
    type: number
  }

  dimension: num_navigational_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "navigational") from unnest(results) as r);;
    type: number
  }

  dimension: num_open_tab_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "open_tab") from unnest(results) as r);;
    type: number
  }

  dimension: num_pocket_collection_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "pocket_collection") from unnest(results) as r);;
    type: number
  }

  dimension: num_quick_action_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "quick_action") from unnest(results) as r);;
    type: number
  }

  dimension: num_search_engine_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "search_engine") from unnest(results) as r);;
    type: number
  }

  dimension: num_suggest_addon_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "suggest_add_on") from unnest(results) as r);;
    type: number
  }

  dimension: num_trending_suggestion_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "trending_suggestion") from unnest(results) as r);;
    type: number
  }

  dimension: num_weather_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "weather") from unnest(results) as r);;
    type: number
  }

  dimension: num_wikipedia_dynamic_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "wikipedia_dynamic") from unnest(results) as r);;
    type: number
  }

  dimension: num_wikipedia_enhanced_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "wikipedia_enhanced") from unnest(results) as r);;
    type: number
  }

  dimension: num_xchannels_addon_impressions {
    hidden:  yes
    sql:  (select countif(r.product_result_type = "xchannels_add_on") from unnest(results) as r);;
    type: number
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

  measure: autofill_clicks {
    group_label: "Autofill"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "autofill" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: autofill_impressions {
    group_label: "Autofill"
    description: "The number of times a user exits the urlbar dropdown menu while an Autofill result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_autofill_impressions} > 0 THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: autofill_CTR {
    group_label: "Autofill"
    description: "Clicks / Impressions"
    sql: safe_divide(${autofill_clicks}, ${autofill_impressions});;
    type: number
  }

  measure: autofill_annoyances {
    group_label: "Autofill"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "autofill" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: amp_spons_clicks {
    group_label: "AdMarketplace Sponsored"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "admarketplace_sponsored" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: amp_spons_impressions {
    group_label: "AdMarketplace Sponsored"
    description: "The number of times a user exits the urlbar dropdown menu while an AdMarketplace Sponsored result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_admarketplace_sponsored_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "admarketplace_sponsored" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: bookmark_clicks {
    group_label: "Bookmark"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "bookmark" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: bookmark_impressions {
    group_label: "Bookmark"
    description: "The number of times a user exits the urlbar dropdown menu while a Bookmark result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_bookmark_impressions} > 0 THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "bookmark" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: DPSS_clicks {
    group_label: "Default Partner Search Suggestion"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "default_partner_search_suggestion" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: DPSS_impressions {
    group_label: "Default Partner Search Suggestion"
    description: "The number of times a user exits the urlbar dropdown menu while a Partner Search Suggestion result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_default_partner_search_suggestion_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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

  measure: history_clicks {
    group_label: "History"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "history" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: history_impressions {
    group_label: "History"
    description: "The number of times a user exits the urlbar dropdown menu while a History result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_history_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "history" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: mdn_clicks {
    group_label: "MDN"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "mdn" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: mdn_impressions {
    group_label: "MDN"
    description: "The number of times a user exits the urlbar dropdown menu while a MDN result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_mdn_impressions} > 0  THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: mdn_CTR {
    group_label: "MDN"
    description: "Clicks / Impressions"
    sql: safe_divide(${mdn_clicks}, ${mdn_impressions});;
    type: number
  }

  measure: mdn_annoyances {
    group_label: "MDN"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "mdn" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: navigational_clicks {
    group_label: "Navigational"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "navigational" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: navigational_impressions {
    group_label: "Navigational"
    description: "The number of times a user exits the urlbar dropdown menu while a Navigational result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_navigational_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "navigational" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: open_tab_clicks {
    group_label: "Open Tab"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "open_tab" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: open_tab_impressions {
    group_label: "Open Tab"
    description: "The number of times a user exits the urlbar dropdown menu while an Open Tab result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_open_tab_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "open_tab" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: pocket_collection_clicks {
    group_label: "Pocket Collection"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "pocket_collection" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: pocket_collection_impressions {
    group_label: "Pocket Collection"
    description: "The number of times a user exits the urlbar dropdown menu while a Pocket result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_pocket_collection_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "pocket_collection" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: quick_action_clicks {
    group_label: "Quick Action"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "quick_action" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: quick_action_impressions {
    group_label: "Quick Action"
    description: "The number of times a user exits the urlbar dropdown menu while a Quick Action result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_quick_action_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "quick_action" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: search_engine_clicks {
    group_label: "Search Engine"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "search_engine" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: search_engine_impressions {
    group_label: "Search Engine"
    description: "The number of times a user exits the urlbar dropdown menu while a Search Engine result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_search_engine_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "search_engine" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: suggest_addon_clicks {
    group_label: "Suggest Addon"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "suggest_add_on" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: suggest_addon_impressions {
    group_label: "Suggest Addon"
    description: "The number of times a user exits the urlbar dropdown menu while a Suggest Addon result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_suggest_addon_impressions} > 0  THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: suggest_addon_CTR {
    group_label: "Suggest Addon"
    description: "Clicks / Impressions"
    sql: safe_divide(${suggest_addon_clicks}, ${suggest_addon_impressions});;
    type: number
  }

  measure: suggest_addon_annoyances {
    group_label: "Suggest Addon"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "suggest_add_on" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: trending_clicks {
    group_label: "Trending"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "trending_suggestion" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: trending_impressions {
    group_label: "Trending"
    description: "The number of times a user exits the urlbar dropdown menu while a Trending result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_trending_suggestion_impressions} > 0  THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: trending_CTR {
    group_label: "Trending"
    description: "Clicks / Impressions"
    sql: safe_divide(${trending_clicks}, ${trending_impressions});;
    type: number
  }

  measure: trending_annoyances {
    group_label: "Trending"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "trending_suggestion" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: weather_clicks {
    group_label: "Weather"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "weather" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: weather_impressions {
    group_label: "Weather"
    description: "The number of times a user exits the urlbar dropdown menu while a Weather result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_weather_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "weather" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: wikipedia_dynamic_clicks {
    group_label: "Wikipedia Dynamic"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "wikipedia_dynamic" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: wikipedia_dynamic_impressions {
    group_label: "Wikipedia Dynamic"
    description: "The number of times a user exits the urlbar dropdown menu while a Dynamic Wikipedia result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_wikipedia_dynamic_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "wikipedia_dynamic" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: wikipedia_enhanced_clicks {
    group_label: "Wikipedia Enhanced"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "wikipedia_enhanced" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: wikipedia_enhanced_impressions {
    group_label: "Wikipedia Enhanced"
    description: "The number of times a user exits the urlbar dropdown menu while a Enhanced Wikipedia result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_wikipedia_enhanced_impressions} > 0  THEN ${event_id} ELSE NULL END));;
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
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "wikipedia_enhanced" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: xchannels_addon_clicks {
    group_label: "Xchannels Addon"
    sql: COUNT(DISTINCT(CASE WHEN ${product_selected_result} = "xchannels_add_on" and ${is_terminal} and ${event_action} = "engaged" THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: xchannels_addon_impressions {
    group_label: "Xchannels Addon"
    description: "The number of times a user exits the urlbar dropdown menu while an Xchannels Addon result was visible"
    sql: COUNT(DISTINCT(CASE WHEN ${is_terminal} and ${num_xchannels_addon_impressions} > 0  THEN ${event_id} ELSE NULL END));;
    type: number
  }

  measure: xchannels_addon_CTR {
    group_label: "Xchannels Addon"
    description: "Clicks / Impressions"
    sql: safe_divide(${xchannels_addon_clicks}, ${xchannels_addon_impressions});;
    type: number
  }

  measure: xchannels_addon_annoyances {
    group_label: "Xchannels Addon"
    sql: COUNT(DISTINCT(CASE WHEN ${product_engaged_result_type} = "xchannels_add_on" and ${event_action} = "annoyance" THEN ${event_id} ELSE NULL END));;
    type: number
  }
}
