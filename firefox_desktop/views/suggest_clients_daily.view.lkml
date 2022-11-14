include: "//looker-hub/firefox_desktop/views/*"

view: +suggest_clients_daily {

  measure: distinct_client_count {
    type: number
    sql: COUNT(DISTINCT ${TABLE}.client_id) ;;
  }

  measure: total_block_count {
    type: number
    sql: SUM(${TABLE}.block_nonsponsored_bestmatch_count + ${TABLE}.block_nonsponsored_count +
    ${TABLE}.block_sponsored_bestmatch_count + ${TABLE}.block_sponsored_count) ;;
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

  measure: block_nonsponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.block_nonsponsored_bestmatch_count) ;;
  }

  measure: block_nonsponsored {
    type: number
    sql: SUM(${TABLE}.block_nonsponsored_count) ;;
  }

  measure: block_sponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.block_sponsored_bestmatch_count) ;;
  }

  measure: block_sponsored {
    type: number
    sql: SUM(${TABLE}.block_sponsored_count) ;;
  }

  measure: total_click_count {
    type: number
    sql: SUM(${TABLE}.click_nonsponsored_bestmatch_count + ${TABLE}.click_nonsponsored_count +
      ${TABLE}.click_sponsored_bestmatch_count + ${TABLE}.click_sponsored_count) ;;
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

  measure: click_nonsponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.click_nonsponsored_bestmatch_count) ;;
  }

  measure: click_nonsponsored {
    type: number
    sql: SUM(${TABLE}.click_nonsponsored_count) ;;
  }

  measure: click_sponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.click_sponsored_bestmatch_count) ;;
  }

  measure: click_sponsored {
    type: number
    sql: SUM(${TABLE}.click_sponsored_count) ;;
  }

  measure: total_help_count {
    type: number
    sql: SUM(${TABLE}.help_nonsponsored_bestmatch_count + ${TABLE}.help_nonsponsored_count +
      ${TABLE}.help_sponsored_bestmatch_count + ${TABLE}.help_sponsored_count) ;;
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

  measure: help_nonsponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.help_nonsponsored_bestmatch_count) ;;
  }

  measure: help_nonsponsored {
    type: number
    sql: SUM(${TABLE}.help_nonsponsored_count) ;;
  }

  measure: help_sponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.help_sponsored_bestmatch_count) ;;
  }

  measure: help_sponsored {
    type: number
    sql: SUM(${TABLE}.help_sponsored_count) ;;
  }

  measure: total_impression_count {
    type: number
    sql: SUM(${TABLE}.impression_nonsponsored_bestmatch_count + ${TABLE}.impression_nonsponsored_count +
      ${TABLE}.impression_sponsored_bestmatch_count + ${TABLE}.impression_sponsored_count) ;;
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

  measure: impression_nonsponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.impression_nonsponsored_bestmatch_count) ;;
  }

  measure: impression_nonsponsored {
    type: number
    sql: SUM(${TABLE}.impression_nonsponsored_count) ;;
  }

  measure: impression_sponsored_bestmatch {
    type: number
    sql: SUM(${TABLE}.impression_sponsored_bestmatch_count) ;;
  }

  measure: impression_sponsored {
    type: number
    sql: SUM(${TABLE}.impression_sponsored_count) ;;
  }

}
