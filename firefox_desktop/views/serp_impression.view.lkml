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

  dimension: has_ad_click {
    group_label: "Ad Features"
    label: "Has Ad Clicks"
    type: yesno
    description: "If SERP had at least 1 ad click"
    sql: ${num_ad_clicks} > 0 ;;
  }

  dimension: has_ads_visible {
    group_label: "Ad Features"
    label: "Has Visible Ads"
    type: yesno
    description: "If SERP had visible ads"
    sql: ${num_ads_visible} > 0 ;;
  }

  dimension: has_cookie_banner_visible {
    group_label: "Component Features"
    label: "Has Visible Cookie Banner"
    type: yesno
    description: "If SERP had cookie banner visible"
    sql: EXISTS(
      SELECT * FROM UNNEST(${non_ad_impressions}) AS e
      WHERE e.component = 'cookie_banner' AND e.num_elements_visible > 0
    ) ;;
  }

  dimension: has_refined_search_visible {
    group_label: "Component Features"
    label: "Has Visible Refined Search Buttons"
    description: "If SERP had refined search buttons visible"
    type: yesno
    sql: EXISTS(
      SELECT * FROM UNNEST(${non_ad_impressions}) AS e
      WHERE e.component = 'refined_search_buttons' AND e.num_elements_visible > 0
    ) ;;
  }

  dimension: has_shopping_tab_visible {
    group_label: "Component Features"
    label: "Has Visible Shopping Tab"
    type: yesno
    description: "If SERP had shopping tab visible"
    sql: EXISTS(
      SELECT * FROM UNNEST(${non_ad_impressions}) AS e
      WHERE e.component = 'shopping_tab' AND e.num_elements_visible > 0
    ) ;;
  }

  dimension: impression_id {
    hidden: yes
    primary_key: yes
  }

  dimension: is_engaged {
    group_label: "SERP Features"
    type: yesno
    description: "At least 1 engagement (any type) on SERP (including ads/non-ads)"
    sql: ${abandon_reason} IS NULL ;;
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

  dimension: num_cookie_banner_accepts {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_accept'
    ) ;;
  }

  dimension: num_cookie_banner_rejects {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_reject'
    ) ;;
  }

  dimension: num_cookie_banner_more_options {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_more_options'
    ) ;;
  }

  dimension: num_non_ad_engagements {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
    ) ;;
  }

  dimension: num_non_ad_link_clicks {
    hidden: yes
  }

  dimension: num_other_engagements {
    hidden: yes
  }

  dimension: num_refined_search_clicks {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'refined_search_buttons' AND e.action = 'clicked'
    ) ;;
  }

  dimension: num_refined_search_expands {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'refined_search_buttons' AND e.action = 'expanded'
    ) ;;
  }

  dimension: num_searchbox_submits {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'incontent_searchbox' AND e.action = 'submitted'
    ) ;;
  }

  dimension: num_shopping_tab_clicks {
    hidden: yes
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'shopping_tab' AND e.action = 'clicked'
    ) ;;
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

#--------------------------------------------------------------------

# SERP impression metrics

  measure: serp_impressions_count {
    group_label: "SERP Metrics"
    label: "SERP Impressions"
    description: "Total number of SERP impressions"
    type: count
  }

  measure: abandonment_impressions_count {
    group_label: "SERP Metrics"
    label: "Abandoned SERP Impressions"
    description: "Number of abandoned SERP impressions"
    type: count
    filters: [is_engaged: "no"]
  }

  measure: engaged_impressions_count {
    group_label: "SERP Metrics"
    label: "Engaged SERP impressions"
    description: "Number of engaged SERP impressions"
    type: count
    filters: [is_engaged: "yes"]
  }

  measure: ad_impressions_count {
    group_label: "SERP Metrics"
    label: "SERPs with Ads"
    description: "Number of SERP impressions with visible ads"
    type: count
    filters: [has_ads_visible: "yes"]
  }

  measure: clicked_ad_impressions_count {
    group_label: "SERP Metrics"
    label: "SERPs with Ad Clicks"
    description: "Number of SERP impressions with at least 1 ad click"
    type: count
    filters: [has_ad_click: "yes"]
  }

#--------------------

# Ad metrics

  measure: ads_loaded {
    group_label: "Ad Metrics"
    label: "Num Ads Loaded"
    description: "Number of ads loaded (may or may not be visible)"
    type: sum
    sql: ${num_ads_loaded} ;;
  }

  measure: ads_visible {
    group_label: "Ad Metrics"
    label: "Num Ads Visible"
    description: "Number of ads visible"
    type: sum
    sql: ${num_ads_visible} ;;
  }

  measure: ads_not_showing {
    group_label: "Ad Metrics"
    label: "Num Ads Not Showing"
    description: "Number of ads loaded and not showing"
    type: sum
    sql: ${num_ads_notshowing} ;;
  }

  measure: ads_blocked {
    group_label: "Ad Metrics"
    label: "Num Ads Blocked"
    description: "Number of ads blocked by an ad blocker"
    type: sum
    sql: ${num_ads_blocked} ;;
  }

  measure: ad_clicks {
    group_label: "Ad Metrics"
    label: "Ad Clicks"
    description: "Total number of ad clicks"
    type: sum
    sql: ${num_ad_clicks} ;;
  }

