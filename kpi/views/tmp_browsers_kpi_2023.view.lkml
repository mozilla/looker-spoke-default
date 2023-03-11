view: tmp_browser_kpis_2023 {
  derived_table: {
    sql:
      WITH
      observed_dau AS (
      -- cannot use active_users_aggregates.qdau_desktop until backfill is completed.
      -- see: https://mozilla-hub.atlassian.net/browse/DENG-651
      SELECT
      submission_date,
      'DAU' AS metric,
      -- about below: the first probe that counts URIs in private mode landed about 2020-11-18.
      -- before that point, we only had uri counts in non-private (normal mode). so we check the
      -- new probe first and fall back on the old if its NULL.
      -- see https://bugzilla.mozilla.org/show_bug.cgi?id=1737674
      COUNTIF(COALESCE(
      scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
      scalar_parent_browser_engagement_total_uri_count_sum,
      0) > 0 AND active_hours_sum > 0) AS point,
      COUNTIF(COALESCE(
      scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
      scalar_parent_browser_engagement_total_uri_count_sum,
      0) > 0 AND active_hours_sum > 0) AS lower,
      COUNTIF(COALESCE(
      scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
      scalar_parent_browser_engagement_total_uri_count_sum,
      0) > 0 AND active_hours_sum > 0) AS upper
      FROM telemetry.clients_daily
      WHERE submission_date >= DATE_SUB('2022-12-16', INTERVAL 27 DAY)
      GROUP BY 1
      ),

      projected_dau AS (
      SELECT
      submission_date,
      'DAU Projected' AS metric,
      point,
      lower,
      upper
      FROM (
      SELECT
      DATE(ds) AS submission_date,
      FLOOR(yhat) AS point,
      FLOOR(yhat_lower) AS lower,
      FLOOR(yhat_upper) AS upper,
      RANK() OVER(PARTITION BY ds ORDER BY forecast_date DESC) AS rank
      FROM `moz-fx-data-shared-prod.telemetry_derived.kpi_automated_forecast_v1`
      WHERE DATE(ds) BETWEEN DATE_SUB('2022-12-16', INTERVAL 27 DAY) AND '2023-12-15'
      AND LOWER(metric) = 'qdau'
      AND LOWER(target) = 'desktop'
      )
      WHERE rank = 1
      ),

      forecasted_dau AS (
      SELECT
      DATE(date) AS submission_date,
      'DAU Forecast' AS metric,
      FLOOR(qualified_dau) AS point,
      FLOOR(qualified_dau_lower) AS lower,
      FLOOR(qualified_dau_upper) AS upper
      FROM `mozdata.analysis.bochocki_desktop_kpi_forecast_2023`
      WHERE DATE(date) BETWEEN '2022-12-16' AND '2023-12-15'
      ),

      observed_dau_28_ma AS (
      SELECT
      submission_date,
      'DAU 28MA' AS metric,
      FLOOR(AVG(point) OVER rolling_average_window) AS point,
      FLOOR(AVG(point) OVER rolling_average_window) AS lower,
      FLOOR(AVG(point) OVER rolling_average_window) AS upper
      FROM observed_dau
      WINDOW rolling_average_window AS (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW)
      ORDER BY 1
      ),

      projected_dau_28_ma AS (
      SELECT
      submission_date,
      'DAU 28MA Projected' AS metric,
      FLOOR(AVG(point) OVER rolling_average_window) AS point,
      FLOOR(AVG(lower) OVER rolling_average_window) AS lower,
      FLOOR(AVG(upper) OVER rolling_average_window) AS upper
      FROM projected_dau
      WINDOW rolling_average_window AS (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW)
      ORDER BY 1
      ),

      forecasted_dau_28_ma AS (
      SELECT
      DATE(date) AS submission_date,
      'DAU 28MA Forecast' AS metric,
      FLOOR(qualified_dau_28MA) AS point,
      FLOOR(qualified_dau_28MA_lower) AS lower,
      FLOOR(qualified_dau_28MA_upper) AS upper
      FROM `mozdata.analysis.bochocki_desktop_kpi_forecast_2023`
      WHERE DATE(date) BETWEEN '2022-12-16' AND '2023-12-15'
      ),

      joined AS (
      SELECT * FROM observed_dau WHERE submission_date < CURRENT_DATE()
      UNION ALL
      SELECT * FROM projected_dau WHERE submission_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
      UNION ALL
      SELECT * FROM forecasted_dau
      UNION ALL
      SELECT * FROM observed_dau_28_ma WHERE submission_date < CURRENT_DATE()
      UNION ALL
      SELECT * FROM projected_dau_28_ma WHERE submission_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
      UNION ALL
      SELECT * FROM forecasted_dau_28_ma
      )

      SELECT *
      FROM joined
      WHERE submission_date BETWEEN '2022-12-16' AND '2023-12-15'
      ORDER BY submission_date
      ;;
  }

  dimension_group: submission {
    sql: DATE(${TABLE}.submission_date) ;;
    label: "Submission Date"
    description: "The date we received pings from clients"
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
  }

  dimension: metric {
    type: string
    label: "Metric"
    description: "
    DAU [Daily Active Users]: The number of unique client_ids counted on a given submission_date.
    DAU_28MA [DAU 28-day moving average]: The average DAU over the preceding 28-day period, inclusive of the end date.
    Observed: The metric value that was actually observed from our users.
    Forecasted: The metric value that was forecast at the start of Q1, along with its lower/upper confidence intervals.
    Projected: The most revent metric value that was forecast given our observed performance, along its lower/upper confidence intervals.
    "
    sql: ${TABLE}.metric ;;
  }

  measure: point {
    type: sum
    label: "Point"
    description: "The point estimate for a metric"
    sql: ${TABLE}.point ;;
  }

  measure: lower {
    type: sum
    label: "Lower CI"
    description: "The lower confidence interval for a metric"
    sql: ${TABLE}.lower ;;
  }

  measure: upper {
    type: sum
    label: "Upper CI"
    description: "The upper confidence interval for a metric"
    sql: ${TABLE}.upper ;;
  }
}
