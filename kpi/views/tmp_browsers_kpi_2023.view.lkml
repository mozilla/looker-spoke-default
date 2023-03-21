view: tmp_browser_kpis_2023 {
  derived_table: {
    sql:
      WITH
      desktop AS (
      SELECT submission_date,
        'desktop' AS product,
        COUNTIF(
          active_hours_sum > 0 AND
          COALESCE(
            scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
            scalar_parent_browser_engagement_total_uri_count_sum,
            0
          ) > 0
        ) AS dau,
        AVG(COUNTIF(
          active_hours_sum > 0 AND
          COALESCE(
            scalar_parent_browser_engagement_total_uri_count_normal_and_private_mode_sum,
            scalar_parent_browser_engagement_total_uri_count_sum,
            0
          ) > 0
        )) OVER (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS dau_28ma
      FROM `mozdata.telemetry.clients_daily`
      WHERE submission_date >= DATE_SUB('2022-12-16', INTERVAL 27 DAY)
      GROUP BY 1
      ),

      mobile AS (
      SELECT submission_date,
        'mobile' AS product,
        COUNTIF(
          `mozfun`.bits28.active_in_range(days_seen_bits, 0, 1) AND
          normalized_app_name IN ('Fenix', 'Firefox iOS')
        ) as dau,
        AVG(COUNTIF(
          `mozfun`.bits28.active_in_range(days_seen_bits, 0, 1) AND
          normalized_app_name IN ('Fenix', 'Firefox iOS')
        )) OVER (ORDER BY submission_date ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS dau_28ma
      FROM `mozdata.telemetry.unified_metrics`
      WHERE submission_date >= DATE_SUB('2022-12-16', INTERVAL 27 DAY)
      GROUP BY 1
      ),

      joined AS (
      SELECT * FROM desktop
      UNION ALL
      SELECT * FROM mobile
      )

      SELECT *
      FROM joined
      WHERE submission_date >= '2022-12-16'
      ORDER BY submission_date
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

  dimension: product {
    type: string
    label: "Product"
    description: "The product of interest, either 'desktop' or 'mobile'"
    sql: ${TABLE}.product ;;
  }

  measure: dau {
    type: average
    label: "DAU"
    description: "
    The number of unique clients that we received a main ping from on each `submission_date`,
    given that the client had >0 active hours and >0 URIs loaded.
    "
    sql: ${TABLE}.dau ;;
  }

  measure: dau_28ma {
    type:  average
    label: "DAU 28-day Moving Average"
    description: "
    The number of unique clients that we received a main ping from on each `submission_date`,
    given that the client had >0 active hours and >0 URIs loaded, averaged over a 28-day
    period that ends on the `submission_date`.
    "
    value_format: "0.##"
    sql: ${TABLE}.dau_28ma ;;
  }

}