#--------------------

# Shopping page metrics

  measure: shopping_page_impressions_count {
    group_label: "Shopping Page Metrics"
    label: "Shopping Page Impressions"
    description: "Number of shopping page impressions"
    type: count
    filters: [is_shopping_page: "yes"]
  }

  measure: is_shopping_page_ad_impression_count {
    group_label: "Shopping Page Metrics"
    label: "Shopping Pages with Ads"
    description: "Number of shopping page impressions with visible ads"
    type: count
    filters: [is_shopping_page: "yes", has_ads_visible: "yes"]
  }

  measure: shopping_page_with_ad_click_count {
    group_label: "Shopping Page Metrics"
    label: "Shopping Pages with Ad Clicks"
    description: "Number of shopping page impressions with at least 1 ad click"
    type: count
    filters: [is_shopping_page: "yes", has_ad_click: "yes"]
  }

#--------------------

# Rate metrics

  measure: ads_loaded_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Loaded Per SERP"
    description: "Number of ads loaded / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_loaded}, ${serp_impressions_count}) ;;
  }

  measure: ads_visible_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Visible Per SERP"
    description: "Number of ads visible / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_visible}, ${serp_impressions_count}) ;;
  }

  measure: ads_not_showing_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Not Showing Per SERP"
    description: "Number of ads not showing / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_not_showing}, ${serp_impressions_count}) ;;
  }

  measure: ad_impression_rate {
    group_label: "Rate Metrics"
    label: "SERP Ad Impression Rate"
    description: "Proportion of SERP impressions that have visible ads"
    type: number
    sql: SAFE_DIVIDE(${ad_impressions_count}, ${serp_impressions_count}) ;;
  }

  measure: visible_proportion {
    group_label: "Rate Metrics"
    label: "Proportion Loaded Ads Visible"
    description: "Number of ads visible / number of ads loaded"
    type: number
    sql: SAFE_DIVIDE(${ads_visible}, ${ads_loaded}) ;;
  }

  measure: is_shopping_page_proportion {
    group_label: "Rate Metrics"
    label: "Proportion SERP with Ads as Shopping Pages"
    description: "Proportion of SERP impressions with ads that are shopping pages"
    type: number
    sql: SAFE_DIVIDE(${is_shopping_page_ad_impression_count}, ${ad_impressions_count}) ;;
  }

  measure: ad_clicks_per_impression_id {
    group_label: "Rate Metrics"
    label: "SERP Ad Click Rate"
    description: "Total number of ads clicked / number of SERP impressions with visible ads"
    type: number
    sql: SAFE_DIVIDE(${ad_clicks}, ${ad_impressions_count}) ;;
  }

  measure: Ads_CTR {
    group_label: "Rate Metrics"
    label: "SERP Ad CTR"
    description: "Proportion of SERP impressions with visible ads that had an ad click"
    type: number
    sql: SAFE_DIVIDE(${clicked_ad_impressions_count}, ${ad_impressions_count}) ;;
  }

#--------------------

# Engagement metrics

  measure: non_ad_link_clicks {
    group_label: "Engagement Metrics"
    label: "Organic Link Clicks"
    description: "Total number of clicks on organic result links"
    type: sum
    sql: ${num_non_ad_link_clicks} ;;
  }

  measure: submits {
    group_label: "Engagement Metrics"
    label: "Search Box Submits"
    description: "Total number of in-content search box submits"
    type: sum
    sql: ${num_searchbox_submits} ;;
  }

  measure: non_ad_overall_engagements {
    group_label: "Engagement Metrics"
    label: "Non-Ad Engagements"
    description: "Total number of engagements with all non-ad UI features"
    type: sum
    sql: ${num_non_ad_engagements} ;;
  }

#--------------------

