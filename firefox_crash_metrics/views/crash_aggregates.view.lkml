include: "//looker-hub/firefox_crash_metrics/views/crash_aggregates.view.lkml"

view: +crash_aggregates {


  # Define measures
  measure: num_crashing_users {
    label: "DAU"
    type:  sum
    sql: (${TABLE}.crashing_users) ;;
  }

  measure: crashing_users_p25_approx {
    type: number
    sql: APPROX_QUANTILES(${num_crashing_users}, 100)[OFFSET(25)] ;;
    label: "Approximate 75th Percentile Sales"
    # Optional: Format the value
    value_format_name: decimal_2
  }

  measure: crashing_users_p75_approx {
    type: number
    sql: APPROX_QUANTILES(${num_crashing_users}, 100)[OFFSET(75)] ;;
    label: "Approximate 75th Percentile Sales"
    # Optional: Format the value
    value_format_name: decimal_2
  }

  # Group exclusions together
  dimension: crash_async_shutdown_timeout{
    sql: ${TABLE}.crash_async_shutdown_timeout ;;
    group_label: "Exclusions"
  }
  dimension: crash_background_task_name {
    sql: ${TABLE}.crash_background_task_name ;;
    group_label: "Exclusions"
  }
  dimension: crash_quota_manager_shutdown_timeout {
    sql: ${TABLE}.crash_quota_manager_shutdown_timeout ;;
    group_label: "Exclusions"
  }
  dimension: memory_oom_allocation_size {
    sql: ${TABLE}.memory_oom_allocation_size;;
    group_label: "Exclusions"
  }
  dimension: exclude {
    suggestions: [
      "os",
      "background tasks",
      "shutdown hangs",
      "NONE"
    ]
    group_label: "Exclusions"
  }


  dimension: crashing_users {
    sql: ${TABLE}.crashing_users ;;
    hidden: yes
  }

}
