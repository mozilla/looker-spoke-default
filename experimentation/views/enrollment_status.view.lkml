view: enrollment_status {
  derived_table: {
    sql:
      WITH enrollments AS (
          SELECT
              experiment,
              MAX(window_start) AS window_start,
              SUM(enroll_count) AS cumulative_enroll_count,
              SUM(unenroll_count) AS cumulative_unenroll_count,
          FROM `moz-fx-data-shared-prod.telemetry_derived.experiment_enrollment_aggregates_live_v1`
          GROUP BY 1
      ), meta AS (
          SELECT
              normandy_slug,
              start_date AS launch_date,
              end_date AS end_date,
          FROM `moz-fx-data-experiments`.monitoring.experimenter_experiments_v1
      ), agg AS (
        SELECT
            experiment,
            MAX(cumulative_enroll_count) AS enrollments_so_far,
            MAX(cumulative_unenroll_count) AS unenrollments_so_far,
            MAX(DATE_DIFF(DATE(window_start), launch_date, DAY)) AS days_since_launch,
            MAX(DATE_DIFF(DATE(window_start), end_date, DAY)) AS days_since_end
        FROM
            enrollments
            INNER JOIN meta
            ON enrollments.experiment = meta.normandy_slug
        GROUP BY 1
      )

      SELECT
          experiment,
          CASE
              WHEN days_since_launch > 0 AND enrollments_so_far < 500 THEN
                  "⚠️ Enrollment is low: fewer than 500 enrollments since launch"
              WHEN days_since_launch > 0 AND (COALESCE(days_since_end, 0) < 0) AND unenrollments_so_far/enrollments_so_far > 0.1 THEN
                  FORMAT("🚨️ Unenrollments are high: %.1f%% of clients have unenrolled since launch", unenrollments_so_far/enrollments_so_far*100)
              WHEN days_since_launch > 0 AND (COALESCE(days_since_end, 0) < 0) AND unenrollments_so_far/enrollments_so_far > 0.05 THEN
                  FORMAT("⚠️ Unenrollments are elevated: %.1f%% of clients have unenrolled since launch", unenrollments_so_far/enrollments_so_far*100)
              WHEN days_since_launch > 0 AND (COALESCE(days_since_end, 0) < 0) AND unenrollments_so_far/enrollments_so_far > 0.01 THEN
                  FORMAT("ℹ️ Unenrollments may be elevated: %.1f%% of clients have unenrolled since launch", unenrollments_so_far/enrollments_so_far*100)
              WHEN days_since_launch = 0 THEN
                  "🕰 Waiting for enrollments"
              ELSE
                  "No warning"
              END
          AS message
      FROM agg;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
    html: <p style="font-size: 25px"> {{ value }} </p> ;;
  }

  dimension: experiment {
    type: string
    sql: ${TABLE}.experiment ;;
  }
}
