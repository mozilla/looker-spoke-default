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
    description: "If SERP had at least 1 ad click in any ad component"
    sql: ${num_ad_clicks} > 0 ;;
  }

  dimension: has_ads_visible {
    group_label: "Ad Features"
    label: "Has Visible Ads"
    type: yesno
    description: "If SERP had visible ads in any ad component"
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
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_accept'
    ) ;;
  }

  dimension: num_cookie_banner_rejects {
    hidden: yes
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_reject'
    ) ;;
  }

  dimension: num_cookie_banner_more_options {
    hidden: yes
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'cookie_banner' AND e.action = 'clicked_more_options'
    ) ;;
  }

  dimension: num_non_ad_engagements {
    hidden: yes
    type: number
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
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'refined_search_buttons' AND e.action = 'clicked'
    ) ;;
  }

  dimension: num_refined_search_expands {
    hidden: yes
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'refined_search_buttons' AND e.action = 'expanded'
    ) ;;
  }

  dimension: num_searchbox_submits {
    hidden: yes
    type: number
    sql: (
      SELECT
        SUM(e.num_engagements)
      FROM UNNEST(${non_ad_engagements}) AS e
      WHERE e.component = 'incontent_searchbox' AND e.action = 'submitted'
    ) ;;
  }

  dimension: num_shopping_tab_clicks {
    hidden: yes
    type: number
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
    description: "Number of SERP impressions with visible ads in any ad component"
    type: count
    filters: [has_ads_visible: "yes"]
  }

  measure: clicked_ad_impressions_count {
    group_label: "SERP Metrics"
    label: "SERPs with Ad Clicks"
    description: "Number of SERP impressions with at least 1 ad click in any ad component"
    type: count
    filters: [has_ad_click: "yes"]
  }

#--------------------

# Ad metrics

  measure: ads_loaded {
    group_label: "Ad Metrics"
    label: "Num Ads Loaded"
    description: "Number of ads loaded (may or may not be visible) across all ad components"
    type: sum
    sql: ${num_ads_loaded} ;;
  }

  measure: ads_visible {
    group_label: "Ad Metrics"
    label: "Num Ads Visible"
    description: "Number of ads visible across all ad components"
    type: sum
    sql: ${num_ads_visible} ;;
  }

  measure: ads_not_showing {
    group_label: "Ad Metrics"
    label: "Num Ads Not Showing"
    description: "Number of ads loaded and not showing across all ad components"
    type: sum
    sql: ${num_ads_notshowing} ;;
  }

  measure: ads_blocked {
    group_label: "Ad Metrics"
    label: "Num Ads Blocked"
    description: "Number of ads blocked by an ad blocker across all ad components"
    type: sum
    sql: ${num_ads_blocked} ;;
  }

  measure: ad_clicks {
    group_label: "Ad Metrics"
    label: "Ad Clicks"
    description: "Number of ad clicks across all ad components"
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
    description: "Number of shopping page impressions with visible ads across all ad components"
    type: count
    filters: [is_shopping_page: "yes", has_ads_visible: "yes"]
  }

  measure: shopping_page_with_ad_click_count {
    group_label: "Shopping Page Metrics"
    label: "Shopping Pages with Ad Clicks"
    description: "Number of shopping page impressions with at least 1 ad click across all ad components"
    type: count
    filters: [is_shopping_page: "yes", has_ad_click: "yes"]
  }

#--------------------