# Non-ad component metrics

  measure: refined_search_visible {
    group_label: "Component Metrics"
    label: "SERPs with Refined Search Buttons"
    description: "Number of SERP impressions with refined search buttons visible"
    type: count
    filters: [has_refined_search_visible: "yes"]
  }

  measure: refined_search_clicks {
    group_label: "Component Metrics"
    label: "Refined Search Buttons Clicks"
    description: "Number of clicks on refined search buttons"
    type: sum
    sql: ${num_refined_search_clicks} ;;
  }

  measure: refined_search_expands {
    group_label: "Component Metrics"
    label: "Refined Search Buttons Expands"
    description: "Number of expansions of refined search buttons"
    type: sum
    sql: ${num_refined_search_expands} ;;
  }

  measure: shopping_tab_visible {
    group_label: "Component Metrics"
    label: "SERPs with Shopping Tab"
    description: "Number of SERP impressions with shopping tab visible"
    type: count
    filters: [has_shopping_tab_visible: "yes"]
  }

  measure: shopping_tab_clicks {
    group_label: "Component Metrics"
    label: "Shopping Tab Clicks"
    description: "Number of clicks on shopping tab"
    type: sum
    sql: ${num_shopping_tab_clicks} ;;
  }

  measure: cookie_banner_visible {
    group_label: "Component Metrics"
    label: "SERPs with Cookie Banner"
    description: "Number of SERP impressions with cookie banner visible"
    type: count
    filters: [has_cookie_banner_visible: "yes"]
  }

  measure: cookie_banner_clicks_accept {
    group_label: "Component Metrics"
    label: "Cookie Banner Accepts"
    description: "Number of clicks on cookie banner to accept cookies"
    type: sum
    sql: ${num_cookie_banner_accepts} ;;
  }

  measure: cookie_banner_clicks_reject {
    group_label: "Component Metrics"
    label: "Cookie Banner Rejects"
    description: "Number of clicks on cookie banner to reject cookies"
    type: sum
    sql: ${num_cookie_banner_rejects} ;;
  }

  measure: cookie_banner_clicks_more_options {
    group_label: "Component Metrics"
    label: "Cookie Banner More Options"
    description: "Number of clicks on cookie banner to see more options"
    type: sum
    sql: ${num_cookie_banner_more_options} ;;
  }
}

view: serp_impression__ad_components {
  extends: [serp_events_table__ad_components]

  dimension: id {
    hidden:  yes
    primary_key: yes
    sql: CONCAT(${serp_impression.impression_id}, ${TABLE}.component) ;;
  }

  dimension: blocker_inferred {
    hidden: yes
  }

  dimension: component {
    label: "Display Component"
    description: "SERP display component"
  }

  dimension: has_ads_visible {
    type: yesno
    description: "If component had ads visible (always False for non-ad components)"
    sql: ${num_visible} > 0 ;;
  }
  dimension: has_ad_clicked {
    type: yesno
    description: "If component had at least 1 visible ad clicked"
    sql: ${num_visible} > 0 and ${num_clicks} > 0 ;;
  }
  dimension: is_engaged {
    type: yesno
    description: "If at least 1 engagement (click/expand/submit) was recorded for the component"
    sql: ${num_clicks} > 0 or ${num_other_engagements} > 0 ;;
  }

  dimension: num_blocked {
    hidden: yes
  }

  dimension: num_clicks {
    hidden: yes
  }

  dimension: num_loaded {
    hidden: yes
  }

  dimension: num_notshowing {
    hidden: yes
  }

  dimension: num_other_engagements {
    hidden: yes
  }

  dimension: num_visible {
    hidden: yes
  }

  measure: ad_impressions_count {
    group_label: "Ad Impression Metrics"
    label: "Num SERP with Ad Impressions"
    description: "Number of SERP impressions with visible ads in component"
    type: count_distinct
    sql: ${serp_impression.impression_id} ;;
    filters: [has_ads_visible: "yes"]
  }
  measure: clicked_ad_impressions_count {
    group_label: "Engagement Metrics"
    label: "Num SERP with Ad Click"
    description: "Number of SERP impressions with at least 1 ad click in component"
    type: count_distinct
    sql: ${serp_impression.impression_id} ;;
    filters: [has_ad_clicked: "yes"]
  }
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
  measure: ads_loaded{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Loaded"
    description: "Total number of ads loaded in component"
    type: sum
    sql: ${num_loaded} ;;
  }
  measure: ads_visible{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Visible"
    description: "Total number of ads visible in component"
    type: sum
    sql: ${num_visible} ;;
  }
  measure: ads_not_showing{
    group_label: "Ad Impression Metrics"
    label: "Num Ads Not Showing"
    description: "Total number of ads loaded and not showing in component"
    type: sum
    sql: ${num_notshowing} ;;
  }
  measure: visible_proportion{
    group_label: "Ad Impression Metrics"
    label: "Proportion Loaded Ads Visible"
    description: "Number of ads visible / number of ads loaded in component"
    type: number
    sql: safe_divide(${ads_visible},${ads_loaded});;
  }
  # measure: clicks{
  #   group_label: "Engagement Metrics"
  #   label: "Num Clicks"
  #   description: "Total number of ad links/non-ad links/UI features clicked in component"
  #   type: sum
  #   sql: ${num_clicks};;
  # }
  measure: ad_clicks{
    group_label: "Engagement Metrics"
    label: "Num Ad Clicks"
    description: "Total number of clicks on visible ads in component"
    type: sum
    sql: ${num_clicks} ;;
    # filters: [has_ads_visible: "yes"]
  }

  measure: other_engagements{
    group_label: "Engagement Metrics"
    label: "Num Other Engagements"
    description: "Total number of other engagements in component"
    type: sum
    sql: ${num_other_engagements} ;;
    # filters: [has_ads_visible: "yes"]
  }
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

}

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
