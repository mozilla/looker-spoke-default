include: "//looker-hub/combined_browser_metrics/views/active_users_aggregates_attribution.view.lkml"

view: +active_users_aggregates_attribution {

  dimension: app_name {
    label: "Browser Name"
    type: string
    sql: ${TABLE}.app_name ;;
  }

  dimension: app_version{
    label: "Browser Version"
    type: string
    sql: ${TABLE}.app_version ;;
  }

# Attribution details ungrouped as this is a focused view for attribution analysis

  dimension: attributed{
    label: "Attributed (Yes/No)"
    type:  string
    sql: ${TABLE}.attributed ;;
  }

  dimension: attribution_campaign {
    label: "Attribution Campaign"
    type:  string
    sql: ${TABLE}.attribution_campaign ;;
  }

  dimension: attribution_content {
    label: "Attribution Content"
    type:  string
    sql: ${TABLE}.attribution_content ;;
  }

  dimension: attribution_experiment {
    label: "Attribution Experiment"
    type:  string
    sql: ${TABLE}.attribution_experiment ;;
  }

  dimension: attribution_medium {
    label: "Attribution Medium"
    type:  string
    sql: ${TABLE}.attribution_medium ;;
  }

  dimension: attribution_source {
    label: "Attribution Source"
    type:  string
    sql: ${TABLE}.attribution_source ;;
  }

  dimension: attribution_variation{
    label: "Attribution Variation"
    type:  string
    sql: ${TABLE}.attribution_variation ;;
  }

  # Measures
  measure: daily_active_users {
    label: "DAU"
    type:  sum
    sql: (${TABLE}.dau) ;;
  }

  measure: weekly_active_users {
    label: "WAU"
    type: sum
    sql:  ${TABLE}.wau ;;
  }

  measure: monthly_active_users {
    label: "MAU"
    type: sum
    sql:  ${TABLE}.mau ;;
  }

  measure: new_profile {
    label: "New Profiles"
    type: sum
    sql:  ${TABLE}.new_profiles ;;
  }

  measure: ad_click {
    label: "Ad Clicks"
    type: sum
    sql:  ${TABLE}.ad_clicks ;;
  }

  measure: organic_search_counts {
    label: "Organic Search Counts"
    type: sum
    sql:  ${TABLE}.organic_search_count ;;
  }

  measure: search_counts {
    label: "Search Counts"
    type: sum
    sql:  ${TABLE}.search_count ;;
  }

  measure: search_with_ad {
    label: "Search With Ads"
    type: sum
    sql:  ${TABLE}.search_with_ads ;;
  }

  measure: uri_counts {
    label: "URI Counts"
    type: sum
    sql:  ${TABLE}.uri_count ;;
  }

  measure: active_hour {
    label: "Active Hours"
    type: sum
    sql:  ${TABLE}.active_hours ;;
  }

# Hide metric columns showing as dimensions
  dimension: mau {
    hidden: yes
    sql: ${TABLE}.mau ;;
  }

  dimension: dau {
    hidden: yes
    sql: ${TABLE}.dau ;;
  }

  dimension: wau {
    hidden: yes
    sql: ${TABLE}.wau ;;
  }

  dimension: new_profiles {
    hidden: yes
    sql: ${TABLE}.new_profiles ;;
  }

  dimension: ad_clicks {
    hidden: yes
    sql: ${TABLE}.ad_clicks ;;
  }

  dimension: organic_search_count {
    hidden: yes
    sql: ${TABLE}.organic_search_count ;;
  }

  dimension: search_count {
    hidden: yes
    sql: ${TABLE}.search_count ;;
  }

  dimension: search_with_ads {
    hidden: yes
    sql: ${TABLE}.search_with_ads ;;
  }

  dimension: uri_count {
    hidden: yes
    sql: ${TABLE}.uri_count ;;
  }

  dimension: active_hours {
    hidden: yes
    sql: ${TABLE}.active_hours ;;
  }

}
