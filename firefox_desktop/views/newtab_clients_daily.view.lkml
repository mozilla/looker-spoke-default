view: newtab_clients_daily {

  sql_table_name: `mozdata.telemetry.newtab_clients_daily` ;;

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: legacy_telemetry_client_id {
    hidden: yes
  }

  dimension: content_recommendations_enabled {
    sql: ${TABLE}.pocket_enabled ;;
    type: yesno
  }

  dimension: pocket_is_signed_in {
    sql: ${TABLE}.pocket_is_signed_in ;;
    type: yesno
  }

  dimension: content_recommendations_sponsored_stories_enabled {
    sql: ${TABLE}.pocket_sponsored_stories_enabled ;;
    type: yesno
  }

  dimension: topsites_enabled {
    sql: ${TABLE}.topsites_enabled ;;
    type: yesno
  }

  dimension: sponsored_topsites_enabled {
    sql: ${TABLE}.topsites_sponsored_enabled ;;
    type: yesno
  }

  dimension: weather_widget_enabled {
    sql:  ${TABLE}.newtab_weather_widget_enabled ;;
    type:  yesno
  }

  dimension: topic_preferences_set {
    sql:  ${TABLE}.newtab_weather_widget_enabled ;;
    type:  yesno
  }

  dimension: topic_preferences_set_first_time {
    sql: ${TABLE}.topic_selection_selected_topics_first_time ;;
    type: yesno
  }

  dimension: newtab_homepage_category {
    sql: ${TABLE}.newtab_homepage_category ;;
    type: string
  }

  dimension: newtab_newtab_category {
    sql: ${TABLE}.newtab_newtab_category ;;
    type: string
  }

  dimension: newtab_search_enabled {
    sql: ${TABLE}.newtab_search_enabled ;;
    type: yesno
  }

  dimension: topsites_rows {
    sql: ${TABLE}.topsites_rows ;;
    type: number
  }

  dimension: country_code {
    sql: ${TABLE}.country_code ;;
    type: string
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: default_search_engine {
    sql: ${TABLE}.default_search_engine ;;
    type: string
  }

  dimension: default_private_search_engine {
    sql: ${TABLE}.default_private_search_engine ;;
    type: string
  }

  dimension: normalized_os {
    sql: ${TABLE}.normalized_os ;;
    type: string
  }

  dimension: activity_segment {
    sql: ${TABLE}.activity_segment ;;
    type: string
  }

  dimension: is_new_profile {
    sql: ${TABLE}.is_new_profile ;;
    type: yesno
  }

  dimension: major_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.browser_version).major_version ;;
    description: "The major version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: minor_version {
    type: number
    sql: mozfun.norm.browser_version_info(${TABLE}.browser_version).minor_version ;;
    description: "The minor version of the application, as a number."
    group_label: "Browser Version"
  }

  dimension: had_default_ui_visit {
    type: yesno
    sql: IF(${TABLE}.visits_with_default_ui > 0, TRUE, FALSE) ;;
  }

  measure: client_count {
    type: count_distinct
    sql: ${client_id} ;;
    approximate: yes
  }

  measure: newtab_visit_count {
    sql: ${TABLE}.newtab_visit_count ;;
    type: sum
  }

  measure: visits_with_default_ui {
    sql: ${TABLE}.visits_with_default_ui ;;
    type: sum
    group_label: "KPI Metrics"
  }

  measure: non_search_engagement {
    sql: ${TABLE}.topsite_tile_clicks
      + ${TABLE}.pocket_clicks
      + ${TABLE}.pocket_saves
      + ${TABLE}.pocket_thumb_voting_events
      + ${TABLE}.topic_selection_opened
      + ${TABLE}.topic_selection_updates
      + ${TABLE}.weather_widget_clicks
      + ${TABLE}.weather_widget_change_display_to_detailed
      + ${TABLE}.weather_widget_change_display_to_simple
      + ${TABLE}.wallpaper_clicks
      + cast(${TABLE}.topic_selection_selected_topics_first_time AS INT);;
    type: sum
    group_label: "KPI Metrics"
  }

  measure: visits_with_non_impression_engagement {
    sql: ${TABLE}.visits_with_non_impression_engagement ;;
    type: sum
    group_label: "KPI Metrics"
  }

  measure: visits_with_non_search_engagement {
    sql: ${TABLE}.visits_with_non_search_engagement ;;
    type: sum
    group_label: "KPI Metrics"
  }

  measure: visits_with_non_default_ui {
    sql: ${TABLE}.visits_with_non_default_ui ;;
    type: sum
    group_label: "KPI Metrics"
  }

  measure: searches {
    sql: ${TABLE}.searches ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_search_ad_clicks {
    sql: ${TABLE}.tagged_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_search_ad_impressions {
    sql: ${TABLE}.tagged_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: follow_on_search_ad_clicks {
    sql: ${TABLE}.follow_on_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: follow_on_search_ad_impressions {
    sql: ${TABLE}.follow_on_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_follow_on_search_ad_clicks {
    sql: ${TABLE}.tagged_follow_on_search_ad_clicks ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: tagged_follow_on_search_ad_impressions {
    sql: ${TABLE}.tagged_follow_on_search_ad_impressions ;;
    type: sum
    group_label: "Search Interactions"
  }

  measure: topsite_tile_clicks {
    sql: ${TABLE}.topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_clicks {
    sql: ${TABLE}.sponsored_topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_clicks {
    sql: ${TABLE}.organic_topsite_tile_clicks ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: topsite_tile_impressions {
    sql: ${TABLE}.topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_impressions {
    sql: ${TABLE}.sponsored_topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_impressions {
    sql: ${TABLE}.organic_topsite_tile_impressions ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: topsite_tile_dismissals {
    sql: ${TABLE}.topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: sponsored_topsite_tile_dismissals {
    sql: ${TABLE}.sponsored_topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: organic_topsite_tile_dismissals {
    sql: ${TABLE}.organic_topsite_tile_dismissals ;;
    type: sum
    group_label: "Tiles Interactions"
  }

  measure: content_recommendations_impressions {
    sql: ${TABLE}.pocket_impressions ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: sponsored_content_recommendations_impressions {
    sql: ${TABLE}.sponsored_pocket_impressions ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: organic_content_recommendations_impressions {
    sql: ${TABLE}.organic_pocket_impressions ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: content_recommendations_clicks {
    sql: ${TABLE}.pocket_clicks ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: sponsored_content_recommendations_clicks {
    sql: ${TABLE}.sponsored_pocket_clicks ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: organic_content_recommendations_clicks {
    sql: ${TABLE}.organic_pocket_clicks ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: organic_content_recommendations_dismissals {
    sql: ${TABLE}.organic_pocket_dismissals ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: sponsored_content_recommendations_dismissals {
    sql: ${TABLE}.sponsored_pocket_dismissals ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: content_recommendations_saves {
    sql: ${TABLE}.pocket_saves ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: sponsored_content_recommendations_saves {
    sql: ${TABLE}.sponsored_pocket_saves ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: organic_content_recommendations_saves {
    sql: ${TABLE}.organic_pocket_saves ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: content_recommendations_thumbs_up {
    sql: ${TABLE}.pocket_thumbs_up ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: content_recommendations_thumbs_down {
    sql: ${TABLE}.pocket_thumbs_down ;;
    type: sum
    group_label: "Content Recommendations Interactions"
  }

  measure: wallpaper_clicks {
    sql: ${TABLE}.wallpaper_clicks ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: wallpaper_clicks_had_previous_wallpaper {
    sql: ${TABLE}.wallpaper_clicks_had_previous_wallpaper ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: wallpaper_clicks_first_selected_wallpaper {
    sql: ${TABLE}.wallpaper_clicks_first_selected_wallpaper ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: wallpaper_category_clicks {
    sql: ${TABLE}.wallpaper_category_clicks ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: wallpaper_highlight_dismissals {
    sql: ${TABLE}.wallpaper_highlight_dismissals ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: wallpaper_highlight_cta_clicks {
    sql: ${TABLE}.wallpaper_highlight_cta_clicks ;;
    type: sum
    group_label: "Wallpaper Interactions"
  }

  measure: weather_widget_impressions {
    sql: ${TABLE}.weather_widget_impressions ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: weather_widget_clicks {
    sql: ${TABLE}.weather_widget_clicks ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: weather_widget_load_errors {
    sql: ${TABLE}.weather_widget_load_errors ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: weather_widget_change_display_to_detailed {
    sql: ${TABLE}.weather_widget_change_display_to_detailed ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: weather_widget_change_display_to_simple {
    sql: ${TABLE}.weather_widget_change_display_to_simple ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: weather_widget_location_selected {
    sql: ${TABLE}.weather_widget_location_selected ;;
    type: sum
    group_label: "Weather Interactions"
  }

  measure: topic_selection_selected_topics_first_time {
    sql: CASE WHEN ${TABLE}.topic_selection_selected_topics_first_time THEN 1 ELSE 0 END ;;
    type: sum
    group_label: "Topic Selection Interactions"
  }

  measure: topic_selection_updates {
    sql: ${TABLE}.topic_selection_updates ;;
    type: sum
    group_label: "Topic Selection Interactions"
  }

  measure: topic_selection_opened {
    sql: ${TABLE}.topic_selection_opened ;;
    type: sum
    group_label: "Topic Selection Interactions"
  }

  measure: topic_selection_dismissals {
    sql: ${TABLE}.topic_selection_dismissals ;;
    type: sum
    group_label: "Topic Selection Interactions"
  }

}
