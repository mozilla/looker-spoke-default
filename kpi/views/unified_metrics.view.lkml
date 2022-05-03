include: "//looker-hub/kpi/views/unified_metrics.view.lkml"

view: +unified_metrics {
  dimension: active_today {
    type: yesno
    label: "Client Sent Ping Today"
    sql:  `mozfun`.bits28.active_in_range(${TABLE}.days_seen_bits, 0, 1) ;;
    description: "Did we recieve a ping from the client today?"
  }

  dimension: client_qualifies {
    type: yesno
    label: "Client Qualifies for 2022 KPI"
    sql: CASE WHEN ${TABLE}.normalized_app_name != 'Firefox Desktop' AND ${TABLE}.normalized_app_name NOT LIKE '% BrowserStack' THEN TRUE
      WHEN ${TABLE}.normalized_app_name = 'Firefox Desktop' AND ${TABLE}.active_hours_sum > 0 AND ${TABLE}.uri_count > 0 THEN TRUE
      ELSE FALSE END ;;
  }

  dimension: normalized_app_name {
    label: "App Name"
    description: "Possible Values are Firefox Desktop, Firefox iOS, Fenix, Focus Android and Focus iOS"
  }

  dimension: platform {
    label: "Platform (Firefox Desktop or Mobile)"
    sql: CASE WHEN ${TABLE}.normalized_app_name = 'Firefox Desktop' THEN 'Firefox Desktop' ELSE 'Firefox Mobile' END ;;
  }

  measure: total_user_count {
    type: count
  }

  measure: total_uri_count {
    type: sum
    sql: ${TABLE}.uri_count ;;
  }

  measure: total_search_count {
    type: sum
    sql: ${TABLE}.search_count ;;
  }

  measure: total_search_with_ads {
    type: sum
    sql: ${TABLE}.search_with_ads ;;
    label: "Searches with Ads"
  }

  measure: total_ad_click {
    type: sum
    sql: ${TABLE}.ad_click ;;
    label: "Ad Clicks"
  }

  measure: total_organic_search_count {
    type: sum
    sql: ${TABLE}.organic_search_count ;;
  }

  measure: total_durations {
    type: sum
    sql: ${TABLE}.durations ;;
    label: "App Open Duration (From Baseline Ping - Mobile Only)"
  }

  measure: total_active_hours_sum {
    type: sum
    sql: ${TABLE}.active_hours_sum ;;
    label: "Active Hours (Desktop Only)"
  }

  measure: clients {
    hidden: yes
  }
}
