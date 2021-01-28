include: "//looker-hub/firefox_desktop/views/*.view.lkml"

view: events {
  extends: [events_daily]

  dimension: completed_event_1 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([
            mozfun.event_analysis.event_index_to_match_string(${event_1.index})],
            True)) ;;
  }

  dimension: completed_event_2 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              mozfun.event_analysis.event_index_to_match_string(${event_1.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_2.index})],
            True)) ;;
  }

  dimension: completed_event_3 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              mozfun.event_analysis.event_index_to_match_string(${event_1.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_2.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_3.index})],
            True)) ;;
  }


  dimension: completed_event_4 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events,
            mozfun.event_analysis.create_funnel_regex([
              mozfun.event_analysis.event_index_to_match_string(${event_1.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_2.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_3.index}),
              mozfun.event_analysis.event_index_to_match_string(${event_4.index})],
            True)) ;;
  }

  measure: total_user_days {
    type: count
    hidden: yes
  }

  measure: count_sessions_event1 {
    label: "Count Completed Step 1"#"{{ _filters['event_types_legacy.name'] }}"
    type: count

    filters: {
      field: completed_event_1
      value: "yes"
    }
  }

  measure: count_sessions_event2 {
    label: "Count Completed Step 2"#"{{ _filters['event_2.name'] }}"
    type: count
    description: "Only includes sessions which also completed event 1"

    filters: {
      field: completed_event_2
      value: "yes"
    }
  }

  measure: count_sessions_event3 {
    label: "Count Completed Step 3"#"{{ _filters['event_3.name'] }}"
    type: count
    description: "Only includes sessions which also completed up to event 2"

    filters: {
      field: completed_event_3
      value: "yes"
    }
  }

  measure: count_sessions_event4 {
    label: "Count Completed Step 4"#"{{ _filters['event_4.name'] }}"
    type: count
    description: "Only includes sessions which also completed up to event 3"

    filters: {
      field: completed_event_4
      value: "yes"
    }
  }

  measure: fraction_sessions_event1 {
    label: "Fraction Completed Step 1"
    sql: SAFE_DIVIDE(${count_sessions_event1}, ${count_sessions_event1}) ;;
    type: number
  }

  measure: fraction_sessions_event2 {
    label: "Fraction Completed Step 2"
    sql: SAFE_DIVIDE(${count_sessions_event2}, ${count_sessions_event1}) ;;
    type: number
  }

  measure: fraction_sessions_event3 {
    label: "Fraction Completed Step 3"
    sql: SAFE_DIVIDE(${count_sessions_event3}, ${count_sessions_event1}) ;;
    type: number
  }

  measure: fraction_sessions_event4 {
    label: "Fraction Completed Step 4"
    sql: SAFE_DIVIDE(${count_sessions_event4}, ${count_sessions_event1}) ;;
    type: number
  }
}
