view: browser_kpi_forecasts_2025 {
  derived_table: {
    sql:
      WITH date_range AS (
        SELECT DATE_ADD("2024-01-01", INTERVAL n DAY) AS submission_date
        FROM UNNEST(GENERATE_ARRAY(0, DATE_DIFF("2025-12-31", "2024-01-01", DAY))) AS n
      ),

      aua AS (
        SELECT
          submission_date,
          CASE
            WHEN app_name = "Firefox Desktop" THEN "desktop"
            WHEN app_name IN ("Fenix", "Firefox iOS", "Focus Android", "Focus iOS") THEN "mobile"
            ELSE "other"
          END AS product,
          SUM(dau) AS dau
        FROM `moz-fx-data-shared-prod.telemetry.active_users_aggregates`
        WHERE submission_date >= "2023-12-01"
        GROUP BY submission_date, product
      ),

      aua_ma AS (
        SELECT
          submission_date,
          product,
          dau,
          AVG(dau) OVER (PARTITION BY product ORDER BY submission_date ASC ROWS BETWEEN 27 PRECEDING AND CURRENT ROW) AS dau_28ma,
          MAX(submission_date) OVER () AS max_date
        FROM aua
      ),

      joined_data AS (
        SELECT
          d.submission_date,
          DATE(2024, EXTRACT(MONTH FROM d.submission_date), EXTRACT(DAY FROM d.submission_date)) AS submission_day,
          COALESCE(aua_ma.product, forecast.product, "") AS product,
          aua_ma.dau,
          aua_ma.dau_28ma AS actual_dau28ma,
          IF(EXTRACT(YEAR FROM d.submission_date) = 2024, aua_ma.dau_28ma, NULL) AS actual_dau28ma_2024,
          IF(EXTRACT(YEAR FROM d.submission_date) = 2025, aua_ma.dau_28ma, NULL) AS actual_dau28ma_2025,
          IF(d.submission_date = aua_ma.max_date, aua_ma.dau_28ma, NULL) AS most_recent_actuals,
          forecast.dau_28_ma AS forecast_dau28ma,
          COALESCE(forecast.forecast_name, "actuals") AS forecast_name,
          COALESCE(forecast.year, 0) AS forecast_year,
          COALESCE(forecast.quarter, 0) AS forecast_quarter
        FROM date_range AS d
        LEFT JOIN aua_ma
          ON d.submission_date = aua_ma.submission_date
        LEFT JOIN `mozdata.analysis.browser_kpi_forecasts_2025` AS forecast
          ON d.submission_date = forecast.submission_date
         AND forecast.product = COALESCE(aua_ma.product, forecast.product)
      )

      SELECT * FROM joined_data
      ;;
  }

  dimension_group: submission_date {
    type: time
    datatype: date
    timeframes: [date]
    convert_tz: no
    label: "Submission"
    description: "The date we received pings from clients."
    sql: ${TABLE}.submission_date ;;
  }

  dimension_group: submission_day {
    type: time
    datatype: date
    timeframes: [date]
    convert_tz: no
    label: "Submission Day"
    description: "The date we received pings from clients."
    sql: ${TABLE}.submission_day ;;
    html:{{ rendered_value | date: "%B %e" }};;
  }

  dimension: product {
    type: string
    label: "KPI Product Reporting Group"
    description: "Either 'desktop' or 'mobile'."
    sql: ${TABLE}.product ;;
  }

  dimension: forecast_name {
    type: string
    label: "Forecast name"
    description: "The descriptive name for the forecast (e.g. 'base')."
    sql: ${TABLE}.forecast_name ;;
  }

  dimension: year {
    type: date_year
    label: "Year"
    description: "The year that the forecast is generated for."
    sql: ${TABLE}.year ;;
  }

  dimension: quarter {
    type: number
    label: "Quarter"
    description: "The first quarter for which the forecast is reported."
    sql: ${TABLE}.quarter ;;
  }

  measure: dau {
    type: average
    label: "DAU"
    description: "The DAU on a given submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.dau ;;
  }

  measure: actual_dau28ma {
    type: average
    label: "Actual DAU 28-day Average"
    description: "The 28-Day Average of DAU ending on a given submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.actual_dau28ma ;;
  }

  measure: actual_dau28ma_2024 {
    type: average
    label: "2024 DAU 28-day Average"
    description: "The 28-Day Average of DAU ending on a given submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.actual_dau28ma_2024 ;;
  }

  measure: actual_dau28ma_2025 {
    type: average
    label: "2025 DAU 28-day Average"
    description: "The 28-Day Average of DAU ending on a given submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.actual_dau28ma_2025 ;;
  }

  measure: most_recent_actuals {
    type: average
    label: "Most Recent Actuals"
    description: "The 28-Day Average of DAU ending on the most recent submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.most_recent_actuals ;;
  }


  measure: forecast_dau28ma {
    type: average
    label: "Forecast"
    description: "The 28-Day Average of DAU ending on a given submission_date."
    value_format: "#,##0"
    sql: ${TABLE}.forecast_dau28ma ;;
  }
}
