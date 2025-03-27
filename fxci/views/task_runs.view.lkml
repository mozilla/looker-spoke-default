include: "//looker-hub/fxci/views/task_runs_base.view.lkml"

view: task_runs {
  extends: [task_runs_base]

  dimension: key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.task_id, '-', ${TABLE}.run_id) ;;  }

  parameter: date_bucket {
    type: string
    label: "Date Bucket"
    allowed_value: { label: "Day" value: "day" }
    allowed_value: { label: "Week" value: "week" }
    allowed_value: { label: "Month" value: "month" }
    allowed_value: { label: "Quarter" value: "quarter" }
    default_value: "day"
  }

  dimension: date {
    type: date
    sql:
    CASE
      WHEN {% parameter date_bucket %}  = 'week' THEN DATE(FORMAT_DATE('%F', DATE_TRUNC(${task_runs.submission_date} , WEEK(SUNDAY))))
      WHEN {% parameter date_bucket %}  = 'month' THEN DATE(FORMAT_DATE('%Y-%m-%d', DATE_TRUNC(${task_runs.submission_date}, MONTH )))
      WHEN {% parameter date_bucket %}  = 'quarter' THEN DATE(FORMAT_DATE('%Y-%m-%d', DATE_TRUNC(${task_runs.submission_date} , QUARTER)))
      ELSE ${task_runs.submission_date}
    END
  ;;
  }

  dimension: duration {
    type: duration_second
    sql_start: ${started_raw} ;;
    sql_end:  ${resolved_raw} ;;
    label: "Duration"
    description: "Task duration in seconds"
  }

  measure: task_run_count {
    type: count
    label: "Run Count"
  }

  measure: average_duration {
    type: average
    sql: ${duration} ;;
    label: "Average Duration"
    description: "Average duration in seconds"
  }
}
