include: "//looker-hub/user_journey/views/events_daily.view.lkml"

view: funnel_analysis {
  extends: [events_daily]

  filter: date {
    type: date
    sql: {% condition date %} CAST(funnel_analysis.submission_date AS TIMESTAMP) {% endcondition %} ;;
  }

  dimension: completed_event_1 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([
            ${event_type_1.match_string}],
            True)) ;;
  }

  dimension: completed_event_2 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              ${event_type_1.match_string},
              ${event_type_2.match_string}],
            True)) ;;
  }

  dimension: completed_event_3 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              ${event_type_1.match_string},
              ${event_type_2.match_string},
              ${event_type_3.match_string}],
            True)) ;;
  }

  dimension: completed_event_4 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              ${event_type_1.match_string},
              ${event_type_2.match_string},
              ${event_type_3.match_string},
              ${event_type_4.match_string}],
            True)) ;;
  }

  measure: total_user_days {
    type: count
    hidden: yes
  }

  measure: count_user_days_event1 {
    label: "Count Completed Step 1"
    type: count

    filters: {
      field: completed_event_1
      value: "yes"
    }
  }

  measure: count_user_days_event2 {
    label: "Count Completed Step 2"
    type: count
    description: "Only includes user days which also completed event 1"

    filters: {
      field: completed_event_2
      value: "yes"
    }
  }

  measure: count_user_days_event3 {
    label: "Count Completed Step 3"
    type: count
    description: "Only includes user days which also completed up to event 2"

    filters: {
      field: completed_event_3
      value: "yes"
    }
  }

  measure: count_user_days_event4 {
    label: "Count Completed Step 4"
    type: count
    description: "Only includes user days which also completed up to event 3"

    filters: {
      field: completed_event_4
      value: "yes"
    }
  }

  measure: fraction_user_days_event1 {
    label: "Fraction Completed Step 1"
    sql: SAFE_DIVIDE(${count_user_days_event1}, ${count_user_days_event1}) ;;
    type: number
  }

  measure: fraction_user_days_event2 {
    label: "Fraction Completed Step 2"
    sql: SAFE_DIVIDE(${count_user_days_event2}, ${count_user_days_event1}) ;;
    type: number
  }

  measure: fraction_user_days_event3 {
    label: "Fraction Completed Step 3"
    sql: SAFE_DIVIDE(${count_user_days_event3}, ${count_user_days_event1}) ;;
    type: number
  }

  measure: fraction_user_days_event4 {
    label: "Fraction Completed Step 4"
    sql: SAFE_DIVIDE(${count_user_days_event4}, ${count_user_days_event1}) ;;
    type: number
  }
}
