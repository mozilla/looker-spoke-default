include: "//looker-hub/contextual_services/views/event_aggregates.view.lkml"

view: +event_aggregates {
  dimension: user_count {
    hidden: yes
    sql: ${TABLE}.user_count ;;
  }

  dimension: event_count {
    hidden: yes
    sql: ${TABLE}.event_count ;;
  }

  measure: user_counts {
    label: "User Count"
    type: sum
    sql: ${TABLE}.user_count ;;
    description: "Count of users."
  }

  measure: event_counts {
    label: "Event Count"
    type: sum
    sql: ${TABLE}.event_count ;;
    description: "Count of events."
  }
}
