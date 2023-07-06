include: "//looker-hub/firefox_accounts/views/events.view.lkml"

view: +events {
  dimension_group: submission {
    type: time
    sql: ${TABLE}.timestamp ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension_group: timestamp {
    hidden: yes
  }

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: flow_count {
    type: count_distinct
    sql: ${flow_id} ;;
  }
}
