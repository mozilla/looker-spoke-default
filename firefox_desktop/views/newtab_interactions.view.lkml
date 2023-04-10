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

  dimension: organic_topsite_clicks {
    hidden: yes
  }

  dimension: sponsored_topsite_impressions {
    hidden: yes
  }

  dimension: organic_topsite_impressions {
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

  dimension: pocket_impressions {
    hidden: yes
  }

  dimension: sponsored_pocket_impressions {
    hidden: yes
  }

  dimension: organic_pocket_impressions {
    hidden: yes
  }

  dimension: pocket_clicks {
    hidden: yes
  }

  dimension: sponsored_pocket_clicks {
    hidden: yes
  }

  dimension: organic_pocket_clicks {
    hidden: yes
  }

  dimension: pocket_saves {
    hidden: yes
  }

  dimension: sponsored_pocket_saves {
    hidden: yes
  }

  dimension: organic_pocket_saves {
    hidden: yes
  }

  dimension: pocket_story_position {
    sql: ${TABLE}.pocket_story_position ;;
    type: number
  }

  dimension: pocket_enabled {
    sql: ${TABLE}.pocket_enabled ;;
    type: yesno
  }

  dimension: pocket_is_signed_in {
    sql: ${TABLE}.pocket_is_signed_in ;;
    type: yesno
  }

  dimension: pocket_sponsored_stories_enabled {
    sql: ${TABLE}.pocket_sponsored_stories_enabled ;;
    type: yesno
  }

  dimension: topsites_enabled {
    sql: ${TABLE}.topsites_enabled ;;
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
    sql: ${tagged_search_ad_impressions} - ${tagged_follow_on_search_ad_impressions};;
  }

  measure: sum_tagged_search_ad_clicks {
    group_label: "Search"
    label: "Tagged Search Ad Clicks"
    type: sum
    sql: ${tagged_search_ad_clicks} - ${tagged_follow_on_search_ad_clicks};;
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

  measure: sum_all_search_ad_clicks {
    group_label: "Search"
    label: "Total Tagged Ad Clicks"
    type: sum
    sql: ${tagged_search_ad_clicks} ;;
  }

  measure: sum_all_search_ad_impressions {
    group_label: "Search"
    label: "Total Tagged Ad Impressions"
    type: sum
    sql: ${tagged_search_ad_impressions} ;;
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
    sql: IF(${tagged_search_ad_impressions} - ${tagged_follow_on_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} - ${tagged_follow_on_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
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

  measure:  visits_with_any_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_any_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_impressions} > 0, ${newtab_visit_id}, NULL) ;;
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
    sql: IF(${tagged_search_ad_impressions} - ${tagged_follow_on_search_ad_impressions}> 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} - ${tagged_follow_on_search_ad_clicks}> 0, ${client_id}, NULL) ;;
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
    sql: IF(${tagged_follow_on_search_ad_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_any_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_any_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${tagged_search_ad_impressions} > 0, ${client_id}, NULL) ;;
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

  measure: sum_organic_topsite_clicks {
    group_label: "Topsites"
    label: "Organic Topsite Clicks"
    type: sum
    sql: ${organic_topsite_clicks} ;;
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

  measure: sum_organic_topsite_impressions {
    group_label: "Topsites"
    label: "Organic Topsite Impressions"
    type: sum
    sql: ${organic_topsite_impressions} ;;
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

  measure: visits_with_organic_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${organic_topsite_clicks} > 0, ${newtab_visit_id}, NULL) ;;
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

  measure: visits_with_organic_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${organic_topsite_impressions} > 0, ${newtab_visit_id}, NULL) ;;
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

  measure: clients_with_organic_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${organic_topsite_clicks} > 0, ${client_id}, NULL) ;;
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

  measure: clients_with_organic_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${organic_topsite_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  ### Pocket

  measure: sum_pocket_impressions {
    group_label: "Pocket"
    group_item_label: "Pocket Impressions"
    sql: ${pocket_impressions} ;;
    type: sum
  }

  measure: sum_sponsored_pocket_impressions {
    group_label: "Pocket"
    group_item_label: "Sponsored Pocket Impressions"
    sql: ${sponsored_pocket_impressions} ;;
    type: sum
  }

  measure: sum_organic_pocket_impressions {
    group_label: "Pocket"
    group_item_label: "Organic Pocket Impressions"
    sql: ${organic_pocket_impressions} ;;
    type: sum
  }

  measure: sum_pocket_clicks {
    group_label: "Pocket"
    group_item_label: "Pocket Clicks"
    sql: ${pocket_clicks} ;;
    type: sum
  }

  measure: sum_sponsored_pocket_clicks {
    group_label: "Pocket"
    group_item_label: "Sponsored Pocket Clicks"
    sql: ${sponsored_pocket_clicks} ;;
    type: sum
  }

  measure: sum_organic_pocket_clicks {
    group_label: "Pocket"
    group_item_label: "Organic Pocket Clicks"
    sql: ${organic_pocket_clicks} ;;
    type: sum
  }

  measure: sum_pocket_saves {
    group_label: "Pocket"
    group_item_label: "Pocket Saves"
    sql: ${pocket_saves} ;;
    type: sum
  }

  measure: sum_sponsored_pocket_saves {
    group_label: "Pocket"
    group_item_label: "Sponsored Pocket Saves"
    sql: ${sponsored_pocket_saves} ;;
    type: sum
  }

  measure: sum_organic_pocket_saves {
    group_label: "Pocket"
    group_item_label: "Organic Pocket Saves"
    sql: ${organic_pocket_saves} ;;
    type: sum
  }

  measure: visits_with_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_organic_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_impressions} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_organic_pocket_impressions {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_impressions} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_organic_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_clicks} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_organic_pocket_clicks {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_clicks} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_saves} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${pocket_saves} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_saves} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${sponsored_pocket_saves} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_organic_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_saves} > 0, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_organic_pocket_saves {
    group_label: "Pocket"
    type: count_distinct
    sql: IF(${organic_pocket_saves} > 0, ${client_id}, NULL) ;;
    approximate: yes
  }

}
