include: "//looker-hub/review_checker_desktop/views/events.view"

view: +events {

  dimension: client_id {
    primary_key: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: is_opt_in {
    type: number
    sql: ${clients.is_opt_in} ;;
  }


  #measures

  measure: client_counts  {
    type: count_distinct
    sql: ${client_id} ;;
  }

  #exposure based on 'surface_onboarding_displayed' event
  measure: surface_onboarding_displayed {
    type: sum
    sql: ${is_exposed_event} ;;
  }

  #based on 'surface_opt_in_clicked' glean event
  measure: opt_in_button_click_sum {
    type: sum
    sql: ${is_opt_in_event} ;;
  }

  #based on 'surface_displayed' glean event
  measure: surface_displayed {
    type: sum
    sql: ${is_surface_displayed} ;;
  }

  # measure: existing_user_sum {
  #   type: sum_distinct
  #   sql_distinct_key: ${client_id} ;;
  #   sql: ${existing_user} ;;
  # }

  #from clients opt_in state measure/dimension
  measure: opt_in_count {
    type: sum
    sql: ${is_opt_in} ;;
  }

  measure: opt_in_rate {
    type: number
    sql: 100 * ${opt_in_count}/${surface_onboarding_displayed} ;;

  }
  measure: engaged_with_sidebar_count {
    type: sum
    sql: ${is_engaged_with_sidebar} ;;
  }

  measure: opt_in_button_click_rate {
    type: number
    sql: 100 * ${opt_in_button_click_sum}/NULLIF(${surface_onboarding_displayed}, 0) ;;
    value_format: "0\%"

  }



}
