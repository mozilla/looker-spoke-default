include: "//looker-hub/firefox_desktop/views/serp_events_table.view.lkml"

view: serp_impression {
  extends: [serp_events_table]

  dimension: abandon_reason {
    type: string
    description: "Reason for abandonment (Null if is_engaged = Yes)"
    sql: ${TABLE}.abandon_reason ;;
  }
  dimension: ad_blocker_inferred {
    type: yesno
    description: "If ad blocker was being used (Yes/No)"
    sql: ${TABLE}.ad_blocker_inferred ;;
  }
  dimension: browser_version_info__is_major_release {
    hidden: yes
  }
  dimension: browser_version_info__major_version {
    hidden: yes
  }
  dimension: browser_version_info__minor_version {
    hidden: yes
  }
  dimension: browser_version_info__patch_revision {
    hidden: yes
  }
  dimension: browser_version_info__version {
    hidden: yes
  }
  dimension: component {
    type: string
    description: "SERP display component"
    sql: ${TABLE}.component ;;
  }
  dimension: event_timestamp {
    hidden: yes
  }
  dimension: experiments {
    hidden: yes
    sql: ${TABLE}.experiments ;;
  }
  dimension: glean_client_id {
    hidden: yes
    sql: ${TABLE}.glean_client_id ;;
  }
  dimension: has_ads_loaded {
    type: yesno
    description: "If ads were loaded (Yes/No)"
    sql: ${TABLE}.has_ads_loaded ;;
  }

  dimension: has_ads_visible {
    type: yesno
    description: "If ads were visible (Yes/No)"
    sql: ${TABLE}.num_ads_showing > 0;;
  }
  dimension: impression_id {
    hidden: yes
  }
  dimension: is_ad_component {
    type: yesno
    description: "If component is an ad component (Yes/No)"
    sql: ${TABLE}.is_ad_component ;;
  }
  dimension: is_engaged {
    type: yesno
    description: "At least 1 engagement event present for the impression ID (Yes/No)"
    sql: ${TABLE}.is_engaged ;;
  }
  dimension: is_shopping_page {
    type: yesno
    description: "If SERP Impression is known to be a shopping page (Yes/No)"
    sql: ${TABLE}.is_shopping_page ;;
  }
  dimension: is_tagged {
    type: yesno
    description: "If SERP Impression is tagged (Yes/No)"
    sql: ${TABLE}.is_tagged ;;
  }
  dimension: legacy_telemetry_client_id {
    hidden: yes
  }
  dimension: normalized_channel {
    type: string
    sql: ${TABLE}.normalized_channel ;;
  }
  dimension: normalized_country_code {
    type: string
    sql: ${TABLE}.normalized_country_code ;;
  }
  dimension: num_ads_hidden_reported {
    hidden: yes
  }
  dimension: num_ads_loaded_reported {
    hidden: yes
  }
  dimension: num_ads_notshowing {
    hidden: yes
  }
  dimension: num_ads_showing {
    hidden: yes
  }
  dimension: num_ads_visible_reported {
    hidden: yes
  }
  dimension: num_clicks {
    hidden: yes
  }
  dimension: num_expands {
    hidden: yes
  }
  dimension: num_submits {
    hidden: yes
  }
  dimension: os {
    hidden: yes
  }
  dimension: ping_seq {
    hidden: yes
  }
  dimension: sample_id {
    group_label: "Filters to speed up Looker"
    description: "Filter on this Dimension to speed up Looker while prototyping a dashboard. For example, filtering `sample_id < 10` will select a random 10% sample of the data, instead of all the data. DO NOT use this filter in a production dashboard for metrics with rare events (e.g., when click counts on a result type are low)."
    type: number
    sql: ${TABLE}.sample_id ;;
  }
  dimension: sap_source {
    description: "How the user arrived at the SERP"
    type: string
    sql: ${TABLE}.sap_source ;;
  }
  dimension: search_engine {
    description: "Search engine"
    type: string
    sql: ${TABLE}.search_engine ;;
  }
  dimension_group: submission {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.submission_date ;;
  }
  measure: serp_impressions_count {
    group_label: "SERP Impression Metrics"
    description: "The number of distinct SERP Impressions"
    type: count_distinct
    sql: ${impression_id};;
  }





  measure: ad_impressions_count {
    group_label: "Ad Impression Metrics"
    description: "The number of distinct SERP impressions with visible ads"
    type: number
    sql: COUNT(DISTINCT IF(${has_ads_visible}, ${impression_id}, NULL));;

  }

  measure: ads_loaded{
    group_label: "Ad Impression Metrics"
    description: "Total number of ads loaded"
    type: sum
    sql: ${TABLE}.num_ads_loaded_reported;;

  }

  measure: ads_visible{
    group_label: "Ad Impression Metrics"
    description: "Total number of ads visible"
    type: sum
    sql: ${TABLE}.num_ads_showing;;

  }

  measure: ads_not_showing{
    group_label: "Ad Impression Metrics"
    description: "Total number of ads loaded and not showing on SERP"
    type: sum
    sql: ${TABLE}.num_ads_notshowing;;

  }

  measure: ads_loaded_per_impression_id {
    group_label: "Ad Impression Metrics"
    description: "number of ads loaded / serp_impressions_count"
    type: number
    sql: safe_divide(${ads_loaded},${serp_impressions_count} );;

  }

  measure: ads_visible_per_impression_id {
    group_label: "Ad Impression Metrics"
    description: "number of ads visible / serp_impressions_count"
    type: number
    sql: safe_divide(${ads_visible},${serp_impressions_count} );;

  }

  measure: ads_not_showing_per_impression_id {
    group_label: "Ad Impression Metrics"
    description: "number of ads not showing / serp_impressions_count"
    type: number
    sql: safe_divide(${ads_not_showing},${serp_impressions_count});;

  }

  measure: visible_proportion{
    group_label: "Ad Impression Metrics"
    description: "number of ads visible / number of ads loaded"
    type: number
    sql: safe_divide(${ads_visible},${ads_loaded});;

  }

  measure: is_shopping_page_proportion{
    group_label: "Ad Impression Metrics"
    description: "shopping page ratio (yes/no) for impressions with visible ads"
    type: number
    sql: safe_divide(${is_shopping_page_ad_impression_count}, ${ad_impressions_count});;
  }

  measure: is_shopping_page_ad_impression_count {
    group_label: "Ad Impression Metrics"
    description: "The number of distinct impressions for shopping page with visible ads"
    type: number
    sql: COUNT(DISTINCT IF(${is_shopping_page} and ${has_ads_visible}, ${impression_id}, NULL));;

  }

  measure: clicks{
    group_label: "Engagement Metrics"
    description: "Total number of ads/non-ads links clicked"
    type: sum
    sql: ${TABLE}.num_clicks;;

  }

  measure: ad_clicks{
    group_label: "Engagement Metrics"
    description: "Total number of ads clicks for impressions with visible ads"
    type: number
    sql: SUM( IF( ${has_ads_visible} , ${TABLE}.num_clicks, 0));;

  }

  measure: expansion{
    group_label: "Engagement Metrics"
    description: "Total number of clicks on the expansion button (applies to ad_carousel, ad_sidebar, refined_search_buttons) "
    type: sum
    sql: ${TABLE}.num_expands;;

  }

  measure: submits{
    group_label: "Engagement Metrics"
    description: "Total number of in content search box submits"
    type: sum
    sql: ${TABLE}.num_submits;;

  }


  measure: Ads_CTR{
    group_label: "Engagement Metrics"
    description: "number of impressions with at least 1 ad clicks / number of impressions with visible ads"
    type: number
    sql: safe_divide(COUNT(DISTINCT IF (${num_clicks} > 0 and ${num_ads_showing} > 0 , ${impression_id}, NULL)), ${ad_impressions_count});;


  }

  measure: ad_clicks_per_impression_id {
    group_label: "Engagement Metrics"
    description: "Total number of ads clicked / number of impressions with visible ads"
    type: number
    sql: safe_divide(${ad_clicks},${ad_impressions_count});;

  }


 measure: abandonment_impressions_count {
  group_label: "Abandonment Metrics"
  description: "The number of abandoned impressions"
  type: number
  sql: COUNT(DISTINCT IF (${is_engaged} = FALSE, ${impression_id}, NULL));;

}



}
