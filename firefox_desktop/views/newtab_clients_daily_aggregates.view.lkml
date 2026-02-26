

view: newtab_clients_daily_aggregates {

  derived_table: {
    sql: SELECT
          *
        FROM
          `moz-fx-data-shared-prod.firefox_desktop_derived.newtab_clients_daily_aggregates_v2`
        WHERE
          submission_date
          BETWEEN
          {% if submission_date_extension._parameter_value == "year_1" %}
          DATE_SUB(COALESCE(SAFE_CAST({% date_start submission_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 394 DAY)
          {% elsif submission_date_extension._parameter_value == "days_28" %}
          DATE_SUB(COALESCE(SAFE_CAST({% date_start submission_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 28 DAY)
          {% elsif submission_date_extension._parameter_value == "days_7" %}
          DATE_SUB(COALESCE(SAFE_CAST({% date_start submission_date_range %} AS DATE), CURRENT_DATE()), INTERVAL 7 DAY)
          {% else %}
          COALESCE(SAFE_CAST({% date_start submission_date_range %} AS DATE), CURRENT_DATE())
          {% endif %}
          AND
          COALESCE(
          SAFE_CAST(
          {% date_end submission_date_range %} AS DATE
          ), CURRENT_DATE())
    ;;
  }

  dimension: default_ui_visits {
    group_label: "Metrics"
    label: "Default UI Visits"
    description: "Count of visits with default UI"
    type: number
    sql: ${TABLE}.default_ui_visits ;;
  }

  dimension: any_engagement_visits {
    group_label: "Metrics"
    label: "Any Engagement Visits"
    description: "Count of visits with any engagement"
    type: number
    sql: ${TABLE}.any_engagement_visits ;;
  }

  dimension: any_engagement_clients {
    group_label: "Metrics"
    label: "Any Engagement Clients"
    description: "Count clients with any engagement"
    type: number
    sql: ${TABLE}.any_engagement_clients ;;
  }

  dimension: nonsearch_engagement_visits {
    group_label: "Metrics"
    label: "Nonsearch Engagement Visits"
    description: "Count of visits with nonsearch engagement"
    type: number
    sql: ${TABLE}.nonsearch_engagement_visits ;;
  }

  dimension: nonsearch_engagement_clients {
    group_label: "Metrics"
    label: "Nonsearch Engagement Clients"
    description: "Count of clients with nonsearch engagement"
    type: number
    sql: ${TABLE}.nonsearch_engagement_clients ;;
  }

  dimension: default_ui_clients {
    group_label: "Metrics"
    label: "Default UI Clients"
    description: "Count of clients with default UI"
    type: number
    sql: ${TABLE}.default_ui_clients ;;
  }

  dimension: any_content_engagement_visits {
    group_label: "Metrics"
    label: "Any Content Engagement Visits"
    description: "Count of visits with content engagement, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_content_engagement_visits ;;
  }

  dimension: organic_content_engagement_visits {
    group_label: "Metrics"
    label: "Organic Content Engagement Visits"
    description: "Count of visits with organic content engagement"
    type: number
    sql: ${TABLE}.organic_content_engagement_visits ;;
  }

  dimension: sponsored_content_engagement_visits {
    group_label: "Metrics"
    label: "Sponsored Content Engagement Visits"
    description: "Count of visits with sponsored content engagement"
    type: number
    sql: ${TABLE}.sponsored_content_engagement_visits ;;
  }

  dimension: any_content_engagement_clients {
    group_label: "Metrics"
    label: "Any Content Engagement clients"
    description: "Count of clients with content engagement, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_content_engagement_clients ;;
  }

  dimension: organic_content_engagement_clients {
    group_label: "Metrics"
    label: "Organic Content Engagement clients"
    description: "Count of clients with organic content engagement"
    type: number
    sql: ${TABLE}.organic_content_engagement_clients ;;
  }

  dimension: sponsored_content_engagement_clients {
    group_label: "Metrics"
    label: "Sponsored Content Engagement clients"
    description: "Count of clients with sponsored content engagement"
    type: number
    sql: ${TABLE}.sponsored_content_engagement_clients ;;
  }

  dimension: any_content_impression_count {
    group_label: "Metrics"
    label: "Sum of all Content Impressions "
    description: "Sum of content impressions, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_content_impression_count ;;
  }

  dimension: organic_content_impression_count {
    group_label: "Metrics"
    label: "Sum of Organic Content Impressions "
    description: "Sum of organic content impressions"
    type: number
    sql: ${TABLE}.organic_content_impression_count ;;
  }

  dimension: sponsored_content_impression_count {
    group_label: "Metrics"
    label: "Sum of Sponsored Content Impressions "
    description: "Sum of sponsored content impressions"
    type: number
    sql: ${TABLE}.sponsored_content_impression_count ;;
  }

  dimension: any_content_click_count {
    group_label: "Metrics"
    label: "Sum of all Content clicks "
    description: "Sum of content clicks, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_content_click_count ;;
  }

  dimension: organic_content_click_count {
    group_label: "Metrics"
    label: "Sum of Organic Content Clicks "
    description: "Sum of organic content clicks"
    type: number
    sql: ${TABLE}.organic_content_click_count ;;
  }

  dimension: sponsored_content_click_count {
    group_label: "Metrics"
    label: "Sum of Sponsored Content Clicks "
    description: "Sum of sponsored content clicks"
    type: number
    sql: ${TABLE}.sponsored_content_click_count ;;
  }

  dimension: any_topsite_engagement_visits {
    group_label: "Metrics"
    label: "Any Topsite Engagement Visits"
    description: "Count of visits with topsite engagement, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_topsite_engagement_visits ;;
  }

  dimension: organic_topsite_engagement_visits {
    group_label: "Metrics"
    label: "Organic Topsite Engagement Visits"
    description: "Count of visits with organic topsite engagement"
    type: number
    sql: ${TABLE}.organic_topsite_engagement_visits ;;
  }

  dimension: sponsored_topsite_engagement_visits {
    group_label: "Metrics"
    label: "Sponsored Topsite Engagement Visits"
    description: "Count of visits with sponsored topsite engagement"
    type: number
    sql: ${TABLE}.sponsored_topsite_engagement_visits ;;
  }

  dimension: any_topsite_engagement_clients {
    group_label: "Metrics"
    label: "Any Topsite Engagement clients"
    description: "Count of clients with topsite engagement, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_topsite_engagement_clients ;;
  }

  dimension: organic_topsite_engagement_clients {
    group_label: "Metrics"
    label: "Organic Topsite Engagement clients"
    description: "Count of clients with organic topsite engagement"
    type: number
    sql: ${TABLE}.organic_topsite_engagement_clients ;;
  }

  dimension: sponsored_topsite_engagement_clients {
    group_label: "Metrics"
    label: "Sponsored Topsite Engagement clients"
    description: "Count of clients with sponsored topsite engagement"
    type: number
    sql: ${TABLE}.sponsored_topsite_engagement_clients ;;
  }

  dimension: any_topsite_impression_count {
    group_label: "Metrics"
    label: "Sum of all Topsite Impressions "
    description: "Sum of topsite impressions, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_topsite_impression_count ;;
  }

  dimension: organic_topsite_impression_count {
    group_label: "Metrics"
    label: "Sum of Organic Topsite Impressions "
    description: "Sum of organic topsite impressions"
    type: number
    sql: ${TABLE}.organic_topsite_impression_count ;;
  }

  dimension: sponsored_topsite_impression_count {
    group_label: "Metrics"
    label: "Sum of Sponsored Topsite Impressions "
    description: "Sum of sponsored topsite impressions"
    type: number
    sql: ${TABLE}.sponsored_topsite_impression_count ;;
  }

  dimension: any_topsite_click_count {
    group_label: "Metrics"
    label: "Sum of all Topsite clicks "
    description: "Sum of topsite clicks, both sponsored and organic"
    type: number
    sql: ${TABLE}.any_topsite_click_count ;;
  }

  dimension: organic_topsite_click_count {
    group_label: "Metrics"
    label: "Sum of Organic Topsite Clicks "
    description: "Sum of organic topsite clicks"
    type: number
    sql: ${TABLE}.organic_topsite_click_count ;;
  }

  dimension: sponsored_topsite_click_count {
    group_label: "Metrics"
    label: "Sum of Sponsored Topsite Clicks "
    description: "Sum of sponsored topsite clicks"
    type: number
    sql: ${TABLE}.sponsored_topsite_click_count ;;
  }

  dimension: widget_engagement_visits {
    group_label: "Metrics"
    label: "Widget Engagement Visits"
    description: "Count of visits with widget engagement"
    type: number
    sql: ${TABLE}.widget_engagement_visits ;;
  }

  dimension: widget_engagement_clients {
    group_label: "Metrics"
    label: "Widget Engagement Clients"
    description: "Count of clients with widget engagement"
    type: number
    sql: ${TABLE}.widget_engagement_clients ;;
  }

  dimension: widget_interaction_count {
    group_label: "Metrics"
    label: "Widget Interaction Count"
    description: "Count of clients with widget interaction"
    type: number
    sql: ${TABLE}.widget_interaction_count ;;
  }

  dimension: widget_impression_count {
    group_label: "Metrics"
    label: "Widget Impressions Count"
    description: "Count of widget impressions"
    type: number
    sql: ${TABLE}.widget_impression_count ;;
  }


  dimension: others_engagement_visits {
    group_label: "Metrics"
    label: "Others Engagement Visits"
    description: "Count of visits with others engagement"
    type: number
    sql: ${TABLE}.others_engagement_visits ;;
  }

  dimension: others_engagement_clients {
    group_label: "Metrics"
    label: "Others Engagement Clients"
    description: "Count of clients with others engagement"
    type: number
    sql: ${TABLE}.others_engagement_clients ;;
  }

  dimension: others_interaction_count {
    group_label: "Metrics"
    label: "Other Interaction Count"
    description: "Count of clients with Other interaction"
    type: number
    sql: ${TABLE}.other_interaction_count ;;
  }

  dimension: others_impression_count {
    group_label: "Metrics"
    label: "Other Impressions Count"
    description: "Count of other impressions"
    type: number
    sql: ${TABLE}.other_impression_count ;;
  }

  dimension: organic_content_impression_clients {
    group_label: "Metrics"
    label: "Organic Content Impression Clients"
    description: "Count of clients with Organic Content Impressions"
    type: number
    sql: ${TABLE}.organic_content_impression_clients ;;
  }

  dimension: sponsored_content_impression_clients {
    group_label: "Metrics"
    label: "Sponsored Content Impression Clients"
    description: "Count of clients with Sponsored Content Impressions"
    type: number
    sql: ${TABLE}.sponsored_content_impression_clients ;;
  }

  dimension: any_content_impression_clients {
    group_label: "Metrics"
    label: "Any Content Impression Clients"
    description: "Count of clients with any content Impressions"
    type: number
    sql: ${TABLE}.any_content_impression_clients ;;
  }

  dimension: organic_content_click_clients {
    group_label: "Metrics"
    label: "Organic Content Click Clients"
    description: "Count of clients with Organic Content Clicks"
    type: number
    sql: ${TABLE}.organic_content_click_clients ;;
  }

  dimension: sponsored_content_click_clients {
    group_label: "Metrics"
    label: "Sponsored Content Click Clients"
    description: "Count of clients with Sponsored Content Clicks"
    type: number
    sql: ${TABLE}.sponsored_content_click_clients ;;
  }

  dimension: any_content_click_clients {
    group_label: "Metrics"
    label: "Any Content Click Clients"
    description: "Count of clients with any content clicks"
    type: number
    sql: ${TABLE}.any_content_click_clients ;;
  }

  dimension: app_version {
    sql: ${TABLE}.app_version ;;
    type: number
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: channel {
    sql: COALESCE(${TABLE}.channel, "Unknown") ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
    suggestions: ["release", "esr", "beta", "Other", "nightly", "aurora", "Unknown"]
  }

  dimension: country {
    sql: ${TABLE}.country ;;
    type: string
    suggest_persist_for: "24 hours"
    map_layer_name: countries
    group_label: "Base Fields"
  }

  dimension: homepage_category {
    sql: ${TABLE}.homepage_category ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: locale {
    sql: ${TABLE}.locale ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: newtab_category {
    sql: ${TABLE}.newtab_category ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: newtab_search_enabled {
    sql: ${TABLE}.newtab_search_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: organic_content_enabled {
    sql: ${TABLE}.organic_content_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: organic_topsites_enabled {
    sql: ${TABLE}.organic_topsites_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: os {
    sql: ${TABLE}.os ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
    suggestions: ["Windows", "Mac", "Linux", "Other"]
  }

  dimension: sponsored_content_enabled {
    sql: ${TABLE}.sponsored_content_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: sponsored_content_viewable {
    sql: ${TABLE}.sponsored_content_enabled AND ${TABLE}.organic_content_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: sponsored_topsites_enabled {
    sql: ${TABLE}.sponsored_topsites_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: sponsored_topsites_viewable {
    sql: ${TABLE}.sponsored_topsites_enabled AND ${TABLE}.organic_topsites_enabled ;;
    type: yesno
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension: newtab_content_surface_id {
    sql: ${TABLE}.newtab_content_surface_id ;;
    type: string
    suggest_persist_for: "24 hours"
    group_label: "Base Fields"
  }

  dimension_group: submission {
    type: time
    group_label: "Base Fields"
    sql: ${TABLE}.submission_date ;;
    label: "Submission"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  measure: any_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.any_engagement_visits*1 ;;
    label: "Any Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Any Engagement Visits"
  }

  measure: any_engagement_visits_ratio {
    type: number
    label: "Any Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${any_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: nonsearch_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.nonsearch_engagement_visits*1 ;;
    label: "Nonsearch Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Nonsearch Engagement Visits"
  }

  measure: nonsearch_engagement_visits_ratio {
    type: number
    label: "Nonsearch Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${nonsearch_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between nonsearch_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: default_ui_visits_sum {
    type: sum
    sql: ${TABLE}.default_ui_visits*1 ;;
    label: "Default UI Visits Sum"
    group_label: "Statistics"
    description: "Sum of Default UI Visits"
  }

  measure: any_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.any_engagement_clients*1 ;;
    label: "Any Engagement Clients Sum"
    group_label: "Statistics"
    description: "Sum of Any Engagement Clients"
  }

  measure: any_engagement_clients_ratio {
    type: number
    label: "Any Engagement Clients Ratio"
    sql: SAFE_DIVIDE(${any_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: nonsearch_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.nonsearch_engagement_clients*1 ;;
    label: "Nonsearch Engagement Clients Sum"
    group_label: "Statistics"
    description: "Sum of Nonsearch Engagement Clients"
  }

  measure: nonsearch_engagement_clients_ratio {
    type: number
    label: "Nonsearch Engagement Clients Ratio"
    sql: SAFE_DIVIDE(${nonsearch_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between nonsearch_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: default_ui_clients_sum {
    type: sum
    sql: ${TABLE}.default_ui_clients*1 ;;
    label: "Default UI Clients Sum"
    group_label: "Statistics"
    description: "Sum of Default UI Clients"
  }

  measure: any_content_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.any_content_engagement_visits*1 ;;
    label: "Any Content Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Any Content Engagement Visits"
  }

  measure: any_content_engagement_visits_ratio {
    type: number
    label: "Any Content Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${any_content_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_content_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: organic_content_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.organic_content_engagement_visits*1 ;;
    label: "Organic Content Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Organic Content Engagement Visits"
  }

  measure: organic_content_engagement_visits_ratio {
    type: number
    label: "Organic Content Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${organic_content_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_content_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: sponsored_content_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_engagement_visits*1 ;;
    label: "Sponsored Content Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Content Engagement Visits"
  }

  measure: sponsored_content_engagement_visits_ratio {
    type: number
    label: "Sponsored Content Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${sponsored_content_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_content_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: any_content_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.any_content_engagement_clients*1 ;;
    label: "Any Content Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Any Content Engagement clients"
  }

  measure: any_content_engagement_clients_ratio {
    type: number
    label: "Any Content Engagement clients Ratio"
    sql: SAFE_DIVIDE(${any_content_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_content_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: organic_content_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.organic_content_engagement_clients*1 ;;
    label: "Organic Content Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Organic Content Engagement clients"
  }

  measure: organic_content_engagement_clients_ratio {
    type: number
    label: "Organic Content Engagement clients Ratio"
    sql: SAFE_DIVIDE(${organic_content_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_content_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: sponsored_content_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_engagement_clients*1 ;;
    label: "Sponsored Content Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Content Engagement clients"
  }

  measure: sponsored_content_engagement_clients_ratio {
    type: number
    label: "Sponsored Content Engagement clients Ratio"
    sql: SAFE_DIVIDE(${sponsored_content_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_content_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: any_content_impression_count_sum {
    type: sum
    sql: ${TABLE}.any_content_impression_count*1 ;;
    label: "Sum of all Content Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Content Impressions "
  }

  measure: organic_content_impression_count_sum {
    type: sum
    sql: ${TABLE}.organic_content_impression_count*1 ;;
    label: "Sum of Organic Content Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Organic Content Impressions "
  }

  measure: sponsored_content_impression_count_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_impression_count*1 ;;
    label: "Sum of Sponsored Content Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Sponsored Content Impressions "
  }

  measure: any_content_click_count_sum {
    type: sum
    sql: ${TABLE}.any_content_click_count*1 ;;
    label: "Sum of all Content clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Content clicks "
  }

  measure: any_content_click_count_ratio {
    type: number
    label: "Sum of all Content clicks  Ratio"
    sql: SAFE_DIVIDE(${any_content_click_count_sum}, ${any_content_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_content_click_count.sum and
    any_content_impression_count.sum"
  }

  measure: organic_content_click_count_sum {
    type: sum
    sql: ${TABLE}.organic_content_click_count*1 ;;
    label: "Sum of Organic Content Clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Organic Content Clicks "
  }

  measure: organic_content_click_count_ratio {
    type: number
    label: "Sum of Organic Content Clicks  Ratio"
    sql: SAFE_DIVIDE(${organic_content_click_count_sum}, ${organic_content_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_content_click_count.sum and
    organic_content_impression_count.sum"
  }

  measure: sponsored_content_click_count_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_click_count*1 ;;
    label: "Sum of Sponsored Content Clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Sponsored Content Clicks "
  }

  measure: sponsored_content_click_count_ratio {
    type: number
    label: "Sum of Sponsored Content Clicks  Ratio"
    sql: SAFE_DIVIDE(${sponsored_content_click_count_sum}, ${sponsored_content_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_content_click_count.sum and
    sponsored_content_impression_count.sum"
  }

  measure: any_topsite_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.any_topsite_engagement_visits*1 ;;
    label: "Any Topsite Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Any Topsite Engagement Visits"
  }

  measure: any_topsite_engagement_visits_ratio {
    type: number
    label: "Any Topsite Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${any_topsite_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_topsite_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: organic_topsite_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.organic_topsite_engagement_visits*1 ;;
    label: "Organic Topsite Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Organic Topsite Engagement Visits"
  }

  measure: organic_topsite_engagement_visits_ratio {
    type: number
    label: "Organic Topsite Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${organic_topsite_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_topsite_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: sponsored_topsite_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.sponsored_topsite_engagement_visits*1 ;;
    label: "Sponsored Topsite Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Topsite Engagement Visits"
  }

  measure: sponsored_topsite_engagement_visits_ratio {
    type: number
    label: "Sponsored Topsite Engagement Visits Ratio"
    sql: SAFE_DIVIDE(${sponsored_topsite_engagement_visits_sum}, ${default_ui_visits_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_topsite_engagement_visits.sum and
    default_ui_visits.sum"
  }

  measure: any_topsite_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.any_topsite_engagement_clients*1 ;;
    label: "Any Topsite Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Any Topsite Engagement clients"
  }

  measure: any_topsite_engagement_clients_ratio {
    type: number
    label: "Any Topsite Engagement clients Ratio"
    sql: SAFE_DIVIDE(${any_topsite_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_topsite_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: organic_topsite_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.organic_topsite_engagement_clients*1 ;;
    label: "Organic Topsite Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Organic Topsite Engagement clients"
  }

  measure: organic_topsite_engagement_clients_ratio {
    type: number
    label: "Organic Topsite Engagement clients Ratio"
    sql: SAFE_DIVIDE(${organic_topsite_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_topsite_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: sponsored_topsite_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.sponsored_topsite_engagement_clients*1 ;;
    label: "Sponsored Topsite Engagement clients Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Topsite Engagement clients"
  }

  measure: sponsored_topsite_engagement_clients_ratio {
    type: number
    label: "Sponsored Topsite Engagement clients Ratio"
    sql: SAFE_DIVIDE(${sponsored_topsite_engagement_clients_sum}, ${default_ui_clients_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_topsite_engagement_clients.sum and
    default_ui_clients.sum"
  }

  measure: any_topsite_impression_count_sum {
    type: sum
    sql: ${TABLE}.any_topsite_impression_count*1 ;;
    label: "Sum of all Topsite Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Topsite Impressions "
  }

  measure: organic_topsite_impression_count_sum {
    type: sum
    sql: ${TABLE}.organic_topsite_impression_count*1 ;;
    label: "Sum of Organic Topsite Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Organic Topsite Impressions "
  }

  measure: sponsored_topsite_impression_count_sum {
    type: sum
    sql: ${TABLE}.sponsored_topsite_impression_count*1 ;;
    label: "Sum of Sponsored Topsite Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Sponsored Topsite Impressions "
  }

  measure: any_topsite_click_count_sum {
    type: sum
    sql: ${TABLE}.any_topsite_click_count*1 ;;
    label: "Sum of all Topsite clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Topsite clicks "
  }

  measure: any_topsite_click_count_ratio {
    type: number
    label: "Sum of all Topsite clicks  Ratio"
    sql: SAFE_DIVIDE(${any_topsite_click_count_sum}, ${any_topsite_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between any_topsite_click_count.sum and
    any_topsite_impression_count.sum"
  }

  measure: organic_topsite_click_count_sum {
    type: sum
    sql: ${TABLE}.organic_topsite_click_count*1 ;;
    label: "Sum of Organic Topsite Clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Organic Topsite Clicks "
  }

  measure: organic_topsite_click_count_ratio {
    type: number
    label: "Sum of Organic Topsite Clicks  Ratio"
    sql: SAFE_DIVIDE(${organic_topsite_click_count_sum}, ${organic_topsite_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between organic_topsite_click_count.sum and
    organic_topsite_impression_count.sum"
  }

  measure: sponsored_topsite_click_count_sum {
    type: sum
    sql: ${TABLE}.sponsored_topsite_click_count*1 ;;
    label: "Sum of Sponsored Topsite Clicks  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Sponsored Topsite Clicks "
  }

  measure: sponsored_topsite_click_count_ratio {
    type: number
    label: "Sum of Sponsored Topsite Clicks  Ratio"
    sql: SAFE_DIVIDE(${sponsored_topsite_click_count_sum}, ${sponsored_topsite_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between sponsored_topsite_click_count.sum and
    sponsored_topsite_impression_count.sum"
  }

  measure: widget_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.widget_engagement_visits*1 ;;
    label: "Widget Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Widget Engagement Visits"
  }

  measure: widget_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.widget_engagement_clients*1 ;;
    label: "Widget Engagement Clients Sum"
    group_label: "Statistics"
    description: "Sum of Widget Engagement Clients"
  }

  measure: others_engagement_visits_sum {
    type: sum
    sql: ${TABLE}.others_engagement_visits*1 ;;
    label: "Others Engagement Visits Sum"
    group_label: "Statistics"
    description: "Sum of Others Engagement Visits"
  }

  measure: others_engagement_clients_sum {
    type: sum
    sql: ${TABLE}.others_engagement_clients*1 ;;
    label: "Others Engagement Clients Sum"
    group_label: "Statistics"
    description: "Sum of Others Engagement Clients"
  }

  measure: widget_impression_count_sum {
    type: sum
    sql: ${TABLE}.widget_impression_count*1 ;;
    label: "Sum of Widget Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Widget Impressions "
  }

  measure: widget_interaction_count_sum {
    type: sum
    sql: ${TABLE}.widget_interaction_count*1 ;;
    label: "Sum of all Widget interaction  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Widget interactions "
  }

  measure: widget_interaction_count_ratio {
    type: number
    label: "Sum of all Widget interactions  Ratio"
    sql: SAFE_DIVIDE(${widget_interaction_count_sum}, ${widget_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between widget_interaction_count.sum and
    widget_impression_count.sum"
  }

  measure: others_impression_count_sum {
    type: sum
    sql: ${TABLE}.other_impression_count*1 ;;
    label: "Sum of Others Impressions  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of Others Impressions "
  }

  measure: others_interaction_count_sum {
    type: sum
    sql: ${TABLE}.other_interaction_count*1 ;;
    label: "Sum of all Others interaction  Sum"
    group_label: "Statistics"
    description: "Sum of Sum of all Others interactions "
  }

  measure: others_interaction_count_ratio {
    type: number
    label: "Sum of all Others interactions  Ratio"
    sql: SAFE_DIVIDE(${others_interaction_count_sum}, ${others_impression_count_sum}) ;;
    group_label: "Statistics"
    description: "\"
    Ratio between other_interaction_count.sum and
    other_impression_count.sum"
  }

  measure: organic_content_impression_clients_sum {
    type: sum
    sql: ${TABLE}.organic_content_impression_clients*1 ;;
    label: "Organic Content Impression Clients Sum"
    group_label: "Statistics"
    description: "Sum of Organic Content Impression Clients"
  }

  measure: sponsored_content_impression_clients_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_impression_clients*1 ;;
    label: "Sponsored Content Impression Clients Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Content Impression Clients"
  }

  measure: any_content_impression_clients_sum {
    type: sum
    sql: ${TABLE}.any_content_impression_clients*1 ;;
    label: "Any Content Impression Clients Sum"
    group_label: "Statistics"
    description: "Sum of Any Content Impression Clients"
  }

  measure: organic_content_click_clients_sum {
    type: sum
    sql: ${TABLE}.organic_content_click_clients*1 ;;
    label: "Organic Content Click Clients Sum"
    group_label: "Statistics"
    description: "Sum of Organic Content Click Clients"
  }

  measure: sponsored_content_click_clients_sum {
    type: sum
    sql: ${TABLE}.sponsored_content_click_clients*1 ;;
    label: "Sponsored Content Click Clients Sum"
    group_label: "Statistics"
    description: "Sum of Sponsored Content Click Clients"
  }

  measure: any_content_click_clients_sum {
    type: sum
    sql: ${TABLE}.any_content_click_clients*1 ;;
    label: "Any Content Click Clients Sum"
    group_label: "Statistics"
    description: "Sum of Any Content Click Clients"
  }

  set: metrics {
    fields: [
      any_engagement_visits,
      any_engagement_clients,
      nonsearch_engagement_visits,
      default_ui_visits,
      nonsearch_engagement_clients,
      default_ui_clients,
      any_content_engagement_visits,
      organic_content_engagement_visits,
      sponsored_content_engagement_visits,
      any_content_engagement_clients,
      organic_content_engagement_clients,
      sponsored_content_engagement_clients,
      any_content_impression_count,
      organic_content_impression_count,
      sponsored_content_impression_count,
      any_content_click_count,
      organic_content_click_count,
      sponsored_content_click_count,
      any_topsite_engagement_visits,
      organic_topsite_engagement_visits,
      sponsored_topsite_engagement_visits,
      any_topsite_engagement_clients,
      organic_topsite_engagement_clients,
      sponsored_topsite_engagement_clients,
      any_topsite_impression_count,
      organic_topsite_impression_count,
      sponsored_topsite_impression_count,
      any_topsite_click_count,
      organic_topsite_click_count,
      sponsored_topsite_click_count,
      widget_engagement_visits,
      widget_engagement_clients,
      others_engagement_visits,
      others_engagement_clients,
      any_engagement_visits_sum,
      any_engagement_visits_ratio,
      nonsearch_engagement_visits_sum,
      nonsearch_engagement_visits_ratio,
      default_ui_visits_sum,
      any_engagement_clients_sum,
      any_engagement_clients_ratio,
      nonsearch_engagement_clients_sum,
      nonsearch_engagement_clients_ratio,
      default_ui_clients_sum,
      any_content_engagement_visits_sum,
      any_content_engagement_visits_ratio,
      organic_content_engagement_visits_sum,
      organic_content_engagement_visits_ratio,
      sponsored_content_engagement_visits_sum,
      sponsored_content_engagement_visits_ratio,
      any_content_engagement_clients_sum,
      any_content_engagement_clients_ratio,
      organic_content_engagement_clients_sum,
      organic_content_engagement_clients_ratio,
      sponsored_content_engagement_clients_sum,
      sponsored_content_engagement_clients_ratio,
      any_content_impression_count_sum,
      organic_content_impression_count_sum,
      sponsored_content_impression_count_sum,
      any_content_click_count_sum,
      any_content_click_count_ratio,
      organic_content_click_count_sum,
      organic_content_click_count_ratio,
      sponsored_content_click_count_sum,
      sponsored_content_click_count_ratio,
      any_topsite_engagement_visits_sum,
      any_topsite_engagement_visits_ratio,
      organic_topsite_engagement_visits_sum,
      organic_topsite_engagement_visits_ratio,
      sponsored_topsite_engagement_visits_sum,
      sponsored_topsite_engagement_visits_ratio,
      any_topsite_engagement_clients_sum,
      any_topsite_engagement_clients_ratio,
      organic_topsite_engagement_clients_sum,
      organic_topsite_engagement_clients_ratio,
      sponsored_topsite_engagement_clients_sum,
      sponsored_topsite_engagement_clients_ratio,
      any_topsite_impression_count_sum,
      organic_topsite_impression_count_sum,
      sponsored_topsite_impression_count_sum,
      any_topsite_click_count_sum,
      any_topsite_click_count_ratio,
      organic_topsite_click_count_sum,
      organic_topsite_click_count_ratio,
      sponsored_topsite_click_count_sum,
      sponsored_topsite_click_count_ratio,
      widget_engagement_visits_sum,
      widget_engagement_clients_sum,
      others_engagement_visits_sum,
      others_engagement_clients_sum,
      widget_impression_count_sum,
      widget_interaction_count_sum,
      widget_interaction_count_ratio,
      others_impression_count_sum,
      others_interaction_count_sum,
      others_interaction_count_ratio,
      organic_content_impression_clients_sum,
      sponsored_content_impression_clients_sum,
      any_content_impression_clients_sum,
      organic_content_click_clients_sum,
      sponsored_content_click_clients_sum,
      any_content_click_clients_sum,
    ]
  }

  parameter: aggregate_metrics_by {
    label: "Aggregate Client Metrics Per"
    type: unquoted
    default_value: "day"

    allowed_value: {
      label: "Per Day"
      value: "day"
    }

    allowed_value: {
      label: "Per Week"
      value: "week"
    }

    allowed_value: {
      label: "Per Month"
      value: "month"
    }

    allowed_value: {
      label: "Per Quarter"
      value: "quarter"
    }

    allowed_value: {
      label: "Per Year"
      value: "year"
    }

    allowed_value: {
      label: "Overall"
      value: "overall"
    }
  }

  parameter: sampling {
    label: "Sample of source data in %"
    type: unquoted
    default_value: "100"
    hidden: yes
  }

  filter: submission_date_range {
    type: date
  }

  parameter: submission_date_extension {
    type: unquoted
    default_value: "None"
    allowed_value: {
      value: "None"
      label: "None"
    }
    allowed_value: {
      value: "year_1"
      label: "1 year"
    }
    allowed_value: {
      value: "days_28"
      label: "28 days"
    }
    allowed_value: {
      value: "days_7"
      label: "7 days"
    }
  }

}