# Rate metrics

  measure: ads_loaded_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Loaded Per SERP"
    description: "Number of ads loaded across all ad components / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_loaded}, ${serp_impressions_count}) ;;
  }

  measure: ads_visible_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Visible Per SERP"
    description: "Number of ads visible across all ad components / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_visible}, ${serp_impressions_count}) ;;
  }

  measure: ads_not_showing_per_impression_id {
    group_label: "Rate Metrics"
    label: "Ads Not Showing Per SERP"
    description: "Number of ads not showing across all ad components / number of SERP impressions"
    type: number
    sql: SAFE_DIVIDE(${ads_not_showing}, ${serp_impressions_count}) ;;
  }

  measure: ad_impression_rate {
    group_label: "Rate Metrics"
    label: "SERP Ad Impression Rate"
    description: "Proportion of SERP impressions that have visible ads in any ad component"
    type: number
    sql: SAFE_DIVIDE(${ad_impressions_count}, ${serp_impressions_count}) ;;
  }

  measure: visible_proportion {
    group_label: "Rate Metrics"
    label: "Proportion Loaded Ads Visible"
    description: "Number of ads visible across all ad components / number of ads loaded across all ad components"
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
    description: "Total number of ads clicked across all ad components/ number of SERP impressions with visible ads in any ad component"
    type: number
    sql: SAFE_DIVIDE(${ad_clicks}, ${ad_impressions_count}) ;;
  }

  measure: Ads_CTR {
    group_label: "Rate Metrics"
    label: "SERP Ad CTR"
    description: "Proportion of SERP impressions with visible ads that had an ad click in any ad component"
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
    label: "Ad Component  (see Info)"
    description: "
      SERP ad component.
      Groups or filters by individual ad components.
      This field must be used when measures in this view are selected.
      When this field is in use, do not use measures under 'SERP Impressions'.
    "
  }

  dimension: has_ads_visible {
    type: yesno
    hidden:  yes
    sql: ${num_visible} > 0 ;;
  }

  dimension: has_ad_clicked {
    type: yesno
    hidden:  yes
    sql: ${num_clicks} > 0 ;;
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

#--------------------------------------------------------------------

# Ad metrics

  measure: ads_loaded {
    group_label: "Ad Metrics by Component"
    label: "Num Ads Loaded in Component"
    description: "Number of ads loaded in the component (may or may not be visible)"
    type: sum
    sql: ${num_loaded} ;;
  }

  measure: ads_visible {
    group_label: "Ad Metrics by Component"
    label: "Num Ads Visible in Component"
    description: "Number of ads visible in the component"
    type: sum
    sql: ${num_visible} ;;
  }

  measure: ads_not_showing {
    group_label: "Ad Metrics by Component"
    label: "Num Ads Not Showing in Component"
    description: "Number of ads loaded and not showing in the component"
    type: sum
    sql: ${num_notshowing} ;;
  }

  measure: ads_blocked {
    group_label: "Ad Metrics by Component"
    label: "Num Ads Blocked in Component"
    description: "Number of ads blocked by an ad blocker in the component"
    type: sum
    sql: ${num_blocked} ;;
  }

  measure: ad_clicks {
    group_label: "Ad Metrics by Component"
    label: "Ad Clicks in Component"
    description: "Number of ad clicks in the component"
    type: sum
    sql: ${num_clicks} ;;
  }

  measure: other_engagements {
    group_label: "Ad Metrics by Component"
    label: "Other Engagements in Component"
    description: "Number of other engagements in the component, eg. expanding the carousel."
    type: sum
    sql: ${num_other_engagements} ;;
  }

#--------------------

  measure: serp_impressions_count {
    group_label: "SERP Metrics by Component"
    label: "SERP Impressions"
    description: "Number of SERP impressions wth loaded ads in component"
    type: count
  }

  measure: ad_impressions_count {
    group_label: "SERP Metrics by Component"
    label: "SERPs with Ads in Component"
    description: "Number of SERP impressions with visible ads in component"
    type: count
    filters: [has_ads_visible: "yes"]
  }

  measure: clicked_ad_impressions_count {
    group_label: "SERP Metrics by Component"
    label: "SERPs with Ad Clicks in Component"
    description: "Number of SERP impressions with at least 1 ad click in component"
    type: count
    filters: [has_ad_clicked: "yes"]
  }

  measure: ad_ctr {
    group_label: "Rate Metrics by Component"
    label: "Component Ad CTR"
    description: "Proportion of SERP impressions with visible ads in component that had an ad click in component"
    type: number
    sql: SAFE_DIVIDE(${clicked_ad_impressions_count}, ${ad_impressions_count}) ;;
  }

  measure: visible_proportion {
    group_label: "Rate Metrics by Component"
    label: "Component Proportion Loaded Ads Visible"
    description: "Number of ads visible in component / number of ads loaded in component"
    type: number
    sql: SAFE_DIVIDE(${ads_visible}, ${ads_loaded}) ;;
  }
}
