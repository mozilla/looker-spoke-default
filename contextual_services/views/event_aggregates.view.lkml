include: "//looker-hub/contextual_services/views/event_aggregates.view.lkml"

view: +event_aggregates {
  dimension: user_count {
    hidden: yes
    sql: ${TABLE}.user_count ;;
  }

  measure: total_users {
    type: sum
    sql: ${user_count} ;;
    description: "Count of Users."
  }
}
