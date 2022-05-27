include: "//looker-hub/mozilla_vpn/views/funnel_analysis.view"
view: funnel_analysis_extra_steps {
  extends: [funnel_analysis]
  dimension: completed_step_5 {
    type: yesno
    description: "Whether the user completed step 5 on the associated day."
    sql: REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([${step_1.match_string},${step_2.match_string},${step_3.match_string},${step_4.match_string},${step_5.match_string}],True)) ;;
  }
  measure: count_completed_step_5 {
    description: "The number of times that step 4 was completed. Grouping by day makes this a count of users who completed step 4 on each day."
    type: count
    filters: [
      completed_step_1: "yes",
      completed_step_2: "yes",
      completed_step_3: "yes",
      completed_step_4: "yes",
      completed_step_5: "yes",
    ]
  }
  measure: fraction_completed_step_5 {
    description: "Of the user-days that completed Step 1, the fraction that completed step 5."
    type: number
    value_format: "0.00%"
    sql: SAFE_DIVIDE(${count_completed_step_5}, ${count_completed_step_1}) ;;
  }


  dimension: completed_step_6 {
    type: yesno
    description: "Whether the user completed step 6 on the associated day."
    sql: REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([${step_1.match_string},${step_2.match_string},${step_3.match_string},${step_4.match_string},${step_5.match_string},${step_6.match_string}],True)) ;;
  }
  measure: count_completed_step_6 {
    description: "The number of times that step 4 was completed. Grouping by day makes this a count of users who completed step 4 on each day."
    type: count
    filters: [
      completed_step_1: "yes",
      completed_step_2: "yes",
      completed_step_3: "yes",
      completed_step_4: "yes",
      completed_step_5: "yes",
      completed_step_6: "yes",
    ]
  }
  measure: fraction_completed_step_6 {
    description: "Of the user-days that completed Step 1, the fraction that completed step 6."
    type: number
    value_format: "0.00%"
    sql: SAFE_DIVIDE(${count_completed_step_6}, ${count_completed_step_1}) ;;
  }

  dimension: completed_step_7 {
    type: yesno
    description: "Whether the user completed step 6 on the associated day."
    sql: REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([${step_1.match_string},${step_2.match_string},
      ${step_3.match_string},${step_4.match_string},${step_5.match_string},${step_6.match_string},${step_7.match_string}],True)) ;;
  }
  measure: count_completed_step_7 {
    description: "The number of times that step 4 was completed. Grouping by day makes this a count of users who completed step 4 on each day."
    type: count
    filters: [
      completed_step_1: "yes",
      completed_step_2: "yes",
      completed_step_3: "yes",
      completed_step_4: "yes",
      completed_step_5: "yes",
      completed_step_6: "yes",
      completed_step_7: "yes",
    ]
  }
  measure: fraction_completed_step_7 {
    description: "Of the user-days that completed Step 1, the fraction that completed step 7."
    type: number
    value_format: "0.00%"
    sql: SAFE_DIVIDE(${count_completed_step_7}, ${count_completed_step_1}) ;;
  }

  dimension: completed_step_8 {
    type: yesno
    description: "Whether the user completed step 6 on the associated day."
    sql: REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([${step_1.match_string},${step_2.match_string},
      ${step_3.match_string},${step_4.match_string},${step_5.match_string},${step_6.match_string},${step_7.match_string},${step_8.match_string}],True)) ;;
  }
  measure: count_completed_step_8 {
    description: "The number of times that step 4 was completed. Grouping by day makes this a count of users who completed step 4 on each day."
    type: count
    filters: [
      completed_step_1: "yes",
      completed_step_2: "yes",
      completed_step_3: "yes",
      completed_step_4: "yes",
      completed_step_5: "yes",
      completed_step_6: "yes",
      completed_step_7: "yes",
      completed_step_8: "yes",
    ]
  }
  measure: fraction_completed_step_8 {
    description: "Of the user-days that completed Step 1, the fraction that completed step 8."
    type: number
    value_format: "0.00%"
    sql: SAFE_DIVIDE(${count_completed_step_8}, ${count_completed_step_1}) ;;
  }
}
view: +event_types {}

view: +step_1 {
}
view: +step_2 {
}
view: +step_3 {
}
view: +step_4 {
}
view: step_5 {
  extends: [event_types]
}
view: step_6 {
  extends: [event_types]
}
view: step_7 {
  extends: [event_types]
}
view: step_8 {
  extends: [event_types]
}
view: +event_names {
}
