include: "//looker-hub/firefox_desktop/views/newtab_interactions_table.view.lkml"

view: newtab_interactions {
  extends: [newtab_interactions_table]

  dimension: searches {
    hidden: yes
  }

  dimension: newtab_visit_id {
    hidden: yes
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: sponsored_topsite_clicks {
    hidden: yes
  }

  dimension: sponsored_topsite_impressions {
    hidden: yes
  }

  dimension: tagged_follow_on_search_ad_clicks {
    hidden: yes
  }

  dimension: tagged_follow_on_search_ad_impressions {
    hidden: yes
  }

  dimension: tagged_search_ad_clicks {
    hidden: yes
  }

  dimension: tagged_search_ad_impressions {
    hidden: yes
  }

  dimension: follow_on_search_ad_clicks {
    hidden: yes
  }

  dimension: follow_on_search_ad_impressions {
    hidden: yes
  }

  dimension: topsite_clicks {
    hidden: yes
  }

  dimension: topsite_impressions {
    hidden: yes
  }
  measure: visits {
    type: count_distinct
    sql: ${newtab_visit_id} ;;
    approximate: yes
  }

  measure: clients {
    type: count_distinct
    sql: ${client_id} ;;
    approximate: yes
  }

  ### Search

  measure: sum_searches {
    group_label: "Search"
    label: "Searches"
    type: sum
    sql: ${searches} ;;
  }

  measure: sum_tagged_search_ad_impressions {
    group_label: "Search"
    label: "Tagged Search Ad Impressions"
    type: sum
    sql: ${tagged_search_ad_impressions} ;;
  }

  measure: sum_tagged_search_ad_clicks {
    group_label: "Search"
    label: "Tagged Search Ad Clicks"
    type: sum
    sql: ${tagged_search_ad_clicks} ;;
  }

  measure: sum_follow_on_search_ad_impressions {
    group_label: "Search"
    label: "Follow-on Search Ad Impressions"
    type: sum
    sql: ${follow_on_search_ad_impressions} ;;
  }

  measure: sum_follow_on_search_ad_clicks {
    group_label: "Search"
    label: "Follow-on Search Ad Clicks"
    type: sum
    sql: ${follow_on_search_ad_clicks} ;;
  }

  measure: sum_tagged_follow_on_search_ad_impressions {
    group_label: "Search"
    label: "Tagged Follow-on Search Ad Impressions"
    type: sum
    sql: ${tagged_follow_on_search_ad_impressions} ;;
  }

  measure: sum_tagged_follow_on_search_ad_clicks {
    group_label: "Search"
    label: "Tagged Follow-on Search Ad Clicks"
    type: sum
    sql: ${tagged_follow_on_search_ad_clicks} ;;
  }

  measure: visits_with_search {
    group_label: "Search"
    type: count_distinct
    sql: IF(${searches} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_tagged_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${follow_on_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${follow_on_search_ad_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_tagged_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_follow_on_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_follow_on_search_ad_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_search {
    group_label: "Search"
    type: count_distinct
    sql: IF(${searches} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_tagged_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${follow_on_search_ad_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${follow_on_search_ad_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_tagged_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_follow_on_search_ad_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_follow_on_search_ad_clicks}, ${client_id}, NULL) ;;
    approximate: yes
  }


  ### Topsites

  measure: sum_topsite_clicks {
    group_label: "Topsites"
    label: "Topsite Clicks"
    type: sum
    sql: ${topsite_clicks} ;;
  }

  measure: sum_sponsored_topsite_clicks {
    group_label: "Topsites"
    label: "Sponsored Topsite Clicks"
    type: sum
    sql: ${sponsored_topsite_clicks} ;;
  }

  measure: sum_topsite_impressions {
    group_label: "Topsites"
    label: "Topsite Impressions"
    type: sum
    sql: ${topsite_impressions} ;;
  }

  measure: sum_sponsored_topsite_impressions {
    group_label: "Topsites"
    label: "Sponsored Topsite Impressions"
    type: sum
    sql: ${sponsored_topsite_impressions} ;;
  }

  measure: visits_with_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${topsite_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${sponsored_topsite_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${topsite_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${sponsored_topsite_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${topsite_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${sponsored_topsite_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${topsite_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${sponsored_topsite_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

}
