include: "//looker-hub/firefox_crash_metrics/views/crash_aggregates.view.lkml"

view: +crash_aggregates {

  # Group Exclusions together
  parameter: exclude {
    suggestions: [
      "os",
      "background tasks",
      "shutdown hangs",
      "NONE"
    ]
    view_label: "Exclusions"
  }

  dimension: crash_background_task_name {
    sql: ${TABLE}.crash_background_task_name ;;
    view_label: "Exclusions"
  }
  dimension: memory_oom_allocation_size {
    sql: ${TABLE}.memory_oom_allocation_size;;
    view_label: "Exclusions"
  }
  dimension: crash_shutdown_metrics {
    type: yesno
    sql: (
          ${TABLE}.crash_async_shutdown_timeout IS NULL
          OR ${TABLE}.crash_quota_manager_shutdown_timeout IS NULL
        ) ;;
    view_label: "Exclusions"
  }

  dimension: crashing_users {
    sql: ${TABLE}.crashing_users ;;
    hidden: yes
  }
  dimension: crash_quota_manager_shutdown_timeout {
    sql: ${TABLE}.crash_quota_manager_shutdown_timeout ;;
    hidden: yes
  }
  dimension: crash_async_shutdown_timeout{
    sql: ${TABLE}.crash_async_shutdown_timeout ;;
    hidden: yes
  }
  dimension: major_version {
    label: "Version"
    sql: ${TABLE}.major_version ;;
  }

  # Define measures
  measure: num_crashing_users {
    label: "Crashing Users"
    type:  sum
    sql: (${TABLE}.crashing_users) ;;
  }

  measure: crashing_users_p25_approx {
    type: number
    sql: APPROX_QUANTILES(${num_crashing_users}, 100)[OFFSET(25)] ;;
    label: "Approximate 25th Percentile Crashing Users"
    # Optional: Format the value
    value_format_name: decimal_2
  }

  measure: crashing_users_p75_approx {
    type: number
    sql: APPROX_QUANTILES(${num_crashing_users}, 100)[OFFSET(75)] ;;
    label: "Approximate 75th Percentile Crashing Users"
    # Optional: Format the value
    value_format_name: decimal_2
  }
}
