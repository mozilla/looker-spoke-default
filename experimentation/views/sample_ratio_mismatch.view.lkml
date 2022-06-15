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
            0.9 AS probability,
            0.0157 AS p_value
          ),
          STRUCT(
            0.75 AS probability,
            0.102 AS p_value
          ),
          STRUCT(
            0.5 AS probability,
            0.455 AS p_value
          ),
          STRUCT(
            0.25 AS probability,
            1.323 AS p_value
          ),
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
          ),
          STRUCT(
            0.002,
            9.550
          ),
          STRUCT(
            0.001,
            10.828
          )
        ]
      ) AS v
    ),
    {% if metric._parameter_value == "'daily_active_clients'" %}
    max_date_daily_clients AS (
      SELECT MAX(submission_date)
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiments_daily_active_clients_v1`
      WHERE experiment_id = {% parameter experiment %}
    ),
    actual AS (
      SELECT
        branch,
        active_clients AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiments_daily_active_clients_v1`
      WHERE
        experiment_id = {% parameter experiment %}
        AND submission_date = (SELECT * FROM max_date_daily_clients)
        AND branch IS NOT NULL
    ),
    {% elsif metric._parameter_value == "'enrollments'" %}
    actual AS (
      SELECT
        branch,
        SUM(value) AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiment_enrollment_overall_v1`
      WHERE
        experiment = {% parameter experiment %}
        AND branch IS NOT NULL
      GROUP BY 1
    ),
    {% else %}
    actual AS (
      SELECT
        branch,
        SUM(value) AS value
      FROM `moz-fx-data-shared-prod.telemetry_derived.experiment_unenrollment_overall_v1`
      WHERE
        experiment = {% parameter experiment %}
        AND branch IS NOT NULL
      GROUP BY 1
    ),
    {% endif %}
    expected_ratios AS (
      SELECT
          branch.slug AS branch,
          branch.ratio
      FROM
        `moz-fx-data-experiments.monitoring.experimenter_experiments_v1`,
        UNNEST(branches) AS branch
      WHERE normandy_slug = {% parameter experiment %}
    ),
    total_ratios AS (
      SELECT
        SUM(ratio) as total_ratio
      FROM expected_ratios
    ),
    total AS (
      SELECT SUM(value) AS total
      FROM actual
    ),
    joined AS (
      SELECT
        value AS actual,
        total.total * (ratio / (SELECT total_ratio FROM total_ratios)) AS expected
      FROM actual
      INNER JOIN
      expected_ratios
      USING(branch)
      CROSS JOIN total
    ),
    chisquare AS (
      SELECT
        SUM(POW(actual - expected, 2) / expected) AS chi
      FROM
        joined
    )
    SELECT
      (SELECT probability FROM p_values WHERE p_value >= (SELECT chi FROM chisquare) ORDER BY probability DESC LIMIT 1) AS p_value,
    ;;
  }

  dimension: p_value {
    type: number
    sql: COALESCE(${TABLE}.p_value, 0) ;;
  }

  dimension: message {
    type: string
    sql: IF(COALESCE(${TABLE}.p_value, 0) < {% parameter p_value_threshold %}, "⚠️ Sample Ratio Mismatch might be present", "✅ Probably no Sample Ratio Mismatch" )  ;;
    html: <p style="font-size: 15px"> {{ value }} </p> ;;
  }

  parameter: experiment {
    type: string
  }

  parameter: p_value_threshold {
    type: number
    default_value: "0.1"
  }

  parameter: metric {
    type: string
    allowed_value: {
      label: "Daily Active Clients"
      value: "daily_active_clients"
    }
    allowed_value: {
      label: "Enrollments"
      value: "enrollments"
    }
    allowed_value: {
      label: "Unenrollments"
      value: "unenrollments"
    }
    default_value: "enrollments"
  }
}
