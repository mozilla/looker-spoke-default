include: "//looker-hub/firefox_desktop/views/serp_events_table.view.lkml"

view: serp_impression {
  extends: [serp_events_table]

  dimension: abandon_reason {
    group_label: "SERP Features"
    label: "Abandonment reason"
    description: "Reason for SERP abandonment (Null if is_engaged = Yes)"
  }

  dimension: ad_blocker_inferred {
    group_label: "Ad Features"
    label: "Ad Blocker in Use"
    description: "If ad blocker was being used on SERP"
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

  dimension: event_timestamp {
    hidden: yes
  }

  dimension: experiments {
    hidden: yes
  }

  dimension: glean_client_id {
    hidden: yes
  }

  dimension: has_ads_loaded {
    group_label: "Ad Features"
    type: yesno
    description: "If SERP had ads loaded (may or may not be visible)"
    sql: ${num_ads_loaded} > 0 ;;
  }

  dimension: has_ads_visible {
    group_label: "Ad Features"
    type: yesno
    description: "If SERP had visible ads"
    sql: ${num_ads_visible} > 0 ;;
  }
  dimension: has_ad_click {
    group_label: "Ad Features"
    type: yesno
    description: "If SERP had at least 1 click on a visible ad"
    sql: ${num_ads_visible} > 0 and ${num_ad_clicks} > 0 ;;
  }
  dimension: has_any_click {
    group_label: "SERP Features"
    type: yesno
    description: "If SERP had at least 1 click on any component (ad/non-ad)"
    sql: ${has_ad_click} or ${num_non_ad_link_clicks} > 0 ;;
  }

  dimension: impression_id {
    hidden: yes
  }

  dimension: is_engaged {
    group_label: "SERP Features"
    type: yesno
    description: "At least 1 engagement (any type) on SERP (including ads/non-ads)"
    sql: ${has_any_click} or ${num_other_engagements} > 0;;
  }

  dimension: is_private {
    group_label: "SERP Features"
    description: "If SERP was loaded in Private Browsing Mode"
  }

  dimension: is_shopping_page {
    group_label: "SERP Features"
    description: "If SERP is known to be a shopping page"
  }

  dimension: is_signed_in {
    group_label: "SERP Features"
    description: "If SERP was loaded while signed into an account with search provider"
  }

  dimension: is_tagged {
    group_label: "SERP Features"
    description: "If SERP comes from a tagged search"
  }

  dimension: legacy_telemetry_client_id {
    hidden: yes
  }

  dimension: normalized_channel {
    sql: ${TABLE}.normalized_channel ;;
    type: string
  }

  dimension: normalized_country_code {
    sql: ${TABLE}.normalized_country_code ;;
    type: string
  }

  dimension: num_ad_clicks {
    hidden: yes
  }

  dimension: num_ads_blocked {
    hidden: yes
  }

  dimension: num_ads_loaded {
    hidden: yes
  }

  dimension: num_ads_notshowing {
    hidden: yes
  }

  dimension: num_ads_visible {
    hidden: yes
  }

  dimension: num_non_ad_link_clicks {
    hidden: yes
  }

  dimension: num_other_engagements {
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
    description: "Filter on sample ID to speed up Looker while prototyping a dashboard. For example, filtering `sample_id < 10` will select a random 10% sample of the data, instead of all the data. DO NOT use this filter in a production dashboard for metrics with rare events (e.g., when click counts on a result type are low)."
  }

  dimension: sap_source {
    group_label: "SERP Features"
    description: "How the user arrived at the SERP"
  }

  dimension: search_engine {
    group_label: "SERP Features"
    description: "Search engine"
  }

  measure: serp_impressions_count {
    group_label: "SERP Impression Metrics"
    label: "Num SERP Impressions"
    description: "Number of SERP impressions"
    type: count
  }

  measure: ad_impressions_count {
    group_label: "Ad Impression Metrics"
    label: "Num SERP with Ad Impressions"
    description: "Number of SERP impressions with visible ads"
    type: count
    filters: [has_ads_visible: "yes"]
  }

  measure: ad_impression_rate {
    group_label: "Ad Impression Metrics"
    label: "SERP Ad Impression Rate"
    description: "Proportion of SERP impressions with visible ads"
    type: number
    sql: safe_divide(${ad_impressions_count}, ${serp_impressions_count}) ;;
  }

  measure: clicked_ad_impressions_count {
    group_label: "Engagement Metrics"
    label: "Num SERP with Ad Click"
    description: "Number of SERP impressions with at least 1 ad click"
    type: count
    filters: [has_ad_click: "yes"]
  }

  measure: ads_loaded{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Loaded"
    description: "Total number of ads loaded"
    type: sum
    sql: ${num_ads_loaded};;
  }

  measure: ads_visible{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Visible"
    description: "Total number of ads visible"
    type: sum
    sql: ${num_ads_visible};;
  }

  measure: ads_not_showing{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Not Showing"
    description: "Total number of ads loaded and not showing"
    type: sum
    sql: ${num_ads_notshowing};;
  }

  measure: ads_loaded_per_impression_id {
    group_label: "Ad Impression Metrics"
    label: "Ads Loaded Per SERP"
    description: "Number of ads loaded / number of SERP impressions"
    type: number
    sql: safe_divide(${ads_loaded},${serp_impressions_count});;
  }

  measure: ads_visible_per_impression_id {
    group_label: "Ad Impression Metrics"
    label: "Ads Visible Per SERP"
    description: "Number of ads visible / number of SERP impressions"
    type: number
    sql: safe_divide(${ads_visible},${serp_impressions_count});;
  }

  measure: ads_not_showing_per_impression_id {
    group_label: "Ad Impression Metrics"
    label: "Ads Not Showing Per SERP"
    description: "Number of ads not showing / number of SERP impressions"
    type: number
    sql: safe_divide(${ads_not_showing},${serp_impressions_count});;
  }

  measure: visible_proportion{
    group_label: "Ad Impression Metrics"
    label: "Proportion Loaded Ads Visible"
    description: "Number of ads visible / number of ads loaded"
    type: number
    sql: safe_divide(${ads_visible},${ads_loaded});;
  }

  measure: shopping_page_impressions_count {
    group_label: "Shopping page Metrics"
    label: "Num Shopping Page Impressions"
    description: "Number of shopping page impressions"
    type: count
    filters: [is_shopping_page: "yes"]
  }

  measure: is_shopping_page_proportion{
    group_label: "Shopping page Metrics"
    label: "Proportion Shopping Page Impressions"
    description: "Shopping page ratio (yes/no) for impressions with visible ads"
    type: number
    sql: safe_divide(${is_shopping_page_ad_impression_count}, ${ad_impressions_count});;
  }

  measure: is_shopping_page_ad_impression_count {
    group_label: "Shopping page Metrics"
    label: "Num Shopping Page with Ad Impressions"
    description: "Number of shopping page impressions with visible ads"
    type: count
    filters: [is_shopping_page: "yes", has_ads_visible: "yes"]
  }

  measure: shopping_page_with_ad_click_count {
    group_label: "Shopping page Metrics"
    label: "Num Shopping Page with Ad Click"
    description: "Number of shopping page impressions with at least 1 ad click"
    type: count
    filters: [is_shopping_page: "yes", has_ad_click: "yes"]
  }

  # measure: non_ad_link_clicks{
  #   group_label: "Engagement Metrics"
  #   label: "Num Clicks"
  #   description: "Total number of ad links/non-ad links/UI features clicked"
  #   type: sum
  #   sql: ${TABLE}.num_clicks;;
  # }
  measure: ad_clicks{
    group_label: "Engagement Metrics"
    label: "Num Ad Clicks"
    description: "Total number of clicks on visible ads"
    type: sum
    sql: ${num_ad_clicks};;
  }
  # measure: expansion_TODO{
  #   group_label: "Engagement Metrics"
  #   label: "Num Expands"
  #   description: "Total number of clicks on the expansion button (applies to ad_carousel, ad_sidebar, refined_search_buttons)"
  #   type: sum
  #   sql: ${TABLE}.num_expands;;
  # }
  # measure: submits_TODO{
  #   group_label: "Engagement Metrics"
  #   label: "Num Submits"
  #   description: "Total number of in-content search box submits"
  #   type: sum
  #   sql: ${TABLE}.num_submits;;
  # }

  measure: Ads_CTR{
    group_label: "Engagement Metrics"
    label: "SERP Ad CTR"
    description: "Number of SERP impressions with at least 1 ad click / number of SERP impressions with visible ads"
    type: number
    sql: safe_divide(${clicked_ad_impressions_count}, ${ad_impressions_count}) ;;
  }

  measure: ad_clicks_per_impression_id {
    group_label: "Engagement Metrics"
    label: "Ads Clicked Per SERP"
    description: "Total number of ads clicked / number of impressions with visible ads"
    type: number
    sql: safe_divide(${ad_clicks},${ad_impressions_count});;
  }

  measure: abandonment_impressions_count {
    group_label: "Abandonment Metrics"
    label: "Num Abandoned SERP"
    description: "Number of abandoned SERP impressions"
    type: count
    filters: [abandon_reason: "-NULL"]
  }
}


# view: serp_impression_old {
#   label: "SERP Impressions"
#   derived_table: {
#     # Aggregate at the impression ID level to get per-impression dimensions
#     sql:
#       SELECT
#         impression_id,
#         submission_date,
#         normalized_channel,
#         normalized_country_code,
#         sample_id,
#         is_shopping_page,
#         search_engine,
#         sap_source,
#         is_tagged,
#         is_engaged,
#         abandon_reason,
#         LOGICAL_OR(is_core_ad_component
#           AND num_ads_loaded_reported > 0) AS has_ads_loaded,
#         LOGICAL_OR(is_core_ad_component
#           AND num_ads_showing > 0) AS has_ads_visible,
#         LOGICAL_OR(is_core_ad_component AND num_ads_showing > 0
#           AND num_clicks > 0) AS has_ad_click,
#         LOGICAL_OR(num_clicks > 0) AS has_any_click,
#         LOGICAL_OR(is_core_ad_component
#           AND ad_blocker_inferred) AS ad_blocker_inferred,
#         SUM(num_clicks) AS num_clicks,
#         SUM(num_expands) AS num_expands,
#         SUM(num_submits) AS num_submits,
#         SUM(IF(is_core_ad_component, num_ads_loaded_reported, 0)) AS num_ads_loaded,
#         SUM(IF(is_core_ad_component, num_ads_showing, 0)) AS num_ads_showing,
#         SUM(IF(is_core_ad_component, num_ads_notshowing, 0)) AS num_ads_notshowing,
#         SUM(IF(is_core_ad_component and num_ads_showing > 0, num_clicks, 0)) AS num_ad_clicks,
#       FROM (
#         SELECT
#           *,
#           COALESCE(
#             component IN (
#               'ad_carousel',
#               'ad_image_row',
#               'ad_link',
#               'ad_sidebar',
#               'ad_sitelink'
#             ),
#             FALSE
#           ) AS is_core_ad_component
#         FROM
#           ${serp_events_table.SQL_TABLE_NAME} AS serp_events_table
#       )
#       GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
#       ;;
#   }


#   dimension: impression_id {
#     type:  string
#     primary_key: yes
#     hidden: yes
#     sql: ${TABLE}.impression_id ;;
#   }


# }

# view: serp_components {
#   sql_table_name: `mozdata.firefox_desktop.serp_events` ;;
#   label: "SERP Components"

#   # Include these explicitly so they are available for joining in the explore
#   dimension: impression_id {
#     hidden: yes
#     type:  string
#     sql: ${TABLE}.impression_id ;;
#   }
#   dimension_group: submission {
#     hidden: yes
#     type: time
#     timeframes: [raw, date, week, month, quarter, year]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.submission_date ;;
#   }
#   dimension: normalized_channel {
#     hidden: yes
#     type: string
#     sql: ${TABLE}.normalized_channel ;;
#   }
#   dimension: sample_id {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.sample_id ;;
#   }
#   dimension: component {
#     label: "Display Component"
#     description: "SERP display component"
#     type: string
#     sql: ${TABLE}.component ;;
#   }
#   dimension: is_ad_component {
#     # Override table's is_ad_component to restrict the definition to monetizable ad components
#     type: yesno
#     description: "If component is an ad component"
#     sql: ${component} in ('ad_carousel', 'ad_image_row', 'ad_link', 'ad_sidebar', 'ad_sitelink') ;;
#   }
#   dimension: has_ads_visible {
#     type: yesno
#     description: "If component had ads visible (always False for non-ad components)"
#     sql: ${is_ad_component} and ${TABLE}.num_ads_showing > 0;;
#   }
#   dimension: has_ad_clicked {
#     type: yesno
#     description: "If component had at least 1 visible ad clicked"
#     sql: ${is_ad_component} and ${TABLE}.num_ads_showing > 0 and ${TABLE}.num_clicks > 0;;
#   }
#   dimension: is_engaged {
#     type: yesno
#     description: "If at least 1 engagement (click/expand/submit) was recorded for the component"
#     sql: ${TABLE}.num_clicks > 0 or ${TABLE}.num_expands > 0 or ${TABLE}.num_submits > 0 ;;
#   }

#   measure: serp_impressions_count {
#     group_label: "SERP Impression Metrics"
#     label: "Num SERP Impressions"
#     description: "Number of SERP Impressions with component"
#     type: count_distinct
#     sql: ${impression_id};;
#   }
#   measure: ad_impressions_count {
#     group_label: "Ad Impression Metrics"
#     label: "Num SERP with Ad Impressions"
#     description: "Number of SERP impressions with visible ads in component"
#     type: count_distinct
#     sql: ${impression_id};;
#     filters: [has_ads_visible: "yes"]
#   }
#   measure: clicked_ad_impressions_count {
#     group_label: "Engagement Metrics"
#     label: "Num SERP with Ad Click"
#     description: "Number of SERP impressions with at least 1 ad click in component"
#     type: count_distinct
#     sql: ${impression_id};;
#     filters: [has_ad_clicked: "yes"]
#   }
#   measure: ad_impression_rate {
#     group_label: "Ad Impression Metrics"
#     label: "SERP Ad Impression Rate"
#     description: "Proportion of SERP impressions with visible ads in component"
#     type: number
#     sql: safe_divide(${ad_impressions_count}, ${serp_impressions_count}) ;;
#   }
#   measure: ad_ctr{
#     group_label: "Engagement Metrics"
#     label: "SERP Ad CTR"
#     description: "Number of SERP impressions with at least 1 ad click / number of SERP impressions with visible ads"
#     type: number
#     sql: safe_divide(${clicked_ad_impressions_count}, ${ad_impressions_count}) ;;
#   }
#   measure: ads_loaded{
#     group_label: "Ad Impression Metrics"
#     label: "Num Ads Loaded"
#     description: "Total number of ads loaded in component"
#     type: sum
#     sql: ${TABLE}.num_ads_loaded_reported;;
#   }
#   measure: ads_visible{
#     group_label: "Ad Impression Metrics"
#     label: "Num Ads Visible"
#     description: "Total number of ads visible in component"
#     type: sum
#     sql: ${TABLE}.num_ads_showing;;
#   }
#   measure: ads_not_showing{
#     group_label: "Ad Impression Metrics"
#     label: "Num Ads Not Showing"
#     description: "Total number of ads loaded and not showing in component"
#     type: sum
#     sql: ${TABLE}.num_ads_notshowing;;
#   }
#   measure: visible_proportion{
#     group_label: "Ad Impression Metrics"
#     label: "Proportion Loaded Ads Visible"
#     description: "Number of ads visible / number of ads loaded in component"
#     type: number
#     sql: safe_divide(${ads_visible},${ads_loaded});;
#   }
#   measure: clicks{
#     group_label: "Engagement Metrics"
#     label: "Num Clicks"
#     description: "Total number of ad links/non-ad links/UI features clicked in component"
#     type: sum
#     sql: ${TABLE}.num_clicks;;
#   }
#   measure: ad_clicks{
#     group_label: "Engagement Metrics"
#     label: "Num Ad Clicks"
#     description: "Total number of clicks on visible ads in component"
#     type: sum
#     sql: ${TABLE}.num_clicks;;
#     filters: [has_ads_visible: "yes"]
#   }
#   measure: expands{
#     group_label: "Engagement Metrics"
#     label: "Num Expands"
#     description: "Total number of clicks on the expansion button (applies to ad_carousel, ad_sidebar, refined_search_buttons)"
#     type: sum
#     sql: ${TABLE}.num_expands;;
#   }
#   measure: submits{
#     group_label: "Engagement Metrics"
#     label: "Num Submits"
#     description: "Total number of in-content search box submits"
#     type: sum
#     sql: ${TABLE}.num_submits;;
#   }
# }
