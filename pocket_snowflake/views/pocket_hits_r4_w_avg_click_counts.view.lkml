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

  dimension: current_year_only {
    label: "current_year_only"
    view_label: "Date/Period Selection"
    type: yesno
    sql:  (  (EXTRACT(MONTH FROM DATE(CONCAT(${Period_month}, '-01'))) <= EXTRACT(MONTH FROM CURRENT_DATE()))
              AND (${Period_year} = EXTRACT(YEAR FROM CURRENT_DATE()))
    );;
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
