include: "//looker-hub/user_journey/views/events_daily.view.lkml"

view: cohort {
  extends: [events_daily]

  filter: date {
    type: date
    sql: {% condition date %} CAST(cohort_analysis.submission_date AS TIMESTAMP) {% endcondition %} ;;
  }

  dimension: completed_event_1 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, ${cohort_event_type_1.match_string}) ;;
  }

  dimension: completed_event_2 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, ${cohort_event_type_2.match_string}) ;;
  }

  dimension: completed_event_3 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, ${cohort_event_type_3.match_string}) ;;
  }

  dimension: completed_event_4 {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, ${cohort_event_type_4.match_string}) ;;
  }

  measure: total_user_days {
    type: count
    hidden: yes
  }


}
