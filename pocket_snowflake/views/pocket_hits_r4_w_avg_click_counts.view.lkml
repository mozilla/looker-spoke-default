view: pocket_hits_r4_w_avg_click_counts {
  sql_table_name: "DBT_SHARED_WITH_MOZILLA"."POCKET_HITS_R4W_AVG_CLICK_COUNTS"
    ;;

  dimension: click_count {
    type: number
    sql: ${TABLE}."CLICK_COUNT" ;;
  }

  dimension: click_count_r4_w {
    type: number
    sql: ${TABLE}."CLICK_COUNT_R4W" ;;
  }

  dimension_group: period_filter {
    type: time
    hidden: yes
    timeframes: [
      date,
      year
    ]
    sql: ${TABLE}."HAPPENED_WEEK" ;;
  }

  dimension_group: Period {
    type: time
    timeframes: [
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."HAPPENED_WEEK" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: click_count_rolling_4_weeks {
  type: max
  sql: ${TABLE}."CLICK_COUNT_R4W" ;;
  }
}
