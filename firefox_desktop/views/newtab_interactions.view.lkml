include: "//looker-hub/firefox_desktop/views/newtab_interactions_table.view.lkml"

view: newtab_interactions {
  extends: [newtab_interactions_table]

  dimension: is_search_issued {
    hidden: yes
  }

  dimension: is_tagged_search_ad_click {
    hidden: yes
  }

  dimension: is_tagged_search_ad_impression {
    hidden: yes
  }

  dimension: is_follow_on_search_ad_click {
    hidden: yes
  }

  dimension: is_follow_on_search_ad_impression {
    hidden: yes
  }

  dimension: newtab_visit_id {
    hidden: yes
  }

  dimension: client_id {
    hidden: yes
  }

  dimension: is_topsite_impression {
    hidden: yes
  }

  dimension: is_sponsored_topsite_impression {
    hidden: yes
  }

  dimension: is_topsite_click {
    hidden: yes
  }

  dimension: is_sponsored_topsite_click {
    hidden: yes
  }

  dimension: is_sponsored_topsite_interaction {
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

  measure: searches {
    group_label: "Search"
    type: sum
    sql: IF(${is_search_issued}, 1, 0) ;;
  }

  measure: tagged_search_ad_impressions {
    group_label: "Search"
    type: sum
    sql: IF(${is_tagged_search_ad_impression}, 1, 0) ;;
  }

  measure: tagged_search_ad_clicks {
    group_label: "Search"
    type: sum
    sql: IF(${is_tagged_search_ad_click}, 1, 0) ;;
  }

  measure: follow_on_search_ad_impressions {
    group_label: "Search"
    type: sum
    sql: IF(${is_follow_on_search_ad_impression}, 1, 0) ;;
  }

  measure: follow_on_search_ad_clicks {
    group_label: "Search"
    type: sum
    sql: IF(${is_follow_on_search_ad_click}, 1, 0) ;;
  }

  measure: tagged_follow_on_search_ad_impressions {
    group_label: "Search"
    type: sum
    sql: IF(${is_follow_on_search_ad_impression} AND ${is_tagged_search_ad_impression}, 1, 0) ;;
  }

  measure: tagged_follow_on_search_ad_clicks {
    group_label: "Search"
    type: sum
    sql: IF(${is_follow_on_search_ad_click} AND ${is_tagged_search_ad_click}, 1, 0) ;;
  }

  measure: visits_with_search {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_search_issued}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_tagged_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_tagged_search_ad_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_tagged_search_ad_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_tagged_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression} AND ${is_tagged_search_ad_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure:  visits_with_tagged_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click} AND ${is_tagged_search_ad_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_search {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_search_issued}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_tagged_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_tagged_search_ad_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_tagged_search_ad_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_tagged_follow_on_search_ad_impression {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_impression} AND ${is_tagged_search_ad_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure:  clients_with_tagged_follow_on_search_ad_click {
    group_label: "Search"
    type: count_distinct
    sql: IF(${is_follow_on_search_ad_click} AND ${is_tagged_search_ad_click}, ${client_id}, NULL) ;;
    approximate: yes
  }


  ### Topsites

  measure: topsite_clicks {
    group_label: "Topsites"
    type: sum
    sql: IF(${is_topsite_click}, 1, 0) ;;
  }

  measure: sponsored_topsite_clicks {
    group_label: "Topsites"
    type: sum
    sql: IF(${is_sponsored_topsite_click}, 1, 0) ;;
  }

  measure: topsite_impressions {
    group_label: "Topsites"
    type: sum
    sql: IF(${is_topsite_impression}, 1, 0) ;;
  }

  measure: sponsored_topsite_impressions {
    group_label: "Topsites"
    type: sum
    sql: IF(${is_sponsored_topsite_impression}, 1, 0) ;;
  }

  measure: visits_with_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_topsite_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_sponsored_topsite_click}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_topsite_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: visits_with_sponsored_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_sponsored_topsite_impression}, ${newtab_visit_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_topsite_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_click {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_sponsored_topsite_click}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_topsite_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

  measure: clients_with_sponsored_topsite_impression {
    group_label: "Topsites"
    type: count_distinct
    sql: IF(${is_sponsored_topsite_impression}, ${client_id}, NULL) ;;
    approximate: yes
  }

}
