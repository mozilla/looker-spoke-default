include: "/user_journey/views/event_type.view.lkml"

view: cohort_event_type_1 {
  extends: [event_type]

  measure: total_days_of_use {
    type: sum
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_1: "yes"
    ]
  }

  measure: average_days_of_use {
    type: average
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_1: "yes"
    ]
  }
}

view: cohort_event_type_2 {
  extends: [event_type]

  measure: total_days_of_use {
    type: sum
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_2: "yes"
    ]
  }

  measure: average_days_of_use {
    type: average
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_2: "yes"
    ]
  }
}

view: cohort_event_type_3 {
  extends: [event_type]

  measure: total_days_of_use {
    type: sum
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_3: "yes"
    ]
  }

  measure: average_days_of_use {
    type: average
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_3: "yes"
    ]
  }
}

view: cohort_event_type_4 {
  extends: [event_type]

  measure: total_days_of_use {
    type: sum
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_4: "yes"
    ]
  }

  measure: average_days_of_use {
    type: average
    sql: ${search_clients_last_seen.days_of_use} ;;
    filters: [
      cohort_analysis.completed_event_4: "yes"
    ]
  }
}
