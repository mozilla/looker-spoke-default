view: tmp_browser_kpis_2023 {
  derived_table: {
    sql:
      WITH
      desktop_dau AS (
      SELECT submission_date,
        'DAU' AS metric,
        'desktop' AS product,
        COUNTIF(
          active_hours_sum > 0 AND
          COALESCE(
            scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
            scalar_parent_browser_engagement_total_uri_count_sum,
            0
          ) > 0
        ) AS value
      FROM `mozdata.telemetry.clients_daily`
      WHERE submission_date >= '2022-12-16'
      GROUP BY 1
      ),

      desktop_dau_28_ma AS (
      SELECT submission_date,
        'DAU 28MA' AS metric,
        'desktop' AS product,
        AVG(COUNTIF(
          active_hours_sum > 0 AND
          COALESCE(
            scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
            scalar_parent_browser_engagement_total_uri_count_sum,
            0
          ) > 0
        )) OVER (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS value
      FROM `mozdata.telemetry.clients_daily`
      WHERE submission_date >= DATE_SUB('2022-12-16', INTERVAL 27 DAY)
      GROUP BY 1
      ),

      mobile_dau AS (
      SELECT submission_date,
        'DAU' AS metric,
        'mobile' AS product,
        COUNTIF(
          `mozfun`.bits28.active_in_range(days_seen_bits, 0, 1) AND
          normalized_app_name IN ('Fenix', 'Firefox iOS')
        ) as value
      FROM `mozdata.telemetry.unified_metrics`
      WHERE submission_date >= '2022-12-16'
      GROUP BY 1
      ),

      mobile_dau_28_ma AS (
      SELECT submission_date,
        'DAU 28MA' AS metric,
        'mobile' AS product,
        AVG(COUNTIF(
          `mozfun`.bits28.active_in_range(days_seen_bits, 0, 1) AND
          normalized_app_name IN ('Fenix', 'Firefox iOS')
        )) OVER (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS value
      FROM `mozdata.telemetry.unified_metrics`
      WHERE submission_date >= DATE_SUB('2022-12-16', INTERVAL 27 DAY)
      GROUP BY 1
      ),

      joined AS (
      SELECT * FROM desktop_dau_28_ma
      UNION ALL
      SELECT * FROM desktop_dau
      UNION ALL
      SELECT * FROM mobile_dau_28_ma
      UNION ALL
      SELECT * FROM mobile_dau
      )

      SELECT *
      FROM joined
      WHERE submission_date >= '2022-12-16'
      ORDER BY metric ASC, submission_date
      ;;
  }

  dimension_group: submission {
    sql: DATE(${TABLE}.submission_date) ;;
    label: "Submission"
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
    description: "The metric of interest, either 'DAU' or 'DAU 28MA'"
    sql: ${TABLE}.metric ;;
  }

  dimension: product {
    type: string
    label: "Product"
    description: "The product of interest, either 'desktop' or 'mobile'"
    sql: ${TABLE}.product ;;
  }

  measure: value {
    type: sum
    label: "Value"
    description: "The calculated value of the metric"
    sql: ${TABLE}.value ;;
  }

}
