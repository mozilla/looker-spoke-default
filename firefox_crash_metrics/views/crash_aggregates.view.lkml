include: "//looker-hub/firefox_crash_metrics/views/crash_aggregates.view.lkml"

view: +crash_aggregates {

  # Group Exclusions together
  parameter: exclude {
    suggestions: [
      "oom",
      "background tasks",
      "shutdown hangs",
      "NONE"
    ]
    view_label: "Exclusions"
  }

  parameter: partition {
    suggestions: [
      "os",
      "channel",
      "process"
    ]
  }

  # Originally,these next three were all in a where clause, using NOT - exclusion rather than inclusion
  # It was very difficult to follow. These are simplified case when statements
  dimension: include_background_tasks {
    type: yesno
    sql: (
          CASE WHEN ({% parameter exclude %} = 'background tasks')
          THEN (${TABLE}.crash_background_task_name IS NULL)
          ELSE TRUE
          END
        ) ;;
    hidden:  no
    view_label: "Exclusions"
    }
  dimension: include_oom {
    type: yesno
    sql: (
          CASE WHEN ({% parameter exclude %} = 'oom')
          THEN (${TABLE}.memory_oom_allocation_size IS NULL)
          ELSE TRUE
          END
        ) ;;
    hidden:  no
    view_label: "Exclusions"
  }
  dimension: include_shutdown_hangs {
    type: yesno
    sql: (
          CASE WHEN ({% parameter exclude %} = 'shutdown hangs')
          THEN (
            ${TABLE}.crash_async_shutdown_timeout IS NULL
            AND ${TABLE}.crash_quota_manager_shutdown_timeout IS NULL
          )
          ELSE TRUE
          END
        ) ;;
    hidden:  no
    view_label: "Exclusions"
  }

  dimension: include_official_esr_versions_only {
    type:  yesno
    sql: ({% parameter partition %} = 'channel')
        OR (${TABLE}.channel != 'esr')
        OR (${TABLE}.major_version IN (115, 128, 140, 153));;
    view_label: "Exclusions"
  }

  dimension: crash_background_task_name {
    sql: ${TABLE}.crash_background_task_name ;;
    hidden: no
    view_label: "Exclusions"
  }
  dimension: crash_quota_manager_shutdown_timeout {
    sql: ${TABLE}.crash_quota_manager_shutdown_timeout ;;
    hidden: no
    view_label: "Exclusions"
  }
  dimension: crash_async_shutdown_timeout{
    sql: ${TABLE}.crash_async_shutdown_timeout ;;
    hidden: no
    view_label: "Exclusions"
  }
  dimension: memory_oom_allocation_size {
    sql: ${TABLE}.memory_oom_allocation_size;;
    hidden: no
    view_label: "Exclusions"
  }

  # Label major_version as Version
  dimension: major_version {
    label: "Version"
    sql: ${TABLE}.major_version ;;
  }

  dimension: channel {
    type: string
    sql:
      CASE WHEN
        ${TABLE}.channel in (
          "release",
          "beta",
          "nightly",
          "esr"
        )
      THEN ${TABLE}.channel
      ELSE
        NULL
      END
  ;;
  }

  dimension: os {
    type: string
    sql:
      CASE WHEN ${TABLE}.os NOT IN ('Other', 'iOS')
        THEN ${TABLE}.os
      ELSE
        NULL
      END
      ;;
  }

  dimension: process_type {
    type: string
    sql:
      CASE WHEN
        ${TABLE}.process_type in (
          "main",
          "content",
          "rdd",
          "gmplugin",
          "utility",
          "gpu",
          "socket"
          )
        THEN ${TABLE}.process_type
        ELSE NULL
        END
  ;;
  }

  # We use this column below in the measurement of the Number of Crashing Users
  dimension: crashing_users {
    sql: ${TABLE}.crashing_users ;;
    hidden: yes
  }

  # Define measures
  measure: sum_crashing_users {
    label: "Crashing Users"
    type:  sum
    sql: (${TABLE}.crashing_users) ;;
  }

  measure: crashing_users_p25_approx {
    type: number
    sql: APPROX_QUANTILES(${sum_crashing_users}, 100)[OFFSET(25)] ;;
    label: "Approximate 25th Percentile Crashing Users"
    # Optional: Format the value
    value_format_name: decimal_2
  }

  measure: crashing_users_p75_approx {
    type: number
    sql: APPROX_QUANTILES(${sum_crashing_users}, 100)[OFFSET(75)] ;;
    label: "Approximate 75th Percentile Crashing Users"
    # Optional: Format the value
    value_format_name: decimal_2
  }
}
