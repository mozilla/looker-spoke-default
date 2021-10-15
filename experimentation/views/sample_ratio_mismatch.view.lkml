view: sample_ratio_mismatch {
  derived_table: {
    sql:
    WITH p_values AS (
      SELECT
        v.probability,
        v.p_value
      FROM
        UNNEST(
          [
            -- based on https://people.richland.edu/james/lecture/m170/tbl-chi.html
            STRUCT(
              0.1 AS probability,
              2.706 AS p_value
            ),
            STRUCT(
              0.05,
              3.841
            ),
            STRUCT(
              0.025,
              5.024
            ),
            STRUCT(
              0.01,
              6.635
            ),
            STRUCT(
              0.005,
              7.879
            )
          ]
        ) AS v
    ),
    max_date_daily_clients AS (
      SELECT MAX(submission_date)
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiments_daily_active_clients_v1`
      WHERE experiment_id = "{% parameter experiment %}"
    ),
    actual_daily_clients AS (
      SELECT
        branch,
        active_clients AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiments_daily_active_clients_v1`
      WHERE
        experiment_id = "{% parameter experiment %}"
        AND submission_date = (SELECT * FROM max_date_daily_clients)
    ),
    actual_enrollments AS (
      SELECT
        branch,
        SUM(value) AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiment_enrollment_overall_v1`
      WHERE
        experiment = "{% parameter experiment %}"
      GROUP BY 1
    ),
    actual_unenrollments AS (
      SELECT
        branch,
        SUM(value) AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiment_unenrollment_overall_v1`
      WHERE
        experiment = "{% parameter experiment %}"
      GROUP BY 1
    ),
    expected_ratios AS (
      SELECT
          branch.slug AS branch,
          branch.ratio
      FROM
        `moz-fx-data-experiments.monitoring.experimenter_experiments_v1`,
        UNNEST(branches) AS branch
      WHERE normandy_slug = "{% parameter experiment %}"
    ),
    total_daily_clients AS (
      SELECT SUM(value) AS total
      FROM actual_daily_clients
    ),
    total_enrollments AS (
      SELECT SUM(value) AS total
      FROM actual_enrollments
    ),
    total_unenrollments AS (
      SELECT SUM(value) AS total
      FROM actual_unenrollments
    ),
    joined_daily_clients AS (
      SELECT
        ANY_VALUE(value) AS actual,
        SUM(total_daily_clients.total) * ANY_VALUE(ratio / 100) AS expected
      FROM actual_daily_clients
      INNER JOIN
      expected_ratios
      USING(branch)
      CROSS JOIN total_daily_clients
      GROUP BY branch
    ),
    joined_enrollments AS (
      SELECT
        ANY_VALUE(value) AS actual,
        SUM(total_enrollments.total) * ANY_VALUE(ratio / 100) AS expected
      FROM actual_enrollments
      INNER JOIN
      expected_ratios
      USING(branch)
      CROSS JOIN total_enrollments
      GROUP BY branch
    ),
    joined_unenrollments AS (
      SELECT
        ANY_VALUE(value) AS actual,
        SUM(total_unenrollments.total) * ANY_VALUE(ratio / 100) AS expected
      FROM actual_unenrollments
      INNER JOIN
      expected_ratios
      USING(branch)
      CROSS JOIN total_unenrollments
      GROUP BY branch
    ),
    chisquare_daily_clients AS (
      SELECT
        SUM(POW(actual - expected, 2) / expected) AS chi
      FROM
        joined_daily_clients
    ),
    chisquare_enrollments AS (
      SELECT
        SUM(POW(actual - expected, 2) / expected) AS chi
      FROM
        joined_enrollments
    ),
    chisquare_unenrollments AS (
      SELECT
        SUM(POW(actual - expected, 2) / expected) AS chi
      FROM
        joined_unenrollments
    )
    SELECT
      IF((SELECT chi > p_value FROM chisquare_daily_clients), "⚠️ Sample Ratio Mismatch might be present", "✅ Probably no Sample Ratio Mismatch" ) AS daily_active_clients,
      IF((SELECT chi > p_value FROM chisquare_enrollments), "⚠️ Sample Ratio Mismatch might be present", "✅ Probably no Sample Ratio Mismatch") AS enrollments,
      IF((SELECT chi > p_value FROM chisquare_unenrollments), "⚠️ Sample Ratio Mismatch might be present", "✅ Probably no Sample Ratio Mismatch") AS unenrollments,
    FROM p_values
    JOIN chisquare_unenrollments unenrollments
    ON TRUE
    WHERE probability = {% parameter p_value %};;
  }

  dimension: daily_active_clients {
    type: string
    sql: ${TABLE}.daily_active_clients ;;
  }

  dimension: enrollments {
    type: string
    sql: ${TABLE}.enrollments ;;
  }

  dimension: unenrollments {
    type: string
    sql: ${TABLE}.unenrollments ;;
  }

  parameter: experiment {
    type: string
  }

  parameter: p_value {
    type: number
    default_value: "0.01"
  }
}
