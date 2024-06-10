view: country_level_yoy_metrics {
  derived_table: {
    sql:
    WITH raw AS (
        SELECT
          EXTRACT(YEAR
          FROM
            active_users_aggregates.submission_date) AS submission_year,
          active_users_aggregates.submission_date AS submission_date,
          IF(countries.region_name LIKE "%America%", "Americas", countries.region_name) AS region_name,
          countries.name AS country_name,
          active_users_aggregates.app_name AS app_name,
          SUM(COALESCE(active_users_aggregates.dau, 0)) AS dau,
          SUM(COALESCE(active_users_aggregates.wau, 0)) AS wau,
          SUM(COALESCE(active_users_aggregates.mau, 0)) AS mau,
        FROM
          `moz-fx-data-shared-prod.telemetry.active_users_aggregates` AS active_users_aggregates
        LEFT JOIN
          `mozdata.static.country_codes_v1` AS countries
        ON
          active_users_aggregates.country = countries.code
        WHERE
          ( active_users_aggregates.submission_date BETWEEN
              DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 27 DAY) AND
              DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 0 DAY)
              OR
            active_users_aggregates.submission_date BETWEEN
              DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 27+365 DAY) AND
              DATE_SUB(DATE({% date_start user_input_date %}), INTERVAL 365 DAY)
          )
        GROUP BY
          ALL ),
      aggregated AS (
        SELECT
          submission_year,
          submission_date,
          region_name,
          country_name,
          app_name,
        IF
          (dau = 0, 1, dau) AS dau,
        IF
          (wau = 0, 1, wau) AS wau,
        IF
          (mau = 0, 1, mau) AS mau,
          AVG(SUM(
            IF
              (dau = 0, 1, dau))) OVER (PARTITION BY submission_year, region_name, country_name, app_name) AS dau_28ma,
          MAX(submission_date) OVER (PARTITION BY submission_year, region_name, country_name, app_name) AS max_date,
        FROM
          raw
        GROUP BY
          ALL ),
      calculated AS (
        SELECT
          submission_date,
          region_name,
          country_name,
          app_name,
          "DAU" AS metric,
          dau AS value,
          LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau - LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          country_name,
          app_name,
          "WAU" AS metric,
          wau AS value,
          LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          wau - LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          country_name,
          app_name,
          "MAU" AS metric,
          mau AS value,
          LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          mau - LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          country_name,
          app_name,
          "DAU 28-Day Moving Average" AS metric,
          dau_28ma AS value,
          LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau_28ma - LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          "Regional Total" AS country_name,
          app_name,
          "DAU" AS metric,
          dau AS value,
          LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau - LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          "Regional Total" AS country_name,
          app_name,
          "WAU" AS metric,
          wau AS value,
          LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          wau - LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          "Regional Total" AS country_name,
          app_name,
          "MAU" AS metric,
          mau AS value,
          LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          mau - LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          region_name,
          "Regional Total" AS country_name,
          app_name,
          "DAU 28-Day Moving Average" AS metric,
          dau_28ma AS value,
          LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau_28ma - LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          "Worldwide" AS region_name,
          "Total" AS country_name,
          app_name,
          "DAU" AS metric,
          dau AS value,
          LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau - LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          "Worldwide" AS region_name,
          "Total" AS country_name,
          app_name,
          "WAU" AS metric,
          wau AS value,
          LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          wau - LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          "Worldwide" AS region_name,
          "Total" AS country_name,
          app_name,
          "MAU" AS metric,
          mau AS value,
          LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          mau - LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date

        UNION ALL

        SELECT
          submission_date,
          "Worldwide" AS region_name,
          "Total" AS country_name,
          app_name,
          "DAU 28-Day Moving Average" AS metric,
          dau_28ma AS value,
          LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS prev_value,
          dau_28ma - LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date
      )
      SELECT
        *
      FROM
        calculated
      WHERE
        submission_date = DATE({% date_start user_input_date %})


      ;;
  }

  filter: user_input_date {
    type: date
    label: "Target Date for YoY Comparison"
  }

  dimension: submission_date {
    type: date
    sql: ${TABLE}.submission_date ;;
  }

  dimension: region_name {
    type: string
    label: "Region"
    description: "Region name. These are based on the UN Statistics Division standard country or area codes for statistical use (M49)."
    drill_fields: [country_name]
    sql: ${TABLE}.region_name ;;
  }

  dimension: country_name {
    type: string
    label: "Country"
    description: "Official country name per ISO 3166."
    sql: ${TABLE}.country_name ;;
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
    sql: ${TABLE}.prev_value ;;
  }

  measure: yoy_diff {
    type: sum
    label: "YoY Difference"
    description: "Diffence between the metric submission date and the metric 365 days prior."
    value_format_name: decimal_0
    sql: ${TABLE}.diff ;;
  }
}
