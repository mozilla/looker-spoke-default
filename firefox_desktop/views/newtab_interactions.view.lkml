# include: "//looker-hub/firefox_desktop/views/newtab_interactions_table.view.lkml"
# include: "newtab_interactions_base.tmp.view.lkml"


#### TODO: Delete

# *Do not manually modify this file*
#
# This file has been generated via https://github.com/mozilla/lookml-generator
# You can extend this view in the looker-spoke-default project (https://github.com/mozilla/looker-spoke-default)

view: newtab_interactions_table_tmp {
  dimension: browser_name {
    sql: ${TABLE}.browser_name ;;
    type: string
  }

  dimension: browser_version {
    sql: ${TABLE}.browser_version ;;
    type: string
  }

  dimension: channel {
    sql: ${TABLE}.channel ;;
    type: string
  }

  dimension: client_id {
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: country_code {
    sql: ${TABLE}.country_code ;;
    type: string
  }

  dimension: default_private_search_engine {
    sql: ${TABLE}.default_private_search_engine ;;
    type: string
  }

  dimension: default_search_engine {
    sql: ${TABLE}.default_search_engine ;;
    type: string
  }

  dimension: experiments {
    sql: ${TABLE}.experiments ;;
    hidden: yes
  }

  dimension: follow_on_search_ad_clicks {
    sql: ${TABLE}.follow_on_search_ad_clicks ;;
    type: number
  }

  dimension: follow_on_search_ad_impressions {
    sql: ${TABLE}.follow_on_search_ad_impressions ;;
    type: number
  }

  dimension: newtab_open_source {
    sql: ${TABLE}.newtab_open_source ;;
    type: string
  }

  dimension: newtab_visit_ended_at {
    sql: ${TABLE}.newtab_visit_ended_at ;;
    type: number
  }

  dimension: newtab_visit_id {
    sql: ${TABLE}.newtab_visit_id ;;
    type: string
  }

  dimension: newtab_visit_started_at {
    sql: ${TABLE}.newtab_visit_started_at ;;
    type: number
  }

  dimension: os {
    sql: ${TABLE}.os ;;
    type: string
  }

  dimension: os_version {
    sql: ${TABLE}.os_version ;;
    type: string
  }

  dimension: search_access_point {
    sql: ${TABLE}.search_access_point ;;
    type: string
  }

  dimension: search_engine {
    sql: ${TABLE}.search_engine ;;
    type: string
  }

  dimension: searches {
    sql: ${TABLE}.searches ;;
    type: number
  }

  dimension: sponsored_topsite_clicks {
    sql: ${TABLE}.sponsored_topsite_clicks ;;
    type: number
  }

  dimension: sponsored_topsite_impressions {
    sql: ${TABLE}.sponsored_topsite_impressions ;;
    type: number
  }

  dimension: tagged_follow_on_search_ad_clicks {
    sql: ${TABLE}.tagged_follow_on_search_ad_clicks ;;
    type: number
  }

  dimension: tagged_follow_on_search_ad_impressions {
    sql: ${TABLE}.tagged_follow_on_search_ad_impressions ;;
    type: number
  }

  dimension: tagged_search_ad_clicks {
    sql: ${TABLE}.tagged_search_ad_clicks ;;
    type: number
  }

  dimension: tagged_search_ad_impressions {
    sql: ${TABLE}.tagged_search_ad_impressions ;;
    type: number
  }

  dimension: topsite_clicks {
    sql: ${TABLE}.topsite_clicks ;;
    type: number
  }

  dimension: topsite_impressions {
    sql: ${TABLE}.topsite_impressions ;;
    type: number
  }

  dimension_group: submission {
    sql: ${TABLE}.submission_date ;;
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
    convert_tz: no
    datatype: date
  }

  sql_table_name: `moz-fx-data-shared-prod.analysis.newtab_interactions` ;;
}

view: newtab_interactions_table__experiments_tmp {
  dimension: key {
    sql: ${TABLE}.key ;;
    type: string
  }

  dimension: value__branch {
    sql: ${TABLE}.value.branch ;;
    type: string
    group_label: "Value"
    group_item_label: "Branch"
  }

  dimension: value__extra__type {
    sql: ${TABLE}.value.extra.type ;;
    type: string
    group_label: "Value Extra"
    group_item_label: "Type"
  }
}

#### End TODO: Delete

view: newtab_interactions {
  extends: [newtab_interactions_table_tmp]

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

  # POCKET

  dimension: pocket_impressions {
    sql: ${TABLE}.pocket_impressions ;;
    type: number
    hidden: yes
  }

  dimension: sponsored_pocket_impressions {
    sql: ${TABLE}.sponsored_pocket_impressions ;;
    type: number
    hidden: yes
  }

  dimension: organic_pocket_impressions {
    sql: ${TABLE}.organic_pocket_impressions ;;
    type: number
    hidden: yes
  }

  dimension: pocket_clicks {
    sql: ${TABLE}.pocket_clicks ;;
    type: number
    hidden: yes
  }

  dimension: sponsored_pocket_clicks {
    sql: ${TABLE}.sponsored_pocket_clicks ;;
    type: number
    hidden: yes
  }

  dimension: organic_pocket_clicks {
    sql: ${TABLE}.organic_pocket_clicks ;;
    type: number
    hidden: yes
  }

  dimension: pocket_saves {
    sql: ${TABLE}.pocket_saves ;;
    type: number
    hidden: yes
  }

  dimension: sponsored_pocket_saves {
    sql: ${TABLE}.sponsored_pocket_saves ;;
    type: number
    hidden: yes
  }

  dimension: organic_pocket_saves {
    sql: ${TABLE}.organic_pocket_saves ;;
    type: number
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

  ####
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
  ###


  # END OF POCKET

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
