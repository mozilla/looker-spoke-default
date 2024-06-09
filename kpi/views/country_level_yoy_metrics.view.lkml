view: country_level_yoy_metrics {
  derived_table: {
    sql:
WITH
        raw AS (
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
              DATE_SUB({% condition user_selected_date %} submission_date {% endcondition %}, INTERVAL 27 DAY) AND
              DATE_SUB({% condition user_selected_date %} submission_date {% endcondition %}, INTERVAL 0 DAY)
              OR
            active_users_aggregates.submission_date BETWEEN
              DATE_SUB({% condition user_selected_date %} submission_date {% endcondition %}, INTERVAL 27+365 DAY) AND
              DATE_SUB({% condition user_selected_date %} submission_date {% endcondition %}, INTERVAL 365 DAY)
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
          dau,
          dau - LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS dau_diff,
          (dau / LAG(dau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC)) -1 AS dau_pct_diff,
          wau,
          wau - LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS wau_diff,
          (wau / LAG(wau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC)) -1 AS wau_pct_diff,
          mau,
          mau - LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS mau_diff,
          (mau / LAG(mau, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC)) -1 AS mau_pct_diff,
          dau_28ma,
          dau_28ma - LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC) AS dau_28ma_diff,
          (dau_28ma / LAG(dau_28ma, 1) OVER (PARTITION BY region_name, country_name, app_name ORDER BY submission_date ASC)) -1 AS dau_28ma_pct_diff,
        FROM
          aggregated
        WHERE
          submission_date = max_date )
      SELECT
        *
      FROM
        calculated
      WHERE
        submission_date = {% condition user_selected_date %} submission_date {% endcondition %}
      ORDER BY
      dau_28ma DESC
      ;;
  }

  filter: user_selected_date {
    type: date
    label: "Date for YoY Comparison"
  }

  dimension: submission_date {
    type: date
    sql: DATE(${TABLE}.submission_date) ;;
  }

  dimension: region_name {
    type: string
    label: "Region"
    description: "Region name. These are based on the UN Statistics Division standard country or area codes for statistical use (M49)."
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
    description: "The browser app's name"
    sql: ${TABLE}.app_name ;;
  }

  measure: dau {
    type: number
    label: "DAU"
    description: "Number of Daily Active Users on the submission date."
    sql: ${TABLE}.dau ;;
  }

  measure: wau {
    type: number
    label: "WAU"
    description: "Number of Distinct Active Users in the 7-day period ending on the submission date."
    sql: ${TABLE}.wau ;;
  }

  measure: mau {
    type: number
    label: "MAU"
    description: "Number of Distinct Active Users in the 28-day period ending on the submission date."
    sql: ${TABLE}.mau ;;
  }

  measure: dau_28ma {
    type: number
    label: "DAU 28-Day Moving Average"
    description: "Average number of Daily Active Users in the 28-day period ending on the submission date."
    sql: ${TABLE}.dau_28ma ;;
  }

  measure: dau_yoy_diff {
    type: number
    label: "DAU YoY Difference"
    description: "Diffence between DAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.dau_diff ;;
  }

  measure: wau_yoy_diff {
    type: number
    label: "WAU YoY Difference"
    description: "Diffence between WAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.wau_diff ;;
  }

  measure: mau_yoy_diff {
    type: number
    label: "MAU YoY Difference"
    description: "Diffence between MAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.mau_diff ;;
  }

  measure: dau_28ma_yoy_diff {
    type: number
    label: "DAU 28-Day Moving Average YoY Difference"
    description: "Diffence between DAU-28MA on the submission date and DAU-28MA 365 days prior."
    sql: ${TABLE}.dau_28ma_diff ;;
  }

  measure: dau_yoy_pct_diff {
    type: number
    label: "DAU YoY Percent Difference"
    description: "Percent diffence between DAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.dau_pct_diff ;;
  }

  measure: wau_yoy_pct_diff {
    type: number
    label: "WAU YoY Percent Difference"
    description: "Percent diffence between WAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.wau_pct_diff ;;
  }

  measure: mau_yoy_pct_diff {
    type: number
    label: "MAU YoY Percent Difference"
    description: "Percent diffence between MAU on the submission date and DAU 365 days prior."
    sql: ${TABLE}.mau_pct_diff ;;
  }

  measure: dau_28ma_yoy_pct_diff {
    type: number
    label: "DAU 28-Day Moving Average YoY Percent Difference"
    description: "Percent diffence between DAU-28MA on the submission date and DAU-28MA 365 days prior."
    sql: ${TABLE}.dau_28ma_pct_diff ;;
  }
}
