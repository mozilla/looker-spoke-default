include: "//looker-hub/monitoring/views/shredder_per_job_stats.view.lkml"

view: +shredder_per_job_stats {

  measure: overall_start_time {
    description: "Start time of the group of jobs"
    sql: TIMESTAMP(MIN(${TABLE}.start_time)) ;;
  }

  measure: overall_end_time {
    description: "End time of the group of jobs"
    sql: TIMESTAMP(MAX(${TABLE}.end_time)) ;;
  }

  measure: total_run_time_hours {
    description: "Runtime of the group of jobs in hours"
    type: number
    sql: TIMESTAMP_DIFF(${overall_end_time}, ${overall_start_time}, SECOND) / 60 / 60 ;;
  }

  measure: total_avg_slots {
    description: "Average slot usage over the duration of the jobs"
    type: number
    sql: SUM(${slot_hours}) / ${total_run_time_hours} ;;
  }

  dimension: job_group {
    description: "Type of table of the task, maps to airflow tasks"
    sql: CASE
      WHEN task_id LIKE 'moz-fx-data-shared-prod.telemetry_stable.main_v%'
        THEN 'main'
      WHEN task_id LIKE 'moz-fx-data-shared-prod.telemetry_stable.main_use_counter_v%'
        THEN 'main_use_counters'
      WHEN task_id LIKE 'moz-fx-data-experiments.%'
        THEN 'experiments'
      ELSE 'all'
    END ;;
  }

}
