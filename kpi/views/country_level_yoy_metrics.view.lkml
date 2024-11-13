view: country_level_yoy_metrics {
  derived_table: {
    sql:
    WITH base AS (
      SELECT
        submission_date,
        country,
        app_name,
        SUM(COALESCE(dau, 0)) AS dau,
        CAST(AVG(SUM(COALESCE(dau, 0))) OVER (PARTITION BY country, app_name ORDER BY submission_date ASC ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS INT64) AS dau_28ma, -- only correct on user input date and previous year input date
        SUM(COALESCE(wau, 0)) AS wau,
        SUM(COALESCE(mau, 0)) AS mau,
      FROM
        `moz-fx-data-shared-prod.telemetry.active_users_aggregates` AS active_users_aggregates
      WHERE
        submission_date BETWEEN DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 27 DAY) AND DATE({% date_start user_input_date %})
        OR submission_date BETWEEN DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 27+365 DAY) AND DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 365 DAY)
      GROUP BY
        ALL
    ), metrics AS (
      SELECT *
      FROM base
      UNPIVOT(value FOR metric IN (dau, dau_28ma, wau, mau))
      WHERE submission_date = DATE({% date_start user_input_date %})
      OR submission_date = DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 365 DAY)
    ), yoy AS (
      SELECT *,
      LAG(value) OVER (PARTITION BY country, app_name, metric ORDER BY submission_date ASC) as previous_value
      FROM metrics
    )
    SELECT
      submission_date,
      country,
      app_name,
      CASE WHEN metric IN ('dau', 'wau', 'mau') THEN UPPER(metric) ELSE 'DAU 28-day Moving Average' END as metric,
      value,
      previous_value
    FROM yoy
    WHERE previous_value IS NOT NULL;;
  }
  filter: user_input_date {
    type: date
    label: "Target Date for YoY Comparison"
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: app_name {
    type: string
    label: "Browser Name"
    description: "The browser app name."
    sql: ${TABLE}.app_name ;;
  }

  dimension: metric {
    type: string
    label: "Metric Name"
    description: "The metric of interest."
    sql: ${TABLE}.metric ;;
  }

  dimension: country {
    type: string
    label: "Country Code"
    description: "Country Code"
    sql: ${TABLE}.country ;;
  }

  measure: value {
    type: sum
    label: "Target Date's Value"
    description: "The metric's value."
    value_format_name: decimal_0
    sql: ${TABLE}.value ;;
  }

  measure: previous_value {
    type: sum
    label: "Prior Year's Value"
    description: "The metric's value 365 days ago."
    value_format_name: decimal_0
    sql: ${TABLE}.previous_value ;;
  }

  measure: yoy_difference {
    type: sum
    label: "YoY Difference"
    description: "The difference between the metric's value 365 days ago and its value on the target date."
    value_format_name: decimal_0
    sql:${TABLE}.value - ${TABLE}.previous_value;;
  }
}
