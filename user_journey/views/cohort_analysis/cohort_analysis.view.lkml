include: "//looker-hub/user_journey/views/events_daily.view.lkml"

view: cohort {
  extends: [events_daily]

  filter: date {
    type: date
    sql: {% condition date %} CAST(cohort_analysis.submission_date AS TIMESTAMP) {% endcondition %} ;;
  }

  dimension: completed_message_id_event {
    type: yesno
    sql:  REGEXP_CONTAINS(${TABLE}.events, mozfun.event_analysis.create_funnel_regex([
            ${message_ids.match_string}],
            True)) ;;
  }

  measure: total_user_days {
    type: count
    hidden: yes
  }

  measure: count_user_days_completed_message_id_event {
    label: "Count of User-Days"
    type: count

    filters: {
      field: completed_message_id_event
      value: "yes"
    }
  }
}
