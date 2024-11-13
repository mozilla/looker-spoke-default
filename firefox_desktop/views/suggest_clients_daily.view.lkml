include: "//looker-hub/firefox_desktop/views/suggest_clients_daily.view.lkml"

view: +suggest_clients_daily {

  dimension: user_pref_data_collection_enabled {
    type: yesno
    sql: ${TABLE}.user_pref_data_collection_enabled ;;
    group_label: "User Preferences"
    group_item_label: "Data Collection Enabled"
    description: "Whether or not the checkbox for sharing search terms data is checked in about:preferences"
  }

  dimension: user_pref_firefox_suggest_enabled {
    type: yesno
    sql: ${TABLE}.user_pref_firefox_suggest_enabled ;;
    group_label: "User Preferences"
    group_item_label: "Firefox Suggest Enabled"
    description: "Whether or not the checkbox for showing Firefox Suggestions is checked in about:preferences"
  }

  dimension: user_pref_sponsored_suggestions_enabled {
    type: yesno
    sql: ${TABLE}.user_pref_sponsored_suggestions_enabled ;;
    group_label: "User Preferences"
    group_item_label: "Sponsored Suggestions Enabled"
    description: "Whether or not the checkbox for showing sponsored suggestions is checked in about:preferences"
  }

  measure: distinct_client_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.client_id) ;;
  }

  dimension: block_nonsponsored_bestmatch_count {
    hidden: yes
  }

  dimension: block_nonsponsored_count {
    hidden: yes
  }

  dimension: block_sponsored_bestmatch_count {
    hidden: yes
  }

  dimension: block_sponsored_count {
    hidden: yes
  }

  measure: block_total {
    type: number
    sql: SUM(${TABLE}.block_nonsponsored_bestmatch_count + ${TABLE}.block_nonsponsored_count +
      ${TABLE}.block_sponsored_bestmatch_count + ${TABLE}.block_sponsored_count) ;;
    description: "All blocks, sponsored and nonsponsored"
  }

  measure: block_nonsponsored {
    type: number
    sql: SUM(${TABLE}.block_nonsponsored_bestmatch_count + ${TABLE}.block_nonsponsored_count) ;;
  }

  measure: block_sponsored {
    type: number
    sql: SUM(${TABLE}.block_sponsored_count + ${TABLE}.block_sponsored_bestmatch_count) ;;
  }

  dimension: click_nonsponsored_bestmatch_count {
    hidden: yes
  }

  dimension: click_nonsponsored_count {
    hidden: yes
  }

  dimension: click_sponsored_bestmatch_count {
    hidden: yes
  }

  dimension: click_sponsored_count {
    hidden: yes
  }

  measure: click_total {
    type: number
    sql: SUM(${TABLE}.click_nonsponsored_bestmatch_count + ${TABLE}.click_nonsponsored_count +
      ${TABLE}.click_sponsored_bestmatch_count + ${TABLE}.click_sponsored_count) ;;
    description: "All clicks, sponsored and nonsponsored"
  }

  measure: click_nonsponsored {
    type: number
    sql: SUM(${TABLE}.click_nonsponsored_count + ${TABLE}.click_nonsponsored_bestmatch_count) ;;
  }

  measure: click_sponsored {
    type: number
    sql: SUM(${TABLE}.click_sponsored_count + ${TABLE}.click_sponsored_bestmatch_count) ;;
  }

  dimension: help_nonsponsored_bestmatch_count {
    hidden: yes
  }

  dimension: help_nonsponsored_count {
    hidden: yes
  }

  dimension: help_sponsored_bestmatch_count {
    hidden: yes
  }

  dimension: help_sponsored_count {
    hidden: yes
  }

  measure: help_total {
    type: number
    sql: SUM(${TABLE}.help_nonsponsored_bestmatch_count + ${TABLE}.help_nonsponsored_count +
      ${TABLE}.help_sponsored_bestmatch_count + ${TABLE}.help_sponsored_count) ;;
    description: "All helps, sponsored and nonsponsored"
  }

  measure: help_nonsponsored {
    type: number
    sql: SUM(${TABLE}.help_nonsponsored_count + ${TABLE}.help_nonsponsored_bestmatch_count) ;;
  }

  measure: help_sponsored {
    type: number
    sql: SUM(${TABLE}.help_sponsored_count + ${TABLE}.help_sponsored_bestmatch_count) ;;
  }

  dimension: impression_nonsponsored_bestmatch_count {
    hidden: yes
  }

  dimension: impression_nonsponsored_count {
    hidden: yes
  }

  dimension: impression_sponsored_bestmatch_count {
    hidden: yes
  }

  dimension: impression_sponsored_count {
    hidden: yes
  }

  measure: impression_total {
    type: number
    sql: SUM(${TABLE}.impression_nonsponsored_bestmatch_count + ${TABLE}.impression_nonsponsored_count +
      ${TABLE}.impression_sponsored_bestmatch_count + ${TABLE}.impression_sponsored_count) ;;
    description: "All impressions, sponsored and nonsponsored"
  }

  measure: impression_nonsponsored {
    type: number
    sql: SUM(${TABLE}.impression_nonsponsored_count + ${TABLE}.impression_nonsponsored_bestmatch_count) ;;
  }

  measure: impression_sponsored {
    type: number
    sql: SUM(${TABLE}.impression_sponsored_count + ${TABLE}.impression_sponsored_bestmatch_count) ;;
  }

  measure: clickthrough_rate {
    type: number
    sql: SAFE_DIVIDE(${click_total}, ${impression_total}) * 100;;
    description: "Total clicks divided by total impressions. Displayed as a percent."
    value_format: "0.00\%"
  }

  measure: clickthrough_rate_sponsored {
    type: number
    sql: SAFE_DIVIDE(${click_sponsored}, ${impression_sponsored}) * 100;;
    description: "Sponsored clicks divided by sponsored impressions. Displayed as a percent."
    value_format: "0.00\%"
  }

  measure: clickthrough_rate_nonsponsored {
    type: number
    sql: SAFE_DIVIDE(${click_nonsponsored}, ${impression_nonsponsored}) * 100;;
    description: "Nonsponsored clicks divided by nonsponsored impressions. Displayed as a percent."
    value_format: "0.00\%"
  }
}
